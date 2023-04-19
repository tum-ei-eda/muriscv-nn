<!--
Copyright (c) 2023 TUM Department of Electrical and Computer Engineering - Chair of Electronic Design Automation.

This file is part of muRISCV-NN.
See https://github.com/tum-ei-eda/muriscv-nn for further info.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
# TODOs
- All directories to lower case
- `.gitignore` cleanup and move to directories
- `set -e` to
```
# Prevent silent failures
set -euo pipefail
```
- rework cmake message() with status / warning / error
- remove `CMAKE_SYSTEM_PROCESSOR` option from cmake files
- the tflm integration tests should not only compare the top category but rather the whole result vector
- add `__attribute__((aligned(16)))` to the Tiny MLPerf data generation scripts
- use `#define`s for input data in order to be able to create static arrays at compile time
