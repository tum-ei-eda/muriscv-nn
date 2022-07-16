#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <dlpack/dlpack.h>
#include "tvm/runtime/c_runtime_api.h"
#include "tvm/runtime/crt/error_codes.h"

#include "tvmgen_default.h"

// As we do not known the model inputs, let's assume these are large enough...

char input0_data[100000];
struct tvmgen_default_inputs tvmgen_default_inputs = {input0_data};

char output0_data[100000];
struct tvmgen_default_outputs tvmgen_default_outputs = {output0_data};

void TVMLogf(const char* msg, ...) {
    va_list args;
    va_start(args, msg);
    printf(msg, args);
    va_end(args);
}

tvm_crt_error_t TVMPlatformMemoryAllocate(size_t num_bytes, DLDevice dev, void** out_ptr) {
    return kTvmErrorFunctionCallNotImplemented;
}
tvm_crt_error_t TVMPlatformMemoryFree(void* ptr, DLDevice dev) {
    return kTvmErrorFunctionCallNotImplemented;
}

void __attribute__((noreturn)) TVMPlatformAbort(tvm_crt_error_t code) {
    printf("ERROR = %d!\n", code);
    exit(1);
}

TVM_DLL int TVMFuncRegisterGlobal(const char* name, TVMFunctionHandle f, int override) { return 0; }

int main() {
    printf("Running model...\n");
    int ret_val = tvmgen_default_run(&tvmgen_default_inputs, &tvmgen_default_outputs);
    if (ret_val) {
        TVMPlatformAbort(kTvmErrorPlatformCheckFailure);
    }
    printf("Done!\n");
    return 0;
}

