import argparse
from pathlib import Path

import pandas as pd

from wiki_utils import MODEL_DESCS, BACKEND_DESCS, TARGET_DESCS

parser = argparse.ArgumentParser(description="TODO")
parser.add_argument("files", nargs="+")
parser.add_argument("--open", default="first", choices=["none", "first", "last", "all"])
parser.add_argument("--reverse", action="store_true")
parser.add_argument("--hide-models", action="store_true")
args = parser.parse_args()

files = args.files
# print("files", files)

data = []

for file in files:
    name = Path(file).stem
    with open(file, "r") as f:
        content = f.read()
    lines = content.split("\n")
    labels = [line.split('"', 1)[-1].split('"', 1)[0] for line in lines if "<a name=" in line]
    backends = list(set([label.split("-")[2] for label in labels]))
    models = list(set(["-".join(label.split("-")[6:]) for label in labels]))
    # print("name", name)
    # if len(labels) > 0:
    #     print("labels", labels)
    #     print("backends", backends)
    #     print("models", models)
    #     input(">")
    splitted = name.split("-")
    # print("splitted", splitted)
    assert len(splitted) > 5
    assert splitted[0] == "Benchmarks"
    date = "-".join(splitted[1:4])
    # print("date", date)
    framework = splitted[4]
    # print("framework", framework)
    toolchain = splitted[5]
    # print("toolchain", toolchain)
    if len(splitted) > 6:
        opt = splitted[6]
    else:
        opt = "s"
    # print("opt", opt)
    if len(splitted) > 7:
        target = splitted[7]
    else:
        target = "SpikeRV32"
    # print("target", target)
    # print()
    date_ = date.replace("-", "")
    if len(backends) == 0:  # fallback
        backends = ["tvmaot" if "tvm" in framework.lower() else "tflmi"]
    for backend in backends:
        label = f"{date_}-{framework.lower()}-{backend.lower()}-{toolchain.lower()}-{opt.lower()}-{target.lower()}"
        new = {
            "file": name,
            "date": date,
            "framework": framework,
            "backend": backend,
            "toolchain": toolchain,
            "opt": opt,
            "target": target,
            "label": label,
        }
        data.append(new)
        if len(models) == 0:  # fallback
            models = ["aww", "resnet", "toycar", "vww"]
        for model in models:
            label2 = f"{label}-{model.lower()}"
            new = {
                "file": name,
                "date": date,
                "framework": framework,
                "backend": backend,
                "toolchain": toolchain,
                "opt": opt,
                "target": target,
                "model": model,
                "label": label2,
            }
            data.append(new)

# print("data", data)

df = pd.DataFrame(data)
# print("df", df)

indent = 0
i = 0

grouped_df = list(df.groupby("date"))

if not args.reverse:
    grouped_df = list(reversed(grouped_df))

for date, group_df in grouped_df:
    first = i == 0
    last = i == (len(grouped_df) - 1)
    open_ = (args.open == "all") or (args.open == "first" and first) or (args.open == "last" and last)
    i += 1
    print("  " * indent + ("<details open>" if open_ else "<details>"))
    indent += 1
    print("  " * indent + f"<summary><b>{date}</b></summary>")
    print("  " * indent + "<ul>")
    indent += 1
    for framework, group2_df in group_df.groupby("framework"):
        print("  " * indent + f"<li>{framework}</li>")
        print("  " * indent + "<ul>")
        indent += 1
        backends = group2_df["backend"].unique()
        for backend, group21_df in group2_df.groupby("backend"):
            if len(backends) > 1:
                print("  " * indent + f"<li>{backend}</li>")
                print("  " * indent + "<ul>")
                indent += 1
            for toolchain, group3_df in group2_df.groupby("toolchain"):
                print("  " * indent + f"<li>{toolchain}</li>")
                print("  " * indent + "<ul>")
                indent += 1
                for opt, group4_df in group3_df.groupby("opt"):
                    print("  " * indent + f"<li>{opt}</li>")
                    # print("  " * indent + "<ul>")
                    # indent += 1
                    for target, group5_df in group4_df.groupby("target"):
                        main_df = group5_df[pd.isna(group5_df["model"])]
                        assert len(main_df) == 1
                        file = main_df["file"].iloc[0]
                        # print("  " * indent + f"<li><a href=\"https://github.com/tum-ei-eda/muriscv-nn/wiki/{file}\">{target}</a></li>")
                        target_desc = TARGET_DESCS.get(target)
                        target_desc_str = ""
                        if target_desc:
                            target_desc_str = f" ({target})"
                            target = target_desc
                            # desc_str = f" ({desc})"
                        print(
                            "  " * indent
                            + f'<b><a href="https://github.com/tum-ei-eda/muriscv-nn/wiki/{file}">{target}</a>{target_desc_str}</b>'
                        )
                        if args.hide_models:
                            print("  " * indent + "<br>")
                            continue
                        print("  " * indent + "<ul>")
                        indent += 1
                        for model, group6_df in group5_df.groupby("model"):
                            assert len(group6_df) == 1
                            label = group6_df["label"].iloc[0]
                            file = group6_df["file"].iloc[0]
                            model_desc = MODEL_DESCS.get(model)
                            model_desc_str = ""
                            if model_desc:
                                model_desc_str = f" ({model})"
                                model = model_desc
                                # desc_str = f" ({desc})"
                            print(
                                "  " * indent
                                + f'<li><a href="https://github.com/tum-ei-eda/muriscv-nn/wiki/{file}#{label}">{model}</a>{model_desc_str}</li>'
                            )
                        indent -= 1
                        print("  " * indent + "</ul>")
                    # indent -= 1
                    # print("  " * indent + "</ul>")
                indent -= 1
                print("  " * indent + "</ul>")
            if len(backends) > 1:
                indent -= 1
                print("  " * indent + "</ul>")
        indent -= 1
        print("  " * indent + "</ul>")
    indent -= 1
    print("  " * indent + "</ul>")
    indent -= 1
    print("  " * indent + "</details>")
