from jinja2 import FileSystemLoader, pass_eval_context
import jinja2
import csv
import os
from datetime import date

today = date.today()


with open("aww-benchmark-tflmi-" + str(today) + "/out.csv", newline="") as file:
    aww_tflmi_csv = list(csv.reader(file))
with open("vww-benchmark-tflmi-" + str(today) + "/out.csv", newline="") as file:
    vww_tflmi_csv = list(csv.reader(file))
with open("resnet-benchmark-tflmi-" + str(today) + "/out.csv", newline="") as file:
    resnet_tflmi_csv = list(csv.reader(file))
with open("toycar-benchmark-tflmi-" + str(today) + "/out.csv", newline="") as file:
    toycar_tflmi_csv = list(csv.reader(file))

with open("aww-benchmark-tvmaot-" + str(today) + "/out.csv", newline="") as file:
    aww_tvmaot_csv = list(csv.reader(file))
with open("vww-benchmark-tvmaot-" + str(today) + "/out.csv", newline="") as file:
    vww_tvmaot_csv = list(csv.reader(file))
with open("resnet-benchmark-tvmaot-" + str(today) + "/out.csv", newline="") as file:
    resnet_tvmaot_csv = list(csv.reader(file))
with open("toycar-benchmark-tvmaot-" + str(today) + "/out.csv", newline="") as file:
    toycar_tvmaot_csv = list(csv.reader(file))


def env_var(value, key):
    return os.getenv(key, value)


def round3(value):
    return round(float(value), 3)


environment = jinja2.Environment(loader=FileSystemLoader("./"))

environment.filters["env_var"] = env_var
environment.filters["round3"] = round3

template = environment.get_template("benchmarks_template.md")


filename = f"Benchmarks-" + str(today) + ".md"
content = template.render(
    aww_tflmi_data=aww_tflmi_csv,
    vww_tflmi_data=vww_tflmi_csv,
    resnet_tflmi_data=resnet_tflmi_csv,
    toycar_tflmi_data=toycar_tflmi_csv,
    aww_tvmaot_data=aww_tvmaot_csv,
    vww_tvmaot_data=vww_tvmaot_csv,
    resnet_tvmaot_data=resnet_tvmaot_csv,
    toycar_tvmaot_data=toycar_tvmaot_csv,
)
with open(filename, mode="w", encoding="utf-8") as message:
    message.write(content)
    print(f"... wrote {filename}")
