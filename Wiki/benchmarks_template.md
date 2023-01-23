## Setup

### Simulator

- Spike ([`riscv-isa-sim `](https://github.com/riscv-software-src/riscv-isa-sim)) (ISS, CPI=1)

### Toolchains

- **Scalar:** Self compiled on `master` branch of [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain)
- **Packed:** Self compiled using patches found in https://github.com/riscv-collab/riscv-gcc/pull/258 and https://github.com/riscvarchive/riscv-binutils-gdb/pull/257
- **Vector:** Self compiled using this working-branch: [`riscv-gcc-rvv-next`](https://github.com/riscv-collab/riscv-gcc/tree/riscv-gcc-rvv-next)

### Models

- [MLPerfTiny](https://github.com/mlcommons/tiny) Benchmark

### Package Versions

- MLonMCU : {{ "default" | env_var('MLIF_REF') }}
- TFLM :  {{ "default" | env_var('TFLM_REF') }}
- TVM : {% if "default" | env_var('PREBUILT_TVM') == '1' %} Nightly Pre-Build {% else %} {{ "default" | env_var('TVM_REF') }} {% endif %}
- Spike : {{ "default" | env_var('SPIKE_REF') }}
- Spike PK : {{ "default" | env_var('SPIKEPK_REF') }}


### Miscellaneous

- Used `-Os` flag for compilation.
- Benchmarks generated using [MLonMCU](https://github.com/tum-ei-eda/mlonmcu) deployment tool with minimal efforts.
- Memory metrics are reported in Bytes

### Frameworks

Benchmarks exist for integration with TensorFlow Lite for Microcontrollers (TFLM) and TVM.

## TFLite for Microcontrollers

Comparing reference kernel implementations (`Default`) with `cmsis-nn` optimized kernels and linkage with `libmuriscvnn.a`.


### Audio Wake Words (`aww`)

| Cycles    | Total ROM | Total RAM | ROM read-only | ROM code | VLEN | Kernels    | Extensions |
| --------- | --------- | --------- | ------------- | -------- | ---- | ---------- | ---------- |
{% for x in aww_data %}{% if x[1] == "tflmi" %}| {{x[3]}} | {{x[4]}} | {{x[5]}} | {{x[6]}} | {{x[7]}} | {{x[8]}} | {{x[9]}} | {{x[10]}} |
{% endif %}{% endfor %} 

### Visual Wake Words (`vww`)

| Cycles    | Total ROM | Total RAM | ROM read-only | ROM code | VLEN | Kernels    | Extensions |
| --------- | --------- | --------- | ------------- | -------- | ---- | ---------- | ---------- |
{% for x in vww_data %}{% if x[1] == "tflmi" %}| {{x[3]}} | {{x[4]}} | {{x[5]}} | {{x[6]}} | {{x[7]}} | {{x[8]}} | {{x[9]}} | {{x[10]}} |
{% endif %}{% endfor %} 


### Image Classification (`resnet`)

| Cycles    | Total ROM | Total RAM | ROM read-only | ROM code | VLEN | Kernels    | Extensions |
| --------- | --------- | --------- | ------------- | -------- | ---- | ---------- | ---------- |
{% for x in resnet_data %}{% if x[1] == "tflmi" %}| {{x[3]}} | {{x[4]}} | {{x[5]}} | {{x[6]}} | {{x[7]}} | {{x[8]}} | {{x[9]}} | {{x[10]}} |
{% endif %}{% endfor %} 

### Anomaly Detection (`toycar`)

| Cycles    | Total ROM | Total RAM | ROM read-only | ROM code | VLEN | Kernels    | Extensions |
| --------- | --------- | --------- | ------------- | -------- | ---- | ---------- | ---------- |
{% for x in toycar_data %}{% if x[1] == "tflmi" %}| {{x[3]}} | {{x[4]}} | {{x[5]}} | {{x[6]}} | {{x[7]}} | {{x[8]}} | {{x[9]}} | {{x[10]}} |
{% endif %}{% endfor %} 

## TVM

Using CMSIS-NN BYOC feature and linkage with `libmuriscvnn.a`.

Extension mapping:
- `VEXT -> cortex-m55`
- `PEXT -> cortex-m7`

Used data/kernel layouts:
- Untuned: `NHWC` (TFLite default)
- Tuned: `NCHW` (Converted using TVM)

### Audio Wake Words (`aww`)

| Cycles    | Total ROM | Total RAM | ROM read-only | ROM code | VLEN | Kernels    | Extensions |
| --------- | --------- | --------- | ------------- | -------- | ---- | ---------- | ---------- |
{% for x in aww_data %}{% if x[1] == "tvmaot" %}| {{x[3]}} | {{x[4]}} | {{x[5]}} | {{x[6]}} | {{x[7]}} | {{x[8]}} | {{x[9]}} | {{x[10]}} |
{% endif %}{% endfor %} 

### Visual Wake Words (`vww`)

| Cycles    | Total ROM | Total RAM | ROM read-only | ROM code | VLEN | Kernels    | Extensions |
| --------- | --------- | --------- | ------------- | -------- | ---- | ---------- | ---------- |
{% for x in vww_data %}{% if x[1] == "tvmaot" %}| {{x[3]}} | {{x[4]}} | {{x[5]}} | {{x[6]}} | {{x[7]}} | {{x[8]}} | {{x[9]}} | {{x[10]}} |
{% endif %}{% endfor %} 

### Image Classification (`resnet`)

| Cycles    | Total ROM | Total RAM | ROM read-only | ROM code | VLEN | Kernels    | Extensions |
| --------- | --------- | --------- | ------------- | -------- | ---- | ---------- | ---------- |
{% for x in resnet_data %}{% if x[1] == "tvmaot" %}| {{x[3]}} | {{x[4]}} | {{x[5]}} | {{x[6]}} | {{x[7]}} | {{x[8]}} | {{x[9]}} | {{x[10]}} |
{% endif %}{% endfor %}

### Anomaly Detection (`toycar`)

| Cycles    | Total ROM | Total RAM | ROM read-only | ROM code | VLEN | Kernels    | Extensions |
| --------- | --------- | --------- | ------------- | -------- | ---- | ---------- | ---------- |
{% for x in toycar_data %}{% if x[1] == "tvmaot" %}| {{x[3]}} | {{x[4]}} | {{x[5]}} | {{x[6]}} | {{x[7]}} | {{x[8]}} | {{x[9]}} | {{x[10]}} |
{% endif %}{% endfor %}


## Code size compared to CMSIS-NN

**WIP**
