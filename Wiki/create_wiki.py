#
# Copyright (c) 2023 TUM Department of Electrical and Computer Engineering - Chair of Electronic Design Automation.
#
# This file is part of muRISCV-NN.
# See https://github.com/tum-ei-eda/muriscv-nn for further info.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
from jinja2 import FileSystemLoader, pass_eval_context
import jinja2
import csv
import os
from datetime import date

today = date.today()


with open("aww-benchmark-" + str(today) + "/out.csv", newline="") as file:
    aww_csv = list(csv.reader(file))
with open("vww-benchmark-" + str(today) + "/out.csv", newline="") as file:
    vww_csv = list(csv.reader(file))
with open("resnet-benchmark-" + str(today) + "/out.csv", newline="") as file:
    resnet_csv = list(csv.reader(file))
with open("toycar-benchmark-" + str(today) + "/out.csv", newline="") as file:
    toycar_csv = list(csv.reader(file))


def env_var(value, key):
    return os.getenv(key, value)


environment = jinja2.Environment(loader=FileSystemLoader("./"))

environment.filters["env_var"] = env_var

template = environment.get_template("benchmarks_template.md")


filename = f"Benchmarks-" + str(today) + ".md"
content = template.render(aww_data=aww_csv, vww_data=vww_csv, resnet_data=resnet_csv, toycar_data=toycar_csv)
with open(filename, mode="w", encoding="utf-8") as message:
    message.write(content)
    print(f"... wrote {filename}")
