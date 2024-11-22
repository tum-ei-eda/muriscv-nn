import os
import argparse
from datetime import date

import pandas as pd
import jinja2
from jinja2 import FileSystemLoader

from wiki_utils import MODEL_DESCS, BACKEND_DESCS, TARGET_DESCS

# pass_eval_context

today = date.today()
date = str(today)

parser = argparse.ArgumentParser()

parser.add_argument("files", nargs="+", help="CSV file paths")
parser.add_argument("--split", action="store_true", help="Split wiki into multiple pages")
parser.add_argument("--date", type=str, default=None, help="Override used date")

args = parser.parse_args()

if args.date:
    date = args.date


df = pd.DataFrame()

for fname in args.files:
    temp_df = pd.read_csv(fname)

    df = pd.concat([df, temp_df])
    if date is not None and "Date" not in df.columns:
        df["Date"] = date

df.fillna("-", inplace=True)
df["Framework"] = df["Backend"].apply(lambda x: "tvm" if "tvm" in x else "tflm")


# print("df", df)
def env_var(value, key):
    return os.getenv(key, value)


def round3(value):
    return round(float(value), 3)


environment = jinja2.Environment(loader=FileSystemLoader("./"))

environment.filters["env_var"] = env_var
environment.filters["round3"] = round3

template = environment.get_template("benchmarks_template.md.j2")

data = {}

framework_names = []
backend_names = []
toolchain_names = []
optimize_names = []
model_names = []
target_names = []
# TODO: xlen, unroll, fuse-ld

for framework_name, framework_df in df.groupby("Framework"):
    framework_names.append(framework_name)
    data[framework_name] = {}
    for toolchain_name, toolchain_df in framework_df.groupby("Toolchain"):
        toolchain_names.append(toolchain_name)
        data[framework_name][toolchain_name] = {}
        for optimize_name, optimize_df in toolchain_df.groupby("Optimize"):
            optimize_names.append(optimize_name)
            data[framework_name][toolchain_name][optimize_name] = {}
            for target_name, target_df in optimize_df.groupby("Target"):
                target_names.append(target_name)
                data[framework_name][toolchain_name][optimize_name][target_name] = {}
                for backend_name, backend_df in target_df.groupby("Backend"):
                    backend_names.append(backend_name)
                    data[framework_name][toolchain_name][optimize_name][target_name][backend_name] = {}
                    for model_name, model_df in backend_df.groupby("Model"):
                        data[framework_name][toolchain_name][optimize_name][target_name][backend_name][model_name] = (
                            model_df.to_dict("records")
                        )
                        model_names.append(model_name)

# data = {
#     "tflmi": {
#         "aww": aww_tflmi_df.to_dict("records"),
#         "vww": vww_tflmi_df.to_dict("records"),
#         "vww": vww_tflmi_df.to_dict("records"),
#         "toycar": toycar_tflmi_df.to_dict("records"),
#     },
#     "tvmaot": {
#         "aww": aww_tvmaot_df.to_dict("records"),
#         "vww": vww_tvmaot_df.to_dict("records"),
#         "vww": vww_tvmaot_df.to_dict("records"),
#         "toycar": toycar_tvmaot_df.to_dict("records"),
#     },
# }

if args.split:
    for framework_name, framework_data in data.items():
        for toolchain_name, toolchain_data in framework_data.items():
            for optimize_name, optimize_data in toolchain_data.items():
                for target_name, target_data in optimize_data.items():
                    filename = (
                        "Benchmarks-"
                        + date
                        + "-"
                        + framework_name.upper()
                        + "-"
                        + toolchain_name.upper()
                        + "-O"
                        + str(optimize_name)
                        + "-"
                        + target_name
                    )
                    # print("data", {framework_name: {toolchain_name: toolchain_data}})
                    data2 = {framework_name: {toolchain_name: {optimize_name: {target_name: target_data}}}}
                    print("data2", data2)
                    df2 = df[
                        (df["Framework"] == framework_name)
                        & (df["Toolchain"] == toolchain_name)
                        & (df["Optimize"] == optimize_name)
                        & (df["Target"] == target_name)
                    ]
                    content = template.render(
                        data=data2,
                        date=date,
                        date_=date.replace("-", ""),
                        model_descriptions=MODEL_DESCS,
                        backend_descriptions=BACKEND_DESCS,
                        target_descriptions=TARGET_DESCS,
                        filename=filename,
                        framework_names=[framework_name],
                        backend_names=backend_names,
                        toolchain_names=[toolchain_name],
                        optimize_names=[optimize_name],
                        model_names=model_names,
                        target_names=target_names,
                    )
                    with open(filename + ".md", mode="w", encoding="utf-8") as message:
                        message.write(content)
                        print(f"... wrote {filename}.md")
                    df2.to_csv(filename + ".csv")
                    print(f"... wrote {filename}.csv")
else:
    filename = "Benchmarks-" + date
    # data2 = {}
    # for framework_name, framework_data in data.items():
    #     for toolchain_name, toolchain_data in framework_data.items():
    #         data2.update(toolchain_data)
    # print("data", data)
    content = template.render(
        data=data,
        date=date,
        date_=date.replace("-", ""),
        model_descriptions=MODEL_DESCS,
        backend_descriptions=BACKEND_DESCS,
        target_descriptions=TARGET_DESCS,
        filename=filename,
        framework_names=framework_names,
        backend_names=backend_names,
        toolchain_names=toolchain_names,
        optimize_names=optimize_names,
        model_names=model_names,
        target_names=target_names,
    )
    with open(filename + ".md", mode="w", encoding="utf-8") as message:
        message.write(content)
        print(f"... wrote {filename}.md")
    df.to_csv(filename + ".csv")
    print(f"... wrote {filename}.csv")
