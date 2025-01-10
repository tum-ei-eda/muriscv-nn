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

#define VECSIZE 512
#define VEC8    (VECSIZE / 8)
#define VEC16   (VECSIZE / 16)
#define VEC32   (VECSIZE / 32)
#define VEC64   (VECSIZE / 64)

typedef unsigned char          Uns8;
typedef unsigned short         Uns16;
typedef unsigned int           Uns32;
typedef unsigned long long int Uns64;
typedef float                  Flt32;
typedef double                 Flt64;

typedef union v512U {
    Uns8   vu8[VEC8];
    Uns16  vu16[VEC16];
    Uns32  vu32[VEC32];
    Flt32  vf32[VEC32];
    Uns64  vu64[VEC64];
    Flt64  vf64[VEC64];
} v512T, *v512P;

void printVEC(v512P v, Uns8 wid, const char *fmt);
void enableVEC();
void enableFP();
