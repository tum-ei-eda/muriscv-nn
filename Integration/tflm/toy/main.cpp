#include <cmath>
#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/micro_mutable_op_resolver.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "toy_data/toy_input_data.h"
#include "toy_data/toy_model_data.h"
#include "toy_data/toy_model_settings.h"
#include "toy_data/toy_output_data_ref.h"

constexpr size_t tensor_arena_size = 256 * 1024;
alignas(16) uint8_t tensor_arena[tensor_arena_size];

int main(int argc, char* argv[]) {
  tflite::MicroErrorReporter micro_error_reporter;
  tflite::ErrorReporter* error_reporter = &micro_error_reporter;

  const tflite::Model* model = tflite::GetModel(toy_model_data);

  static tflite::MicroMutableOpResolver<1> resolver;
  resolver.AddFullyConnected();

  tflite::MicroInterpreter interpreter(model, resolver, tensor_arena,
                                       tensor_arena_size, error_reporter);

  if (interpreter.AllocateTensors() != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "ERROR: In AllocateTensors().");
    return -1;
  }

  for (size_t i = 0; i < toy_data_sample_cnt; i++) {
    memcpy(interpreter.input(0)->data.int8, (int8_t*)toy_input_data[i],
           toy_input_data_len[i]);

    if (interpreter.Invoke() != kTfLiteOk) {
      TF_LITE_REPORT_ERROR(error_reporter, "ERROR: In Invoke().");
      return -1;
    }

    uint32_t sum = 0;
    for (size_t j = 0; j < toy_input_data_len[i]; j++) {
      sum += pow(
          (int8_t)toy_input_data[i][j] - interpreter.output(0)->data.int8[j],
          2);
    }
    sum /= toy_input_data_len[i];

    uint32_t diff = abs(sum - toy_output_data_ref[i]);
    if (diff > 1) {
      printf("ERROR: at #%d, sum %d ref %d diff %d \n", i, sum,
             toy_output_data_ref[i], diff);
      return -1;
    } else {
      printf("Sample #%d pass, sum %d ref %d diff %d \n", i, sum,
             toy_output_data_ref[i], diff);
    }
  }

  printf("Success!\n");
  return 0;
}
