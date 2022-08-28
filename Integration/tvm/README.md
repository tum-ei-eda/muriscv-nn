# TVM Integration Tests

## Models
The TFLite models are the same models used by the TFLM integration tests. They are taken directly from the the [MLPerf Tiny](https://github.com/mlcommons/tiny/tree/master/benchmark/training) benchmarks and renamed to simplify the scripts:
- `kws_ref_model.tflite` -> `aww.tflite`
- `pretrainedResnet_quant.tflite` -> `ic.tflite`
- `ad01_int8.tflite` -> `toy.tflite`
- `vww_96_int8.tflite` -> `vww.tflite`
