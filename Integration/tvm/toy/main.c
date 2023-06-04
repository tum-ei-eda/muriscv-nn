#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

#include "toy_data/toy_input_data.h"
#include "toy_data/toy_model_settings.h"
#include "toy_data/toy_output_data_ref.h"
#include "tvm/runtime/c_runtime_api.h"
#include "tvm/runtime/crt/error_codes.h"
#include "tvmgen_default.h"

void TVMLogf(const char *msg, ...)
{
    va_list args;
    va_start(args, msg);
    vfprintf(stdout, msg, args);
    va_end(args);
}

tvm_crt_error_t TVMPlatformMemoryAllocate(size_t num_bytes, DLDevice dev, void **out_ptr)
{
    return kTvmErrorFunctionCallNotImplemented;
}

tvm_crt_error_t TVMPlatformMemoryFree(void *ptr, DLDevice dev) { return kTvmErrorFunctionCallNotImplemented; }

void __attribute__((noreturn)) TVMPlatformAbort(tvm_crt_error_t error_code)
{
    printf("TVMPlatformAbort: %d\n", error_code);
    exit(-1);
}

TVM_DLL int TVMFuncRegisterGlobal(const char *name, TVMFunctionHandle f, int override) { return 0; }

int run_test()
{
    int ret_val = 42;
    for (size_t i = 0; i < toy_data_sample_cnt; i++)
    {
        struct tvmgen_default_inputs tvmgen_default_inputs = {(int8_t *)toy_input_data[i]};
        int8_t output_data[1024] = {0}; // TODO(fabianpedd): Make this precise by using defines for the array sizes
        struct tvmgen_default_outputs tvmgen_default_outputs = {output_data};


        printf("Beginning Run\n");

        uint32_t timerBefore;
        uint32_t timerAfter;

        uint32_t instBefore;
        uint32_t instAfter;

        __asm__ volatile("csrr %0, cycle;" : "=r" (timerBefore)  );
        __asm__ volatile("csrr %0, minstret;" : "=r" (instBefore)  );

        printf("A\n");
        ret_val = tvmgen_default_run(&tvmgen_default_inputs, &tvmgen_default_outputs);
        printf("B\n");

        __asm__ volatile("csrr %0, cycle;" : "=r" (timerAfter)  );
        __asm__ volatile("csrr %0, minstret;" : "=r" (instAfter)  );

        printf("Total Cycles  : %d\n\n", abs(timerAfter - timerBefore));

        printf("Total Instructions  : %d\n\n", abs(instAfter - instBefore));

        if (ret_val)
        {
            TVMPlatformAbort(kTvmErrorPlatformCheckFailure);
        }

        uint32_t sum = 0;
        for (size_t j = 0; j < toy_input_data_len[i]; j++)
        {
            sum += pow((int8_t)toy_input_data[i][j] - output_data[j], 2);
        }
        sum /= toy_input_data_len[i];

        uint32_t diff = abs(sum - toy_output_data_ref[i]);
        if (diff > 1)
        {
            printf("ERROR: at #%d, sum %d ref %d diff %d \n", i, sum, toy_output_data_ref[i], diff);
            return -1;
        }
        else
        {
            printf("Sample #%d pass, sum %d ref %d diff %d \n", i, sum, toy_output_data_ref[i], diff);
        }
    }
    return 0;
}

int main(int argc, char *argv[])
{
    int ret = run_test();
    if (ret != 0)
    {
        printf("Test Failed!\n");
        // Make sure RISC-V simulators detect a failed test
#if defined(__riscv) || defined(__riscv__)
        __asm__ volatile("unimp");
#endif
    }
    else
    {
        printf("Test Success!\n");
    }

    return ret;
}
