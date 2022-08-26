#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "aww_data/aww_input_data.h"
#include "aww_data/aww_model_data.h"
#include "aww_data/aww_model_settings.h"
#include "aww_data/aww_output_data_ref.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/micro_mutable_op_resolver.h"
#include "tensorflow/lite/schema/schema_generated.h"

constexpr size_t tensor_arena_size = 256 * 1024;
alignas(16) uint8_t tensor_arena[tensor_arena_size];

int main(int argc, char* argv[]) {
  tflite::MicroErrorReporter micro_error_reporter;
  tflite::ErrorReporter* error_reporter = &micro_error_reporter;

  const tflite::Model* model = tflite::GetModel(aww_model_data);

  static tflite::MicroMutableOpResolver<6> resolver;
  resolver.AddFullyConnected();
  resolver.AddConv2D();
  resolver.AddDepthwiseConv2D();
  resolver.AddAveragePool2D();
  resolver.AddReshape();
  resolver.AddSoftmax();

  tflite::MicroInterpreter interpreter(model, resolver, tensor_arena,
                                       tensor_arena_size, error_reporter);

  if (interpreter.AllocateTensors() != kTfLiteOk) {
    TF_LITE_REPORT_ERROR(error_reporter, "ERROR: In AllocateTensors().");
    return -1;
  }

  for (size_t i = 0; i < aww_data_sample_cnt; i++) {
    memcpy(interpreter.input(0)->data.int8, (int8_t*)aww_input_data[i],
           aww_input_data_len[i]);

    if (interpreter.Invoke() != kTfLiteOk) {
      TF_LITE_REPORT_ERROR(error_reporter, "ERROR: In Invoke().");
      return -1;
    }

    int8_t top_index = 0;
    for (size_t j = 0; j < aww_model_label_cnt; j++) {
      if (interpreter.output(0)->data.int8[j] >
          interpreter.output(0)->data.int8[top_index]) {
        top_index = j;
      }
    }

    if (top_index != aww_output_data_ref[i]) {
      printf("ERROR: at #%d, top_index %d aww_output_data_ref %d \n", i,
             top_index, aww_output_data_ref[i]);
      return -1;
    } else {
      printf("Sample #%d pass, top_index %d matches ref %d \n", i, top_index,
             aww_output_data_ref[i]);
    }
  }

  printf("Success!\n");
  return 0;
}
