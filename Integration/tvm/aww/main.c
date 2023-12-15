#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

#include "aww_data/aww_input_data.h"
#include "aww_data/aww_model_settings.h"
#include "aww_data/aww_output_data_ref.h"
#include "tvm/runtime/c_runtime_api.h"
#include "tvm/runtime/crt/error_codes.h"
#include "tvmgen_default.h"

#if defined(SIM_VICUNA)
#include <uart.h>
#include <runtime.h>
#define printf uart_printf
#endif





void TVMLogf(const char *msg, ...)
{
    va_list args;
    va_start(args, msg);
#if !defined(SIM_VICUNA)
    vfprintf(stdout, msg, args);//Vicuna does not currently support this print statement to the UART device
#endif
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
    for (size_t i = 0; i < aww_data_sample_cnt; i++)
    {
        struct tvmgen_default_inputs tvmgen_default_inputs = {(int8_t *)aww_input_data[i]};
        int8_t output_data[256] = {0}; // TODO(fabianpedd): Make this precise by using defines for the array sizes
        struct tvmgen_default_outputs tvmgen_default_outputs = {output_data};

#if defined(SIM_VICUNA)
        //These prints and CSR Reads are for benchmarking on Vicuna
        printf("Beginning Run\n");

        uint32_t timerBefore;
        uint32_t timerAfter;

        uint32_t instBefore;
        uint32_t instAfter;
        
        __asm__ volatile("csrr %0, cycle;" : "=r" (timerBefore)  );
        __asm__ volatile("csrr %0, minstret;" : "=r" (instBefore)  );
#endif

        int ret_val = tvmgen_default_run(&tvmgen_default_inputs, &tvmgen_default_outputs);

#if defined(SIM_VICUNA)
        __asm__ volatile("csrr %0, cycle;" : "=r" (timerAfter)  );
        __asm__ volatile("csrr %0, minstret;" : "=r" (instAfter)  );

        printf("Value Before : %d\n", timerBefore);
        printf("Value After  : %d\n", timerAfter);
        printf("Total Cycles : %d\n\n", abs(timerAfter - timerBefore));

        printf("RetInst Before : %d\n", instBefore);
        printf("RetInst After  : %d\n", instAfter);
        printf("Total RetInst  : %d\n\n", abs(instAfter - instBefore));
#endif



        if (ret_val)
        {
            TVMPlatformAbort(kTvmErrorPlatformCheckFailure);
        }

        int8_t top_index = 0;
        for (size_t j = 0; j < aww_model_label_cnt; j++)
        {
            if (output_data[j] > output_data[top_index])
            {
                top_index = j;
            }
        }

        if (top_index != aww_output_data_ref[i])
        {
            printf("ERROR: at #%d, top_index %d aww_output_data_ref %d \n", i, top_index, aww_output_data_ref[i]);
            return -1;
        }
        else
        {
            printf("Sample #%d pass, top_index %d matches ref %d \n", i, top_index, aww_output_data_ref[i]);
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
