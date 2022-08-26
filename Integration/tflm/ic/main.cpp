#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "ic_data/ic_input_data.h"
#include "ic_data/ic_model_data.h"
#include "ic_data/ic_model_settings.h"
#include "ic_data/ic_output_data_ref.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/micro_mutable_op_resolver.h"
#include "tensorflow/lite/schema/schema_generated.h"

constexpr size_t tensor_arena_size = 256 * 1024;
alignas(16) uint8_t tensor_arena[tensor_arena_size];

int main(int argc, char* argv[]) {
  tflite::MicroErrorReporter micro_error_reporter;
  tflite::ErrorReporter* error_reporter = &micro_error_reporter;

  const tflite::Model* model = tflite::GetModel(ic_model_data);

  static tflite::MicroMutableOpResolver<7> resolver;
  resolver.AddFullyConnected();
  resolver.AddConv2D();
  resolver.AddDepthwiseConv2D();
  resolver.AddAveragePool2D();
  resolver.AddReshape();
  resolver.AddSoftmax();
  resolver.AddAdd();

  tflite::MicroInterpreter interpreter(model, resolver, tensor_arena,
                                       tensor_arena_size, error_reporter);

  if (interpreter.AllocateTensors() != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "ERROR: In AllocateTensors().");
    return -1;
  }

  for (size_t i = 0; i < ic_data_sample_cnt; i++) {
    // Plain memcpy does not suffice as we need to add 128 to every value of the
    // input tensor
    for (size_t j = 0; j < ic_input_data_len[i]; j++) {
      interpreter.input(0)->data.int8[j] = (int8_t)ic_input_data[i][j] + 128;
    }

    if (interpreter.Invoke() != kTfLiteOk) {
      TF_LITE_REPORT_ERROR(error_reporter, "ERROR: In Invoke().");
      return -1;
    }

    int8_t top_index = 0;
    for (size_t j = 0; j < ic_model_label_cnt; j++) {
      if (interpreter.output(0)->data.int8[j] >
          interpreter.output(0)->data.int8[top_index]) {
        top_index = j;
      }
    }

    if (top_index != ic_output_data_ref[i]) {
      printf("ERROR: at #%d, top_index %d ic_output_data_ref %d \n", i,
             top_index, ic_output_data_ref[i]);
      return -1;
    } else {
      printf("Sample #%d pass, top_index %d matches ref %d \n", i, top_index,
             ic_output_data_ref[i]);
    }
  }

  printf("Success!\n");
  return 0;
}
