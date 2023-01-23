from jinja2 import FileSystemLoader, pass_eval_context
import jinja2
import csv
import os
from datetime import date

today = date.today()


with open("aww-benchmark-"+str(today)+"/out.csv", newline="") as file:
    aww_csv = list(csv.reader(file))
with open("vww-benchmark-"+str(today)+"/out.csv", newline="") as file:
    vww_csv = list(csv.reader(file))
with open("resnet-benchmark-"+str(today)+"/out.csv", newline="") as file:
    resnet_csv = list(csv.reader(file))
with open("toycar-benchmark-"+str(today)+"/out.csv", newline="") as file:
    toycar_csv = list(csv.reader(file))
    
    
def env_var(value, key):
  return os.getenv(key, value)

environment = jinja2.Environment(loader=FileSystemLoader("./"))

environment.filters['env_var'] = env_var

template = environment.get_template("benchmarks_template.md")



filename = f"Benchmarks-"+str(today)+".md"
content = template.render(aww_data=aww_csv, vww_data=vww_csv, resnet_data=resnet_csv, toycar_data=toycar_csv)
with open(filename, mode="w", encoding="utf-8") as message:
    message.write(content)
    print(f"... wrote {filename}")
