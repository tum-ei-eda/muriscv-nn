/*
 *
 * Copyright (c) 2005-2020 Imperas Software Ltd., www.imperas.com
 *
 * The contents of this file are provided under the Software License
 * Agreement that you accepted before downloading this file.
 *
 * This source forms part of the Software and can be used for educational,
 * training, and demonstration purposes but cannot be used for derivative
 * works except in cases where the derivative works require OVP technology
 * to run.
 *
 * For open source models released under licenses that you can use for
 * derivative works, please visit www.OVPworld.org or www.imperas.com
 * for the location of the open source models.
 *
 */

#include <stdio.h>
#include <string.h>

#include "vsupport.h"

// Need to enable the Vector Context Status in mstatus
void enableVEC() {
    asm(
        "    csrr      t0, mstatus       \n"
        "    li        t1, (0x1 << 23)   \n"
        "    or        t1, t1, t0        \n"
        "    csrw      mstatus, t1       \n"
    );
    return;
}

void enableFP() {
    // enable floating point instructions
    asm (
        "    csrr s4, mstatus  \n"
        "    li   s5, 1<<13    \n"
        "    or   s4, s4, s5   \n"
        "    csrw mstatus, s4  \n"
    );
}

void printVEC(v512P v, Uns8 wid, const char *fmt) {
    int idx;
    char format[64];

    if        (wid==8)  {
        sprintf(format, "REPORT: v8[%%02d] = %s\n", fmt);
        for(idx=0; idx<VEC8; idx++) {
            printf(format, idx, v->vu8[idx]);
        }
    } else if (wid==16) {
        sprintf(format, "REPORT: v16[%%02d] = %s\n", fmt);
        for(idx=0; idx<VEC16; idx++) {
            printf(format, idx, v->vu16[idx]);
        }
    } else if (wid==32) {
        sprintf(format, "REPORT: v32[%%02d] = %s\n", fmt);
        for(idx=0; idx<VEC32; idx++) {
            if (!strcmp(fmt,"%f")) {
                printf(format, idx, v->vf32[idx]);
            } else {
                printf(format, idx, v->vu32[idx]);
            }
        }
    } else if (wid==64) {
        sprintf(format, "REPORT: v64[%%02d] = %s\n", fmt);
        for(idx=0; idx<VEC64; idx++) {
            if (!strcmp(fmt,"%f")) {
                printf(format, idx, v->vf64[idx]);
            } else {
                printf(format, idx, v->vu64[idx]);
            }
        }
    }
}
