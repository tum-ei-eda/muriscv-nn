#include <stdint.h>

#include "muriscv_nn_functions.h"

int main(void)
{
    q7_t values[] = {-128, -1, 0, 1, 127};
    const q7_t expected[] = {0, 0, 0, 1, 127};

    muriscv_nn_relu_q7(values, (uint16_t)(sizeof(values) / sizeof(values[0])));

    for (unsigned int i = 0; i < sizeof(values) / sizeof(values[0]); ++i)
    {
        if (values[i] != expected[i])
        {
            return 1;
        }
    }

    return 0;
}
