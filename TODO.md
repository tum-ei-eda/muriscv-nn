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
