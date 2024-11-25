import argparse
from pathlib import Path

import numpy as np
import pandas as pd

parser = argparse.ArgumentParser("Compare muRISCV-NN benchmarks")
parser.add_argument("files", nargs="+", help="Two or more CSV files (first is baseline)")
parser.add_argument("--metrics", nargs="+", default=["Run Cycles"], help="The column name to compare")
parser.add_argument("--ignore", nargs="*", default=[], help="The column name to ignore")
parser.add_argument("--rel", action="store_true", help="Add relative columns")
parser.add_argument("--output", default=None, help="Write results to .csv file")
parser.add_argument("--join", default="outer", choices=["outer", "inner", "left", "right"], help="Join type")
args = parser.parse_args()

assert len(args.files) >= 2

DROP_COLS = ["Linker"]


FILE_COLS = ["Framework", "Toolchain", "Optimize", "Target"]  # Todo: Date
GROUP_COLS = ["Backend", "Model"]
INDEX_COLS = ["VLEN", "Layout", "Kernels", "Mode", "Arch", "Unroll", "AutoVectorize"]
ALL_COLS = FILE_COLS + GROUP_COLS + INDEX_COLS

dfs = []


file_configs = []


for file in args.files:
    splitted = Path(file).stem.split("-")
    assert len(splitted) == 8, "Invalid filename"
    date = "-".join(splitted[1:4])
    framework = splitted[4]
    toolchain = splitted[5]
    optimize = splitted[6]
    target = splitted[7]
    cfg = {"Date": date, "Framework": framework, "Toolchain": toolchain, "Optimize": optimize, "Target": target}
    file_configs.append(cfg)
    df = pd.read_csv(file, index_col=False)
    df["Optimize"] = df["Optimize"].astype(str)
    df.drop(columns=DROP_COLS, inplace=True)
    id_vars = ALL_COLS
    # id_vars = [col for col in id_vars if col not in args.ignore]
    assert all(metric in df.columns for metric in args.metrics)
    # workaround
    value_vars = args.metrics
    df_ = pd.melt(df, id_vars=id_vars, value_vars=value_vars, var_name="Metric", value_name="Value")
    df_["Value"] = df_["Value"].replace("-", np.nan)
    df_["Value"] = df_["Value"].astype("float32")
    dfs.append(df_)

diffs = []
diff_cols = set()

base_cfg = file_configs[0]
for cfg in file_configs[1:]:
    # print("cfg", cfg)
    diff = (set(base_cfg.items()) ^ set(cfg.items())) - set(base_cfg.items())
    if len(diff) > 0:
        diff_str = ", ".join([f"{key}: {base_cfg[key]} -> {val}" for key, val in diff])
        # print("diff_str", diff_str)
        diffs.append(diff_str)
        for key, val in diff:
            diff_cols.add(key)

if "auto" in args.ignore:
    args.ignore += diff_cols
    args.ignore.remove("auto")

if len(args.ignore) > 0:
    for df in dfs:
        df.drop(columns=[col for col in args.ignore if col in df.columns], inplace=True)


baseline_df = dfs[0]
compare_dfs = dfs[1:]

on = ALL_COLS + ["Metric"]
on = [col for col in on if col not in args.ignore]

file_mapping = {
    "B": (Path(args.files[0]).stem, "Baseline", None),
    **{f"C{i+1}": (Path(file).stem, f"Compare {i+1}", diffs[i]) for i, file in enumerate(args.files[1:])},
}

merged_df = baseline_df
merged_df.rename(columns={"Value": "Value (B)"}, inplace=True)
for i, compare_df in enumerate(compare_dfs):
    # print("merged_df", merged_df, merged_df.columns, merged_df.dtypes)
    # print("compare_df", compare_df, compare_df.columns, compare_df.dtypes)
    # print("how", args.join)
    # print("on", on)
    merged_df = pd.merge(merged_df, compare_df, how=args.join, on=on)
    merged_df.rename(columns={"Value": f"Value (C{i+1})"}, inplace=True)
    # print("merged_df")
    print(merged_df)
    unhandled_cols = [col for col in merged_df.columns if "_x" in col]
    print("unhandled_cols", unhandled_cols)
    if len(unhandled_cols) > 0:
        raise RuntimeError(f"Unhandled cols: {unhandled_cols}")
    if args.rel:
        merged_df[f"Value (C{i+1}) [rel.]"] = merged_df[f"Value (C{i+1})"] / merged_df["Value (B)"]
    # print("merged_df")
    print(merged_df)
    # input(">?")

head = ""

head += "**Metrics:**\n"
for metric in args.metrics:
    head += f"- {metric}\n"


head += "\n**Labels:**\n"
for label, file_desc in file_mapping.items():
    file, desc, diff_str = file_desc
    if diff_str is None:
        diff_str = ""
    else:
        diff_str = f" [{diff_str}]"

    head += f"- {label}:\t`{file}` ({desc}){diff_str}\n"

print(head)

print("**DataFrame:**")
print(merged_df)

if args.output:
    suffix = Path(args.output).suffix
    assert len(suffix) > 1
    fmt = suffix[1:]
    if fmt == "csv":
        merged_df.to_csv(args.output, index=False)
    elif fmt == "pkl":
        raise NotImplementedError("pkl outout")
    elif fmt == "md":
        import tempfile

        with tempfile.NamedTemporaryFile() as tmp:
            merged_df.to_markdown(tmp.name, index=False)
            with open(tmp.name, "r") as f:
                table = f.read()
        with open(args.output, "w") as f:
            f.write(head)
            f.write("\n")
            f.write(table)
    else:
        raise ValueError(f"Unsupported fmt: {fmt}")
