// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlane_e.h for the primary calling header

#include "Vlane_e_PSBYia.h"
#include "Vlane_e_PSplPG.h"

#include "verilated_dpi.h"

extern const VlWide<10> Vlane_e__ConstPool__PS2URe;

VL_INLINE_OPT void Vlane_e_PSBYia__PSjYrI(Vlane_e_PSBYia* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vlane_e_PSplPG* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlane_e_PSBYia__PSjYrI\n"); );
    // Variables
    CData PSi9lD;
    CData PShQDJ;
    CData PSccYI;
    CData PSV8nP;
    CData PSVaSy;
    CData PSTCII;
    CData PSHAhn;
    CData PSzmao;
    CData PSX226;
    CData PS0PvK;
    CData PSl6we;
    CData PSnACJ;
    CData PSxJEX;
    CData PS2pso;
    CData PS6zm3;
    CData PSr3Gq;
    CData PSl6tO;
    CData PSCVYe;
    CData PSyQbC;
    CData PSNU2L;
    CData PSK4i8;
    SData PS1RlL;
    SData PSIxfk;
    SData PSel0Y;
    SData PSypPc;
    SData PSzI7s;
    SData PSmCG4;
    SData PSfjCu;
    SData PScBCJ;
    VlWide<3> PScyfP;
    IData PSB2A9;
    VlWide<3> PSfsnK;
    VlWide<3> PSvhuJ;
    IData PSXBCg;
    VlWide<3> PSVis0;
    VlWide<6> PSvfEi;
    VlWide<6> PSL7wa;
    IData PSsBz8;
    IData PSFCIE;
    IData PSacXn;
    IData PS5sCl;
    IData PSPq1M;
    IData PSUAAL;
    IData PS9t0S;
    IData PSsbkx;
    IData PSAfsU;
    CData PSOTKL;
    CData PSJTAb;
    CData PSiD84;
    CData PSRJ2v;
    CData PSRh5V;
    CData PSseVN;
    CData PSIROH;
    CData PSsrHk;
    CData PSg9kE;
    CData PS9Hpv;
    CData PSpEa5;
    CData PSliBq;
    CData PScXOo;
    CData PSVcoj;
    CData PS3U99;
    CData PSKLwr;
    VlWide<7> PSaMtS;
    VlWide<7> PSJ0R5;
    VlWide<7> PSOK4W;
    VlWide<7> PSB2AQ1IM;
    VlWide<7> PS9EOk;
    VlWide<7> PS8KdK;
    VlWide<7> PS9Fge;
    VlWide<7> PSn3aT;
    VlWide<4> PSqG5C;
    VlWide<4> PSUPQG;
    VlWide<4> PSOOAC;
    VlWide<4> PS4Aig;
    VlWide<4> PSRPJZ;
    VlWide<4> PS3KqQ;
    VlWide<4> PS5dlp;
    VlWide<4> PSlp2c;
    VlWide<4> PSL97F;
    VlWide<4> PS79br;
    VlWide<4> PStBjs;
    VlWide<4> PSErUN;
    VlWide<4> PSIuLL;
    VlWide<4> PSJyeL;
    VlWide<4> PSTuC1;
    VlWide<4> PSkz3L;
    VlWide<4> PSKWji;
    VlWide<4> PSTUBQ;
    VlWide<4> PS5Oqb;
    VlWide<4> PSLSIT;
    VlWide<6> PSC9Eb;
    VlWide<6> PSIojr;
    VlWide<6> PS23SX;
    VlWide<6> PSCe5f;
    VlWide<6> PScX8u;
    VlWide<6> PSWNZd;
    VlWide<6> PSoEr6;
    VlWide<6> PSWn1f;
    VlWide<6> PScTPw;
    VlWide<3> PS1VfH;
    VlWide<3> PSIVI0;
    VlWide<3> PSUI1u;
    VlWide<3> PSwvXn;
    VlWide<3> PS8Rf7;
    VlWide<3> PS3Oqz;
    VlWide<3> PSdGjy;
    VlWide<3> PS8r3Z;
    VlWide<3> PS0hNU;
    VlWide<3> PSArFz;
    VlWide<3> PSi8E9;
    VlWide<3> PSVaLP;
    VlWide<3> PSiBuD;
    VlWide<3> PSys9N;
    VlWide<3> PS5iRr;
    VlWide<3> PSbz8E;
    VlWide<3> PSW7VB;
    VlWide<3> PS67rg;
    CData PSZuta;
    CData PS8nCz;
    CData PS561A;
    CData PSCFTR;
    CData PSSSs3;
    CData PSvMGz;
    CData PSNpjH;
    CData PSXg5A;
    VlWide<6> PSPnBq;
    VlWide<3> PSMmmb;
    VlWide<3> PSkYny;
    VlWide<5> PSlZls;
    VlWide<5> PSE2yI;
    VlWide<5> PSButB;
    VlWide<5> PSfMdB;
    CData PS9yPE;
    CData PSlLZg;
    CData PS1QET;
    CData PSwiA0;
    QData PSzKQX;
    QData PS584z;
    QData PSkHbf;
    QData PSerbP;
    QData PSvEon;
    QData PSDhBe;
    QData PS4AGY;
    QData PSFA25;
    QData PS7moc;
    // Body
    vlSelf->PSq2YV = ((0xffffffffffffdfffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0xdU));
    vlSelf->PSq2YV = ((0xffffffffffffbfffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0xeU));
    vlSelf->PSq2YV = ((0xffffffffffff7fffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0xfU));
    vlSelf->PSq2YV = ((0xfffffffffffeffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x10U));
    vlSelf->PSq2YV = ((0xfffffffffffdffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x11U));
    vlSelf->PSq2YV = ((0xfffffffffffbffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x12U));
    vlSelf->PSq2YV = ((0xfffffffffff7ffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x13U));
    vlSelf->PSq2YV = ((0xffffffffffefffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x14U));
    vlSelf->PSq2YV = ((0xffffffffffdfffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x15U));
    vlSelf->PSq2YV = ((0xffffffffffbfffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x16U));
    vlSelf->PSq2YV = ((0xffffffffff7fffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x17U));
    vlSelf->PSq2YV = ((0xfffffffffeffffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x18U));
    vlSelf->PSq2YV = ((0xfffffffffdffffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x19U));
    vlSelf->PSq2YV = ((0xfffffffffbffffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x1aU));
    vlSelf->PSq2YV = ((0xfffffffff7ffffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x1bU));
    vlSelf->PSq2YV = ((0xffffffffefffffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x1cU));
    vlSelf->PSq2YV = ((0xffffffffdfffffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x1dU));
    vlSelf->PSq2YV = ((0xffffffffbfffffffULL & vlSelf->PSq2YV) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000000ULL 
                                                   & vlSelf->PSq2YV))))) 
                         << 0x1eU));
    vlSelf->PSlWgI[0U] = ((0xffffffc0U & vlSelf->PSlWgI[0U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSq2YV 
                                                     >> 1U)))
                                       ? ((vlSelf->PSlWgI[0U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSlWgI[0U] 
                                             >> 6U))
                                       : ((vlSelf->PSlWgI[0U] 
                                           << 0x14U) 
                                          | (vlSelf->PSlWgI[0U] 
                                             >> 0xcU)))));
    vlSelf->PSlWgI[0U] = ((0xfffff03fU & vlSelf->PSlWgI[0U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSq2YV 
                                                       >> 3U)))
                                         ? ((vlSelf->PSlWgI[0U] 
                                             << 0xeU) 
                                            | (vlSelf->PSlWgI[0U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSlWgI[0U] 
                                             << 8U) 
                                            | (vlSelf->PSlWgI[0U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSlWgI[0U] = ((0xfffc0fffU & vlSelf->PSlWgI[0U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSq2YV 
                                                         >> 5U)))
                                           ? ((vlSelf->PSlWgI[1U] 
                                               << 2U) 
                                              | (vlSelf->PSlWgI[0U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSlWgI[1U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSlWgI[1U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSlWgI[0U] = ((0xff03ffffU & vlSelf->PSlWgI[0U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSq2YV 
                                                          >> 7U)))
                                            ? ((vlSelf->PSlWgI[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSlWgI[1U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSlWgI[1U] 
                                                << 0x10U) 
                                               | (vlSelf->PSlWgI[1U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSlWgI[0U] = ((0xc0ffffffU & vlSelf->PSlWgI[0U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSq2YV 
                                                            >> 9U)))
                                              ? ((vlSelf->PSlWgI[1U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSlWgI[1U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSlWgI[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSlWgI[1U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSOTKL = (0x3fU & ((1U & (IData)((vlSelf->PSq2YV 
                                      >> 0xbU))) ? 
                       ((vlSelf->PSlWgI[2U] << 0x1eU) 
                        | (vlSelf->PSlWgI[2U] >> 2U))
                        : ((vlSelf->PSlWgI[2U] << 0x18U) 
                           | (vlSelf->PSlWgI[2U] >> 8U))));
    vlSelf->PSlWgI[0U] = ((0x3fffffffU & vlSelf->PSlWgI[0U]) 
                          | (((1U & (IData)((vlSelf->PSq2YV 
                                             >> 0xbU)))
                               ? ((vlSelf->PSlWgI[2U] 
                                   << 0x1eU) | (vlSelf->PSlWgI[2U] 
                                                >> 2U))
                               : ((vlSelf->PSlWgI[2U] 
                                   << 0x18U) | (vlSelf->PSlWgI[2U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSlWgI[1U] = ((0xfffffff0U & vlSelf->PSlWgI[1U]) 
                          | (PSOTKL >> 2U));
    vlSelf->PSlWgI[1U] = ((0xfffffc0fU & vlSelf->PSlWgI[1U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSq2YV 
                                                       >> 0xdU)))
                                         ? ((vlSelf->PSlWgI[2U] 
                                             << 0x12U) 
                                            | (vlSelf->PSlWgI[2U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSlWgI[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSlWgI[2U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSlWgI[1U] = ((0xffff03ffU & vlSelf->PSlWgI[1U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSq2YV 
                                                        >> 0xfU)))
                                          ? ((vlSelf->PSlWgI[2U] 
                                              << 6U) 
                                             | (vlSelf->PSlWgI[2U] 
                                                >> 0x1aU))
                                          : vlSelf->PSlWgI[3U]) 
                                        << 0xaU)));
    vlSelf->PSlWgI[1U] = ((0xffc0ffffU & vlSelf->PSlWgI[1U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSq2YV 
                                                          >> 0x11U)))
                                            ? ((vlSelf->PSlWgI[3U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSlWgI[3U] 
                                                  >> 6U))
                                            : ((vlSelf->PSlWgI[3U] 
                                                << 0x14U) 
                                               | (vlSelf->PSlWgI[3U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSlWgI[1U] = ((0xf03fffffU & vlSelf->PSlWgI[1U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSq2YV 
                                                           >> 0x13U)))
                                             ? ((vlSelf->PSlWgI[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSlWgI[3U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSlWgI[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSlWgI[3U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSJTAb = (0x3fU & ((1U & (IData)((vlSelf->PSq2YV 
                                      >> 0x15U))) ? 
                       ((vlSelf->PSlWgI[4U] << 2U) 
                        | (vlSelf->PSlWgI[3U] >> 0x1eU))
                        : ((vlSelf->PSlWgI[4U] << 0x1cU) 
                           | (vlSelf->PSlWgI[4U] >> 4U))));
    vlSelf->PSlWgI[1U] = ((0xfffffffU & vlSelf->PSlWgI[1U]) 
                          | (((1U & (IData)((vlSelf->PSq2YV 
                                             >> 0x15U)))
                               ? ((vlSelf->PSlWgI[4U] 
                                   << 2U) | (vlSelf->PSlWgI[3U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSlWgI[4U] 
                                   << 0x1cU) | (vlSelf->PSlWgI[4U] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSlWgI[2U] = ((0xfffffffcU & vlSelf->PSlWgI[2U]) 
                          | (PSJTAb >> 4U));
    vlSelf->PSlWgI[2U] = ((0xffffff03U & vlSelf->PSlWgI[2U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSq2YV 
                                                      >> 0x17U)))
                                        ? ((vlSelf->PSlWgI[4U] 
                                            << 0x16U) 
                                           | (vlSelf->PSlWgI[4U] 
                                              >> 0xaU))
                                        : ((vlSelf->PSlWgI[4U] 
                                            << 0x10U) 
                                           | (vlSelf->PSlWgI[4U] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSlWgI[2U] = ((0xffffc0ffU & vlSelf->PSlWgI[2U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSq2YV 
                                                        >> 0x19U)))
                                          ? ((vlSelf->PSlWgI[4U] 
                                              << 0xaU) 
                                             | (vlSelf->PSlWgI[4U] 
                                                >> 0x16U))
                                          : ((vlSelf->PSlWgI[5U] 
                                              << 4U) 
                                             | (vlSelf->PSlWgI[4U] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSlWgI[2U] = ((0xfff03fffU & vlSelf->PSlWgI[2U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSq2YV 
                                                         >> 0x1bU)))
                                           ? ((vlSelf->PSlWgI[5U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSlWgI[5U] 
                                                 >> 2U))
                                           : ((vlSelf->PSlWgI[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSlWgI[5U] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSlWgI[2U] = ((0xfc0fffffU & vlSelf->PSlWgI[2U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSq2YV 
                                                           >> 0x1dU)))
                                             ? ((vlSelf->PSlWgI[5U] 
                                                 << 0x12U) 
                                                | (vlSelf->PSlWgI[5U] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSlWgI[5U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSlWgI[5U] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSlWgI[2U] = ((0x3ffffffU & vlSelf->PSlWgI[2U]) 
                          | (((1U & (IData)((vlSelf->PSq2YV 
                                             >> 0x1fU)))
                               ? ((vlSelf->PSlWgI[5U] 
                                   << 6U) | (vlSelf->PSlWgI[5U] 
                                             >> 0x1aU))
                               : vlSelf->PSlWgI[6U]) 
                             << 0x1aU));
    vlSelf->PSlWgI[3U] = ((0xffffffc0U & vlSelf->PSlWgI[3U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSq2YV 
                                                     >> 0x21U)))
                                       ? ((vlSelf->PSlWgI[6U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSlWgI[6U] 
                                             >> 6U))
                                       : ((vlSelf->PSlWgI[6U] 
                                           << 0x14U) 
                                          | (vlSelf->PSlWgI[6U] 
                                             >> 0xcU)))));
    vlSelf->PSlWgI[3U] = ((0xfffff03fU & vlSelf->PSlWgI[3U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSq2YV 
                                                       >> 0x23U)))
                                         ? ((vlSelf->PSlWgI[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSlWgI[6U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSlWgI[6U] 
                                             << 8U) 
                                            | (vlSelf->PSlWgI[6U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSlWgI[3U] = ((0xfffc0fffU & vlSelf->PSlWgI[3U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSq2YV 
                                                         >> 0x25U)))
                                           ? ((vlSelf->PSlWgI[7U] 
                                               << 2U) 
                                              | (vlSelf->PSlWgI[6U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSlWgI[7U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSlWgI[7U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSlWgI[3U] = ((0xff03ffffU & vlSelf->PSlWgI[3U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSq2YV 
                                                          >> 0x27U)))
                                            ? ((vlSelf->PSlWgI[7U] 
                                                << 0x16U) 
                                               | (vlSelf->PSlWgI[7U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSlWgI[7U] 
                                                << 0x10U) 
                                               | (vlSelf->PSlWgI[7U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSlWgI[3U] = ((0xc0ffffffU & vlSelf->PSlWgI[3U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSq2YV 
                                                            >> 0x29U)))
                                              ? ((vlSelf->PSlWgI[7U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSlWgI[7U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSlWgI[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSlWgI[7U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSiD84 = (0x3fU & ((1U & (IData)((vlSelf->PSq2YV 
                                      >> 0x2bU))) ? 
                       ((vlSelf->PSlWgI[8U] << 0x1eU) 
                        | (vlSelf->PSlWgI[8U] >> 2U))
                        : ((vlSelf->PSlWgI[8U] << 0x18U) 
                           | (vlSelf->PSlWgI[8U] >> 8U))));
    vlSelf->PSlWgI[3U] = ((0x3fffffffU & vlSelf->PSlWgI[3U]) 
                          | (((1U & (IData)((vlSelf->PSq2YV 
                                             >> 0x2bU)))
                               ? ((vlSelf->PSlWgI[8U] 
                                   << 0x1eU) | (vlSelf->PSlWgI[8U] 
                                                >> 2U))
                               : ((vlSelf->PSlWgI[8U] 
                                   << 0x18U) | (vlSelf->PSlWgI[8U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSlWgI[4U] = ((0xfffffff0U & vlSelf->PSlWgI[4U]) 
                          | (PSiD84 >> 2U));
    vlSelf->PSlWgI[4U] = ((0xfffffc0fU & vlSelf->PSlWgI[4U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSq2YV 
                                                       >> 0x2dU)))
                                         ? ((vlSelf->PSlWgI[8U] 
                                             << 0x12U) 
                                            | (vlSelf->PSlWgI[8U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSlWgI[8U] 
                                             << 0xcU) 
                                            | (vlSelf->PSlWgI[8U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSlWgI[4U] = ((0xffff03ffU & vlSelf->PSlWgI[4U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSq2YV 
                                                        >> 0x2fU)))
                                          ? ((vlSelf->PSlWgI[8U] 
                                              << 6U) 
                                             | (vlSelf->PSlWgI[8U] 
                                                >> 0x1aU))
                                          : vlSelf->PSlWgI[9U]) 
                                        << 0xaU)));
    vlSelf->PSlWgI[4U] = ((0xffc0ffffU & vlSelf->PSlWgI[4U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSq2YV 
                                                          >> 0x31U)))
                                            ? ((vlSelf->PSlWgI[9U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSlWgI[9U] 
                                                  >> 6U))
                                            : ((vlSelf->PSlWgI[9U] 
                                                << 0x14U) 
                                               | (vlSelf->PSlWgI[9U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSlWgI[4U] = ((0xf03fffffU & vlSelf->PSlWgI[4U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSq2YV 
                                                           >> 0x33U)))
                                             ? ((vlSelf->PSlWgI[9U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSlWgI[9U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSlWgI[9U] 
                                                 << 8U) 
                                                | (vlSelf->PSlWgI[9U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSRJ2v = (0x3fU & ((1U & (IData)((vlSelf->PSq2YV 
                                      >> 0x35U))) ? 
                       ((vlSelf->PSlWgI[0xaU] << 2U) 
                        | (vlSelf->PSlWgI[9U] >> 0x1eU))
                        : ((vlSelf->PSlWgI[0xaU] << 0x1cU) 
                           | (vlSelf->PSlWgI[0xaU] 
                              >> 4U))));
    vlSelf->PSlWgI[4U] = ((0xfffffffU & vlSelf->PSlWgI[4U]) 
                          | (((1U & (IData)((vlSelf->PSq2YV 
                                             >> 0x35U)))
                               ? ((vlSelf->PSlWgI[0xaU] 
                                   << 2U) | (vlSelf->PSlWgI[9U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSlWgI[0xaU] 
                                   << 0x1cU) | (vlSelf->PSlWgI[0xaU] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSlWgI[5U] = ((0xfffffffcU & vlSelf->PSlWgI[5U]) 
                          | (PSRJ2v >> 4U));
    vlSelf->PSlWgI[5U] = ((0xffffff03U & vlSelf->PSlWgI[5U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSq2YV 
                                                      >> 0x37U)))
                                        ? ((vlSelf->PSlWgI[0xaU] 
                                            << 0x16U) 
                                           | (vlSelf->PSlWgI[0xaU] 
                                              >> 0xaU))
                                        : ((vlSelf->PSlWgI[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSlWgI[0xaU] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSlWgI[5U] = ((0xffffc0ffU & vlSelf->PSlWgI[5U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSq2YV 
                                                        >> 0x39U)))
                                          ? ((vlSelf->PSlWgI[0xaU] 
                                              << 0xaU) 
                                             | (vlSelf->PSlWgI[0xaU] 
                                                >> 0x16U))
                                          : ((vlSelf->PSlWgI[0xbU] 
                                              << 4U) 
                                             | (vlSelf->PSlWgI[0xaU] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSlWgI[5U] = ((0xfff03fffU & vlSelf->PSlWgI[5U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSq2YV 
                                                         >> 0x3bU)))
                                           ? ((vlSelf->PSlWgI[0xbU] 
                                               << 0x1eU) 
                                              | (vlSelf->PSlWgI[0xbU] 
                                                 >> 2U))
                                           : ((vlSelf->PSlWgI[0xbU] 
                                               << 0x18U) 
                                              | (vlSelf->PSlWgI[0xbU] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSlWgI[5U] = ((0xfc0fffffU & vlSelf->PSlWgI[5U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSq2YV 
                                                           >> 0x3dU)))
                                             ? ((vlSelf->PSlWgI[0xbU] 
                                                 << 0x12U) 
                                                | (vlSelf->PSlWgI[0xbU] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSlWgI[0xbU] 
                                                 << 0xcU) 
                                                | (vlSelf->PSlWgI[0xbU] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    if (((IData)(vlSelf->PSJIo7) & (IData)(vlSelf->PSECYd))) {
        vlSelf->PSa3qB = (0x1fffffffffffffULL & (vlSelf->PSVWV7 
                                                 << 
                                                 (0x3fU 
                                                  & vlSelf->PSQSu6[0U])));
        vlSelf->PSeHap = (0xfffU & (((IData)(vlSelf->PS3A7i) 
                                     - (0x3fU & vlSelf->PSQSu6[0U])) 
                                    + (0U != (0x3fU 
                                              & vlSelf->PSQSu6[0U]))));
    } else {
        vlSelf->PSa3qB = (0x1fffffffffffffULL & vlSelf->PS3zoU);
        vlSelf->PSeHap = (0xfffU & (IData)(vlSelf->PSqy0X));
    }
    vlSelf->PSQjug = ((0xfffffffffffffffeULL & vlSelf->PSQjug) 
                      | (IData)((IData)((0ULL != (6ULL 
                                                  & vlSelf->PSQjug)))));
    vlSelf->PSQjug = ((0xfffffffffffffffdULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 1U));
    vlSelf->PSQjug = ((0xfffffffffffffffbULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 2U));
    vlSelf->PSQjug = ((0xfffffffffffffff7ULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 3U));
    vlSelf->PSQjug = ((0xffffffffffffffefULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 4U));
    vlSelf->PSQjug = ((0xffffffffffffffdfULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 5U));
    vlSelf->PSQjug = ((0xffffffffffffffbfULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 6U));
    vlSelf->PSQjug = ((0xffffffffffffff7fULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 7U));
    vlSelf->PSQjug = ((0xfffffffffffffeffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 8U));
    vlSelf->PSQjug = ((0xfffffffffffffdffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 9U));
    vlSelf->PSQjug = ((0xfffffffffffffbffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0xaU));
    vlSelf->PSQjug = ((0xfffffffffffff7ffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0xbU));
    vlSelf->PSQjug = ((0xffffffffffffefffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0xcU));
    vlSelf->PSQjug = ((0xffffffffffffdfffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0xdU));
    vlSelf->PSQjug = ((0xffffffffffffbfffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0xeU));
    vlSelf->PSQjug = ((0xffffffffffff7fffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0xfU));
    vlSelf->PSQjug = ((0xfffffffffffeffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x10U));
    vlSelf->PSQjug = ((0xfffffffffffdffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x11U));
    vlSelf->PSQjug = ((0xfffffffffffbffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x12U));
    vlSelf->PSQjug = ((0xfffffffffff7ffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x13U));
    vlSelf->PSQjug = ((0xffffffffffefffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x14U));
    vlSelf->PSQjug = ((0xffffffffffdfffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x15U));
    vlSelf->PSQjug = ((0xffffffffffbfffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x16U));
    vlSelf->PSQjug = ((0xffffffffff7fffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x17U));
    vlSelf->PSQjug = ((0xfffffffffeffffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x18U));
    vlSelf->PSQjug = ((0xfffffffffdffffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x19U));
    vlSelf->PSQjug = ((0xfffffffffbffffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x1aU));
    vlSelf->PSQjug = ((0xfffffffff7ffffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x1bU));
    vlSelf->PSQjug = ((0xffffffffefffffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x1cU));
    vlSelf->PSQjug = ((0xffffffffdfffffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x1dU));
    vlSelf->PSQjug = ((0xffffffffbfffffffULL & vlSelf->PSQjug) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000000ULL 
                                                   & vlSelf->PSQjug))))) 
                         << 0x1eU));
    vlSelf->PSQSu6[0U] = ((0xffffffc0U & vlSelf->PSQSu6[0U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSQjug 
                                                     >> 1U)))
                                       ? ((vlSelf->PSQSu6[0U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSQSu6[0U] 
                                             >> 6U))
                                       : ((vlSelf->PSQSu6[0U] 
                                           << 0x14U) 
                                          | (vlSelf->PSQSu6[0U] 
                                             >> 0xcU)))));
    vlSelf->PSQSu6[0U] = ((0xfffff03fU & vlSelf->PSQSu6[0U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSQjug 
                                                       >> 3U)))
                                         ? ((vlSelf->PSQSu6[0U] 
                                             << 0xeU) 
                                            | (vlSelf->PSQSu6[0U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSQSu6[0U] 
                                             << 8U) 
                                            | (vlSelf->PSQSu6[0U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSQSu6[0U] = ((0xfffc0fffU & vlSelf->PSQSu6[0U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSQjug 
                                                         >> 5U)))
                                           ? ((vlSelf->PSQSu6[1U] 
                                               << 2U) 
                                              | (vlSelf->PSQSu6[0U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSQSu6[1U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSQSu6[1U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSQSu6[0U] = ((0xff03ffffU & vlSelf->PSQSu6[0U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSQjug 
                                                          >> 7U)))
                                            ? ((vlSelf->PSQSu6[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSQSu6[1U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSQSu6[1U] 
                                                << 0x10U) 
                                               | (vlSelf->PSQSu6[1U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSQSu6[0U] = ((0xc0ffffffU & vlSelf->PSQSu6[0U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSQjug 
                                                            >> 9U)))
                                              ? ((vlSelf->PSQSu6[1U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSQSu6[1U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSQSu6[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSQSu6[1U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSRh5V = (0x3fU & ((1U & (IData)((vlSelf->PSQjug 
                                      >> 0xbU))) ? 
                       ((vlSelf->PSQSu6[2U] << 0x1eU) 
                        | (vlSelf->PSQSu6[2U] >> 2U))
                        : ((vlSelf->PSQSu6[2U] << 0x18U) 
                           | (vlSelf->PSQSu6[2U] >> 8U))));
    vlSelf->PSQSu6[0U] = ((0x3fffffffU & vlSelf->PSQSu6[0U]) 
                          | (((1U & (IData)((vlSelf->PSQjug 
                                             >> 0xbU)))
                               ? ((vlSelf->PSQSu6[2U] 
                                   << 0x1eU) | (vlSelf->PSQSu6[2U] 
                                                >> 2U))
                               : ((vlSelf->PSQSu6[2U] 
                                   << 0x18U) | (vlSelf->PSQSu6[2U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSQSu6[1U] = ((0xfffffff0U & vlSelf->PSQSu6[1U]) 
                          | (PSRh5V >> 2U));
    vlSelf->PSQSu6[1U] = ((0xfffffc0fU & vlSelf->PSQSu6[1U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSQjug 
                                                       >> 0xdU)))
                                         ? ((vlSelf->PSQSu6[2U] 
                                             << 0x12U) 
                                            | (vlSelf->PSQSu6[2U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSQSu6[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSQSu6[2U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSQSu6[1U] = ((0xffff03ffU & vlSelf->PSQSu6[1U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSQjug 
                                                        >> 0xfU)))
                                          ? ((vlSelf->PSQSu6[2U] 
                                              << 6U) 
                                             | (vlSelf->PSQSu6[2U] 
                                                >> 0x1aU))
                                          : vlSelf->PSQSu6[3U]) 
                                        << 0xaU)));
    vlSelf->PSQSu6[1U] = ((0xffc0ffffU & vlSelf->PSQSu6[1U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSQjug 
                                                          >> 0x11U)))
                                            ? ((vlSelf->PSQSu6[3U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSQSu6[3U] 
                                                  >> 6U))
                                            : ((vlSelf->PSQSu6[3U] 
                                                << 0x14U) 
                                               | (vlSelf->PSQSu6[3U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSQSu6[1U] = ((0xf03fffffU & vlSelf->PSQSu6[1U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSQjug 
                                                           >> 0x13U)))
                                             ? ((vlSelf->PSQSu6[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSQSu6[3U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSQSu6[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSQSu6[3U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSseVN = (0x3fU & ((1U & (IData)((vlSelf->PSQjug 
                                      >> 0x15U))) ? 
                       ((vlSelf->PSQSu6[4U] << 2U) 
                        | (vlSelf->PSQSu6[3U] >> 0x1eU))
                        : ((vlSelf->PSQSu6[4U] << 0x1cU) 
                           | (vlSelf->PSQSu6[4U] >> 4U))));
    vlSelf->PSQSu6[1U] = ((0xfffffffU & vlSelf->PSQSu6[1U]) 
                          | (((1U & (IData)((vlSelf->PSQjug 
                                             >> 0x15U)))
                               ? ((vlSelf->PSQSu6[4U] 
                                   << 2U) | (vlSelf->PSQSu6[3U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSQSu6[4U] 
                                   << 0x1cU) | (vlSelf->PSQSu6[4U] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSQSu6[2U] = ((0xfffffffcU & vlSelf->PSQSu6[2U]) 
                          | (PSseVN >> 4U));
    vlSelf->PSQSu6[2U] = ((0xffffff03U & vlSelf->PSQSu6[2U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSQjug 
                                                      >> 0x17U)))
                                        ? ((vlSelf->PSQSu6[4U] 
                                            << 0x16U) 
                                           | (vlSelf->PSQSu6[4U] 
                                              >> 0xaU))
                                        : ((vlSelf->PSQSu6[4U] 
                                            << 0x10U) 
                                           | (vlSelf->PSQSu6[4U] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSQSu6[2U] = ((0xffffc0ffU & vlSelf->PSQSu6[2U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSQjug 
                                                        >> 0x19U)))
                                          ? ((vlSelf->PSQSu6[4U] 
                                              << 0xaU) 
                                             | (vlSelf->PSQSu6[4U] 
                                                >> 0x16U))
                                          : ((vlSelf->PSQSu6[5U] 
                                              << 4U) 
                                             | (vlSelf->PSQSu6[4U] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSQSu6[2U] = ((0xfff03fffU & vlSelf->PSQSu6[2U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSQjug 
                                                         >> 0x1bU)))
                                           ? ((vlSelf->PSQSu6[5U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSQSu6[5U] 
                                                 >> 2U))
                                           : ((vlSelf->PSQSu6[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSQSu6[5U] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSQSu6[2U] = ((0xfc0fffffU & vlSelf->PSQSu6[2U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSQjug 
                                                           >> 0x1dU)))
                                             ? ((vlSelf->PSQSu6[5U] 
                                                 << 0x12U) 
                                                | (vlSelf->PSQSu6[5U] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSQSu6[5U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSQSu6[5U] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSQSu6[2U] = ((0x3ffffffU & vlSelf->PSQSu6[2U]) 
                          | (((1U & (IData)((vlSelf->PSQjug 
                                             >> 0x1fU)))
                               ? ((vlSelf->PSQSu6[5U] 
                                   << 6U) | (vlSelf->PSQSu6[5U] 
                                             >> 0x1aU))
                               : vlSelf->PSQSu6[6U]) 
                             << 0x1aU));
    vlSelf->PSQSu6[3U] = ((0xffffffc0U & vlSelf->PSQSu6[3U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSQjug 
                                                     >> 0x21U)))
                                       ? ((vlSelf->PSQSu6[6U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSQSu6[6U] 
                                             >> 6U))
                                       : ((vlSelf->PSQSu6[6U] 
                                           << 0x14U) 
                                          | (vlSelf->PSQSu6[6U] 
                                             >> 0xcU)))));
    vlSelf->PSQSu6[3U] = ((0xfffff03fU & vlSelf->PSQSu6[3U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSQjug 
                                                       >> 0x23U)))
                                         ? ((vlSelf->PSQSu6[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSQSu6[6U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSQSu6[6U] 
                                             << 8U) 
                                            | (vlSelf->PSQSu6[6U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSQSu6[3U] = ((0xfffc0fffU & vlSelf->PSQSu6[3U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSQjug 
                                                         >> 0x25U)))
                                           ? ((vlSelf->PSQSu6[7U] 
                                               << 2U) 
                                              | (vlSelf->PSQSu6[6U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSQSu6[7U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSQSu6[7U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSQSu6[3U] = ((0xff03ffffU & vlSelf->PSQSu6[3U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSQjug 
                                                          >> 0x27U)))
                                            ? ((vlSelf->PSQSu6[7U] 
                                                << 0x16U) 
                                               | (vlSelf->PSQSu6[7U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSQSu6[7U] 
                                                << 0x10U) 
                                               | (vlSelf->PSQSu6[7U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSQSu6[3U] = ((0xc0ffffffU & vlSelf->PSQSu6[3U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSQjug 
                                                            >> 0x29U)))
                                              ? ((vlSelf->PSQSu6[7U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSQSu6[7U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSQSu6[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSQSu6[7U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSIROH = (0x3fU & ((1U & (IData)((vlSelf->PSQjug 
                                      >> 0x2bU))) ? 
                       ((vlSelf->PSQSu6[8U] << 0x1eU) 
                        | (vlSelf->PSQSu6[8U] >> 2U))
                        : ((vlSelf->PSQSu6[8U] << 0x18U) 
                           | (vlSelf->PSQSu6[8U] >> 8U))));
    vlSelf->PSQSu6[3U] = ((0x3fffffffU & vlSelf->PSQSu6[3U]) 
                          | (((1U & (IData)((vlSelf->PSQjug 
                                             >> 0x2bU)))
                               ? ((vlSelf->PSQSu6[8U] 
                                   << 0x1eU) | (vlSelf->PSQSu6[8U] 
                                                >> 2U))
                               : ((vlSelf->PSQSu6[8U] 
                                   << 0x18U) | (vlSelf->PSQSu6[8U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSQSu6[4U] = ((0xfffffff0U & vlSelf->PSQSu6[4U]) 
                          | (PSIROH >> 2U));
    vlSelf->PSQSu6[4U] = ((0xfffffc0fU & vlSelf->PSQSu6[4U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSQjug 
                                                       >> 0x2dU)))
                                         ? ((vlSelf->PSQSu6[8U] 
                                             << 0x12U) 
                                            | (vlSelf->PSQSu6[8U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSQSu6[8U] 
                                             << 0xcU) 
                                            | (vlSelf->PSQSu6[8U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSQSu6[4U] = ((0xffff03ffU & vlSelf->PSQSu6[4U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSQjug 
                                                        >> 0x2fU)))
                                          ? ((vlSelf->PSQSu6[8U] 
                                              << 6U) 
                                             | (vlSelf->PSQSu6[8U] 
                                                >> 0x1aU))
                                          : vlSelf->PSQSu6[9U]) 
                                        << 0xaU)));
    vlSelf->PSQSu6[4U] = ((0xffc0ffffU & vlSelf->PSQSu6[4U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSQjug 
                                                          >> 0x31U)))
                                            ? ((vlSelf->PSQSu6[9U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSQSu6[9U] 
                                                  >> 6U))
                                            : ((vlSelf->PSQSu6[9U] 
                                                << 0x14U) 
                                               | (vlSelf->PSQSu6[9U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSQSu6[4U] = ((0xf03fffffU & vlSelf->PSQSu6[4U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSQjug 
                                                           >> 0x33U)))
                                             ? ((vlSelf->PSQSu6[9U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSQSu6[9U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSQSu6[9U] 
                                                 << 8U) 
                                                | (vlSelf->PSQSu6[9U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSsrHk = (0x3fU & ((1U & (IData)((vlSelf->PSQjug 
                                      >> 0x35U))) ? 
                       ((vlSelf->PSQSu6[0xaU] << 2U) 
                        | (vlSelf->PSQSu6[9U] >> 0x1eU))
                        : ((vlSelf->PSQSu6[0xaU] << 0x1cU) 
                           | (vlSelf->PSQSu6[0xaU] 
                              >> 4U))));
    vlSelf->PSQSu6[4U] = ((0xfffffffU & vlSelf->PSQSu6[4U]) 
                          | (((1U & (IData)((vlSelf->PSQjug 
                                             >> 0x35U)))
                               ? ((vlSelf->PSQSu6[0xaU] 
                                   << 2U) | (vlSelf->PSQSu6[9U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSQSu6[0xaU] 
                                   << 0x1cU) | (vlSelf->PSQSu6[0xaU] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSQSu6[5U] = ((0xfffffffcU & vlSelf->PSQSu6[5U]) 
                          | (PSsrHk >> 4U));
    vlSelf->PSQSu6[5U] = ((0xffffff03U & vlSelf->PSQSu6[5U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSQjug 
                                                      >> 0x37U)))
                                        ? ((vlSelf->PSQSu6[0xaU] 
                                            << 0x16U) 
                                           | (vlSelf->PSQSu6[0xaU] 
                                              >> 0xaU))
                                        : ((vlSelf->PSQSu6[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSQSu6[0xaU] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSQSu6[5U] = ((0xffffc0ffU & vlSelf->PSQSu6[5U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSQjug 
                                                        >> 0x39U)))
                                          ? ((vlSelf->PSQSu6[0xaU] 
                                              << 0xaU) 
                                             | (vlSelf->PSQSu6[0xaU] 
                                                >> 0x16U))
                                          : ((vlSelf->PSQSu6[0xbU] 
                                              << 4U) 
                                             | (vlSelf->PSQSu6[0xaU] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSQSu6[5U] = ((0xfff03fffU & vlSelf->PSQSu6[5U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSQjug 
                                                         >> 0x3bU)))
                                           ? ((vlSelf->PSQSu6[0xbU] 
                                               << 0x1eU) 
                                              | (vlSelf->PSQSu6[0xbU] 
                                                 >> 2U))
                                           : ((vlSelf->PSQSu6[0xbU] 
                                               << 0x18U) 
                                              | (vlSelf->PSQSu6[0xbU] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSQSu6[5U] = ((0xfc0fffffU & vlSelf->PSQSu6[5U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSQjug 
                                                           >> 0x3dU)))
                                             ? ((vlSelf->PSQSu6[0xbU] 
                                                 << 0x12U) 
                                                | (vlSelf->PSQSu6[0xbU] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSQSu6[0xbU] 
                                                 << 0xcU) 
                                                | (vlSelf->PSQSu6[0xbU] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    if (((IData)(vlSelf->PSSiVU) & (IData)(vlSelf->PSe1F5))) {
        vlSelf->PSp2UU = (0x1fffffffffffffULL & (vlSelf->PSEdAs 
                                                 << 
                                                 (0x3fU 
                                                  & vlSelf->PSJBMX[0U])));
        vlSelf->PS7AYf = (0xfffU & (((IData)(vlSelf->PScYAL) 
                                     - (0x3fU & vlSelf->PSJBMX[0U])) 
                                    + (0U != (0x3fU 
                                              & vlSelf->PSJBMX[0U]))));
    } else {
        vlSelf->PSp2UU = (0x1fffffffffffffULL & vlSelf->PSx3B4);
        vlSelf->PS7AYf = (0xfffU & (IData)(vlSelf->PS9CXG));
    }
    vlSelf->PSLzn5 = ((0xfffffffffffffffeULL & vlSelf->PSLzn5) 
                      | (IData)((IData)((0ULL != (6ULL 
                                                  & vlSelf->PSLzn5)))));
    vlSelf->PSLzn5 = ((0xfffffffffffffffdULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 1U));
    vlSelf->PSLzn5 = ((0xfffffffffffffffbULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 2U));
    vlSelf->PSLzn5 = ((0xfffffffffffffff7ULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 3U));
    vlSelf->PSLzn5 = ((0xffffffffffffffefULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 4U));
    vlSelf->PSLzn5 = ((0xffffffffffffffdfULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 5U));
    vlSelf->PSLzn5 = ((0xffffffffffffffbfULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 6U));
    vlSelf->PSLzn5 = ((0xffffffffffffff7fULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 7U));
    vlSelf->PSLzn5 = ((0xfffffffffffffeffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 8U));
    vlSelf->PSLzn5 = ((0xfffffffffffffdffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 9U));
    vlSelf->PSLzn5 = ((0xfffffffffffffbffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0xaU));
    vlSelf->PSLzn5 = ((0xfffffffffffff7ffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0xbU));
    vlSelf->PSLzn5 = ((0xffffffffffffefffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0xcU));
    vlSelf->PSLzn5 = ((0xffffffffffffdfffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0xdU));
    vlSelf->PSLzn5 = ((0xffffffffffffbfffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0xeU));
    vlSelf->PSLzn5 = ((0xffffffffffff7fffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0xfU));
    vlSelf->PSLzn5 = ((0xfffffffffffeffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x10U));
    vlSelf->PSLzn5 = ((0xfffffffffffdffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x11U));
    vlSelf->PSLzn5 = ((0xfffffffffffbffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x12U));
    vlSelf->PSLzn5 = ((0xfffffffffff7ffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x13U));
    vlSelf->PSLzn5 = ((0xffffffffffefffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x14U));
    vlSelf->PSLzn5 = ((0xffffffffffdfffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x15U));
    vlSelf->PSLzn5 = ((0xffffffffffbfffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x16U));
    vlSelf->PSLzn5 = ((0xffffffffff7fffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x17U));
    vlSelf->PSLzn5 = ((0xfffffffffeffffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x18U));
    vlSelf->PSLzn5 = ((0xfffffffffdffffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x19U));
    vlSelf->PSLzn5 = ((0xfffffffffbffffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x1aU));
    vlSelf->PSLzn5 = ((0xfffffffff7ffffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x1bU));
    vlSelf->PSLzn5 = ((0xffffffffefffffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x1cU));
    vlSelf->PSLzn5 = ((0xffffffffdfffffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x1dU));
    vlSelf->PSLzn5 = ((0xffffffffbfffffffULL & vlSelf->PSLzn5) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000000ULL 
                                                   & vlSelf->PSLzn5))))) 
                         << 0x1eU));
    vlSelf->PSJBMX[0U] = ((0xffffffc0U & vlSelf->PSJBMX[0U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSLzn5 
                                                     >> 1U)))
                                       ? ((vlSelf->PSJBMX[0U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSJBMX[0U] 
                                             >> 6U))
                                       : ((vlSelf->PSJBMX[0U] 
                                           << 0x14U) 
                                          | (vlSelf->PSJBMX[0U] 
                                             >> 0xcU)))));
    vlSelf->PSJBMX[0U] = ((0xfffff03fU & vlSelf->PSJBMX[0U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSLzn5 
                                                       >> 3U)))
                                         ? ((vlSelf->PSJBMX[0U] 
                                             << 0xeU) 
                                            | (vlSelf->PSJBMX[0U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSJBMX[0U] 
                                             << 8U) 
                                            | (vlSelf->PSJBMX[0U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSJBMX[0U] = ((0xfffc0fffU & vlSelf->PSJBMX[0U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSLzn5 
                                                         >> 5U)))
                                           ? ((vlSelf->PSJBMX[1U] 
                                               << 2U) 
                                              | (vlSelf->PSJBMX[0U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSJBMX[1U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSJBMX[1U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSJBMX[0U] = ((0xff03ffffU & vlSelf->PSJBMX[0U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSLzn5 
                                                          >> 7U)))
                                            ? ((vlSelf->PSJBMX[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSJBMX[1U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSJBMX[1U] 
                                                << 0x10U) 
                                               | (vlSelf->PSJBMX[1U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSJBMX[0U] = ((0xc0ffffffU & vlSelf->PSJBMX[0U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSLzn5 
                                                            >> 9U)))
                                              ? ((vlSelf->PSJBMX[1U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSJBMX[1U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSJBMX[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSJBMX[1U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSg9kE = (0x3fU & ((1U & (IData)((vlSelf->PSLzn5 
                                      >> 0xbU))) ? 
                       ((vlSelf->PSJBMX[2U] << 0x1eU) 
                        | (vlSelf->PSJBMX[2U] >> 2U))
                        : ((vlSelf->PSJBMX[2U] << 0x18U) 
                           | (vlSelf->PSJBMX[2U] >> 8U))));
    vlSelf->PSJBMX[0U] = ((0x3fffffffU & vlSelf->PSJBMX[0U]) 
                          | (((1U & (IData)((vlSelf->PSLzn5 
                                             >> 0xbU)))
                               ? ((vlSelf->PSJBMX[2U] 
                                   << 0x1eU) | (vlSelf->PSJBMX[2U] 
                                                >> 2U))
                               : ((vlSelf->PSJBMX[2U] 
                                   << 0x18U) | (vlSelf->PSJBMX[2U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSJBMX[1U] = ((0xfffffff0U & vlSelf->PSJBMX[1U]) 
                          | (PSg9kE >> 2U));
    vlSelf->PSJBMX[1U] = ((0xfffffc0fU & vlSelf->PSJBMX[1U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSLzn5 
                                                       >> 0xdU)))
                                         ? ((vlSelf->PSJBMX[2U] 
                                             << 0x12U) 
                                            | (vlSelf->PSJBMX[2U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSJBMX[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSJBMX[2U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSJBMX[1U] = ((0xffff03ffU & vlSelf->PSJBMX[1U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSLzn5 
                                                        >> 0xfU)))
                                          ? ((vlSelf->PSJBMX[2U] 
                                              << 6U) 
                                             | (vlSelf->PSJBMX[2U] 
                                                >> 0x1aU))
                                          : vlSelf->PSJBMX[3U]) 
                                        << 0xaU)));
    vlSelf->PSJBMX[1U] = ((0xffc0ffffU & vlSelf->PSJBMX[1U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSLzn5 
                                                          >> 0x11U)))
                                            ? ((vlSelf->PSJBMX[3U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSJBMX[3U] 
                                                  >> 6U))
                                            : ((vlSelf->PSJBMX[3U] 
                                                << 0x14U) 
                                               | (vlSelf->PSJBMX[3U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSJBMX[1U] = ((0xf03fffffU & vlSelf->PSJBMX[1U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSLzn5 
                                                           >> 0x13U)))
                                             ? ((vlSelf->PSJBMX[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSJBMX[3U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSJBMX[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSJBMX[3U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PS9Hpv = (0x3fU & ((1U & (IData)((vlSelf->PSLzn5 
                                      >> 0x15U))) ? 
                       ((vlSelf->PSJBMX[4U] << 2U) 
                        | (vlSelf->PSJBMX[3U] >> 0x1eU))
                        : ((vlSelf->PSJBMX[4U] << 0x1cU) 
                           | (vlSelf->PSJBMX[4U] >> 4U))));
    vlSelf->PSJBMX[1U] = ((0xfffffffU & vlSelf->PSJBMX[1U]) 
                          | (((1U & (IData)((vlSelf->PSLzn5 
                                             >> 0x15U)))
                               ? ((vlSelf->PSJBMX[4U] 
                                   << 2U) | (vlSelf->PSJBMX[3U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSJBMX[4U] 
                                   << 0x1cU) | (vlSelf->PSJBMX[4U] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSJBMX[2U] = ((0xfffffffcU & vlSelf->PSJBMX[2U]) 
                          | (PS9Hpv >> 4U));
    vlSelf->PSJBMX[2U] = ((0xffffff03U & vlSelf->PSJBMX[2U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSLzn5 
                                                      >> 0x17U)))
                                        ? ((vlSelf->PSJBMX[4U] 
                                            << 0x16U) 
                                           | (vlSelf->PSJBMX[4U] 
                                              >> 0xaU))
                                        : ((vlSelf->PSJBMX[4U] 
                                            << 0x10U) 
                                           | (vlSelf->PSJBMX[4U] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSJBMX[2U] = ((0xffffc0ffU & vlSelf->PSJBMX[2U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSLzn5 
                                                        >> 0x19U)))
                                          ? ((vlSelf->PSJBMX[4U] 
                                              << 0xaU) 
                                             | (vlSelf->PSJBMX[4U] 
                                                >> 0x16U))
                                          : ((vlSelf->PSJBMX[5U] 
                                              << 4U) 
                                             | (vlSelf->PSJBMX[4U] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSJBMX[2U] = ((0xfff03fffU & vlSelf->PSJBMX[2U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSLzn5 
                                                         >> 0x1bU)))
                                           ? ((vlSelf->PSJBMX[5U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSJBMX[5U] 
                                                 >> 2U))
                                           : ((vlSelf->PSJBMX[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSJBMX[5U] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSJBMX[2U] = ((0xfc0fffffU & vlSelf->PSJBMX[2U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSLzn5 
                                                           >> 0x1dU)))
                                             ? ((vlSelf->PSJBMX[5U] 
                                                 << 0x12U) 
                                                | (vlSelf->PSJBMX[5U] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSJBMX[5U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSJBMX[5U] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSJBMX[2U] = ((0x3ffffffU & vlSelf->PSJBMX[2U]) 
                          | (((1U & (IData)((vlSelf->PSLzn5 
                                             >> 0x1fU)))
                               ? ((vlSelf->PSJBMX[5U] 
                                   << 6U) | (vlSelf->PSJBMX[5U] 
                                             >> 0x1aU))
                               : vlSelf->PSJBMX[6U]) 
                             << 0x1aU));
    vlSelf->PSJBMX[3U] = ((0xffffffc0U & vlSelf->PSJBMX[3U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSLzn5 
                                                     >> 0x21U)))
                                       ? ((vlSelf->PSJBMX[6U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSJBMX[6U] 
                                             >> 6U))
                                       : ((vlSelf->PSJBMX[6U] 
                                           << 0x14U) 
                                          | (vlSelf->PSJBMX[6U] 
                                             >> 0xcU)))));
    vlSelf->PSJBMX[3U] = ((0xfffff03fU & vlSelf->PSJBMX[3U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSLzn5 
                                                       >> 0x23U)))
                                         ? ((vlSelf->PSJBMX[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSJBMX[6U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSJBMX[6U] 
                                             << 8U) 
                                            | (vlSelf->PSJBMX[6U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSJBMX[3U] = ((0xfffc0fffU & vlSelf->PSJBMX[3U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSLzn5 
                                                         >> 0x25U)))
                                           ? ((vlSelf->PSJBMX[7U] 
                                               << 2U) 
                                              | (vlSelf->PSJBMX[6U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSJBMX[7U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSJBMX[7U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSJBMX[3U] = ((0xff03ffffU & vlSelf->PSJBMX[3U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSLzn5 
                                                          >> 0x27U)))
                                            ? ((vlSelf->PSJBMX[7U] 
                                                << 0x16U) 
                                               | (vlSelf->PSJBMX[7U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSJBMX[7U] 
                                                << 0x10U) 
                                               | (vlSelf->PSJBMX[7U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSJBMX[3U] = ((0xc0ffffffU & vlSelf->PSJBMX[3U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSLzn5 
                                                            >> 0x29U)))
                                              ? ((vlSelf->PSJBMX[7U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSJBMX[7U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSJBMX[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSJBMX[7U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSpEa5 = (0x3fU & ((1U & (IData)((vlSelf->PSLzn5 
                                      >> 0x2bU))) ? 
                       ((vlSelf->PSJBMX[8U] << 0x1eU) 
                        | (vlSelf->PSJBMX[8U] >> 2U))
                        : ((vlSelf->PSJBMX[8U] << 0x18U) 
                           | (vlSelf->PSJBMX[8U] >> 8U))));
    vlSelf->PSJBMX[3U] = ((0x3fffffffU & vlSelf->PSJBMX[3U]) 
                          | (((1U & (IData)((vlSelf->PSLzn5 
                                             >> 0x2bU)))
                               ? ((vlSelf->PSJBMX[8U] 
                                   << 0x1eU) | (vlSelf->PSJBMX[8U] 
                                                >> 2U))
                               : ((vlSelf->PSJBMX[8U] 
                                   << 0x18U) | (vlSelf->PSJBMX[8U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSJBMX[4U] = ((0xfffffff0U & vlSelf->PSJBMX[4U]) 
                          | (PSpEa5 >> 2U));
    vlSelf->PSJBMX[4U] = ((0xfffffc0fU & vlSelf->PSJBMX[4U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSLzn5 
                                                       >> 0x2dU)))
                                         ? ((vlSelf->PSJBMX[8U] 
                                             << 0x12U) 
                                            | (vlSelf->PSJBMX[8U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSJBMX[8U] 
                                             << 0xcU) 
                                            | (vlSelf->PSJBMX[8U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSJBMX[4U] = ((0xffff03ffU & vlSelf->PSJBMX[4U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSLzn5 
                                                        >> 0x2fU)))
                                          ? ((vlSelf->PSJBMX[8U] 
                                              << 6U) 
                                             | (vlSelf->PSJBMX[8U] 
                                                >> 0x1aU))
                                          : vlSelf->PSJBMX[9U]) 
                                        << 0xaU)));
    vlSelf->PSJBMX[4U] = ((0xffc0ffffU & vlSelf->PSJBMX[4U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSLzn5 
                                                          >> 0x31U)))
                                            ? ((vlSelf->PSJBMX[9U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSJBMX[9U] 
                                                  >> 6U))
                                            : ((vlSelf->PSJBMX[9U] 
                                                << 0x14U) 
                                               | (vlSelf->PSJBMX[9U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSJBMX[4U] = ((0xf03fffffU & vlSelf->PSJBMX[4U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSLzn5 
                                                           >> 0x33U)))
                                             ? ((vlSelf->PSJBMX[9U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSJBMX[9U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSJBMX[9U] 
                                                 << 8U) 
                                                | (vlSelf->PSJBMX[9U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSliBq = (0x3fU & ((1U & (IData)((vlSelf->PSLzn5 
                                      >> 0x35U))) ? 
                       ((vlSelf->PSJBMX[0xaU] << 2U) 
                        | (vlSelf->PSJBMX[9U] >> 0x1eU))
                        : ((vlSelf->PSJBMX[0xaU] << 0x1cU) 
                           | (vlSelf->PSJBMX[0xaU] 
                              >> 4U))));
    vlSelf->PSJBMX[4U] = ((0xfffffffU & vlSelf->PSJBMX[4U]) 
                          | (((1U & (IData)((vlSelf->PSLzn5 
                                             >> 0x35U)))
                               ? ((vlSelf->PSJBMX[0xaU] 
                                   << 2U) | (vlSelf->PSJBMX[9U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSJBMX[0xaU] 
                                   << 0x1cU) | (vlSelf->PSJBMX[0xaU] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSJBMX[5U] = ((0xfffffffcU & vlSelf->PSJBMX[5U]) 
                          | (PSliBq >> 4U));
    vlSelf->PSJBMX[5U] = ((0xffffff03U & vlSelf->PSJBMX[5U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSLzn5 
                                                      >> 0x37U)))
                                        ? ((vlSelf->PSJBMX[0xaU] 
                                            << 0x16U) 
                                           | (vlSelf->PSJBMX[0xaU] 
                                              >> 0xaU))
                                        : ((vlSelf->PSJBMX[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSJBMX[0xaU] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSJBMX[5U] = ((0xffffc0ffU & vlSelf->PSJBMX[5U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSLzn5 
                                                        >> 0x39U)))
                                          ? ((vlSelf->PSJBMX[0xaU] 
                                              << 0xaU) 
                                             | (vlSelf->PSJBMX[0xaU] 
                                                >> 0x16U))
                                          : ((vlSelf->PSJBMX[0xbU] 
                                              << 4U) 
                                             | (vlSelf->PSJBMX[0xaU] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSJBMX[5U] = ((0xfff03fffU & vlSelf->PSJBMX[5U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSLzn5 
                                                         >> 0x3bU)))
                                           ? ((vlSelf->PSJBMX[0xbU] 
                                               << 0x1eU) 
                                              | (vlSelf->PSJBMX[0xbU] 
                                                 >> 2U))
                                           : ((vlSelf->PSJBMX[0xbU] 
                                               << 0x18U) 
                                              | (vlSelf->PSJBMX[0xbU] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSJBMX[5U] = ((0xfc0fffffU & vlSelf->PSJBMX[5U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSLzn5 
                                                           >> 0x3dU)))
                                             ? ((vlSelf->PSJBMX[0xbU] 
                                                 << 0x12U) 
                                                | (vlSelf->PSJBMX[0xbU] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSJBMX[0xbU] 
                                                 << 0xcU) 
                                                | (vlSelf->PSJBMX[0xbU] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    if (((IData)(vlSelf->PSSiVU) & (IData)(vlSelf->PSe1F5))) {
        vlSelf->PSBQlf = (0x1fffffffffffffULL & (vlSelf->PSTbav 
                                                 << 
                                                 (0x3fU 
                                                  & vlSelf->PSpkC2[0U])));
        vlSelf->PSrIYA = (0xfffU & (((IData)(vlSelf->PSq087) 
                                     - (0x3fU & vlSelf->PSpkC2[0U])) 
                                    + (0U != (0x3fU 
                                              & vlSelf->PSpkC2[0U]))));
    } else {
        vlSelf->PSBQlf = (0x1fffffffffffffULL & vlSelf->PSjdQO);
        vlSelf->PSrIYA = (0xfffU & (IData)(vlSelf->PS7BVB));
    }
    vlSelf->PS5e82 = ((0xfffffffffffffffeULL & vlSelf->PS5e82) 
                      | (IData)((IData)((0ULL != (6ULL 
                                                  & vlSelf->PS5e82)))));
    vlSelf->PS5e82 = ((0xfffffffffffffffdULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 1U));
    vlSelf->PS5e82 = ((0xfffffffffffffffbULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 2U));
    vlSelf->PS5e82 = ((0xfffffffffffffff7ULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 3U));
    vlSelf->PS5e82 = ((0xffffffffffffffefULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 4U));
    vlSelf->PS5e82 = ((0xffffffffffffffdfULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 5U));
    vlSelf->PS5e82 = ((0xffffffffffffffbfULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 6U));
    vlSelf->PS5e82 = ((0xffffffffffffff7fULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 7U));
    vlSelf->PS5e82 = ((0xfffffffffffffeffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 8U));
    vlSelf->PS5e82 = ((0xfffffffffffffdffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 9U));
    vlSelf->PS5e82 = ((0xfffffffffffffbffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0xaU));
    vlSelf->PS5e82 = ((0xfffffffffffff7ffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0xbU));
    vlSelf->PS5e82 = ((0xffffffffffffefffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0xcU));
    vlSelf->PS5e82 = ((0xffffffffffffdfffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0xdU));
    vlSelf->PS5e82 = ((0xffffffffffffbfffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0xeU));
    vlSelf->PS5e82 = ((0xffffffffffff7fffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0xfU));
    vlSelf->PS5e82 = ((0xfffffffffffeffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x10U));
    vlSelf->PS5e82 = ((0xfffffffffffdffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x11U));
    vlSelf->PS5e82 = ((0xfffffffffffbffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x12U));
    vlSelf->PS5e82 = ((0xfffffffffff7ffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x13U));
    vlSelf->PS5e82 = ((0xffffffffffefffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x14U));
    vlSelf->PS5e82 = ((0xffffffffffdfffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x15U));
    vlSelf->PS5e82 = ((0xffffffffffbfffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x16U));
    vlSelf->PS5e82 = ((0xffffffffff7fffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x17U));
    vlSelf->PS5e82 = ((0xfffffffffeffffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x18U));
    vlSelf->PS5e82 = ((0xfffffffffdffffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x19U));
    vlSelf->PS5e82 = ((0xfffffffffbffffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x1aU));
    vlSelf->PS5e82 = ((0xfffffffff7ffffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x1bU));
    vlSelf->PS5e82 = ((0xffffffffefffffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x1cU));
    vlSelf->PS5e82 = ((0xffffffffdfffffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x1dU));
    vlSelf->PS5e82 = ((0xffffffffbfffffffULL & vlSelf->PS5e82) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000000ULL 
                                                   & vlSelf->PS5e82))))) 
                         << 0x1eU));
    vlSelf->PSpkC2[0U] = ((0xffffffc0U & vlSelf->PSpkC2[0U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PS5e82 
                                                     >> 1U)))
                                       ? ((vlSelf->PSpkC2[0U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSpkC2[0U] 
                                             >> 6U))
                                       : ((vlSelf->PSpkC2[0U] 
                                           << 0x14U) 
                                          | (vlSelf->PSpkC2[0U] 
                                             >> 0xcU)))));
    vlSelf->PSpkC2[0U] = ((0xfffff03fU & vlSelf->PSpkC2[0U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PS5e82 
                                                       >> 3U)))
                                         ? ((vlSelf->PSpkC2[0U] 
                                             << 0xeU) 
                                            | (vlSelf->PSpkC2[0U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSpkC2[0U] 
                                             << 8U) 
                                            | (vlSelf->PSpkC2[0U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSpkC2[0U] = ((0xfffc0fffU & vlSelf->PSpkC2[0U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PS5e82 
                                                         >> 5U)))
                                           ? ((vlSelf->PSpkC2[1U] 
                                               << 2U) 
                                              | (vlSelf->PSpkC2[0U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSpkC2[1U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSpkC2[1U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSpkC2[0U] = ((0xff03ffffU & vlSelf->PSpkC2[0U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PS5e82 
                                                          >> 7U)))
                                            ? ((vlSelf->PSpkC2[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSpkC2[1U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSpkC2[1U] 
                                                << 0x10U) 
                                               | (vlSelf->PSpkC2[1U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSpkC2[0U] = ((0xc0ffffffU & vlSelf->PSpkC2[0U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PS5e82 
                                                            >> 9U)))
                                              ? ((vlSelf->PSpkC2[1U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSpkC2[1U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSpkC2[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSpkC2[1U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PScXOo = (0x3fU & ((1U & (IData)((vlSelf->PS5e82 
                                      >> 0xbU))) ? 
                       ((vlSelf->PSpkC2[2U] << 0x1eU) 
                        | (vlSelf->PSpkC2[2U] >> 2U))
                        : ((vlSelf->PSpkC2[2U] << 0x18U) 
                           | (vlSelf->PSpkC2[2U] >> 8U))));
    vlSelf->PSpkC2[0U] = ((0x3fffffffU & vlSelf->PSpkC2[0U]) 
                          | (((1U & (IData)((vlSelf->PS5e82 
                                             >> 0xbU)))
                               ? ((vlSelf->PSpkC2[2U] 
                                   << 0x1eU) | (vlSelf->PSpkC2[2U] 
                                                >> 2U))
                               : ((vlSelf->PSpkC2[2U] 
                                   << 0x18U) | (vlSelf->PSpkC2[2U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSpkC2[1U] = ((0xfffffff0U & vlSelf->PSpkC2[1U]) 
                          | (PScXOo >> 2U));
    vlSelf->PSpkC2[1U] = ((0xfffffc0fU & vlSelf->PSpkC2[1U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PS5e82 
                                                       >> 0xdU)))
                                         ? ((vlSelf->PSpkC2[2U] 
                                             << 0x12U) 
                                            | (vlSelf->PSpkC2[2U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSpkC2[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSpkC2[2U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSpkC2[1U] = ((0xffff03ffU & vlSelf->PSpkC2[1U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PS5e82 
                                                        >> 0xfU)))
                                          ? ((vlSelf->PSpkC2[2U] 
                                              << 6U) 
                                             | (vlSelf->PSpkC2[2U] 
                                                >> 0x1aU))
                                          : vlSelf->PSpkC2[3U]) 
                                        << 0xaU)));
    vlSelf->PSpkC2[1U] = ((0xffc0ffffU & vlSelf->PSpkC2[1U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PS5e82 
                                                          >> 0x11U)))
                                            ? ((vlSelf->PSpkC2[3U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSpkC2[3U] 
                                                  >> 6U))
                                            : ((vlSelf->PSpkC2[3U] 
                                                << 0x14U) 
                                               | (vlSelf->PSpkC2[3U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSpkC2[1U] = ((0xf03fffffU & vlSelf->PSpkC2[1U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PS5e82 
                                                           >> 0x13U)))
                                             ? ((vlSelf->PSpkC2[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSpkC2[3U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSpkC2[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSpkC2[3U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSVcoj = (0x3fU & ((1U & (IData)((vlSelf->PS5e82 
                                      >> 0x15U))) ? 
                       ((vlSelf->PSpkC2[4U] << 2U) 
                        | (vlSelf->PSpkC2[3U] >> 0x1eU))
                        : ((vlSelf->PSpkC2[4U] << 0x1cU) 
                           | (vlSelf->PSpkC2[4U] >> 4U))));
    vlSelf->PSpkC2[1U] = ((0xfffffffU & vlSelf->PSpkC2[1U]) 
                          | (((1U & (IData)((vlSelf->PS5e82 
                                             >> 0x15U)))
                               ? ((vlSelf->PSpkC2[4U] 
                                   << 2U) | (vlSelf->PSpkC2[3U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSpkC2[4U] 
                                   << 0x1cU) | (vlSelf->PSpkC2[4U] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSpkC2[2U] = ((0xfffffffcU & vlSelf->PSpkC2[2U]) 
                          | (PSVcoj >> 4U));
    vlSelf->PSpkC2[2U] = ((0xffffff03U & vlSelf->PSpkC2[2U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PS5e82 
                                                      >> 0x17U)))
                                        ? ((vlSelf->PSpkC2[4U] 
                                            << 0x16U) 
                                           | (vlSelf->PSpkC2[4U] 
                                              >> 0xaU))
                                        : ((vlSelf->PSpkC2[4U] 
                                            << 0x10U) 
                                           | (vlSelf->PSpkC2[4U] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSpkC2[2U] = ((0xffffc0ffU & vlSelf->PSpkC2[2U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PS5e82 
                                                        >> 0x19U)))
                                          ? ((vlSelf->PSpkC2[4U] 
                                              << 0xaU) 
                                             | (vlSelf->PSpkC2[4U] 
                                                >> 0x16U))
                                          : ((vlSelf->PSpkC2[5U] 
                                              << 4U) 
                                             | (vlSelf->PSpkC2[4U] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSpkC2[2U] = ((0xfff03fffU & vlSelf->PSpkC2[2U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PS5e82 
                                                         >> 0x1bU)))
                                           ? ((vlSelf->PSpkC2[5U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSpkC2[5U] 
                                                 >> 2U))
                                           : ((vlSelf->PSpkC2[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSpkC2[5U] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSpkC2[2U] = ((0xfc0fffffU & vlSelf->PSpkC2[2U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PS5e82 
                                                           >> 0x1dU)))
                                             ? ((vlSelf->PSpkC2[5U] 
                                                 << 0x12U) 
                                                | (vlSelf->PSpkC2[5U] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSpkC2[5U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSpkC2[5U] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSpkC2[2U] = ((0x3ffffffU & vlSelf->PSpkC2[2U]) 
                          | (((1U & (IData)((vlSelf->PS5e82 
                                             >> 0x1fU)))
                               ? ((vlSelf->PSpkC2[5U] 
                                   << 6U) | (vlSelf->PSpkC2[5U] 
                                             >> 0x1aU))
                               : vlSelf->PSpkC2[6U]) 
                             << 0x1aU));
    vlSelf->PSpkC2[3U] = ((0xffffffc0U & vlSelf->PSpkC2[3U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PS5e82 
                                                     >> 0x21U)))
                                       ? ((vlSelf->PSpkC2[6U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSpkC2[6U] 
                                             >> 6U))
                                       : ((vlSelf->PSpkC2[6U] 
                                           << 0x14U) 
                                          | (vlSelf->PSpkC2[6U] 
                                             >> 0xcU)))));
    vlSelf->PSpkC2[3U] = ((0xfffff03fU & vlSelf->PSpkC2[3U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PS5e82 
                                                       >> 0x23U)))
                                         ? ((vlSelf->PSpkC2[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSpkC2[6U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSpkC2[6U] 
                                             << 8U) 
                                            | (vlSelf->PSpkC2[6U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSpkC2[3U] = ((0xfffc0fffU & vlSelf->PSpkC2[3U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PS5e82 
                                                         >> 0x25U)))
                                           ? ((vlSelf->PSpkC2[7U] 
                                               << 2U) 
                                              | (vlSelf->PSpkC2[6U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSpkC2[7U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSpkC2[7U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSpkC2[3U] = ((0xff03ffffU & vlSelf->PSpkC2[3U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PS5e82 
                                                          >> 0x27U)))
                                            ? ((vlSelf->PSpkC2[7U] 
                                                << 0x16U) 
                                               | (vlSelf->PSpkC2[7U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSpkC2[7U] 
                                                << 0x10U) 
                                               | (vlSelf->PSpkC2[7U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSpkC2[3U] = ((0xc0ffffffU & vlSelf->PSpkC2[3U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PS5e82 
                                                            >> 0x29U)))
                                              ? ((vlSelf->PSpkC2[7U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSpkC2[7U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSpkC2[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSpkC2[7U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PS3U99 = (0x3fU & ((1U & (IData)((vlSelf->PS5e82 
                                      >> 0x2bU))) ? 
                       ((vlSelf->PSpkC2[8U] << 0x1eU) 
                        | (vlSelf->PSpkC2[8U] >> 2U))
                        : ((vlSelf->PSpkC2[8U] << 0x18U) 
                           | (vlSelf->PSpkC2[8U] >> 8U))));
    vlSelf->PSpkC2[3U] = ((0x3fffffffU & vlSelf->PSpkC2[3U]) 
                          | (((1U & (IData)((vlSelf->PS5e82 
                                             >> 0x2bU)))
                               ? ((vlSelf->PSpkC2[8U] 
                                   << 0x1eU) | (vlSelf->PSpkC2[8U] 
                                                >> 2U))
                               : ((vlSelf->PSpkC2[8U] 
                                   << 0x18U) | (vlSelf->PSpkC2[8U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSpkC2[4U] = ((0xfffffff0U & vlSelf->PSpkC2[4U]) 
                          | (PS3U99 >> 2U));
    vlSelf->PSpkC2[4U] = ((0xfffffc0fU & vlSelf->PSpkC2[4U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PS5e82 
                                                       >> 0x2dU)))
                                         ? ((vlSelf->PSpkC2[8U] 
                                             << 0x12U) 
                                            | (vlSelf->PSpkC2[8U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSpkC2[8U] 
                                             << 0xcU) 
                                            | (vlSelf->PSpkC2[8U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSpkC2[4U] = ((0xffff03ffU & vlSelf->PSpkC2[4U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PS5e82 
                                                        >> 0x2fU)))
                                          ? ((vlSelf->PSpkC2[8U] 
                                              << 6U) 
                                             | (vlSelf->PSpkC2[8U] 
                                                >> 0x1aU))
                                          : vlSelf->PSpkC2[9U]) 
                                        << 0xaU)));
    vlSelf->PSpkC2[4U] = ((0xffc0ffffU & vlSelf->PSpkC2[4U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PS5e82 
                                                          >> 0x31U)))
                                            ? ((vlSelf->PSpkC2[9U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSpkC2[9U] 
                                                  >> 6U))
                                            : ((vlSelf->PSpkC2[9U] 
                                                << 0x14U) 
                                               | (vlSelf->PSpkC2[9U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSpkC2[4U] = ((0xf03fffffU & vlSelf->PSpkC2[4U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PS5e82 
                                                           >> 0x33U)))
                                             ? ((vlSelf->PSpkC2[9U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSpkC2[9U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSpkC2[9U] 
                                                 << 8U) 
                                                | (vlSelf->PSpkC2[9U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSKLwr = (0x3fU & ((1U & (IData)((vlSelf->PS5e82 
                                      >> 0x35U))) ? 
                       ((vlSelf->PSpkC2[0xaU] << 2U) 
                        | (vlSelf->PSpkC2[9U] >> 0x1eU))
                        : ((vlSelf->PSpkC2[0xaU] << 0x1cU) 
                           | (vlSelf->PSpkC2[0xaU] 
                              >> 4U))));
    vlSelf->PSpkC2[4U] = ((0xfffffffU & vlSelf->PSpkC2[4U]) 
                          | (((1U & (IData)((vlSelf->PS5e82 
                                             >> 0x35U)))
                               ? ((vlSelf->PSpkC2[0xaU] 
                                   << 2U) | (vlSelf->PSpkC2[9U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSpkC2[0xaU] 
                                   << 0x1cU) | (vlSelf->PSpkC2[0xaU] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSpkC2[5U] = ((0xfffffffcU & vlSelf->PSpkC2[5U]) 
                          | (PSKLwr >> 4U));
    vlSelf->PSpkC2[5U] = ((0xffffff03U & vlSelf->PSpkC2[5U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PS5e82 
                                                      >> 0x37U)))
                                        ? ((vlSelf->PSpkC2[0xaU] 
                                            << 0x16U) 
                                           | (vlSelf->PSpkC2[0xaU] 
                                              >> 0xaU))
                                        : ((vlSelf->PSpkC2[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSpkC2[0xaU] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSpkC2[5U] = ((0xffffc0ffU & vlSelf->PSpkC2[5U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PS5e82 
                                                        >> 0x39U)))
                                          ? ((vlSelf->PSpkC2[0xaU] 
                                              << 0xaU) 
                                             | (vlSelf->PSpkC2[0xaU] 
                                                >> 0x16U))
                                          : ((vlSelf->PSpkC2[0xbU] 
                                              << 4U) 
                                             | (vlSelf->PSpkC2[0xaU] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSpkC2[5U] = ((0xfff03fffU & vlSelf->PSpkC2[5U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PS5e82 
                                                         >> 0x3bU)))
                                           ? ((vlSelf->PSpkC2[0xbU] 
                                               << 0x1eU) 
                                              | (vlSelf->PSpkC2[0xbU] 
                                                 >> 2U))
                                           : ((vlSelf->PSpkC2[0xbU] 
                                               << 0x18U) 
                                              | (vlSelf->PSpkC2[0xbU] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSpkC2[5U] = ((0xfc0fffffU & vlSelf->PSpkC2[5U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PS5e82 
                                                           >> 0x3dU)))
                                             ? ((vlSelf->PSpkC2[0xbU] 
                                                 << 0x12U) 
                                                | (vlSelf->PSpkC2[0xbU] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSpkC2[0xbU] 
                                                 << 0xcU) 
                                                | (vlSelf->PSpkC2[0xbU] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PS3M8z = ((0x1fU & (IData)(vlSelf->PS3M8z)) 
                      | (0x3e0U & (((1U & (IData)(vlSelf->PSH6UL))
                                     ? (IData)(vlSelf->PSIyj5)
                                     : (IData)(vlSelf->PSa68m)) 
                                   << 5U)));
    vlSelf->PSz0ic = ((0x3fU & (IData)(vlSelf->PSz0ic)) 
                      | ((IData)(vlSelf->PSTjOu) << 6U));
    PS584z = (0x1fffffffffULL & (((0xffffffffffffULL 
                                   & ((QData)((IData)(vlSelf->PSSYQk)) 
                                      << 0x25U)) >> (IData)(vlSelf->PSTjOu)) 
                                 >> 0xbU));
    PS1RlL = (0x7ffU & (IData)((0xffffffffffffULL & 
                                ((0xffffffffffffULL 
                                  & ((QData)((IData)(vlSelf->PSSYQk)) 
                                     << 0x25U)) >> (IData)(vlSelf->PSTjOu)))));
    vlSelf->PSBAhW = ((0x1fU & (IData)(vlSelf->PSBAhW)) 
                      | (0x3e0U & (((1U & (IData)(vlSelf->PSyGgA))
                                     ? (IData)(vlSelf->PSKMCt)
                                     : (IData)(vlSelf->PSrPWp)) 
                                   << 5U)));
    vlSelf->PSV3Tj = ((0x3fU & (IData)(vlSelf->PSV3Tj)) 
                      | ((IData)(vlSelf->PSLt4g) << 6U));
    PSerbP = (0x1fffffffffULL & (((0xffffffffffffULL 
                                   & ((QData)((IData)(vlSelf->PS9rUI)) 
                                      << 0x25U)) >> (IData)(vlSelf->PSLt4g)) 
                                 >> 0xbU));
    PSIxfk = (0x7ffU & (IData)((0xffffffffffffULL & 
                                ((0xffffffffffffULL 
                                  & ((QData)((IData)(vlSelf->PS9rUI)) 
                                     << 0x25U)) >> (IData)(vlSelf->PSLt4g)))));
    vlSelf->PSb7uj = ((0x1fU & (IData)(vlSelf->PSb7uj)) 
                      | (0x3e0U & (((1U & (IData)(vlSelf->PSt9UZ))
                                     ? (IData)(vlSelf->PShfVh)
                                     : (IData)(vlSelf->PSGOzF)) 
                                   << 5U)));
    vlSelf->PSEBYB = ((0x3fU & (IData)(vlSelf->PSEBYB)) 
                      | ((IData)(vlSelf->PSZEbA) << 6U));
    PSDhBe = (0x1fffffffffULL & (((0xffffffffffffULL 
                                   & ((QData)((IData)(vlSelf->PSEidl)) 
                                      << 0x25U)) >> (IData)(vlSelf->PSZEbA)) 
                                 >> 0xbU));
    PSel0Y = (0x7ffU & (IData)((0xffffffffffffULL & 
                                ((0xffffffffffffULL 
                                  & ((QData)((IData)(vlSelf->PSEidl)) 
                                     << 0x25U)) >> (IData)(vlSelf->PSZEbA)))));
    vlSelf->PSR26B = ((0x1fU & (IData)(vlSelf->PSR26B)) 
                      | (0x3e0U & (((1U & (IData)(vlSelf->PSlAcN))
                                     ? (IData)(vlSelf->PSsEDM)
                                     : (IData)(vlSelf->PSSwqV)) 
                                   << 5U)));
    vlSelf->PSyjhZ = ((0x3fU & (IData)(vlSelf->PSyjhZ)) 
                      | ((IData)(vlSelf->PSXvEp) << 6U));
    PSFA25 = (0x1fffffffffULL & (((0xffffffffffffULL 
                                   & ((QData)((IData)(vlSelf->PSegIf)) 
                                      << 0x25U)) >> (IData)(vlSelf->PSXvEp)) 
                                 >> 0xbU));
    PSypPc = (0x7ffU & (IData)((0xffffffffffffULL & 
                                ((0xffffffffffffULL 
                                  & ((QData)((IData)(vlSelf->PSegIf)) 
                                     << 0x25U)) >> (IData)(vlSelf->PSXvEp)))));
    vlSelf->PSF1ui = ((0x1fU & (IData)(vlSelf->PSF1ui)) 
                      | (0x3e0U & (((1U & (IData)(vlSelf->PSBXf1))
                                     ? (IData)(vlSelf->PSNxjW)
                                     : (IData)(vlSelf->PSCAv9)) 
                                   << 5U)));
    vlSelf->PS1dxj = ((0xffffU & vlSelf->PS1dxj) | 
                      ((IData)(vlSelf->PSEQTB) << 0x10U));
    VL_EXTEND_WQ(216,53, PSaMtS, vlSelf->PSR4gq);
    VL_SHIFTL_WWI(216,216,32, PSJ0R5, PSaMtS, 0xa3U);
    PSOK4W[0U] = PSJ0R5[0U];
    PSOK4W[1U] = PSJ0R5[1U];
    PSOK4W[2U] = PSJ0R5[2U];
    PSOK4W[3U] = PSJ0R5[3U];
    PSOK4W[4U] = PSJ0R5[4U];
    PSOK4W[5U] = PSJ0R5[5U];
    PSOK4W[6U] = (0xffffffU & PSJ0R5[6U]);
    VL_SHIFTR_WWI(216,216,8, PSB2AQ1IM, PSOK4W, (IData)(vlSelf->PSEQTB));
    PSvfEi[0U] = ((PSB2AQ1IM[2U] << 0xbU) | (PSB2AQ1IM[1U] 
                                             >> 0x15U));
    PSvfEi[1U] = ((PSB2AQ1IM[3U] << 0xbU) | (PSB2AQ1IM[2U] 
                                             >> 0x15U));
    PSvfEi[2U] = ((PSB2AQ1IM[4U] << 0xbU) | (PSB2AQ1IM[3U] 
                                             >> 0x15U));
    PSvfEi[3U] = ((PSB2AQ1IM[5U] << 0xbU) | (PSB2AQ1IM[4U] 
                                             >> 0x15U));
    PSvfEi[4U] = ((PSB2AQ1IM[6U] << 0xbU) | (PSB2AQ1IM[5U] 
                                             >> 0x15U));
    PSvfEi[5U] = (7U & (PSB2AQ1IM[6U] >> 0x15U));
    VL_EXTEND_WQ(216,53, PS9EOk, vlSelf->PSR4gq);
    VL_SHIFTL_WWI(216,216,32, PS8KdK, PS9EOk, 0xa3U);
    PS9Fge[0U] = PS8KdK[0U];
    PS9Fge[1U] = PS8KdK[1U];
    PS9Fge[2U] = PS8KdK[2U];
    PS9Fge[3U] = PS8KdK[3U];
    PS9Fge[4U] = PS8KdK[4U];
    PS9Fge[5U] = PS8KdK[5U];
    PS9Fge[6U] = (0xffffffU & PS8KdK[6U]);
    VL_SHIFTR_WWI(216,216,8, PSn3aT, PS9Fge, (IData)(vlSelf->PSEQTB));
    PSzKQX = (0x1fffffffffffffULL & (((QData)((IData)(
                                                      PSn3aT[1U])) 
                                      << 0x20U) | (QData)((IData)(
                                                                  PSn3aT[0U]))));
    vlSelf->PSW42n = ((0x1fU & (IData)(vlSelf->PSW42n)) 
                      | (0x3e0U & (((1U & (IData)(vlSelf->PSrvNa))
                                     ? (IData)(vlSelf->PSTPrD)
                                     : (IData)(vlSelf->PSDVQX)) 
                                   << 5U)));
    vlSelf->PSd63h = ((0x3fffU & vlSelf->PSd63h) | 
                      ((IData)(vlSelf->PSNakb) << 0xeU));
    VL_EXTEND_WI(100,24, PSqG5C, vlSelf->PSafkA);
    VL_SHIFTL_WWI(100,100,32, PSUPQG, PSqG5C, 0x4cU);
    PSOOAC[0U] = PSUPQG[0U];
    PSOOAC[1U] = PSUPQG[1U];
    PSOOAC[2U] = PSUPQG[2U];
    PSOOAC[3U] = (0xfU & PSUPQG[3U]);
    VL_SHIFTR_WWI(100,100,7, PS4Aig, PSOOAC, (IData)(vlSelf->PSNakb));
    PScyfP[0U] = ((PS4Aig[1U] << 8U) | (PS4Aig[0U] 
                                        >> 0x18U));
    PScyfP[1U] = ((PS4Aig[2U] << 8U) | (PS4Aig[1U] 
                                        >> 0x18U));
    PScyfP[2U] = (0xfffU & ((0xf00U & (PS4Aig[3U] << 8U)) 
                            | (PS4Aig[2U] >> 0x18U)));
    VL_EXTEND_WI(100,24, PSRPJZ, vlSelf->PSafkA);
    VL_SHIFTL_WWI(100,100,32, PS3KqQ, PSRPJZ, 0x4cU);
    PS5dlp[0U] = PS3KqQ[0U];
    PS5dlp[1U] = PS3KqQ[1U];
    PS5dlp[2U] = PS3KqQ[2U];
    PS5dlp[3U] = (0xfU & PS3KqQ[3U]);
    VL_SHIFTR_WWI(100,100,7, PSlp2c, PS5dlp, (IData)(vlSelf->PSNakb));
    PSB2A9 = (0xffffffU & PSlp2c[0U]);
    vlSelf->PSei6c = ((0x1fU & (IData)(vlSelf->PSei6c)) 
                      | (0x3e0U & (((1U & (IData)(vlSelf->PS1VF8))
                                     ? (IData)(vlSelf->PS7A97)
                                     : (IData)(vlSelf->PSY4Al)) 
                                   << 5U)));
    vlSelf->PSOReO = ((0x3fffU & vlSelf->PSOReO) | 
                      ((IData)(vlSelf->PSYKWt) << 0xeU));
    VL_EXTEND_WI(100,24, PSL97F, vlSelf->PSYKej);
    VL_SHIFTL_WWI(100,100,32, PS79br, PSL97F, 0x4cU);
    PStBjs[0U] = PS79br[0U];
    PStBjs[1U] = PS79br[1U];
    PStBjs[2U] = PS79br[2U];
    PStBjs[3U] = (0xfU & PS79br[3U]);
    VL_SHIFTR_WWI(100,100,7, PSErUN, PStBjs, (IData)(vlSelf->PSYKWt));
    PSvhuJ[0U] = ((PSErUN[1U] << 8U) | (PSErUN[0U] 
                                        >> 0x18U));
    PSvhuJ[1U] = ((PSErUN[2U] << 8U) | (PSErUN[1U] 
                                        >> 0x18U));
    PSvhuJ[2U] = (0xfffU & ((0xf00U & (PSErUN[3U] << 8U)) 
                            | (PSErUN[2U] >> 0x18U)));
    VL_EXTEND_WI(100,24, PSIuLL, vlSelf->PSYKej);
    VL_SHIFTL_WWI(100,100,32, PSJyeL, PSIuLL, 0x4cU);
    PSTuC1[0U] = PSJyeL[0U];
    PSTuC1[1U] = PSJyeL[1U];
    PSTuC1[2U] = PSJyeL[2U];
    PSTuC1[3U] = (0xfU & PSJyeL[3U]);
    VL_SHIFTR_WWI(100,100,7, PSkz3L, PSTuC1, (IData)(vlSelf->PSYKWt));
    PSXBCg = (0xffffffU & PSkz3L[0U]);
    vlSelf->PSrd0W = ((0xfe7fU & (IData)(vlSelf->PSrd0W)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PS6yq1)))) 
                          << 8U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PS6yq1)))) 
                                    << 7U)));
    vlSelf->PSrd0W = ((0xf9ffU & (IData)(vlSelf->PSrd0W)) 
                      | (((IData)((0U != (0xc0U & (IData)(vlSelf->PS6yq1)))) 
                          << 0xaU) | ((IData)((0U != 
                                               (0x30U 
                                                & (IData)(vlSelf->PS6yq1)))) 
                                      << 9U)));
    vlSelf->PSrd0W = ((0xe7ffU & (IData)(vlSelf->PSrd0W)) 
                      | (((IData)((0U != (0xc00U & (IData)(vlSelf->PS6yq1)))) 
                          << 0xcU) | ((IData)((0U != 
                                               (0x300U 
                                                & (IData)(vlSelf->PS6yq1)))) 
                                      << 0xbU)));
    vlSelf->PSrd0W = ((0x9fffU & (IData)(vlSelf->PSrd0W)) 
                      | (((IData)((0U != (0xc000U & (IData)(vlSelf->PS6yq1)))) 
                          << 0xeU) | ((IData)((0U != 
                                               (0x3000U 
                                                & (IData)(vlSelf->PS6yq1)))) 
                                      << 0xdU)));
    vlSelf->PSl4Bg = ((0xfffffff00fffffffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)(((((4U & (IData)(vlSelf->PS6yq1))
                                             ? 2U : 3U) 
                                           << 4U) | 
                                          ((1U & (IData)(vlSelf->PS6yq1))
                                            ? 0U : 1U)))) 
                         << 0x1cU));
    vlSelf->PSl4Bg = ((0xfffff00fffffffffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)(((((0x40U 
                                             & (IData)(vlSelf->PS6yq1))
                                             ? 6U : 7U) 
                                           << 4U) | 
                                          ((0x10U & (IData)(vlSelf->PS6yq1))
                                            ? 4U : 5U)))) 
                         << 0x24U));
    vlSelf->PSl4Bg = ((0xfff00fffffffffffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)(((((0x400U 
                                             & (IData)(vlSelf->PS6yq1))
                                             ? 0xaU
                                             : 0xbU) 
                                           << 4U) | 
                                          ((0x100U 
                                            & (IData)(vlSelf->PS6yq1))
                                            ? 8U : 9U)))) 
                         << 0x2cU));
    vlSelf->PSl4Bg = ((0xf00fffffffffffffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)(((((0x4000U 
                                             & (IData)(vlSelf->PS6yq1))
                                             ? 0xeU
                                             : 0xfU) 
                                           << 4U) | 
                                          ((0x1000U 
                                            & (IData)(vlSelf->PS6yq1))
                                            ? 0xcU : 0xdU)))) 
                         << 0x34U));
    vlSelf->PSegkQ = ((0xfe7fU & (IData)(vlSelf->PSegkQ)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSEULR)))) 
                          << 8U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSEULR)))) 
                                    << 7U)));
    vlSelf->PSegkQ = ((0xf9ffU & (IData)(vlSelf->PSegkQ)) 
                      | (((IData)((0U != (0xc0U & (IData)(vlSelf->PSEULR)))) 
                          << 0xaU) | ((IData)((0U != 
                                               (0x30U 
                                                & (IData)(vlSelf->PSEULR)))) 
                                      << 9U)));
    vlSelf->PSegkQ = ((0xe7ffU & (IData)(vlSelf->PSegkQ)) 
                      | (((IData)((0U != (0xc00U & (IData)(vlSelf->PSEULR)))) 
                          << 0xcU) | ((IData)((0U != 
                                               (0x300U 
                                                & (IData)(vlSelf->PSEULR)))) 
                                      << 0xbU)));
    vlSelf->PSegkQ = ((0x9fffU & (IData)(vlSelf->PSegkQ)) 
                      | (((IData)((0U != (0xc000U & (IData)(vlSelf->PSEULR)))) 
                          << 0xeU) | ((IData)((0U != 
                                               (0x3000U 
                                                & (IData)(vlSelf->PSEULR)))) 
                                      << 0xdU)));
    vlSelf->PSKM2A = ((0xfffffff00fffffffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)(((((4U & (IData)(vlSelf->PSEULR))
                                             ? 2U : 3U) 
                                           << 4U) | 
                                          ((1U & (IData)(vlSelf->PSEULR))
                                            ? 0U : 1U)))) 
                         << 0x1cU));
    vlSelf->PSKM2A = ((0xfffff00fffffffffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)(((((0x40U 
                                             & (IData)(vlSelf->PSEULR))
                                             ? 6U : 7U) 
                                           << 4U) | 
                                          ((0x10U & (IData)(vlSelf->PSEULR))
                                            ? 4U : 5U)))) 
                         << 0x24U));
    vlSelf->PSKM2A = ((0xfff00fffffffffffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)(((((0x400U 
                                             & (IData)(vlSelf->PSEULR))
                                             ? 0xaU
                                             : 0xbU) 
                                           << 4U) | 
                                          ((0x100U 
                                            & (IData)(vlSelf->PSEULR))
                                            ? 8U : 9U)))) 
                         << 0x2cU));
    vlSelf->PSKM2A = ((0xf00fffffffffffffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)(((((0x4000U 
                                             & (IData)(vlSelf->PSEULR))
                                             ? 0xeU
                                             : 0xfU) 
                                           << 4U) | 
                                          ((0x1000U 
                                            & (IData)(vlSelf->PSEULR))
                                            ? 0xcU : 0xdU)))) 
                         << 0x34U));
    vlSelf->PSc7RB = ((0xfffffffe7fffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xcULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (3ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x1fU));
    vlSelf->PSc7RB = ((0xfffffff9ffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x21U));
    vlSelf->PSc7RB = ((0xffffffe7ffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x23U));
    vlSelf->PSc7RB = ((0xffffff9fffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x25U));
    vlSelf->PSc7RB = ((0xfffffe7fffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x27U));
    vlSelf->PSc7RB = ((0xfffff9ffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x29U));
    vlSelf->PSc7RB = ((0xffffe7ffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x2bU));
    vlSelf->PSc7RB = ((0xffff9fffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x2dU));
    vlSelf->PSc7RB = ((0xfffe7fffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x2fU));
    vlSelf->PSc7RB = ((0xfff9ffffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x31U));
    vlSelf->PSc7RB = ((0xffe7ffffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x33U));
    vlSelf->PSc7RB = ((0xff9fffffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x35U));
    vlSelf->PSc7RB = ((0xfe7fffffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x37U));
    vlSelf->PSc7RB = ((0xf9ffffffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x39U));
    vlSelf->PSc7RB = ((0xe7ffffffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x3bU));
    vlSelf->PSc7RB = ((0x9fffffffffffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000000000000ULL 
                                                     & vlSelf->PS5nD5))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000000000000ULL 
                                                              & vlSelf->PS5nD5)))))) 
                         << 0x3dU));
    vlSelf->PSJjri[5U] = ((0x3ffffffU & vlSelf->PSJjri[5U]) 
                          | (((1U & (IData)(vlSelf->PS5nD5))
                               ? 0U : 1U) << 0x1aU));
    vlSelf->PSJjri[6U] = ((0xffffffc0U & vlSelf->PSJjri[6U]) 
                          | (0x3ffffffU & (((1U & (IData)(
                                                          (vlSelf->PS5nD5 
                                                           >> 2U)))
                                             ? 2U : 3U) 
                                           | (((1U 
                                                & (IData)(vlSelf->PS5nD5))
                                                ? 0U
                                                : 1U) 
                                              >> 6U))));
    vlSelf->PSJjri[6U] = ((0xfffc003fU & vlSelf->PSJjri[6U]) 
                          | (0xffffffc0U & ((((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 6U)))
                                               ? 6U
                                               : 7U) 
                                             << 0xcU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 4U)))
                                                 ? 4U
                                                 : 5U) 
                                               << 6U))));
    vlSelf->PSJjri[6U] = ((0xc003ffffU & vlSelf->PSJjri[6U]) 
                          | (0xfffc0000U & ((((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0xaU)))
                                               ? 0xaU
                                               : 0xbU) 
                                             << 0x18U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 8U)))
                                                 ? 8U
                                                 : 9U) 
                                               << 0x12U))));
    vlSelf->PSJjri[6U] = ((0x3fffffffU & vlSelf->PSJjri[6U]) 
                          | (((1U & (IData)((vlSelf->PS5nD5 
                                             >> 0xcU)))
                               ? 0xcU : 0xdU) << 0x1eU));
    vlSelf->PSJjri[7U] = ((0xfffffc00U & vlSelf->PSJjri[7U]) 
                          | (0x3fffffffU & ((0x3ffffff0U 
                                             & (((1U 
                                                  & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0xeU)))
                                                  ? 0xeU
                                                  : 0xfU) 
                                                << 4U)) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0xcU)))
                                                 ? 0xcU
                                                 : 0xdU) 
                                               >> 2U))));
    vlSelf->PSJjri[7U] = ((0xffc003ffU & vlSelf->PSJjri[7U]) 
                          | (0xfffffc00U & ((((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0x12U)))
                                               ? 0x12U
                                               : 0x13U) 
                                             << 0x10U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x10U)))
                                                 ? 0x10U
                                                 : 0x11U) 
                                               << 0xaU))));
    vlSelf->PSJjri[7U] = ((0x3fffffU & vlSelf->PSJjri[7U]) 
                          | (0xffc00000U & ((((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0x16U)))
                                               ? 0x16U
                                               : 0x17U) 
                                             << 0x1cU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x14U)))
                                                 ? 0x14U
                                                 : 0x15U) 
                                               << 0x16U))));
    vlSelf->PSJjri[8U] = ((0xfffffffcU & vlSelf->PSJjri[8U]) 
                          | (0x3fffffU & ((0x3fffffU 
                                           & (((1U 
                                                & (IData)(
                                                          (vlSelf->PS5nD5 
                                                           >> 0x16U)))
                                                ? 0x16U
                                                : 0x17U) 
                                              >> 4U)) 
                                          | (((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0x14U)))
                                               ? 0x14U
                                               : 0x15U) 
                                             >> 0xaU))));
    vlSelf->PSJjri[8U] = ((0xffffc003U & vlSelf->PSJjri[8U]) 
                          | (0xfffffffcU & ((((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0x1aU)))
                                               ? 0x1aU
                                               : 0x1bU) 
                                             << 8U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x18U)))
                                                 ? 0x18U
                                                 : 0x19U) 
                                               << 2U))));
    vlSelf->PSJjri[8U] = ((0xfc003fffU & vlSelf->PSJjri[8U]) 
                          | (0xffffc000U & ((((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0x1eU)))
                                               ? 0x1eU
                                               : 0x1fU) 
                                             << 0x14U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x1cU)))
                                                 ? 0x1cU
                                                 : 0x1dU) 
                                               << 0xeU))));
    vlSelf->PSJjri[8U] = ((0x3ffffffU & vlSelf->PSJjri[8U]) 
                          | (((1U & (IData)((vlSelf->PS5nD5 
                                             >> 0x20U)))
                               ? 0x20U : 0x21U) << 0x1aU));
    vlSelf->PSJjri[9U] = ((0xffffffc0U & vlSelf->PSJjri[9U]) 
                          | (0x3ffffffU & (((1U & (IData)(
                                                          (vlSelf->PS5nD5 
                                                           >> 0x22U)))
                                             ? 0x22U
                                             : 0x23U) 
                                           | (((1U 
                                                & (IData)(
                                                          (vlSelf->PS5nD5 
                                                           >> 0x20U)))
                                                ? 0x20U
                                                : 0x21U) 
                                              >> 6U))));
    vlSelf->PSJjri[9U] = ((0xfffc003fU & vlSelf->PSJjri[9U]) 
                          | (0xffffffc0U & ((((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0x26U)))
                                               ? 0x26U
                                               : 0x27U) 
                                             << 0xcU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x24U)))
                                                 ? 0x24U
                                                 : 0x25U) 
                                               << 6U))));
    vlSelf->PSJjri[9U] = ((0xc003ffffU & vlSelf->PSJjri[9U]) 
                          | (0xfffc0000U & ((((1U & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0x2aU)))
                                               ? 0x2aU
                                               : 0x2bU) 
                                             << 0x18U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x28U)))
                                                 ? 0x28U
                                                 : 0x29U) 
                                               << 0x12U))));
    vlSelf->PSJjri[9U] = ((0x3fffffffU & vlSelf->PSJjri[9U]) 
                          | (((1U & (IData)((vlSelf->PS5nD5 
                                             >> 0x2cU)))
                               ? 0x2cU : 0x2dU) << 0x1eU));
    vlSelf->PSJjri[0xaU] = ((0xfffffc00U & vlSelf->PSJjri[0xaU]) 
                            | (0x3fffffffU & ((0x3ffffff0U 
                                               & (((1U 
                                                    & (IData)(
                                                              (vlSelf->PS5nD5 
                                                               >> 0x2eU)))
                                                    ? 0x2eU
                                                    : 0x2fU) 
                                                  << 4U)) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PS5nD5 
                                                              >> 0x2cU)))
                                                   ? 0x2cU
                                                   : 0x2dU) 
                                                 >> 2U))));
    vlSelf->PSJjri[0xaU] = ((0xffc003ffU & vlSelf->PSJjri[0xaU]) 
                            | (0xfffffc00U & ((((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x32U)))
                                                 ? 0x32U
                                                 : 0x33U) 
                                               << 0x10U) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PS5nD5 
                                                              >> 0x30U)))
                                                   ? 0x30U
                                                   : 0x31U) 
                                                 << 0xaU))));
    vlSelf->PSJjri[0xaU] = ((0x3fffffU & vlSelf->PSJjri[0xaU]) 
                            | (0xffc00000U & ((((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x36U)))
                                                 ? 0x36U
                                                 : 0x37U) 
                                               << 0x1cU) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PS5nD5 
                                                              >> 0x34U)))
                                                   ? 0x34U
                                                   : 0x35U) 
                                                 << 0x16U))));
    vlSelf->PSJjri[0xbU] = ((0xfffffffcU & vlSelf->PSJjri[0xbU]) 
                            | (0x3fffffU & ((0x3fffffU 
                                             & (((1U 
                                                  & (IData)(
                                                            (vlSelf->PS5nD5 
                                                             >> 0x36U)))
                                                  ? 0x36U
                                                  : 0x37U) 
                                                >> 4U)) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x34U)))
                                                 ? 0x34U
                                                 : 0x35U) 
                                               >> 0xaU))));
    vlSelf->PSJjri[0xbU] = ((0xffffc003U & vlSelf->PSJjri[0xbU]) 
                            | (0xfffffffcU & ((((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x3aU)))
                                                 ? 0x3aU
                                                 : 0x3bU) 
                                               << 8U) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PS5nD5 
                                                              >> 0x38U)))
                                                   ? 0x38U
                                                   : 0x39U) 
                                                 << 2U))));
    vlSelf->PSJjri[0xbU] = ((0xfc003fffU & vlSelf->PSJjri[0xbU]) 
                            | (0xffffc000U & ((((1U 
                                                 & (IData)(
                                                           (vlSelf->PS5nD5 
                                                            >> 0x3eU)))
                                                 ? 0x3eU
                                                 : 0x3fU) 
                                               << 0x14U) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PS5nD5 
                                                              >> 0x3cU)))
                                                   ? 0x3cU
                                                   : 0x3dU) 
                                                 << 0xeU))));
    vlSelf->PS7vyh = ((0xfffffffe7fffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xcULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (3ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x1fU));
    vlSelf->PS7vyh = ((0xfffffff9ffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x21U));
    vlSelf->PS7vyh = ((0xffffffe7ffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x23U));
    vlSelf->PS7vyh = ((0xffffff9fffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x25U));
    vlSelf->PS7vyh = ((0xfffffe7fffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x27U));
    vlSelf->PS7vyh = ((0xfffff9ffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x29U));
    vlSelf->PS7vyh = ((0xffffe7ffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x2bU));
    vlSelf->PS7vyh = ((0xffff9fffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x2dU));
    vlSelf->PS7vyh = ((0xfffe7fffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x2fU));
    vlSelf->PS7vyh = ((0xfff9ffffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x31U));
    vlSelf->PS7vyh = ((0xffe7ffffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x33U));
    vlSelf->PS7vyh = ((0xff9fffffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x35U));
    vlSelf->PS7vyh = ((0xfe7fffffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x37U));
    vlSelf->PS7vyh = ((0xf9ffffffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x39U));
    vlSelf->PS7vyh = ((0xe7ffffffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x3bU));
    vlSelf->PS7vyh = ((0x9fffffffffffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000000000000ULL 
                                                     & vlSelf->PSSN7W))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000000000000ULL 
                                                              & vlSelf->PSSN7W)))))) 
                         << 0x3dU));
    vlSelf->PSxCEB[5U] = ((0x3ffffffU & vlSelf->PSxCEB[5U]) 
                          | (((1U & (IData)(vlSelf->PSSN7W))
                               ? 0U : 1U) << 0x1aU));
    vlSelf->PSxCEB[6U] = ((0xffffffc0U & vlSelf->PSxCEB[6U]) 
                          | (0x3ffffffU & (((1U & (IData)(
                                                          (vlSelf->PSSN7W 
                                                           >> 2U)))
                                             ? 2U : 3U) 
                                           | (((1U 
                                                & (IData)(vlSelf->PSSN7W))
                                                ? 0U
                                                : 1U) 
                                              >> 6U))));
    vlSelf->PSxCEB[6U] = ((0xfffc003fU & vlSelf->PSxCEB[6U]) 
                          | (0xffffffc0U & ((((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 6U)))
                                               ? 6U
                                               : 7U) 
                                             << 0xcU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 4U)))
                                                 ? 4U
                                                 : 5U) 
                                               << 6U))));
    vlSelf->PSxCEB[6U] = ((0xc003ffffU & vlSelf->PSxCEB[6U]) 
                          | (0xfffc0000U & ((((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0xaU)))
                                               ? 0xaU
                                               : 0xbU) 
                                             << 0x18U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 8U)))
                                                 ? 8U
                                                 : 9U) 
                                               << 0x12U))));
    vlSelf->PSxCEB[6U] = ((0x3fffffffU & vlSelf->PSxCEB[6U]) 
                          | (((1U & (IData)((vlSelf->PSSN7W 
                                             >> 0xcU)))
                               ? 0xcU : 0xdU) << 0x1eU));
    vlSelf->PSxCEB[7U] = ((0xfffffc00U & vlSelf->PSxCEB[7U]) 
                          | (0x3fffffffU & ((0x3ffffff0U 
                                             & (((1U 
                                                  & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0xeU)))
                                                  ? 0xeU
                                                  : 0xfU) 
                                                << 4U)) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0xcU)))
                                                 ? 0xcU
                                                 : 0xdU) 
                                               >> 2U))));
    vlSelf->PSxCEB[7U] = ((0xffc003ffU & vlSelf->PSxCEB[7U]) 
                          | (0xfffffc00U & ((((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0x12U)))
                                               ? 0x12U
                                               : 0x13U) 
                                             << 0x10U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x10U)))
                                                 ? 0x10U
                                                 : 0x11U) 
                                               << 0xaU))));
    vlSelf->PSxCEB[7U] = ((0x3fffffU & vlSelf->PSxCEB[7U]) 
                          | (0xffc00000U & ((((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0x16U)))
                                               ? 0x16U
                                               : 0x17U) 
                                             << 0x1cU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x14U)))
                                                 ? 0x14U
                                                 : 0x15U) 
                                               << 0x16U))));
    vlSelf->PSxCEB[8U] = ((0xfffffffcU & vlSelf->PSxCEB[8U]) 
                          | (0x3fffffU & ((0x3fffffU 
                                           & (((1U 
                                                & (IData)(
                                                          (vlSelf->PSSN7W 
                                                           >> 0x16U)))
                                                ? 0x16U
                                                : 0x17U) 
                                              >> 4U)) 
                                          | (((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0x14U)))
                                               ? 0x14U
                                               : 0x15U) 
                                             >> 0xaU))));
    vlSelf->PSxCEB[8U] = ((0xffffc003U & vlSelf->PSxCEB[8U]) 
                          | (0xfffffffcU & ((((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0x1aU)))
                                               ? 0x1aU
                                               : 0x1bU) 
                                             << 8U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x18U)))
                                                 ? 0x18U
                                                 : 0x19U) 
                                               << 2U))));
    vlSelf->PSxCEB[8U] = ((0xfc003fffU & vlSelf->PSxCEB[8U]) 
                          | (0xffffc000U & ((((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0x1eU)))
                                               ? 0x1eU
                                               : 0x1fU) 
                                             << 0x14U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x1cU)))
                                                 ? 0x1cU
                                                 : 0x1dU) 
                                               << 0xeU))));
    vlSelf->PSxCEB[8U] = ((0x3ffffffU & vlSelf->PSxCEB[8U]) 
                          | (((1U & (IData)((vlSelf->PSSN7W 
                                             >> 0x20U)))
                               ? 0x20U : 0x21U) << 0x1aU));
    vlSelf->PSxCEB[9U] = ((0xffffffc0U & vlSelf->PSxCEB[9U]) 
                          | (0x3ffffffU & (((1U & (IData)(
                                                          (vlSelf->PSSN7W 
                                                           >> 0x22U)))
                                             ? 0x22U
                                             : 0x23U) 
                                           | (((1U 
                                                & (IData)(
                                                          (vlSelf->PSSN7W 
                                                           >> 0x20U)))
                                                ? 0x20U
                                                : 0x21U) 
                                              >> 6U))));
    vlSelf->PSxCEB[9U] = ((0xfffc003fU & vlSelf->PSxCEB[9U]) 
                          | (0xffffffc0U & ((((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0x26U)))
                                               ? 0x26U
                                               : 0x27U) 
                                             << 0xcU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x24U)))
                                                 ? 0x24U
                                                 : 0x25U) 
                                               << 6U))));
    vlSelf->PSxCEB[9U] = ((0xc003ffffU & vlSelf->PSxCEB[9U]) 
                          | (0xfffc0000U & ((((1U & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0x2aU)))
                                               ? 0x2aU
                                               : 0x2bU) 
                                             << 0x18U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x28U)))
                                                 ? 0x28U
                                                 : 0x29U) 
                                               << 0x12U))));
    vlSelf->PSxCEB[9U] = ((0x3fffffffU & vlSelf->PSxCEB[9U]) 
                          | (((1U & (IData)((vlSelf->PSSN7W 
                                             >> 0x2cU)))
                               ? 0x2cU : 0x2dU) << 0x1eU));
    vlSelf->PSxCEB[0xaU] = ((0xfffffc00U & vlSelf->PSxCEB[0xaU]) 
                            | (0x3fffffffU & ((0x3ffffff0U 
                                               & (((1U 
                                                    & (IData)(
                                                              (vlSelf->PSSN7W 
                                                               >> 0x2eU)))
                                                    ? 0x2eU
                                                    : 0x2fU) 
                                                  << 4U)) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PSSN7W 
                                                              >> 0x2cU)))
                                                   ? 0x2cU
                                                   : 0x2dU) 
                                                 >> 2U))));
    vlSelf->PSxCEB[0xaU] = ((0xffc003ffU & vlSelf->PSxCEB[0xaU]) 
                            | (0xfffffc00U & ((((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x32U)))
                                                 ? 0x32U
                                                 : 0x33U) 
                                               << 0x10U) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PSSN7W 
                                                              >> 0x30U)))
                                                   ? 0x30U
                                                   : 0x31U) 
                                                 << 0xaU))));
    vlSelf->PSxCEB[0xaU] = ((0x3fffffU & vlSelf->PSxCEB[0xaU]) 
                            | (0xffc00000U & ((((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x36U)))
                                                 ? 0x36U
                                                 : 0x37U) 
                                               << 0x1cU) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PSSN7W 
                                                              >> 0x34U)))
                                                   ? 0x34U
                                                   : 0x35U) 
                                                 << 0x16U))));
    vlSelf->PSxCEB[0xbU] = ((0xfffffffcU & vlSelf->PSxCEB[0xbU]) 
                            | (0x3fffffU & ((0x3fffffU 
                                             & (((1U 
                                                  & (IData)(
                                                            (vlSelf->PSSN7W 
                                                             >> 0x36U)))
                                                  ? 0x36U
                                                  : 0x37U) 
                                                >> 4U)) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x34U)))
                                                 ? 0x34U
                                                 : 0x35U) 
                                               >> 0xaU))));
    vlSelf->PSxCEB[0xbU] = ((0xffffc003U & vlSelf->PSxCEB[0xbU]) 
                            | (0xfffffffcU & ((((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x3aU)))
                                                 ? 0x3aU
                                                 : 0x3bU) 
                                               << 8U) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PSSN7W 
                                                              >> 0x38U)))
                                                   ? 0x38U
                                                   : 0x39U) 
                                                 << 2U))));
    vlSelf->PSxCEB[0xbU] = ((0xfc003fffU & vlSelf->PSxCEB[0xbU]) 
                            | (0xffffc000U & ((((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSN7W 
                                                            >> 0x3eU)))
                                                 ? 0x3eU
                                                 : 0x3fU) 
                                               << 0x14U) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PSSN7W 
                                                              >> 0x3cU)))
                                                   ? 0x3cU
                                                   : 0x3dU) 
                                                 << 0xeU))));
    vlSelf->PSyCAQ = ((0xfffe0U & vlSelf->PSyCAQ) | 
                      ((1U & (IData)(vlSelf->PSQ2ew))
                        ? (0x1fU & (IData)(vlSelf->PS3M8z))
                        : 0U));
    vlSelf->PSfIxT = ((1U & (IData)(vlSelf->PSfIxT)) 
                      | ((IData)((0U != (IData)(PS1RlL))) 
                         << 1U));
    PSkHbf = (0x3fffffffffULL & (((0x1fffffffffULL 
                                   & ((QData)((IData)(
                                                      (0x3fffffU 
                                                       & (((0x400U 
                                                            & ((IData)(vlSelf->PSQkd9) 
                                                               << 3U)) 
                                                           | (0x3ffU 
                                                              & (IData)(vlSelf->PSo1Mp))) 
                                                          * 
                                                          ((0x400U 
                                                            & ((IData)(vlSelf->PS489D) 
                                                               << 3U)) 
                                                           | (0x3ffU 
                                                              & (IData)(vlSelf->PS4Bor))))))) 
                                      << 2U)) + (0x1fffffffffULL 
                                                 & ((IData)(vlSelf->PS9ZNE)
                                                     ? 
                                                    (~ PS584z)
                                                     : PS584z))) 
                                 + (QData)((IData)(
                                                   ((IData)(vlSelf->PS9ZNE) 
                                                    & (~ (IData)(
                                                                 (0U 
                                                                  != (IData)(PS1RlL)))))))));
    vlSelf->PSyCAQ = ((0xffc1fU & vlSelf->PSyCAQ) | 
                      (((2U & (IData)(vlSelf->PSQ2ew))
                         ? (0x1fU & (IData)(vlSelf->PSBAhW))
                         : 0U) << 5U));
    vlSelf->PSrfaO = ((1U & (IData)(vlSelf->PSrfaO)) 
                      | ((IData)((0U != (IData)(PSIxfk))) 
                         << 1U));
    PSvEon = (0x3fffffffffULL & (((0x1fffffffffULL 
                                   & ((QData)((IData)(
                                                      (0x3fffffU 
                                                       & (((0x400U 
                                                            & ((IData)(vlSelf->PSEI4f) 
                                                               << 3U)) 
                                                           | (0x3ffU 
                                                              & (IData)(vlSelf->PSph4f))) 
                                                          * 
                                                          ((0x400U 
                                                            & ((IData)(vlSelf->PSAQ1I) 
                                                               << 3U)) 
                                                           | (0x3ffU 
                                                              & (IData)(vlSelf->PSRav0))))))) 
                                      << 2U)) + (0x1fffffffffULL 
                                                 & ((IData)(vlSelf->PSsvsQ)
                                                     ? 
                                                    (~ PSerbP)
                                                     : PSerbP))) 
                                 + (QData)((IData)(
                                                   ((IData)(vlSelf->PSsvsQ) 
                                                    & (~ (IData)(
                                                                 (0U 
                                                                  != (IData)(PSIxfk)))))))));
    vlSelf->PSyCAQ = ((0xf83ffU & vlSelf->PSyCAQ) | 
                      (((4U & (IData)(vlSelf->PSQ2ew))
                         ? (0x1fU & (IData)(vlSelf->PSb7uj))
                         : 0U) << 0xaU));
    vlSelf->PStHr1 = ((1U & (IData)(vlSelf->PStHr1)) 
                      | ((IData)((0U != (IData)(PSel0Y))) 
                         << 1U));
    PS4AGY = (0x3fffffffffULL & (((0x1fffffffffULL 
                                   & ((QData)((IData)(
                                                      (0x3fffffU 
                                                       & (((0x400U 
                                                            & ((IData)(vlSelf->PSrYrt) 
                                                               << 3U)) 
                                                           | (0x3ffU 
                                                              & (IData)(vlSelf->PSledF))) 
                                                          * 
                                                          ((0x400U 
                                                            & ((IData)(vlSelf->PSYP6g) 
                                                               << 3U)) 
                                                           | (0x3ffU 
                                                              & (IData)(vlSelf->PS8rVI))))))) 
                                      << 2U)) + (0x1fffffffffULL 
                                                 & ((IData)(vlSelf->PSiKxU)
                                                     ? 
                                                    (~ PSDhBe)
                                                     : PSDhBe))) 
                                 + (QData)((IData)(
                                                   ((IData)(vlSelf->PSiKxU) 
                                                    & (~ (IData)(
                                                                 (0U 
                                                                  != (IData)(PSel0Y)))))))));
    vlSelf->PSyCAQ = ((0x7fffU & vlSelf->PSyCAQ) | 
                      (((8U & (IData)(vlSelf->PSQ2ew))
                         ? (0x1fU & (IData)(vlSelf->PSR26B))
                         : 0U) << 0xfU));
    vlSelf->PS7jPs = ((1U & (IData)(vlSelf->PS7jPs)) 
                      | ((IData)((0U != (IData)(PSypPc))) 
                         << 1U));
    PS7moc = (0x3fffffffffULL & (((0x1fffffffffULL 
                                   & ((QData)((IData)(
                                                      (0x3fffffU 
                                                       & (((0x400U 
                                                            & ((IData)(vlSelf->PS0v6T) 
                                                               << 3U)) 
                                                           | (0x3ffU 
                                                              & (IData)(vlSelf->PSZLjU))) 
                                                          * 
                                                          ((0x400U 
                                                            & ((IData)(vlSelf->PSBDFz) 
                                                               << 3U)) 
                                                           | (0x3ffU 
                                                              & (IData)(vlSelf->PSxbGS))))))) 
                                      << 2U)) + (0x1fffffffffULL 
                                                 & ((IData)(vlSelf->PS1Lxm)
                                                     ? 
                                                    (~ PSFA25)
                                                     : PSFA25))) 
                                 + (QData)((IData)(
                                                   ((IData)(vlSelf->PS1Lxm) 
                                                    & (~ (IData)(
                                                                 (0U 
                                                                  != (IData)(PSypPc)))))))));
    PSV8nP = (0x1fU & (((1U & (IData)(vlSelf->PSHCxm))
                         ? (IData)(vlSelf->PSF1ui) : 0U) 
                       & (- (IData)((1U & (IData)(vlSelf->PS0jIc))))));
    vlSelf->PSJrZa = PSV8nP;
    vlSelf->PSQyGc = ((3U & (IData)(vlSelf->PSQyGc)) 
                      | ((IData)((0U != PSzKQX)) << 2U));
    VL_EXTEND_WQ(106,53, PSKWji, (((QData)((IData)(
                                                   (1U 
                                                    & ((IData)(vlSelf->PSJKUk) 
                                                       >> 7U)))) 
                                   << 0x34U) | (0xfffffffffffffULL 
                                                & vlSelf->PSaa84)));
    VL_EXTEND_WQ(106,53, PSTUBQ, (((QData)((IData)(
                                                   (1U 
                                                    & ((IData)(vlSelf->PSBWMB) 
                                                       >> 7U)))) 
                                   << 0x34U) | (0xfffffffffffffULL 
                                                & vlSelf->PSiPwE)));
    VL_MUL_W(4, PS5Oqb, PSKWji, PSTUBQ);
    PSLSIT[0U] = PS5Oqb[0U];
    PSLSIT[1U] = PS5Oqb[1U];
    PSLSIT[2U] = PS5Oqb[2U];
    PSLSIT[3U] = (0x3ffU & PS5Oqb[3U]);
    VL_EXTEND_WW(163,106, PSC9Eb, PSLSIT);
    VL_SHIFTL_WWI(163,163,32, PSIojr, PSC9Eb, 2U);
    PS23SX[0U] = PSIojr[0U];
    PS23SX[1U] = PSIojr[1U];
    PS23SX[2U] = PSIojr[2U];
    PS23SX[3U] = PSIojr[3U];
    PS23SX[4U] = PSIojr[4U];
    PS23SX[5U] = (7U & PSIojr[5U]);
    VL_EXTEND_WW(164,163, PSCe5f, PS23SX);
    if (vlSelf->PSBBbU) {
        PScX8u[0U] = (~ PSvfEi[0U]);
        PScX8u[1U] = (~ PSvfEi[1U]);
        PScX8u[2U] = (~ PSvfEi[2U]);
        PScX8u[3U] = (~ PSvfEi[3U]);
        PScX8u[4U] = (~ PSvfEi[4U]);
        PScX8u[5U] = (7U & (~ PSvfEi[5U]));
    } else {
        PScX8u[0U] = PSvfEi[0U];
        PScX8u[1U] = PSvfEi[1U];
        PScX8u[2U] = PSvfEi[2U];
        PScX8u[3U] = PSvfEi[3U];
        PScX8u[4U] = PSvfEi[4U];
        PScX8u[5U] = (7U & PSvfEi[5U]);
    }
    VL_EXTEND_WW(164,163, PSWNZd, PScX8u);
    VL_ADD_W(6, PSoEr6, PSCe5f, PSWNZd);
    VL_EXTEND_WI(164,1, PSWn1f, ((IData)(vlSelf->PSBBbU) 
                                 & (~ (IData)((0U != PSzKQX)))));
    VL_ADD_W(6, PScTPw, PSoEr6, PSWn1f);
    PSL7wa[0U] = PScTPw[0U];
    PSL7wa[1U] = PScTPw[1U];
    PSL7wa[2U] = PScTPw[2U];
    PSL7wa[3U] = PScTPw[3U];
    PSL7wa[4U] = PScTPw[4U];
    PSL7wa[5U] = (0xfU & PScTPw[5U]);
    vlSelf->PSlKvW = ((0x3e0U & (IData)(vlSelf->PSlKvW)) 
                      | ((1U & (IData)(vlSelf->PSA9l1))
                          ? (0x1fU & (IData)(vlSelf->PSW42n))
                          : 0U));
    vlSelf->PSDBLG = ((3U & (IData)(vlSelf->PSDBLG)) 
                      | ((IData)((0U != PSB2A9)) << 2U));
    VL_EXTEND_WQ(76,48, PS1VfH, (0xffffffffffffULL 
                                 & ((QData)((IData)(
                                                    ((0x800000U 
                                                      & ((IData)(vlSelf->PSHACS) 
                                                         << 0x10U)) 
                                                     | (0x7fffffU 
                                                        & vlSelf->PS9Asu)))) 
                                    * (QData)((IData)(
                                                      ((0x800000U 
                                                        & ((IData)(vlSelf->PSD1B8) 
                                                           << 0x10U)) 
                                                       | (0x7fffffU 
                                                          & vlSelf->PS5dRf)))))));
    VL_SHIFTL_WWI(76,76,32, PSIVI0, PS1VfH, 2U);
    PSUI1u[0U] = PSIVI0[0U];
    PSUI1u[1U] = PSIVI0[1U];
    PSUI1u[2U] = (0xfffU & PSIVI0[2U]);
    VL_EXTEND_WW(77,76, PSwvXn, PSUI1u);
    if (vlSelf->PSw7Ss) {
        PS8Rf7[0U] = (~ PScyfP[0U]);
        PS8Rf7[1U] = (~ PScyfP[1U]);
        PS8Rf7[2U] = (0xfffU & (~ PScyfP[2U]));
    } else {
        PS8Rf7[0U] = PScyfP[0U];
        PS8Rf7[1U] = PScyfP[1U];
        PS8Rf7[2U] = (0xfffU & PScyfP[2U]);
    }
    VL_EXTEND_WW(77,76, PS3Oqz, PS8Rf7);
    VL_ADD_W(3, PSdGjy, PSwvXn, PS3Oqz);
    VL_EXTEND_WI(77,1, PS8r3Z, ((IData)(vlSelf->PSw7Ss) 
                                & (~ (IData)((0U != PSB2A9)))));
    VL_ADD_W(3, PS0hNU, PSdGjy, PS8r3Z);
    PSfsnK[0U] = PS0hNU[0U];
    PSfsnK[1U] = PS0hNU[1U];
    PSfsnK[2U] = (0x1fffU & PS0hNU[2U]);
    vlSelf->PSlKvW = ((0x1fU & (IData)(vlSelf->PSlKvW)) 
                      | (((2U & (IData)(vlSelf->PSA9l1))
                           ? (0x1fU & (IData)(vlSelf->PSei6c))
                           : 0U) << 5U));
    vlSelf->PS18Zg = ((3U & (IData)(vlSelf->PS18Zg)) 
                      | ((IData)((0U != PSXBCg)) << 2U));
    VL_EXTEND_WQ(76,48, PSArFz, (0xffffffffffffULL 
                                 & ((QData)((IData)(
                                                    ((0x800000U 
                                                      & ((IData)(vlSelf->PSXVbA) 
                                                         << 0x10U)) 
                                                     | (0x7fffffU 
                                                        & vlSelf->PSAIJW)))) 
                                    * (QData)((IData)(
                                                      ((0x800000U 
                                                        & ((IData)(vlSelf->PSnJuN) 
                                                           << 0x10U)) 
                                                       | (0x7fffffU 
                                                          & vlSelf->PSeDBN)))))));
    VL_SHIFTL_WWI(76,76,32, PSi8E9, PSArFz, 2U);
    PSVaLP[0U] = PSi8E9[0U];
    PSVaLP[1U] = PSi8E9[1U];
    PSVaLP[2U] = (0xfffU & PSi8E9[2U]);
    VL_EXTEND_WW(77,76, PSiBuD, PSVaLP);
    if (vlSelf->PSBxqm) {
        PSys9N[0U] = (~ PSvhuJ[0U]);
        PSys9N[1U] = (~ PSvhuJ[1U]);
        PSys9N[2U] = (0xfffU & (~ PSvhuJ[2U]));
    } else {
        PSys9N[0U] = PSvhuJ[0U];
        PSys9N[1U] = PSvhuJ[1U];
        PSys9N[2U] = (0xfffU & PSvhuJ[2U]);
    }
    VL_EXTEND_WW(77,76, PS5iRr, PSys9N);
    VL_ADD_W(3, PSbz8E, PSiBuD, PS5iRr);
    VL_EXTEND_WI(77,1, PSW7VB, ((IData)(vlSelf->PSBxqm) 
                                & (~ (IData)((0U != PSXBCg)))));
    VL_ADD_W(3, PS67rg, PSbz8E, PSW7VB);
    PSVis0[0U] = PS67rg[0U];
    PSVis0[1U] = PS67rg[1U];
    PSVis0[2U] = (0x1fffU & PS67rg[2U]);
    vlSelf->PSrd0W = ((0xfffeU & (IData)(vlSelf->PSrd0W)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSrd0W)))));
    vlSelf->PSrd0W = ((0xfffdU & (IData)(vlSelf->PSrd0W)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSrd0W)))) 
                         << 1U));
    vlSelf->PSrd0W = ((0xfffbU & (IData)(vlSelf->PSrd0W)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSrd0W)))) 
                         << 2U));
    vlSelf->PSrd0W = ((0xfff7U & (IData)(vlSelf->PSrd0W)) 
                      | ((IData)((0U != (0x180U & (IData)(vlSelf->PSrd0W)))) 
                         << 3U));
    vlSelf->PSrd0W = ((0xffefU & (IData)(vlSelf->PSrd0W)) 
                      | ((IData)((0U != (0x600U & (IData)(vlSelf->PSrd0W)))) 
                         << 4U));
    vlSelf->PSrd0W = ((0xffdfU & (IData)(vlSelf->PSrd0W)) 
                      | ((IData)((0U != (0x1800U & (IData)(vlSelf->PSrd0W)))) 
                         << 5U));
    vlSelf->PSrd0W = ((0xffbfU & (IData)(vlSelf->PSrd0W)) 
                      | ((IData)((0U != (0x6000U & (IData)(vlSelf->PSrd0W)))) 
                         << 6U));
    vlSelf->PSAwQk = ((1U & (IData)(vlSelf->PSAwQk)) 
                      | (2U & ((~ (IData)(vlSelf->PSrd0W)) 
                               << 1U)));
    vlSelf->PSl4Bg = ((0xfffffffffffffff0ULL & vlSelf->PSl4Bg) 
                      | (IData)((IData)((0xfU & ((2U 
                                                  & (IData)(vlSelf->PSrd0W))
                                                  ? (IData)(
                                                            (vlSelf->PSl4Bg 
                                                             >> 4U))
                                                  : (IData)(
                                                            (vlSelf->PSl4Bg 
                                                             >> 8U)))))));
    vlSelf->PSl4Bg = ((0xffffffffffffff0fULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)((0xfU & ((8U 
                                                   & (IData)(vlSelf->PSrd0W))
                                                   ? (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0xcU))
                                                   : (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x10U)))))) 
                         << 4U));
    vlSelf->PSl4Bg = ((0xfffffffffffff0ffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)((0xfU & ((0x20U 
                                                   & (IData)(vlSelf->PSrd0W))
                                                   ? (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x14U))
                                                   : (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x18U)))))) 
                         << 8U));
    vlSelf->PSl4Bg = ((0xffffffffffff0fffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)((0xfU & ((0x80U 
                                                   & (IData)(vlSelf->PSrd0W))
                                                   ? (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x1cU))
                                                   : (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x20U)))))) 
                         << 0xcU));
    vlSelf->PSl4Bg = ((0xfffffffffff0ffffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)((0xfU & ((0x200U 
                                                   & (IData)(vlSelf->PSrd0W))
                                                   ? (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x24U))
                                                   : (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x28U)))))) 
                         << 0x10U));
    vlSelf->PSl4Bg = ((0xffffffffff0fffffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)((0xfU & ((0x800U 
                                                   & (IData)(vlSelf->PSrd0W))
                                                   ? (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x2cU))
                                                   : (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x30U)))))) 
                         << 0x14U));
    vlSelf->PSl4Bg = ((0xfffffffff0ffffffULL & vlSelf->PSl4Bg) 
                      | ((QData)((IData)((0xfU & ((0x2000U 
                                                   & (IData)(vlSelf->PSrd0W))
                                                   ? (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x34U))
                                                   : (IData)(
                                                             (vlSelf->PSl4Bg 
                                                              >> 0x38U)))))) 
                         << 0x18U));
    vlSelf->PSmvhX = ((0xffffU & vlSelf->PSmvhX) | 
                      (((IData)(vlSelf->PSWqu8) << 
                        (0xfU & (IData)(vlSelf->PSl4Bg))) 
                       << 0x10U));
    PS0PvK = (0x3fU & ((0xcU == (0xfU & (IData)(vlSelf->PSESh9)))
                        ? ((IData)(0xfU) - (0xfU & (IData)(vlSelf->PSl4Bg)))
                        : ((((((0x1dU >= (0x1fU & ((IData)(6U) 
                                                   * 
                                                   (7U 
                                                    & (IData)(vlSelf->PSKPOM)))))
                                ? (vlSelf->PSZ4nI >> 
                                   (0x1fU & ((IData)(6U) 
                                             * (7U 
                                                & (IData)(vlSelf->PSKPOM)))))
                                : 0U) + VL_EXTENDS_II(6,2, 
                                                      ((0x27U 
                                                        >= 
                                                        (0x3fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x38U 
                                                             & ((IData)(vlSelf->PSKPOM) 
                                                                << 3U))))) 
                                                       & (IData)(
                                                                 (vlSelf->PSxLxl 
                                                                  >> 
                                                                  (0x3fU 
                                                                   & ((IData)(6U) 
                                                                      + 
                                                                      (0x38U 
                                                                       & ((IData)(vlSelf->PSKPOM) 
                                                                          << 3U))))))))) 
                             - (IData)(vlSelf->PSoN3x)) 
                            - (0xfU & (IData)(vlSelf->PSl4Bg))) 
                           + ((0x1dU >= (0x1fU & ((IData)(6U) 
                                                  * 
                                                  (7U 
                                                   & (IData)(vlSelf->PSKPOM)))))
                               ? (vlSelf->PS4pk7 >> 
                                  (0x1fU & ((IData)(6U) 
                                            * (7U & (IData)(vlSelf->PSKPOM)))))
                               : 0U))));
    vlSelf->PSegkQ = ((0xfffeU & (IData)(vlSelf->PSegkQ)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSegkQ)))));
    vlSelf->PSegkQ = ((0xfffdU & (IData)(vlSelf->PSegkQ)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSegkQ)))) 
                         << 1U));
    vlSelf->PSegkQ = ((0xfffbU & (IData)(vlSelf->PSegkQ)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSegkQ)))) 
                         << 2U));
    vlSelf->PSegkQ = ((0xfff7U & (IData)(vlSelf->PSegkQ)) 
                      | ((IData)((0U != (0x180U & (IData)(vlSelf->PSegkQ)))) 
                         << 3U));
    vlSelf->PSegkQ = ((0xffefU & (IData)(vlSelf->PSegkQ)) 
                      | ((IData)((0U != (0x600U & (IData)(vlSelf->PSegkQ)))) 
                         << 4U));
    vlSelf->PSegkQ = ((0xffdfU & (IData)(vlSelf->PSegkQ)) 
                      | ((IData)((0U != (0x1800U & (IData)(vlSelf->PSegkQ)))) 
                         << 5U));
    vlSelf->PSegkQ = ((0xffbfU & (IData)(vlSelf->PSegkQ)) 
                      | ((IData)((0U != (0x6000U & (IData)(vlSelf->PSegkQ)))) 
                         << 6U));
    vlSelf->PSVwRV = ((1U & (IData)(vlSelf->PSVwRV)) 
                      | (2U & ((~ (IData)(vlSelf->PSegkQ)) 
                               << 1U)));
    vlSelf->PSKM2A = ((0xfffffffffffffff0ULL & vlSelf->PSKM2A) 
                      | (IData)((IData)((0xfU & ((2U 
                                                  & (IData)(vlSelf->PSegkQ))
                                                  ? (IData)(
                                                            (vlSelf->PSKM2A 
                                                             >> 4U))
                                                  : (IData)(
                                                            (vlSelf->PSKM2A 
                                                             >> 8U)))))));
    vlSelf->PSKM2A = ((0xffffffffffffff0fULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)((0xfU & ((8U 
                                                   & (IData)(vlSelf->PSegkQ))
                                                   ? (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0xcU))
                                                   : (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x10U)))))) 
                         << 4U));
    vlSelf->PSKM2A = ((0xfffffffffffff0ffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)((0xfU & ((0x20U 
                                                   & (IData)(vlSelf->PSegkQ))
                                                   ? (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x14U))
                                                   : (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x18U)))))) 
                         << 8U));
    vlSelf->PSKM2A = ((0xffffffffffff0fffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)((0xfU & ((0x80U 
                                                   & (IData)(vlSelf->PSegkQ))
                                                   ? (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x1cU))
                                                   : (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x20U)))))) 
                         << 0xcU));
    vlSelf->PSKM2A = ((0xfffffffffff0ffffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)((0xfU & ((0x200U 
                                                   & (IData)(vlSelf->PSegkQ))
                                                   ? (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x24U))
                                                   : (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x28U)))))) 
                         << 0x10U));
    vlSelf->PSKM2A = ((0xffffffffff0fffffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)((0xfU & ((0x800U 
                                                   & (IData)(vlSelf->PSegkQ))
                                                   ? (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x2cU))
                                                   : (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x30U)))))) 
                         << 0x14U));
    vlSelf->PSKM2A = ((0xfffffffff0ffffffULL & vlSelf->PSKM2A) 
                      | ((QData)((IData)((0xfU & ((0x2000U 
                                                   & (IData)(vlSelf->PSegkQ))
                                                   ? (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x34U))
                                                   : (IData)(
                                                             (vlSelf->PSKM2A 
                                                              >> 0x38U)))))) 
                         << 0x18U));
    vlSelf->PSYjlY = ((0xffffU & vlSelf->PSYjlY) | 
                      (((IData)(vlSelf->PSLDvF) << 
                        (0xfU & (IData)(vlSelf->PSKM2A))) 
                       << 0x10U));
    PSnACJ = (0x3fU & ((0xcU == (0xfU & (IData)(vlSelf->PSbbCB)))
                        ? ((IData)(0xfU) - (0xfU & (IData)(vlSelf->PSKM2A)))
                        : ((((((0x1dU >= (0x1fU & ((IData)(6U) 
                                                   * 
                                                   (7U 
                                                    & (IData)(vlSelf->PSdCwq)))))
                                ? (vlSelf->PSsgPs >> 
                                   (0x1fU & ((IData)(6U) 
                                             * (7U 
                                                & (IData)(vlSelf->PSdCwq)))))
                                : 0U) + VL_EXTENDS_II(6,2, 
                                                      ((0x27U 
                                                        >= 
                                                        (0x3fU 
                                                         & ((IData)(6U) 
                                                            + 
                                                            (0x38U 
                                                             & ((IData)(vlSelf->PSdCwq) 
                                                                << 3U))))) 
                                                       & (IData)(
                                                                 (vlSelf->PSuUz6 
                                                                  >> 
                                                                  (0x3fU 
                                                                   & ((IData)(6U) 
                                                                      + 
                                                                      (0x38U 
                                                                       & ((IData)(vlSelf->PSdCwq) 
                                                                          << 3U))))))))) 
                             - (IData)(vlSelf->PSHM9R)) 
                            - (0xfU & (IData)(vlSelf->PSKM2A))) 
                           + ((0x1dU >= (0x1fU & ((IData)(6U) 
                                                  * 
                                                  (7U 
                                                   & (IData)(vlSelf->PSdCwq)))))
                               ? (vlSelf->PSwv4p >> 
                                  (0x1fU & ((IData)(6U) 
                                            * (7U & (IData)(vlSelf->PSdCwq)))))
                               : 0U))));
    vlSelf->PSc7RB = ((0xfffffffffffffffeULL & vlSelf->PSc7RB) 
                      | (IData)((IData)((0ULL != (6ULL 
                                                  & vlSelf->PSc7RB)))));
    vlSelf->PSc7RB = ((0xfffffffffffffffdULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 1U));
    vlSelf->PSc7RB = ((0xfffffffffffffffbULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 2U));
    vlSelf->PSc7RB = ((0xfffffffffffffff7ULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 3U));
    vlSelf->PSc7RB = ((0xffffffffffffffefULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 4U));
    vlSelf->PSc7RB = ((0xffffffffffffffdfULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 5U));
    vlSelf->PSc7RB = ((0xffffffffffffffbfULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 6U));
    vlSelf->PSc7RB = ((0xffffffffffffff7fULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 7U));
    vlSelf->PSc7RB = ((0xfffffffffffffeffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 8U));
    vlSelf->PSc7RB = ((0xfffffffffffffdffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 9U));
    vlSelf->PSc7RB = ((0xfffffffffffffbffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0xaU));
    vlSelf->PSc7RB = ((0xfffffffffffff7ffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0xbU));
    vlSelf->PSc7RB = ((0xffffffffffffefffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0xcU));
    vlSelf->PSc7RB = ((0xffffffffffffdfffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0xdU));
    vlSelf->PSc7RB = ((0xffffffffffffbfffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0xeU));
    vlSelf->PSc7RB = ((0xffffffffffff7fffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0xfU));
    vlSelf->PSc7RB = ((0xfffffffffffeffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x10U));
    vlSelf->PSc7RB = ((0xfffffffffffdffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x11U));
    vlSelf->PSc7RB = ((0xfffffffffffbffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x12U));
    vlSelf->PSc7RB = ((0xfffffffffff7ffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x13U));
    vlSelf->PSc7RB = ((0xffffffffffefffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x14U));
    vlSelf->PSc7RB = ((0xffffffffffdfffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x15U));
    vlSelf->PSc7RB = ((0xffffffffffbfffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x16U));
    vlSelf->PSc7RB = ((0xffffffffff7fffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x17U));
    vlSelf->PSc7RB = ((0xfffffffffeffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x18U));
    vlSelf->PSc7RB = ((0xfffffffffdffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x19U));
    vlSelf->PSc7RB = ((0xfffffffffbffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x1aU));
    vlSelf->PSc7RB = ((0xfffffffff7ffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x1bU));
    vlSelf->PSc7RB = ((0xffffffffefffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x1cU));
    vlSelf->PSc7RB = ((0xffffffffdfffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x1dU));
    vlSelf->PSc7RB = ((0xffffffffbfffffffULL & vlSelf->PSc7RB) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000000ULL 
                                                   & vlSelf->PSc7RB))))) 
                         << 0x1eU));
    vlSelf->PSWg7P = ((1U & (IData)(vlSelf->PSWg7P)) 
                      | (2U & ((~ (IData)(vlSelf->PSc7RB)) 
                               << 1U)));
    vlSelf->PSJjri[0U] = ((0xffffffc0U & vlSelf->PSJjri[0U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSc7RB 
                                                     >> 1U)))
                                       ? ((vlSelf->PSJjri[0U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSJjri[0U] 
                                             >> 6U))
                                       : ((vlSelf->PSJjri[0U] 
                                           << 0x14U) 
                                          | (vlSelf->PSJjri[0U] 
                                             >> 0xcU)))));
    vlSelf->PSJjri[0U] = ((0xfffff03fU & vlSelf->PSJjri[0U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSc7RB 
                                                       >> 3U)))
                                         ? ((vlSelf->PSJjri[0U] 
                                             << 0xeU) 
                                            | (vlSelf->PSJjri[0U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSJjri[0U] 
                                             << 8U) 
                                            | (vlSelf->PSJjri[0U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSJjri[0U] = ((0xfffc0fffU & vlSelf->PSJjri[0U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSc7RB 
                                                         >> 5U)))
                                           ? ((vlSelf->PSJjri[1U] 
                                               << 2U) 
                                              | (vlSelf->PSJjri[0U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSJjri[1U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSJjri[1U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSJjri[0U] = ((0xff03ffffU & vlSelf->PSJjri[0U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSc7RB 
                                                          >> 7U)))
                                            ? ((vlSelf->PSJjri[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSJjri[1U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSJjri[1U] 
                                                << 0x10U) 
                                               | (vlSelf->PSJjri[1U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSJjri[0U] = ((0xc0ffffffU & vlSelf->PSJjri[0U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSc7RB 
                                                            >> 9U)))
                                              ? ((vlSelf->PSJjri[1U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSJjri[1U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSJjri[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSJjri[1U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSZuta = (0x3fU & ((1U & (IData)((vlSelf->PSc7RB 
                                      >> 0xbU))) ? 
                       ((vlSelf->PSJjri[2U] << 0x1eU) 
                        | (vlSelf->PSJjri[2U] >> 2U))
                        : ((vlSelf->PSJjri[2U] << 0x18U) 
                           | (vlSelf->PSJjri[2U] >> 8U))));
    vlSelf->PSJjri[0U] = ((0x3fffffffU & vlSelf->PSJjri[0U]) 
                          | (((1U & (IData)((vlSelf->PSc7RB 
                                             >> 0xbU)))
                               ? ((vlSelf->PSJjri[2U] 
                                   << 0x1eU) | (vlSelf->PSJjri[2U] 
                                                >> 2U))
                               : ((vlSelf->PSJjri[2U] 
                                   << 0x18U) | (vlSelf->PSJjri[2U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSJjri[1U] = ((0xfffffff0U & vlSelf->PSJjri[1U]) 
                          | (PSZuta >> 2U));
    vlSelf->PSJjri[1U] = ((0xfffffc0fU & vlSelf->PSJjri[1U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSc7RB 
                                                       >> 0xdU)))
                                         ? ((vlSelf->PSJjri[2U] 
                                             << 0x12U) 
                                            | (vlSelf->PSJjri[2U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSJjri[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSJjri[2U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSJjri[1U] = ((0xffff03ffU & vlSelf->PSJjri[1U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSc7RB 
                                                        >> 0xfU)))
                                          ? ((vlSelf->PSJjri[2U] 
                                              << 6U) 
                                             | (vlSelf->PSJjri[2U] 
                                                >> 0x1aU))
                                          : vlSelf->PSJjri[3U]) 
                                        << 0xaU)));
    vlSelf->PSJjri[1U] = ((0xffc0ffffU & vlSelf->PSJjri[1U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSc7RB 
                                                          >> 0x11U)))
                                            ? ((vlSelf->PSJjri[3U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSJjri[3U] 
                                                  >> 6U))
                                            : ((vlSelf->PSJjri[3U] 
                                                << 0x14U) 
                                               | (vlSelf->PSJjri[3U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSJjri[1U] = ((0xf03fffffU & vlSelf->PSJjri[1U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSc7RB 
                                                           >> 0x13U)))
                                             ? ((vlSelf->PSJjri[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSJjri[3U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSJjri[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSJjri[3U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PS8nCz = (0x3fU & ((1U & (IData)((vlSelf->PSc7RB 
                                      >> 0x15U))) ? 
                       ((vlSelf->PSJjri[4U] << 2U) 
                        | (vlSelf->PSJjri[3U] >> 0x1eU))
                        : ((vlSelf->PSJjri[4U] << 0x1cU) 
                           | (vlSelf->PSJjri[4U] >> 4U))));
    vlSelf->PSJjri[1U] = ((0xfffffffU & vlSelf->PSJjri[1U]) 
                          | (((1U & (IData)((vlSelf->PSc7RB 
                                             >> 0x15U)))
                               ? ((vlSelf->PSJjri[4U] 
                                   << 2U) | (vlSelf->PSJjri[3U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSJjri[4U] 
                                   << 0x1cU) | (vlSelf->PSJjri[4U] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSJjri[2U] = ((0xfffffffcU & vlSelf->PSJjri[2U]) 
                          | (PS8nCz >> 4U));
    vlSelf->PSJjri[2U] = ((0xffffff03U & vlSelf->PSJjri[2U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSc7RB 
                                                      >> 0x17U)))
                                        ? ((vlSelf->PSJjri[4U] 
                                            << 0x16U) 
                                           | (vlSelf->PSJjri[4U] 
                                              >> 0xaU))
                                        : ((vlSelf->PSJjri[4U] 
                                            << 0x10U) 
                                           | (vlSelf->PSJjri[4U] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSJjri[2U] = ((0xffffc0ffU & vlSelf->PSJjri[2U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSc7RB 
                                                        >> 0x19U)))
                                          ? ((vlSelf->PSJjri[4U] 
                                              << 0xaU) 
                                             | (vlSelf->PSJjri[4U] 
                                                >> 0x16U))
                                          : ((vlSelf->PSJjri[5U] 
                                              << 4U) 
                                             | (vlSelf->PSJjri[4U] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSJjri[2U] = ((0xfff03fffU & vlSelf->PSJjri[2U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSc7RB 
                                                         >> 0x1bU)))
                                           ? ((vlSelf->PSJjri[5U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSJjri[5U] 
                                                 >> 2U))
                                           : ((vlSelf->PSJjri[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSJjri[5U] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSJjri[2U] = ((0xfc0fffffU & vlSelf->PSJjri[2U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSc7RB 
                                                           >> 0x1dU)))
                                             ? ((vlSelf->PSJjri[5U] 
                                                 << 0x12U) 
                                                | (vlSelf->PSJjri[5U] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSJjri[5U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSJjri[5U] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSJjri[2U] = ((0x3ffffffU & vlSelf->PSJjri[2U]) 
                          | (((1U & (IData)((vlSelf->PSc7RB 
                                             >> 0x1fU)))
                               ? ((vlSelf->PSJjri[5U] 
                                   << 6U) | (vlSelf->PSJjri[5U] 
                                             >> 0x1aU))
                               : vlSelf->PSJjri[6U]) 
                             << 0x1aU));
    vlSelf->PSJjri[3U] = ((0xffffffc0U & vlSelf->PSJjri[3U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSc7RB 
                                                     >> 0x21U)))
                                       ? ((vlSelf->PSJjri[6U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSJjri[6U] 
                                             >> 6U))
                                       : ((vlSelf->PSJjri[6U] 
                                           << 0x14U) 
                                          | (vlSelf->PSJjri[6U] 
                                             >> 0xcU)))));
    vlSelf->PSJjri[3U] = ((0xfffff03fU & vlSelf->PSJjri[3U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSc7RB 
                                                       >> 0x23U)))
                                         ? ((vlSelf->PSJjri[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSJjri[6U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSJjri[6U] 
                                             << 8U) 
                                            | (vlSelf->PSJjri[6U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSJjri[3U] = ((0xfffc0fffU & vlSelf->PSJjri[3U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSc7RB 
                                                         >> 0x25U)))
                                           ? ((vlSelf->PSJjri[7U] 
                                               << 2U) 
                                              | (vlSelf->PSJjri[6U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSJjri[7U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSJjri[7U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSJjri[3U] = ((0xff03ffffU & vlSelf->PSJjri[3U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSc7RB 
                                                          >> 0x27U)))
                                            ? ((vlSelf->PSJjri[7U] 
                                                << 0x16U) 
                                               | (vlSelf->PSJjri[7U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSJjri[7U] 
                                                << 0x10U) 
                                               | (vlSelf->PSJjri[7U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSJjri[3U] = ((0xc0ffffffU & vlSelf->PSJjri[3U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSc7RB 
                                                            >> 0x29U)))
                                              ? ((vlSelf->PSJjri[7U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSJjri[7U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSJjri[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSJjri[7U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PS561A = (0x3fU & ((1U & (IData)((vlSelf->PSc7RB 
                                      >> 0x2bU))) ? 
                       ((vlSelf->PSJjri[8U] << 0x1eU) 
                        | (vlSelf->PSJjri[8U] >> 2U))
                        : ((vlSelf->PSJjri[8U] << 0x18U) 
                           | (vlSelf->PSJjri[8U] >> 8U))));
    vlSelf->PSJjri[3U] = ((0x3fffffffU & vlSelf->PSJjri[3U]) 
                          | (((1U & (IData)((vlSelf->PSc7RB 
                                             >> 0x2bU)))
                               ? ((vlSelf->PSJjri[8U] 
                                   << 0x1eU) | (vlSelf->PSJjri[8U] 
                                                >> 2U))
                               : ((vlSelf->PSJjri[8U] 
                                   << 0x18U) | (vlSelf->PSJjri[8U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSJjri[4U] = ((0xfffffff0U & vlSelf->PSJjri[4U]) 
                          | (PS561A >> 2U));
    vlSelf->PSJjri[4U] = ((0xfffffc0fU & vlSelf->PSJjri[4U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSc7RB 
                                                       >> 0x2dU)))
                                         ? ((vlSelf->PSJjri[8U] 
                                             << 0x12U) 
                                            | (vlSelf->PSJjri[8U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSJjri[8U] 
                                             << 0xcU) 
                                            | (vlSelf->PSJjri[8U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSJjri[4U] = ((0xffff03ffU & vlSelf->PSJjri[4U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSc7RB 
                                                        >> 0x2fU)))
                                          ? ((vlSelf->PSJjri[8U] 
                                              << 6U) 
                                             | (vlSelf->PSJjri[8U] 
                                                >> 0x1aU))
                                          : vlSelf->PSJjri[9U]) 
                                        << 0xaU)));
    vlSelf->PSJjri[4U] = ((0xffc0ffffU & vlSelf->PSJjri[4U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSc7RB 
                                                          >> 0x31U)))
                                            ? ((vlSelf->PSJjri[9U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSJjri[9U] 
                                                  >> 6U))
                                            : ((vlSelf->PSJjri[9U] 
                                                << 0x14U) 
                                               | (vlSelf->PSJjri[9U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSJjri[4U] = ((0xf03fffffU & vlSelf->PSJjri[4U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSc7RB 
                                                           >> 0x33U)))
                                             ? ((vlSelf->PSJjri[9U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSJjri[9U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSJjri[9U] 
                                                 << 8U) 
                                                | (vlSelf->PSJjri[9U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSCFTR = (0x3fU & ((1U & (IData)((vlSelf->PSc7RB 
                                      >> 0x35U))) ? 
                       ((vlSelf->PSJjri[0xaU] << 2U) 
                        | (vlSelf->PSJjri[9U] >> 0x1eU))
                        : ((vlSelf->PSJjri[0xaU] << 0x1cU) 
                           | (vlSelf->PSJjri[0xaU] 
                              >> 4U))));
    vlSelf->PSJjri[4U] = ((0xfffffffU & vlSelf->PSJjri[4U]) 
                          | (((1U & (IData)((vlSelf->PSc7RB 
                                             >> 0x35U)))
                               ? ((vlSelf->PSJjri[0xaU] 
                                   << 2U) | (vlSelf->PSJjri[9U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSJjri[0xaU] 
                                   << 0x1cU) | (vlSelf->PSJjri[0xaU] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSJjri[5U] = ((0xfffffffcU & vlSelf->PSJjri[5U]) 
                          | (PSCFTR >> 4U));
    vlSelf->PSJjri[5U] = ((0xffffff03U & vlSelf->PSJjri[5U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSc7RB 
                                                      >> 0x37U)))
                                        ? ((vlSelf->PSJjri[0xaU] 
                                            << 0x16U) 
                                           | (vlSelf->PSJjri[0xaU] 
                                              >> 0xaU))
                                        : ((vlSelf->PSJjri[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSJjri[0xaU] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSJjri[5U] = ((0xffffc0ffU & vlSelf->PSJjri[5U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSc7RB 
                                                        >> 0x39U)))
                                          ? ((vlSelf->PSJjri[0xaU] 
                                              << 0xaU) 
                                             | (vlSelf->PSJjri[0xaU] 
                                                >> 0x16U))
                                          : ((vlSelf->PSJjri[0xbU] 
                                              << 4U) 
                                             | (vlSelf->PSJjri[0xaU] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSJjri[5U] = ((0xfff03fffU & vlSelf->PSJjri[5U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSc7RB 
                                                         >> 0x3bU)))
                                           ? ((vlSelf->PSJjri[0xbU] 
                                               << 0x1eU) 
                                              | (vlSelf->PSJjri[0xbU] 
                                                 >> 2U))
                                           : ((vlSelf->PSJjri[0xbU] 
                                               << 0x18U) 
                                              | (vlSelf->PSJjri[0xbU] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSJjri[5U] = ((0xfc0fffffU & vlSelf->PSJjri[5U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSc7RB 
                                                           >> 0x3dU)))
                                             ? ((vlSelf->PSJjri[0xbU] 
                                                 << 0x12U) 
                                                | (vlSelf->PSJjri[0xbU] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSJjri[0xbU] 
                                                 << 0xcU) 
                                                | (vlSelf->PSJjri[0xbU] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSRl2r[2U] = (IData)((vlSelf->PSBi32 << 
                                  (0x3fU & vlSelf->PSJjri[0U])));
    vlSelf->PSRl2r[3U] = (IData)(((vlSelf->PSBi32 << 
                                   (0x3fU & vlSelf->PSJjri[0U])) 
                                  >> 0x20U));
    PSfjCu = (0xfffU & ((0xcU == (0xfU & (IData)(vlSelf->PSAJri)))
                         ? ((IData)(0x3fU) - (0x3fU 
                                              & vlSelf->PSJjri[0U]))
                         : ((((((0x3bU >= (0x3fU & 
                                           ((IData)(0xcU) 
                                            * (7U & (IData)(vlSelf->PShUBx)))))
                                 ? (IData)((vlSelf->PS83fi 
                                            >> (0x3fU 
                                                & ((IData)(0xcU) 
                                                   * 
                                                   (7U 
                                                    & (IData)(vlSelf->PShUBx))))))
                                 : 0U) + VL_EXTENDS_II(12,2, 
                                                       ((0x27U 
                                                         >= 
                                                         (0x3fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x38U 
                                                              & ((IData)(vlSelf->PShUBx) 
                                                                 << 3U))))) 
                                                        & (IData)(
                                                                  (vlSelf->PS80uE 
                                                                   >> 
                                                                   (0x3fU 
                                                                    & ((IData)(6U) 
                                                                       + 
                                                                       (0x38U 
                                                                        & ((IData)(vlSelf->PShUBx) 
                                                                           << 3U))))))))) 
                              - (IData)(vlSelf->PStsPz)) 
                             - (0x3fU & vlSelf->PSJjri[0U])) 
                            + ((0x3bU >= (0x3fU & ((IData)(0xcU) 
                                                   * 
                                                   (7U 
                                                    & (IData)(vlSelf->PShUBx)))))
                                ? (IData)((vlSelf->PSp5Z4 
                                           >> (0x3fU 
                                               & ((IData)(0xcU) 
                                                  * 
                                                  (7U 
                                                   & (IData)(vlSelf->PShUBx))))))
                                : 0U))));
    vlSelf->PS7vyh = ((0xfffffffffffffffeULL & vlSelf->PS7vyh) 
                      | (IData)((IData)((0ULL != (6ULL 
                                                  & vlSelf->PS7vyh)))));
    vlSelf->PS7vyh = ((0xfffffffffffffffdULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 1U));
    vlSelf->PS7vyh = ((0xfffffffffffffffbULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 2U));
    vlSelf->PS7vyh = ((0xfffffffffffffff7ULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 3U));
    vlSelf->PS7vyh = ((0xffffffffffffffefULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 4U));
    vlSelf->PS7vyh = ((0xffffffffffffffdfULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 5U));
    vlSelf->PS7vyh = ((0xffffffffffffffbfULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 6U));
    vlSelf->PS7vyh = ((0xffffffffffffff7fULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 7U));
    vlSelf->PS7vyh = ((0xfffffffffffffeffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 8U));
    vlSelf->PS7vyh = ((0xfffffffffffffdffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 9U));
    vlSelf->PS7vyh = ((0xfffffffffffffbffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0xaU));
    vlSelf->PS7vyh = ((0xfffffffffffff7ffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0xbU));
    vlSelf->PS7vyh = ((0xffffffffffffefffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0xcU));
    vlSelf->PS7vyh = ((0xffffffffffffdfffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0xdU));
    vlSelf->PS7vyh = ((0xffffffffffffbfffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0xeU));
    vlSelf->PS7vyh = ((0xffffffffffff7fffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0xfU));
    vlSelf->PS7vyh = ((0xfffffffffffeffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x10U));
    vlSelf->PS7vyh = ((0xfffffffffffdffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x11U));
    vlSelf->PS7vyh = ((0xfffffffffffbffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x12U));
    vlSelf->PS7vyh = ((0xfffffffffff7ffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x13U));
    vlSelf->PS7vyh = ((0xffffffffffefffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x14U));
    vlSelf->PS7vyh = ((0xffffffffffdfffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x15U));
    vlSelf->PS7vyh = ((0xffffffffffbfffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x16U));
    vlSelf->PS7vyh = ((0xffffffffff7fffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x17U));
    vlSelf->PS7vyh = ((0xfffffffffeffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x18U));
    vlSelf->PS7vyh = ((0xfffffffffdffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x19U));
    vlSelf->PS7vyh = ((0xfffffffffbffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x1aU));
    vlSelf->PS7vyh = ((0xfffffffff7ffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x1bU));
    vlSelf->PS7vyh = ((0xffffffffefffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x1cU));
    vlSelf->PS7vyh = ((0xffffffffdfffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x1dU));
    vlSelf->PS7vyh = ((0xffffffffbfffffffULL & vlSelf->PS7vyh) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000000ULL 
                                                   & vlSelf->PS7vyh))))) 
                         << 0x1eU));
    vlSelf->PSBwcq = ((1U & (IData)(vlSelf->PSBwcq)) 
                      | (2U & ((~ (IData)(vlSelf->PS7vyh)) 
                               << 1U)));
    vlSelf->PSxCEB[0U] = ((0xffffffc0U & vlSelf->PSxCEB[0U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PS7vyh 
                                                     >> 1U)))
                                       ? ((vlSelf->PSxCEB[0U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSxCEB[0U] 
                                             >> 6U))
                                       : ((vlSelf->PSxCEB[0U] 
                                           << 0x14U) 
                                          | (vlSelf->PSxCEB[0U] 
                                             >> 0xcU)))));
    vlSelf->PSxCEB[0U] = ((0xfffff03fU & vlSelf->PSxCEB[0U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PS7vyh 
                                                       >> 3U)))
                                         ? ((vlSelf->PSxCEB[0U] 
                                             << 0xeU) 
                                            | (vlSelf->PSxCEB[0U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSxCEB[0U] 
                                             << 8U) 
                                            | (vlSelf->PSxCEB[0U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSxCEB[0U] = ((0xfffc0fffU & vlSelf->PSxCEB[0U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PS7vyh 
                                                         >> 5U)))
                                           ? ((vlSelf->PSxCEB[1U] 
                                               << 2U) 
                                              | (vlSelf->PSxCEB[0U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSxCEB[1U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSxCEB[1U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSxCEB[0U] = ((0xff03ffffU & vlSelf->PSxCEB[0U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PS7vyh 
                                                          >> 7U)))
                                            ? ((vlSelf->PSxCEB[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSxCEB[1U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSxCEB[1U] 
                                                << 0x10U) 
                                               | (vlSelf->PSxCEB[1U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSxCEB[0U] = ((0xc0ffffffU & vlSelf->PSxCEB[0U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PS7vyh 
                                                            >> 9U)))
                                              ? ((vlSelf->PSxCEB[1U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSxCEB[1U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSxCEB[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSxCEB[1U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSSSs3 = (0x3fU & ((1U & (IData)((vlSelf->PS7vyh 
                                      >> 0xbU))) ? 
                       ((vlSelf->PSxCEB[2U] << 0x1eU) 
                        | (vlSelf->PSxCEB[2U] >> 2U))
                        : ((vlSelf->PSxCEB[2U] << 0x18U) 
                           | (vlSelf->PSxCEB[2U] >> 8U))));
    vlSelf->PSxCEB[0U] = ((0x3fffffffU & vlSelf->PSxCEB[0U]) 
                          | (((1U & (IData)((vlSelf->PS7vyh 
                                             >> 0xbU)))
                               ? ((vlSelf->PSxCEB[2U] 
                                   << 0x1eU) | (vlSelf->PSxCEB[2U] 
                                                >> 2U))
                               : ((vlSelf->PSxCEB[2U] 
                                   << 0x18U) | (vlSelf->PSxCEB[2U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSxCEB[1U] = ((0xfffffff0U & vlSelf->PSxCEB[1U]) 
                          | (PSSSs3 >> 2U));
    vlSelf->PSxCEB[1U] = ((0xfffffc0fU & vlSelf->PSxCEB[1U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PS7vyh 
                                                       >> 0xdU)))
                                         ? ((vlSelf->PSxCEB[2U] 
                                             << 0x12U) 
                                            | (vlSelf->PSxCEB[2U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSxCEB[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSxCEB[2U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSxCEB[1U] = ((0xffff03ffU & vlSelf->PSxCEB[1U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PS7vyh 
                                                        >> 0xfU)))
                                          ? ((vlSelf->PSxCEB[2U] 
                                              << 6U) 
                                             | (vlSelf->PSxCEB[2U] 
                                                >> 0x1aU))
                                          : vlSelf->PSxCEB[3U]) 
                                        << 0xaU)));
    vlSelf->PSxCEB[1U] = ((0xffc0ffffU & vlSelf->PSxCEB[1U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PS7vyh 
                                                          >> 0x11U)))
                                            ? ((vlSelf->PSxCEB[3U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSxCEB[3U] 
                                                  >> 6U))
                                            : ((vlSelf->PSxCEB[3U] 
                                                << 0x14U) 
                                               | (vlSelf->PSxCEB[3U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSxCEB[1U] = ((0xf03fffffU & vlSelf->PSxCEB[1U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PS7vyh 
                                                           >> 0x13U)))
                                             ? ((vlSelf->PSxCEB[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSxCEB[3U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSxCEB[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSxCEB[3U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSvMGz = (0x3fU & ((1U & (IData)((vlSelf->PS7vyh 
                                      >> 0x15U))) ? 
                       ((vlSelf->PSxCEB[4U] << 2U) 
                        | (vlSelf->PSxCEB[3U] >> 0x1eU))
                        : ((vlSelf->PSxCEB[4U] << 0x1cU) 
                           | (vlSelf->PSxCEB[4U] >> 4U))));
    vlSelf->PSxCEB[1U] = ((0xfffffffU & vlSelf->PSxCEB[1U]) 
                          | (((1U & (IData)((vlSelf->PS7vyh 
                                             >> 0x15U)))
                               ? ((vlSelf->PSxCEB[4U] 
                                   << 2U) | (vlSelf->PSxCEB[3U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSxCEB[4U] 
                                   << 0x1cU) | (vlSelf->PSxCEB[4U] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSxCEB[2U] = ((0xfffffffcU & vlSelf->PSxCEB[2U]) 
                          | (PSvMGz >> 4U));
    vlSelf->PSxCEB[2U] = ((0xffffff03U & vlSelf->PSxCEB[2U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PS7vyh 
                                                      >> 0x17U)))
                                        ? ((vlSelf->PSxCEB[4U] 
                                            << 0x16U) 
                                           | (vlSelf->PSxCEB[4U] 
                                              >> 0xaU))
                                        : ((vlSelf->PSxCEB[4U] 
                                            << 0x10U) 
                                           | (vlSelf->PSxCEB[4U] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSxCEB[2U] = ((0xffffc0ffU & vlSelf->PSxCEB[2U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PS7vyh 
                                                        >> 0x19U)))
                                          ? ((vlSelf->PSxCEB[4U] 
                                              << 0xaU) 
                                             | (vlSelf->PSxCEB[4U] 
                                                >> 0x16U))
                                          : ((vlSelf->PSxCEB[5U] 
                                              << 4U) 
                                             | (vlSelf->PSxCEB[4U] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSxCEB[2U] = ((0xfff03fffU & vlSelf->PSxCEB[2U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PS7vyh 
                                                         >> 0x1bU)))
                                           ? ((vlSelf->PSxCEB[5U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSxCEB[5U] 
                                                 >> 2U))
                                           : ((vlSelf->PSxCEB[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSxCEB[5U] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSxCEB[2U] = ((0xfc0fffffU & vlSelf->PSxCEB[2U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PS7vyh 
                                                           >> 0x1dU)))
                                             ? ((vlSelf->PSxCEB[5U] 
                                                 << 0x12U) 
                                                | (vlSelf->PSxCEB[5U] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSxCEB[5U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSxCEB[5U] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSxCEB[2U] = ((0x3ffffffU & vlSelf->PSxCEB[2U]) 
                          | (((1U & (IData)((vlSelf->PS7vyh 
                                             >> 0x1fU)))
                               ? ((vlSelf->PSxCEB[5U] 
                                   << 6U) | (vlSelf->PSxCEB[5U] 
                                             >> 0x1aU))
                               : vlSelf->PSxCEB[6U]) 
                             << 0x1aU));
    vlSelf->PSxCEB[3U] = ((0xffffffc0U & vlSelf->PSxCEB[3U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PS7vyh 
                                                     >> 0x21U)))
                                       ? ((vlSelf->PSxCEB[6U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSxCEB[6U] 
                                             >> 6U))
                                       : ((vlSelf->PSxCEB[6U] 
                                           << 0x14U) 
                                          | (vlSelf->PSxCEB[6U] 
                                             >> 0xcU)))));
    vlSelf->PSxCEB[3U] = ((0xfffff03fU & vlSelf->PSxCEB[3U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PS7vyh 
                                                       >> 0x23U)))
                                         ? ((vlSelf->PSxCEB[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSxCEB[6U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSxCEB[6U] 
                                             << 8U) 
                                            | (vlSelf->PSxCEB[6U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSxCEB[3U] = ((0xfffc0fffU & vlSelf->PSxCEB[3U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PS7vyh 
                                                         >> 0x25U)))
                                           ? ((vlSelf->PSxCEB[7U] 
                                               << 2U) 
                                              | (vlSelf->PSxCEB[6U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSxCEB[7U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSxCEB[7U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSxCEB[3U] = ((0xff03ffffU & vlSelf->PSxCEB[3U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PS7vyh 
                                                          >> 0x27U)))
                                            ? ((vlSelf->PSxCEB[7U] 
                                                << 0x16U) 
                                               | (vlSelf->PSxCEB[7U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSxCEB[7U] 
                                                << 0x10U) 
                                               | (vlSelf->PSxCEB[7U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSxCEB[3U] = ((0xc0ffffffU & vlSelf->PSxCEB[3U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PS7vyh 
                                                            >> 0x29U)))
                                              ? ((vlSelf->PSxCEB[7U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSxCEB[7U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSxCEB[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSxCEB[7U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSNpjH = (0x3fU & ((1U & (IData)((vlSelf->PS7vyh 
                                      >> 0x2bU))) ? 
                       ((vlSelf->PSxCEB[8U] << 0x1eU) 
                        | (vlSelf->PSxCEB[8U] >> 2U))
                        : ((vlSelf->PSxCEB[8U] << 0x18U) 
                           | (vlSelf->PSxCEB[8U] >> 8U))));
    vlSelf->PSxCEB[3U] = ((0x3fffffffU & vlSelf->PSxCEB[3U]) 
                          | (((1U & (IData)((vlSelf->PS7vyh 
                                             >> 0x2bU)))
                               ? ((vlSelf->PSxCEB[8U] 
                                   << 0x1eU) | (vlSelf->PSxCEB[8U] 
                                                >> 2U))
                               : ((vlSelf->PSxCEB[8U] 
                                   << 0x18U) | (vlSelf->PSxCEB[8U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSxCEB[4U] = ((0xfffffff0U & vlSelf->PSxCEB[4U]) 
                          | (PSNpjH >> 2U));
    vlSelf->PSxCEB[4U] = ((0xfffffc0fU & vlSelf->PSxCEB[4U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PS7vyh 
                                                       >> 0x2dU)))
                                         ? ((vlSelf->PSxCEB[8U] 
                                             << 0x12U) 
                                            | (vlSelf->PSxCEB[8U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSxCEB[8U] 
                                             << 0xcU) 
                                            | (vlSelf->PSxCEB[8U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSxCEB[4U] = ((0xffff03ffU & vlSelf->PSxCEB[4U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PS7vyh 
                                                        >> 0x2fU)))
                                          ? ((vlSelf->PSxCEB[8U] 
                                              << 6U) 
                                             | (vlSelf->PSxCEB[8U] 
                                                >> 0x1aU))
                                          : vlSelf->PSxCEB[9U]) 
                                        << 0xaU)));
    vlSelf->PSxCEB[4U] = ((0xffc0ffffU & vlSelf->PSxCEB[4U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PS7vyh 
                                                          >> 0x31U)))
                                            ? ((vlSelf->PSxCEB[9U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSxCEB[9U] 
                                                  >> 6U))
                                            : ((vlSelf->PSxCEB[9U] 
                                                << 0x14U) 
                                               | (vlSelf->PSxCEB[9U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSxCEB[4U] = ((0xf03fffffU & vlSelf->PSxCEB[4U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PS7vyh 
                                                           >> 0x33U)))
                                             ? ((vlSelf->PSxCEB[9U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSxCEB[9U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSxCEB[9U] 
                                                 << 8U) 
                                                | (vlSelf->PSxCEB[9U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSXg5A = (0x3fU & ((1U & (IData)((vlSelf->PS7vyh 
                                      >> 0x35U))) ? 
                       ((vlSelf->PSxCEB[0xaU] << 2U) 
                        | (vlSelf->PSxCEB[9U] >> 0x1eU))
                        : ((vlSelf->PSxCEB[0xaU] << 0x1cU) 
                           | (vlSelf->PSxCEB[0xaU] 
                              >> 4U))));
    vlSelf->PSxCEB[4U] = ((0xfffffffU & vlSelf->PSxCEB[4U]) 
                          | (((1U & (IData)((vlSelf->PS7vyh 
                                             >> 0x35U)))
                               ? ((vlSelf->PSxCEB[0xaU] 
                                   << 2U) | (vlSelf->PSxCEB[9U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSxCEB[0xaU] 
                                   << 0x1cU) | (vlSelf->PSxCEB[0xaU] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSxCEB[5U] = ((0xfffffffcU & vlSelf->PSxCEB[5U]) 
                          | (PSXg5A >> 4U));
    vlSelf->PSxCEB[5U] = ((0xffffff03U & vlSelf->PSxCEB[5U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PS7vyh 
                                                      >> 0x37U)))
                                        ? ((vlSelf->PSxCEB[0xaU] 
                                            << 0x16U) 
                                           | (vlSelf->PSxCEB[0xaU] 
                                              >> 0xaU))
                                        : ((vlSelf->PSxCEB[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSxCEB[0xaU] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSxCEB[5U] = ((0xffffc0ffU & vlSelf->PSxCEB[5U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PS7vyh 
                                                        >> 0x39U)))
                                          ? ((vlSelf->PSxCEB[0xaU] 
                                              << 0xaU) 
                                             | (vlSelf->PSxCEB[0xaU] 
                                                >> 0x16U))
                                          : ((vlSelf->PSxCEB[0xbU] 
                                              << 4U) 
                                             | (vlSelf->PSxCEB[0xaU] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSxCEB[5U] = ((0xfff03fffU & vlSelf->PSxCEB[5U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PS7vyh 
                                                         >> 0x3bU)))
                                           ? ((vlSelf->PSxCEB[0xbU] 
                                               << 0x1eU) 
                                              | (vlSelf->PSxCEB[0xbU] 
                                                 >> 2U))
                                           : ((vlSelf->PSxCEB[0xbU] 
                                               << 0x18U) 
                                              | (vlSelf->PSxCEB[0xbU] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSxCEB[5U] = ((0xfc0fffffU & vlSelf->PSxCEB[5U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PS7vyh 
                                                           >> 0x3dU)))
                                             ? ((vlSelf->PSxCEB[0xbU] 
                                                 << 0x12U) 
                                                | (vlSelf->PSxCEB[0xbU] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSxCEB[0xbU] 
                                                 << 0xcU) 
                                                | (vlSelf->PSxCEB[0xbU] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PS3B9h[2U] = (IData)((vlSelf->PS4K2t << 
                                  (0x3fU & vlSelf->PSxCEB[0U])));
    vlSelf->PS3B9h[3U] = (IData)(((vlSelf->PS4K2t << 
                                   (0x3fU & vlSelf->PSxCEB[0U])) 
                                  >> 0x20U));
    PSzI7s = (0xfffU & ((0xcU == (0xfU & (IData)(vlSelf->PSv4ze)))
                         ? ((IData)(0x3fU) - (0x3fU 
                                              & vlSelf->PSxCEB[0U]))
                         : ((((((0x3bU >= (0x3fU & 
                                           ((IData)(0xcU) 
                                            * (7U & (IData)(vlSelf->PSsm1t)))))
                                 ? (IData)((vlSelf->PScmXV 
                                            >> (0x3fU 
                                                & ((IData)(0xcU) 
                                                   * 
                                                   (7U 
                                                    & (IData)(vlSelf->PSsm1t))))))
                                 : 0U) + VL_EXTENDS_II(12,2, 
                                                       ((0x27U 
                                                         >= 
                                                         (0x3fU 
                                                          & ((IData)(6U) 
                                                             + 
                                                             (0x38U 
                                                              & ((IData)(vlSelf->PSsm1t) 
                                                                 << 3U))))) 
                                                        & (IData)(
                                                                  (vlSelf->PSDYJt 
                                                                   >> 
                                                                   (0x3fU 
                                                                    & ((IData)(6U) 
                                                                       + 
                                                                       (0x38U 
                                                                        & ((IData)(vlSelf->PSsm1t) 
                                                                           << 3U))))))))) 
                              - (IData)(vlSelf->PSD41g)) 
                             - (0x3fU & vlSelf->PSxCEB[0U])) 
                            + ((0x3bU >= (0x3fU & ((IData)(0xcU) 
                                                   * 
                                                   (7U 
                                                    & (IData)(vlSelf->PSsm1t)))))
                                ? (IData)((vlSelf->PSWkmB 
                                           >> (0x3fU 
                                               & ((IData)(0xcU) 
                                                  * 
                                                  (7U 
                                                   & (IData)(vlSelf->PSsm1t))))))
                                : 0U))));
    vlSelf->PS1ws7 = ((1U & (IData)(vlSelf->PS1ws7)) 
                      | ((((IData)(vlSelf->PS9ZNE) 
                           & ((1U & (IData)((PSkHbf 
                                             >> 0x25U))) 
                              == (IData)(vlSelf->PS0hCH))) 
                          | ((~ (IData)(vlSelf->PS9ZNE)) 
                             & (IData)(vlSelf->PS0hCH))) 
                         << 1U));
    vlSelf->PSSUwc[1U] = ((0x1fU & vlSelf->PSSUwc[1U]) 
                          | ((IData)((0x1fffffffffULL 
                                      & (((IData)(vlSelf->PS9ZNE) 
                                          & (~ (IData)(
                                                       (PSkHbf 
                                                        >> 0x25U))))
                                          ? (- PSkHbf)
                                          : PSkHbf))) 
                             << 5U));
    vlSelf->PSSUwc[2U] = (0x3ffU & (((IData)((0x1fffffffffULL 
                                              & (((IData)(vlSelf->PS9ZNE) 
                                                  & (~ (IData)(
                                                               (PSkHbf 
                                                                >> 0x25U))))
                                                  ? 
                                                 (- PSkHbf)
                                                  : PSkHbf))) 
                                     >> 0x1bU) | ((IData)(
                                                          ((0x1fffffffffULL 
                                                            & (((IData)(vlSelf->PS9ZNE) 
                                                                & (~ (IData)(
                                                                             (PSkHbf 
                                                                              >> 0x25U))))
                                                                ? 
                                                               (- PSkHbf)
                                                                : PSkHbf)) 
                                                           >> 0x20U)) 
                                                  << 5U)));
    vlSelf->PScdb3 = ((1U & (IData)(vlSelf->PScdb3)) 
                      | ((((IData)(vlSelf->PSsvsQ) 
                           & ((1U & (IData)((PSvEon 
                                             >> 0x25U))) 
                              == (IData)(vlSelf->PSxnvP))) 
                          | ((~ (IData)(vlSelf->PSsvsQ)) 
                             & (IData)(vlSelf->PSxnvP))) 
                         << 1U));
    vlSelf->PSFCfp[1U] = ((0x1fU & vlSelf->PSFCfp[1U]) 
                          | ((IData)((0x1fffffffffULL 
                                      & (((IData)(vlSelf->PSsvsQ) 
                                          & (~ (IData)(
                                                       (PSvEon 
                                                        >> 0x25U))))
                                          ? (- PSvEon)
                                          : PSvEon))) 
                             << 5U));
    vlSelf->PSFCfp[2U] = (0x3ffU & (((IData)((0x1fffffffffULL 
                                              & (((IData)(vlSelf->PSsvsQ) 
                                                  & (~ (IData)(
                                                               (PSvEon 
                                                                >> 0x25U))))
                                                  ? 
                                                 (- PSvEon)
                                                  : PSvEon))) 
                                     >> 0x1bU) | ((IData)(
                                                          ((0x1fffffffffULL 
                                                            & (((IData)(vlSelf->PSsvsQ) 
                                                                & (~ (IData)(
                                                                             (PSvEon 
                                                                              >> 0x25U))))
                                                                ? 
                                                               (- PSvEon)
                                                                : PSvEon)) 
                                                           >> 0x20U)) 
                                                  << 5U)));
    vlSelf->PS0OhD = ((1U & (IData)(vlSelf->PS0OhD)) 
                      | ((((IData)(vlSelf->PSiKxU) 
                           & ((1U & (IData)((PS4AGY 
                                             >> 0x25U))) 
                              == (IData)(vlSelf->PS3ITp))) 
                          | ((~ (IData)(vlSelf->PSiKxU)) 
                             & (IData)(vlSelf->PS3ITp))) 
                         << 1U));
    vlSelf->PSGH8p[1U] = ((0x1fU & vlSelf->PSGH8p[1U]) 
                          | ((IData)((0x1fffffffffULL 
                                      & (((IData)(vlSelf->PSiKxU) 
                                          & (~ (IData)(
                                                       (PS4AGY 
                                                        >> 0x25U))))
                                          ? (- PS4AGY)
                                          : PS4AGY))) 
                             << 5U));
    vlSelf->PSGH8p[2U] = (0x3ffU & (((IData)((0x1fffffffffULL 
                                              & (((IData)(vlSelf->PSiKxU) 
                                                  & (~ (IData)(
                                                               (PS4AGY 
                                                                >> 0x25U))))
                                                  ? 
                                                 (- PS4AGY)
                                                  : PS4AGY))) 
                                     >> 0x1bU) | ((IData)(
                                                          ((0x1fffffffffULL 
                                                            & (((IData)(vlSelf->PSiKxU) 
                                                                & (~ (IData)(
                                                                             (PS4AGY 
                                                                              >> 0x25U))))
                                                                ? 
                                                               (- PS4AGY)
                                                                : PS4AGY)) 
                                                           >> 0x20U)) 
                                                  << 5U)));
    PSVaSy = (0x1fU & (vlSelf->PSyCAQ & (- (IData)(
                                                   (1U 
                                                    & (IData)(vlSelf->PS7G14))))));
    PSVaSy = (0x1fU & ((IData)(PSVaSy) | ((vlSelf->PSyCAQ 
                                           >> 5U) & 
                                          (- (IData)(
                                                     (1U 
                                                      & ((IData)(vlSelf->PS7G14) 
                                                         >> 1U)))))));
    PSVaSy = (0x1fU & ((IData)(PSVaSy) | ((vlSelf->PSyCAQ 
                                           >> 0xaU) 
                                          & (- (IData)(
                                                       (1U 
                                                        & ((IData)(vlSelf->PS7G14) 
                                                           >> 2U)))))));
    PSVaSy = (0x1fU & ((IData)(PSVaSy) | ((vlSelf->PSyCAQ 
                                           >> 0xfU) 
                                          & (- (IData)(
                                                       (1U 
                                                        & ((IData)(vlSelf->PS7G14) 
                                                           >> 3U)))))));
    vlSelf->PSihRm = PSVaSy;
    vlSelf->PSDAqQ = ((1U & (IData)(vlSelf->PSDAqQ)) 
                      | ((((IData)(vlSelf->PS1Lxm) 
                           & ((1U & (IData)((PS7moc 
                                             >> 0x25U))) 
                              == (IData)(vlSelf->PSAEDv))) 
                          | ((~ (IData)(vlSelf->PS1Lxm)) 
                             & (IData)(vlSelf->PSAEDv))) 
                         << 1U));
    vlSelf->PSv0cQ[1U] = ((0x1fU & vlSelf->PSv0cQ[1U]) 
                          | ((IData)((0x1fffffffffULL 
                                      & (((IData)(vlSelf->PS1Lxm) 
                                          & (~ (IData)(
                                                       (PS7moc 
                                                        >> 0x25U))))
                                          ? (- PS7moc)
                                          : PS7moc))) 
                             << 5U));
    vlSelf->PSv0cQ[2U] = (0x3ffU & (((IData)((0x1fffffffffULL 
                                              & (((IData)(vlSelf->PS1Lxm) 
                                                  & (~ (IData)(
                                                               (PS7moc 
                                                                >> 0x25U))))
                                                  ? 
                                                 (- PS7moc)
                                                  : PS7moc))) 
                                     >> 0x1bU) | ((IData)(
                                                          ((0x1fffffffffULL 
                                                            & (((IData)(vlSelf->PS1Lxm) 
                                                                & (~ (IData)(
                                                                             (PS7moc 
                                                                              >> 0x25U))))
                                                                ? 
                                                               (- PS7moc)
                                                                : PS7moc)) 
                                                           >> 0x20U)) 
                                                  << 5U)));
    vlSelf->PS0A1B = ((3U & (IData)(vlSelf->PS0A1B)) 
                      | ((((IData)(vlSelf->PSBBbU) 
                           & ((1U & (PSL7wa[5U] >> 3U)) 
                              == (IData)(vlSelf->PSGAtJ))) 
                          | ((~ (IData)(vlSelf->PSBBbU)) 
                             & (IData)(vlSelf->PSGAtJ))) 
                         << 2U));
    VL_NEGATE_W(6, PSPnBq, PSL7wa);
    vlSelf->PS8c4f[0xaU] = ((0x3fU & vlSelf->PS8c4f[0xaU]) 
                            | ((((IData)(vlSelf->PSBBbU) 
                                 & (~ (PSL7wa[5U] >> 3U)))
                                 ? PSPnBq[0U] : PSL7wa[0U]) 
                               << 6U));
    vlSelf->PS8c4f[0xbU] = (((((IData)(vlSelf->PSBBbU) 
                               & (~ (PSL7wa[5U] >> 3U)))
                               ? PSPnBq[0U] : PSL7wa[0U]) 
                             >> 0x1aU) | ((((IData)(vlSelf->PSBBbU) 
                                            & (~ (PSL7wa[5U] 
                                                  >> 3U)))
                                            ? PSPnBq[1U]
                                            : PSL7wa[1U]) 
                                          << 6U));
    vlSelf->PS8c4f[0xcU] = (((((IData)(vlSelf->PSBBbU) 
                               & (~ (PSL7wa[5U] >> 3U)))
                               ? PSPnBq[1U] : PSL7wa[1U]) 
                             >> 0x1aU) | ((((IData)(vlSelf->PSBBbU) 
                                            & (~ (PSL7wa[5U] 
                                                  >> 3U)))
                                            ? PSPnBq[2U]
                                            : PSL7wa[2U]) 
                                          << 6U));
    vlSelf->PS8c4f[0xdU] = (((((IData)(vlSelf->PSBBbU) 
                               & (~ (PSL7wa[5U] >> 3U)))
                               ? PSPnBq[2U] : PSL7wa[2U]) 
                             >> 0x1aU) | ((((IData)(vlSelf->PSBBbU) 
                                            & (~ (PSL7wa[5U] 
                                                  >> 3U)))
                                            ? PSPnBq[3U]
                                            : PSL7wa[3U]) 
                                          << 6U));
    vlSelf->PS8c4f[0xeU] = (((((IData)(vlSelf->PSBBbU) 
                               & (~ (PSL7wa[5U] >> 3U)))
                               ? PSPnBq[3U] : PSL7wa[3U]) 
                             >> 0x1aU) | ((((IData)(vlSelf->PSBBbU) 
                                            & (~ (PSL7wa[5U] 
                                                  >> 3U)))
                                            ? PSPnBq[4U]
                                            : PSL7wa[4U]) 
                                          << 6U));
    vlSelf->PS8c4f[0xfU] = (0x1ffU & (((((IData)(vlSelf->PSBBbU) 
                                         & (~ (PSL7wa[5U] 
                                               >> 3U)))
                                         ? PSPnBq[4U]
                                         : PSL7wa[4U]) 
                                       >> 0x1aU) | 
                                      (0x1c0U & ((((IData)(vlSelf->PSBBbU) 
                                                   & (~ 
                                                      (PSL7wa[5U] 
                                                       >> 3U)))
                                                   ? 
                                                  PSPnBq[5U]
                                                   : 
                                                  PSL7wa[5U]) 
                                                 << 6U))));
    vlSelf->PS3kBH = ((3U & (IData)(vlSelf->PS3kBH)) 
                      | ((((IData)(vlSelf->PSw7Ss) 
                           & ((1U & (PSfsnK[2U] >> 0xcU)) 
                              == (IData)(vlSelf->PSrDrE))) 
                          | ((~ (IData)(vlSelf->PSw7Ss)) 
                             & (IData)(vlSelf->PSrDrE))) 
                         << 2U));
    VL_NEGATE_W(3, PSMmmb, PSfsnK);
    vlSelf->PScTBB[4U] = ((0xffffffU & vlSelf->PScTBB[4U]) 
                          | ((((IData)(vlSelf->PSw7Ss) 
                               & (~ (PSfsnK[2U] >> 0xcU)))
                               ? PSMmmb[0U] : PSfsnK[0U]) 
                             << 0x18U));
    vlSelf->PScTBB[5U] = (((((IData)(vlSelf->PSw7Ss) 
                             & (~ (PSfsnK[2U] >> 0xcU)))
                             ? PSMmmb[0U] : PSfsnK[0U]) 
                           >> 8U) | ((((IData)(vlSelf->PSw7Ss) 
                                       & (~ (PSfsnK[2U] 
                                             >> 0xcU)))
                                       ? PSMmmb[1U]
                                       : PSfsnK[1U]) 
                                     << 0x18U));
    vlSelf->PScTBB[6U] = (((((IData)(vlSelf->PSw7Ss) 
                             & (~ (PSfsnK[2U] >> 0xcU)))
                             ? PSMmmb[1U] : PSfsnK[1U]) 
                           >> 8U) | ((((IData)(vlSelf->PSw7Ss) 
                                       & (~ (PSfsnK[2U] 
                                             >> 0xcU)))
                                       ? PSMmmb[2U]
                                       : PSfsnK[2U]) 
                                     << 0x18U));
    vlSelf->PScTBB[7U] = (0xfU & ((((IData)(vlSelf->PSw7Ss) 
                                    & (~ (PSfsnK[2U] 
                                          >> 0xcU)))
                                    ? PSMmmb[2U] : 
                                   PSfsnK[2U]) >> 8U));
    PSi9lD = (0x1fU & ((IData)(vlSelf->PSlKvW) & (- (IData)(
                                                            (1U 
                                                             & (IData)(vlSelf->PSVKhb))))));
    PSi9lD = (0x1fU & ((IData)(PSi9lD) | (((IData)(vlSelf->PSlKvW) 
                                           >> 5U) & 
                                          (- (IData)(
                                                     (1U 
                                                      & ((IData)(vlSelf->PSVKhb) 
                                                         >> 1U)))))));
    vlSelf->PSBHiA = PSi9lD;
    vlSelf->PSSEOk = ((3U & (IData)(vlSelf->PSSEOk)) 
                      | ((((IData)(vlSelf->PSBxqm) 
                           & ((1U & (PSVis0[2U] >> 0xcU)) 
                              == (IData)(vlSelf->PSBZ5r))) 
                          | ((~ (IData)(vlSelf->PSBxqm)) 
                             & (IData)(vlSelf->PSBZ5r))) 
                         << 2U));
    VL_NEGATE_W(3, PSkYny, PSVis0);
    vlSelf->PSxOdi[4U] = ((0xffffffU & vlSelf->PSxOdi[4U]) 
                          | ((((IData)(vlSelf->PSBxqm) 
                               & (~ (PSVis0[2U] >> 0xcU)))
                               ? PSkYny[0U] : PSVis0[0U]) 
                             << 0x18U));
    vlSelf->PSxOdi[5U] = (((((IData)(vlSelf->PSBxqm) 
                             & (~ (PSVis0[2U] >> 0xcU)))
                             ? PSkYny[0U] : PSVis0[0U]) 
                           >> 8U) | ((((IData)(vlSelf->PSBxqm) 
                                       & (~ (PSVis0[2U] 
                                             >> 0xcU)))
                                       ? PSkYny[1U]
                                       : PSVis0[1U]) 
                                     << 0x18U));
    vlSelf->PSxOdi[6U] = (((((IData)(vlSelf->PSBxqm) 
                             & (~ (PSVis0[2U] >> 0xcU)))
                             ? PSkYny[1U] : PSVis0[1U]) 
                           >> 8U) | ((((IData)(vlSelf->PSBxqm) 
                                       & (~ (PSVis0[2U] 
                                             >> 0xcU)))
                                       ? PSkYny[2U]
                                       : PSVis0[2U]) 
                                     << 0x18U));
    vlSelf->PSxOdi[7U] = (0xfU & ((((IData)(vlSelf->PSBxqm) 
                                    & (~ (PSVis0[2U] 
                                          >> 0xcU)))
                                    ? PSkYny[2U] : 
                                   PSVis0[2U]) >> 8U));
    vlSelf->PSZKPP = ((0x3fU & (IData)(vlSelf->PSZKPP)) 
                      | ((IData)(PS0PvK) << 6U));
    PSCVYe = (7U & (IData)(vlSelf->PSeWzl));
    PSUAAL = (VL_POWSS_III(32,32,32, (IData)(2U), (
                                                   ((0x13fU 
                                                     >= 
                                                     (0x1ffU 
                                                      & ((IData)(0x20U) 
                                                         + 
                                                         (((IData)(4U) 
                                                           - (IData)(PSCVYe)) 
                                                          << 6U))))
                                                     ? 
                                                    (((0U 
                                                       == 
                                                       (0x1fU 
                                                        & ((IData)(0x20U) 
                                                           + 
                                                           (((IData)(4U) 
                                                             - (IData)(PSCVYe)) 
                                                            << 6U))))
                                                       ? 0U
                                                       : 
                                                      (Vlane_e__ConstPool__PS2URe[
                                                       (((IData)(0x1fU) 
                                                         + 
                                                         (0x1ffU 
                                                          & ((IData)(0x20U) 
                                                             + 
                                                             (((IData)(4U) 
                                                               - (IData)(PSCVYe)) 
                                                              << 6U)))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x1fU 
                                                         & ((IData)(0x20U) 
                                                            + 
                                                            (((IData)(4U) 
                                                              - (IData)(PSCVYe)) 
                                                             << 6U)))))) 
                                                     | (Vlane_e__ConstPool__PS2URe[
                                                        (0xfU 
                                                         & (((IData)(0x20U) 
                                                             + 
                                                             (((IData)(4U) 
                                                               - (IData)(PSCVYe)) 
                                                              << 6U)) 
                                                            >> 5U))] 
                                                        >> 
                                                        (0x1fU 
                                                         & ((IData)(0x20U) 
                                                            + 
                                                            (((IData)(4U) 
                                                              - (IData)(PSCVYe)) 
                                                             << 6U)))))
                                                     : 0U) 
                                                   - (IData)(1U)), 1,0) 
              - (IData)(1U));
    PSl6we = (0x3fU & (VL_EXTENDS_II(6,6, (IData)(PS0PvK)) 
                       + PSUAAL));
    vlSelf->PS6DDY = ((0x3fU & (IData)(vlSelf->PS6DDY)) 
                      | ((IData)(PSnACJ) << 6U));
    PSNU2L = (7U & (IData)(vlSelf->PSBFTU));
    PSsbkx = (VL_POWSS_III(32,32,32, (IData)(2U), (
                                                   ((0x13fU 
                                                     >= 
                                                     (0x1ffU 
                                                      & ((IData)(0x20U) 
                                                         + 
                                                         (((IData)(4U) 
                                                           - (IData)(PSNU2L)) 
                                                          << 6U))))
                                                     ? 
                                                    (((0U 
                                                       == 
                                                       (0x1fU 
                                                        & ((IData)(0x20U) 
                                                           + 
                                                           (((IData)(4U) 
                                                             - (IData)(PSNU2L)) 
                                                            << 6U))))
                                                       ? 0U
                                                       : 
                                                      (Vlane_e__ConstPool__PS2URe[
                                                       (((IData)(0x1fU) 
                                                         + 
                                                         (0x1ffU 
                                                          & ((IData)(0x20U) 
                                                             + 
                                                             (((IData)(4U) 
                                                               - (IData)(PSNU2L)) 
                                                              << 6U)))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x1fU 
                                                         & ((IData)(0x20U) 
                                                            + 
                                                            (((IData)(4U) 
                                                              - (IData)(PSNU2L)) 
                                                             << 6U)))))) 
                                                     | (Vlane_e__ConstPool__PS2URe[
                                                        (0xfU 
                                                         & (((IData)(0x20U) 
                                                             + 
                                                             (((IData)(4U) 
                                                               - (IData)(PSNU2L)) 
                                                              << 6U)) 
                                                            >> 5U))] 
                                                        >> 
                                                        (0x1fU 
                                                         & ((IData)(0x20U) 
                                                            + 
                                                            (((IData)(4U) 
                                                              - (IData)(PSNU2L)) 
                                                             << 6U)))))
                                                     : 0U) 
                                                   - (IData)(1U)), 1,0) 
              - (IData)(1U));
    PSxJEX = (0x3fU & (VL_EXTENDS_II(6,6, (IData)(PSnACJ)) 
                       + PSsbkx));
    vlSelf->PSB51p = ((0xfffU & vlSelf->PSB51p) | ((IData)(PSfjCu) 
                                                   << 0xcU));
    PSr3Gq = (7U & (IData)(vlSelf->PSIBWb));
    PS5sCl = (VL_POWSS_III(32,32,32, (IData)(2U), (
                                                   ((0x13fU 
                                                     >= 
                                                     (0x1ffU 
                                                      & ((IData)(0x20U) 
                                                         + 
                                                         (((IData)(4U) 
                                                           - (IData)(PSr3Gq)) 
                                                          << 6U))))
                                                     ? 
                                                    (((0U 
                                                       == 
                                                       (0x1fU 
                                                        & ((IData)(0x20U) 
                                                           + 
                                                           (((IData)(4U) 
                                                             - (IData)(PSr3Gq)) 
                                                            << 6U))))
                                                       ? 0U
                                                       : 
                                                      (Vlane_e__ConstPool__PS2URe[
                                                       (((IData)(0x1fU) 
                                                         + 
                                                         (0x1ffU 
                                                          & ((IData)(0x20U) 
                                                             + 
                                                             (((IData)(4U) 
                                                               - (IData)(PSr3Gq)) 
                                                              << 6U)))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x1fU 
                                                         & ((IData)(0x20U) 
                                                            + 
                                                            (((IData)(4U) 
                                                              - (IData)(PSr3Gq)) 
                                                             << 6U)))))) 
                                                     | (Vlane_e__ConstPool__PS2URe[
                                                        (0xfU 
                                                         & (((IData)(0x20U) 
                                                             + 
                                                             (((IData)(4U) 
                                                               - (IData)(PSr3Gq)) 
                                                              << 6U)) 
                                                            >> 5U))] 
                                                        >> 
                                                        (0x1fU 
                                                         & ((IData)(0x20U) 
                                                            + 
                                                            (((IData)(4U) 
                                                              - (IData)(PSr3Gq)) 
                                                             << 6U)))))
                                                     : 0U) 
                                                   - (IData)(1U)), 1,0) 
              - (IData)(1U));
    PScBCJ = (0xfffU & (VL_EXTENDS_II(12,12, (IData)(PSfjCu)) 
                        + PS5sCl));
    vlSelf->PS8TA9 = ((0xfffU & vlSelf->PS8TA9) | ((IData)(PSzI7s) 
                                                   << 0xcU));
    PS2pso = (7U & (IData)(vlSelf->PSPCxX));
    PSFCIE = (VL_POWSS_III(32,32,32, (IData)(2U), (
                                                   ((0x13fU 
                                                     >= 
                                                     (0x1ffU 
                                                      & ((IData)(0x20U) 
                                                         + 
                                                         (((IData)(4U) 
                                                           - (IData)(PS2pso)) 
                                                          << 6U))))
                                                     ? 
                                                    (((0U 
                                                       == 
                                                       (0x1fU 
                                                        & ((IData)(0x20U) 
                                                           + 
                                                           (((IData)(4U) 
                                                             - (IData)(PS2pso)) 
                                                            << 6U))))
                                                       ? 0U
                                                       : 
                                                      (Vlane_e__ConstPool__PS2URe[
                                                       (((IData)(0x1fU) 
                                                         + 
                                                         (0x1ffU 
                                                          & ((IData)(0x20U) 
                                                             + 
                                                             (((IData)(4U) 
                                                               - (IData)(PS2pso)) 
                                                              << 6U)))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x1fU 
                                                         & ((IData)(0x20U) 
                                                            + 
                                                            (((IData)(4U) 
                                                              - (IData)(PS2pso)) 
                                                             << 6U)))))) 
                                                     | (Vlane_e__ConstPool__PS2URe[
                                                        (0xfU 
                                                         & (((IData)(0x20U) 
                                                             + 
                                                             (((IData)(4U) 
                                                               - (IData)(PS2pso)) 
                                                              << 6U)) 
                                                            >> 5U))] 
                                                        >> 
                                                        (0x1fU 
                                                         & ((IData)(0x20U) 
                                                            + 
                                                            (((IData)(4U) 
                                                              - (IData)(PS2pso)) 
                                                             << 6U)))))
                                                     : 0U) 
                                                   - (IData)(1U)), 1,0) 
              - (IData)(1U));
    PSmCG4 = (0xfffU & (VL_EXTENDS_II(12,12, (IData)(PSzI7s)) 
                        + PSFCIE));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x18U));
    vlSelf->PSpsaa = ((0x1fffffeU & vlSelf->PSpsaa) 
                      | (IData)(PSTCII));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x17U));
    vlSelf->PSpsaa = ((0x1fffffdU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 1U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x16U));
    vlSelf->PSpsaa = ((0x1fffffbU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 2U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x15U));
    vlSelf->PSpsaa = ((0x1fffff7U & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 3U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x14U));
    vlSelf->PSpsaa = ((0x1ffffefU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 4U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x13U));
    vlSelf->PSpsaa = ((0x1ffffdfU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 5U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x12U));
    vlSelf->PSpsaa = ((0x1ffffbfU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 6U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x11U));
    vlSelf->PSpsaa = ((0x1ffff7fU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 7U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0x10U));
    vlSelf->PSpsaa = ((0x1fffeffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 8U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0xfU));
    vlSelf->PSpsaa = ((0x1fffdffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 9U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0xeU));
    vlSelf->PSpsaa = ((0x1fffbffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0xaU));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0xdU));
    vlSelf->PSpsaa = ((0x1fff7ffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0xbU));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0xcU));
    vlSelf->PSpsaa = ((0x1ffefffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0xcU));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0xbU));
    vlSelf->PSpsaa = ((0x1ffdfffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0xdU));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 0xaU));
    vlSelf->PSpsaa = ((0x1ffbfffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0xeU));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 9U));
    vlSelf->PSpsaa = ((0x1ff7fffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0xfU));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 8U));
    vlSelf->PSpsaa = ((0x1feffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x10U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 7U));
    vlSelf->PSpsaa = ((0x1fdffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x11U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 6U));
    vlSelf->PSpsaa = ((0x1fbffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x12U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 5U));
    vlSelf->PSpsaa = ((0x1f7ffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x13U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 4U));
    vlSelf->PSpsaa = ((0x1efffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x14U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 3U));
    vlSelf->PSpsaa = ((0x1dfffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x15U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 2U));
    vlSelf->PSpsaa = ((0x1bfffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x16U));
    PSTCII = (1U & (vlSelf->PSSUwc[0U] >> 1U));
    vlSelf->PSpsaa = ((0x17fffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x17U));
    PSTCII = (1U & vlSelf->PSSUwc[0U]);
    vlSelf->PSpsaa = ((0xffffffU & vlSelf->PSpsaa) 
                      | ((IData)(PSTCII) << 0x18U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x18U));
    vlSelf->PSIrLs = ((0x1fffffeU & vlSelf->PSIrLs) 
                      | (IData)(PSHAhn));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x17U));
    vlSelf->PSIrLs = ((0x1fffffdU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 1U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x16U));
    vlSelf->PSIrLs = ((0x1fffffbU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 2U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x15U));
    vlSelf->PSIrLs = ((0x1fffff7U & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 3U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x14U));
    vlSelf->PSIrLs = ((0x1ffffefU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 4U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x13U));
    vlSelf->PSIrLs = ((0x1ffffdfU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 5U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x12U));
    vlSelf->PSIrLs = ((0x1ffffbfU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 6U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x11U));
    vlSelf->PSIrLs = ((0x1ffff7fU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 7U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0x10U));
    vlSelf->PSIrLs = ((0x1fffeffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 8U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0xfU));
    vlSelf->PSIrLs = ((0x1fffdffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 9U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0xeU));
    vlSelf->PSIrLs = ((0x1fffbffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0xaU));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0xdU));
    vlSelf->PSIrLs = ((0x1fff7ffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0xbU));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0xcU));
    vlSelf->PSIrLs = ((0x1ffefffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0xcU));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0xbU));
    vlSelf->PSIrLs = ((0x1ffdfffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0xdU));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 0xaU));
    vlSelf->PSIrLs = ((0x1ffbfffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0xeU));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 9U));
    vlSelf->PSIrLs = ((0x1ff7fffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0xfU));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 8U));
    vlSelf->PSIrLs = ((0x1feffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x10U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 7U));
    vlSelf->PSIrLs = ((0x1fdffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x11U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 6U));
    vlSelf->PSIrLs = ((0x1fbffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x12U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 5U));
    vlSelf->PSIrLs = ((0x1f7ffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x13U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 4U));
    vlSelf->PSIrLs = ((0x1efffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x14U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 3U));
    vlSelf->PSIrLs = ((0x1dfffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x15U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 2U));
    vlSelf->PSIrLs = ((0x1bfffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x16U));
    PSHAhn = (1U & (vlSelf->PSFCfp[0U] >> 1U));
    vlSelf->PSIrLs = ((0x17fffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x17U));
    PSHAhn = (1U & vlSelf->PSFCfp[0U]);
    vlSelf->PSIrLs = ((0xffffffU & vlSelf->PSIrLs) 
                      | ((IData)(PSHAhn) << 0x18U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x18U));
    vlSelf->PSvddN = ((0x1fffffeU & vlSelf->PSvddN) 
                      | (IData)(PSzmao));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x17U));
    vlSelf->PSvddN = ((0x1fffffdU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 1U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x16U));
    vlSelf->PSvddN = ((0x1fffffbU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 2U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x15U));
    vlSelf->PSvddN = ((0x1fffff7U & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 3U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x14U));
    vlSelf->PSvddN = ((0x1ffffefU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 4U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x13U));
    vlSelf->PSvddN = ((0x1ffffdfU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 5U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x12U));
    vlSelf->PSvddN = ((0x1ffffbfU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 6U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x11U));
    vlSelf->PSvddN = ((0x1ffff7fU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 7U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0x10U));
    vlSelf->PSvddN = ((0x1fffeffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 8U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0xfU));
    vlSelf->PSvddN = ((0x1fffdffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 9U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0xeU));
    vlSelf->PSvddN = ((0x1fffbffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0xaU));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0xdU));
    vlSelf->PSvddN = ((0x1fff7ffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0xbU));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0xcU));
    vlSelf->PSvddN = ((0x1ffefffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0xcU));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0xbU));
    vlSelf->PSvddN = ((0x1ffdfffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0xdU));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 0xaU));
    vlSelf->PSvddN = ((0x1ffbfffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0xeU));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 9U));
    vlSelf->PSvddN = ((0x1ff7fffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0xfU));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 8U));
    vlSelf->PSvddN = ((0x1feffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x10U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 7U));
    vlSelf->PSvddN = ((0x1fdffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x11U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 6U));
    vlSelf->PSvddN = ((0x1fbffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x12U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 5U));
    vlSelf->PSvddN = ((0x1f7ffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x13U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 4U));
    vlSelf->PSvddN = ((0x1efffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x14U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 3U));
    vlSelf->PSvddN = ((0x1dfffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x15U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 2U));
    vlSelf->PSvddN = ((0x1bfffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x16U));
    PSzmao = (1U & (vlSelf->PSGH8p[0U] >> 1U));
    vlSelf->PSvddN = ((0x17fffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x17U));
    PSzmao = (1U & vlSelf->PSGH8p[0U]);
    vlSelf->PSvddN = ((0xffffffU & vlSelf->PSvddN) 
                      | ((IData)(PSzmao) << 0x18U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x18U));
    vlSelf->PSZfAY = ((0x1fffffeU & vlSelf->PSZfAY) 
                      | (IData)(PSX226));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x17U));
    vlSelf->PSZfAY = ((0x1fffffdU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 1U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x16U));
    vlSelf->PSZfAY = ((0x1fffffbU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 2U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x15U));
    vlSelf->PSZfAY = ((0x1fffff7U & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 3U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x14U));
    vlSelf->PSZfAY = ((0x1ffffefU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 4U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x13U));
    vlSelf->PSZfAY = ((0x1ffffdfU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 5U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x12U));
    vlSelf->PSZfAY = ((0x1ffffbfU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 6U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x11U));
    vlSelf->PSZfAY = ((0x1ffff7fU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 7U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0x10U));
    vlSelf->PSZfAY = ((0x1fffeffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 8U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0xfU));
    vlSelf->PSZfAY = ((0x1fffdffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 9U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0xeU));
    vlSelf->PSZfAY = ((0x1fffbffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0xaU));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0xdU));
    vlSelf->PSZfAY = ((0x1fff7ffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0xbU));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0xcU));
    vlSelf->PSZfAY = ((0x1ffefffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0xcU));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0xbU));
    vlSelf->PSZfAY = ((0x1ffdfffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0xdU));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 0xaU));
    vlSelf->PSZfAY = ((0x1ffbfffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0xeU));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 9U));
    vlSelf->PSZfAY = ((0x1ff7fffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0xfU));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 8U));
    vlSelf->PSZfAY = ((0x1feffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x10U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 7U));
    vlSelf->PSZfAY = ((0x1fdffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x11U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 6U));
    vlSelf->PSZfAY = ((0x1fbffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x12U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 5U));
    vlSelf->PSZfAY = ((0x1f7ffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x13U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 4U));
    vlSelf->PSZfAY = ((0x1efffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x14U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 3U));
    vlSelf->PSZfAY = ((0x1dfffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x15U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 2U));
    vlSelf->PSZfAY = ((0x1bfffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x16U));
    PSX226 = (1U & (vlSelf->PSv0cQ[0U] >> 1U));
    vlSelf->PSZfAY = ((0x17fffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x17U));
    PSX226 = (1U & vlSelf->PSv0cQ[0U]);
    vlSelf->PSZfAY = ((0xffffffU & vlSelf->PSZfAY) 
                      | ((IData)(PSX226) << 0x18U));
    PSsBz8 = 0U;
    while ((0x6dU > PSsBz8)) {
        vlSelf->PScLn1 = ((0x6cU >= (0x7fU & ((IData)(0x6cU) 
                                              - PSsBz8))) 
                          & (vlSelf->PS8c4f[(3U & (
                                                   ((IData)(0x6cU) 
                                                    - PSsBz8) 
                                                   >> 5U))] 
                             >> (0x1fU & ((IData)(0x6cU) 
                                          - PSsBz8))));
        if (VL_LIKELY((0x6cU >= (0x7fU & PSsBz8)))) {
            vlSelf->PSW4d1[(3U & (PSsBz8 >> 5U))] = 
                (((~ ((IData)(1U) << (0x1fU & PSsBz8))) 
                  & vlSelf->PSW4d1[(3U & (PSsBz8 >> 5U))]) 
                 | ((IData)(vlSelf->PScLn1) << (0x1fU 
                                                & PSsBz8)));
        }
        PSsBz8 = ((IData)(1U) + PSsBz8);
    }
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0x12U));
    vlSelf->PSoZuM = ((0x7fffffffffffeULL & vlSelf->PSoZuM) 
                      | (IData)((IData)(PShQDJ)));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0x11U));
    vlSelf->PSoZuM = ((0x7fffffffffffdULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 1U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0x10U));
    vlSelf->PSoZuM = ((0x7fffffffffffbULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 2U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0xfU));
    vlSelf->PSoZuM = ((0x7fffffffffff7ULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 3U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0xeU));
    vlSelf->PSoZuM = ((0x7ffffffffffefULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 4U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0xdU));
    vlSelf->PSoZuM = ((0x7ffffffffffdfULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 5U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0xcU));
    vlSelf->PSoZuM = ((0x7ffffffffffbfULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 6U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0xbU));
    vlSelf->PSoZuM = ((0x7ffffffffff7fULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 7U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 0xaU));
    vlSelf->PSoZuM = ((0x7fffffffffeffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 8U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 9U));
    vlSelf->PSoZuM = ((0x7fffffffffdffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 9U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 8U));
    vlSelf->PSoZuM = ((0x7fffffffffbffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0xaU));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 7U));
    vlSelf->PSoZuM = ((0x7fffffffff7ffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0xbU));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 6U));
    vlSelf->PSoZuM = ((0x7ffffffffefffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0xcU));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 5U));
    vlSelf->PSoZuM = ((0x7ffffffffdfffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0xdU));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 4U));
    vlSelf->PSoZuM = ((0x7ffffffffbfffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0xeU));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 3U));
    vlSelf->PSoZuM = ((0x7ffffffff7fffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0xfU));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 2U));
    vlSelf->PSoZuM = ((0x7fffffffeffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x10U));
    PShQDJ = (1U & (vlSelf->PScTBB[1U] >> 1U));
    vlSelf->PSoZuM = ((0x7fffffffdffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x11U));
    PShQDJ = (1U & vlSelf->PScTBB[1U]);
    vlSelf->PSoZuM = ((0x7fffffffbffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x12U));
    PShQDJ = (vlSelf->PScTBB[0U] >> 0x1fU);
    vlSelf->PSoZuM = ((0x7fffffff7ffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x13U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x1eU));
    vlSelf->PSoZuM = ((0x7ffffffefffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x14U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x1dU));
    vlSelf->PSoZuM = ((0x7ffffffdfffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x15U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x1cU));
    vlSelf->PSoZuM = ((0x7ffffffbfffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x16U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x1bU));
    vlSelf->PSoZuM = ((0x7ffffff7fffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x17U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x1aU));
    vlSelf->PSoZuM = ((0x7fffffeffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x18U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x19U));
    vlSelf->PSoZuM = ((0x7fffffdffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x19U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x18U));
    vlSelf->PSoZuM = ((0x7fffffbffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x1aU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x17U));
    vlSelf->PSoZuM = ((0x7fffff7ffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x1bU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x16U));
    vlSelf->PSoZuM = ((0x7ffffefffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x1cU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x15U));
    vlSelf->PSoZuM = ((0x7ffffdfffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x1dU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x14U));
    vlSelf->PSoZuM = ((0x7ffffbfffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x1eU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x13U));
    vlSelf->PSoZuM = ((0x7ffff7fffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x1fU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x12U));
    vlSelf->PSoZuM = ((0x7fffeffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x20U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x11U));
    vlSelf->PSoZuM = ((0x7fffdffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x21U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0x10U));
    vlSelf->PSoZuM = ((0x7fffbffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x22U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0xfU));
    vlSelf->PSoZuM = ((0x7fff7ffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x23U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0xeU));
    vlSelf->PSoZuM = ((0x7ffefffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x24U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0xdU));
    vlSelf->PSoZuM = ((0x7ffdfffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x25U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0xcU));
    vlSelf->PSoZuM = ((0x7ffbfffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x26U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0xbU));
    vlSelf->PSoZuM = ((0x7ff7fffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x27U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 0xaU));
    vlSelf->PSoZuM = ((0x7feffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x28U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 9U));
    vlSelf->PSoZuM = ((0x7fdffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x29U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 8U));
    vlSelf->PSoZuM = ((0x7fbffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x2aU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 7U));
    vlSelf->PSoZuM = ((0x7f7ffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x2bU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 6U));
    vlSelf->PSoZuM = ((0x7efffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x2cU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 5U));
    vlSelf->PSoZuM = ((0x7dfffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x2dU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 4U));
    vlSelf->PSoZuM = ((0x7bfffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x2eU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 3U));
    vlSelf->PSoZuM = ((0x77fffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x2fU));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 2U));
    vlSelf->PSoZuM = ((0x6ffffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x30U));
    PShQDJ = (1U & (vlSelf->PScTBB[0U] >> 1U));
    vlSelf->PSoZuM = ((0x5ffffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x31U));
    PShQDJ = (1U & vlSelf->PScTBB[0U]);
    vlSelf->PSoZuM = ((0x3ffffffffffffULL & vlSelf->PSoZuM) 
                      | ((QData)((IData)(PShQDJ)) << 0x32U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0x12U));
    vlSelf->PSSFpT = ((0x7fffffffffffeULL & vlSelf->PSSFpT) 
                      | (IData)((IData)(PSccYI)));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0x11U));
    vlSelf->PSSFpT = ((0x7fffffffffffdULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 1U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0x10U));
    vlSelf->PSSFpT = ((0x7fffffffffffbULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 2U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0xfU));
    vlSelf->PSSFpT = ((0x7fffffffffff7ULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 3U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0xeU));
    vlSelf->PSSFpT = ((0x7ffffffffffefULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 4U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0xdU));
    vlSelf->PSSFpT = ((0x7ffffffffffdfULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 5U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0xcU));
    vlSelf->PSSFpT = ((0x7ffffffffffbfULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 6U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0xbU));
    vlSelf->PSSFpT = ((0x7ffffffffff7fULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 7U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 0xaU));
    vlSelf->PSSFpT = ((0x7fffffffffeffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 8U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 9U));
    vlSelf->PSSFpT = ((0x7fffffffffdffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 9U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 8U));
    vlSelf->PSSFpT = ((0x7fffffffffbffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0xaU));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 7U));
    vlSelf->PSSFpT = ((0x7fffffffff7ffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0xbU));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 6U));
    vlSelf->PSSFpT = ((0x7ffffffffefffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0xcU));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 5U));
    vlSelf->PSSFpT = ((0x7ffffffffdfffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0xdU));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 4U));
    vlSelf->PSSFpT = ((0x7ffffffffbfffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0xeU));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 3U));
    vlSelf->PSSFpT = ((0x7ffffffff7fffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0xfU));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 2U));
    vlSelf->PSSFpT = ((0x7fffffffeffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x10U));
    PSccYI = (1U & (vlSelf->PSxOdi[1U] >> 1U));
    vlSelf->PSSFpT = ((0x7fffffffdffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x11U));
    PSccYI = (1U & vlSelf->PSxOdi[1U]);
    vlSelf->PSSFpT = ((0x7fffffffbffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x12U));
    PSccYI = (vlSelf->PSxOdi[0U] >> 0x1fU);
    vlSelf->PSSFpT = ((0x7fffffff7ffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x13U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x1eU));
    vlSelf->PSSFpT = ((0x7ffffffefffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x14U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x1dU));
    vlSelf->PSSFpT = ((0x7ffffffdfffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x15U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x1cU));
    vlSelf->PSSFpT = ((0x7ffffffbfffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x16U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x1bU));
    vlSelf->PSSFpT = ((0x7ffffff7fffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x17U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x1aU));
    vlSelf->PSSFpT = ((0x7fffffeffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x18U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x19U));
    vlSelf->PSSFpT = ((0x7fffffdffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x19U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x18U));
    vlSelf->PSSFpT = ((0x7fffffbffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x1aU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x17U));
    vlSelf->PSSFpT = ((0x7fffff7ffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x1bU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x16U));
    vlSelf->PSSFpT = ((0x7ffffefffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x1cU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x15U));
    vlSelf->PSSFpT = ((0x7ffffdfffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x1dU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x14U));
    vlSelf->PSSFpT = ((0x7ffffbfffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x1eU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x13U));
    vlSelf->PSSFpT = ((0x7ffff7fffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x1fU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x12U));
    vlSelf->PSSFpT = ((0x7fffeffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x20U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x11U));
    vlSelf->PSSFpT = ((0x7fffdffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x21U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0x10U));
    vlSelf->PSSFpT = ((0x7fffbffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x22U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0xfU));
    vlSelf->PSSFpT = ((0x7fff7ffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x23U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0xeU));
    vlSelf->PSSFpT = ((0x7ffefffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x24U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0xdU));
    vlSelf->PSSFpT = ((0x7ffdfffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x25U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0xcU));
    vlSelf->PSSFpT = ((0x7ffbfffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x26U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0xbU));
    vlSelf->PSSFpT = ((0x7ff7fffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x27U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 0xaU));
    vlSelf->PSSFpT = ((0x7feffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x28U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 9U));
    vlSelf->PSSFpT = ((0x7fdffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x29U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 8U));
    vlSelf->PSSFpT = ((0x7fbffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x2aU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 7U));
    vlSelf->PSSFpT = ((0x7f7ffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x2bU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 6U));
    vlSelf->PSSFpT = ((0x7efffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x2cU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 5U));
    vlSelf->PSSFpT = ((0x7dfffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x2dU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 4U));
    vlSelf->PSSFpT = ((0x7bfffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x2eU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 3U));
    vlSelf->PSSFpT = ((0x77fffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x2fU));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 2U));
    vlSelf->PSSFpT = ((0x6ffffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x30U));
    PSccYI = (1U & (vlSelf->PSxOdi[0U] >> 1U));
    vlSelf->PSSFpT = ((0x5ffffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x31U));
    PSccYI = (1U & vlSelf->PSxOdi[0U]);
    vlSelf->PSSFpT = ((0x3ffffffffffffULL & vlSelf->PSSFpT) 
                      | ((QData)((IData)(PSccYI)) << 0x32U));
    vlSelf->PSCfiX = ((0x3fU & (IData)(vlSelf->PSCfiX)) 
                      | ((IData)(PSl6we) << 6U));
    vlSelf->PSGFJO = ((0x3fU & (IData)(vlSelf->PSGFJO)) 
                      | ((IData)(PSxJEX) << 6U));
    vlSelf->PSnLiF = ((0xfffU & vlSelf->PSnLiF) | ((IData)(PScBCJ) 
                                                   << 0xcU));
    vlSelf->PSwOG6 = ((0xfffU & vlSelf->PSwOG6) | ((IData)(PSmCG4) 
                                                   << 0xcU));
    vlSelf->PSI7t6[2U] = ((0xffe007ffU & vlSelf->PSI7t6[2U]) 
                          | (0xfffff800U & ((((4U & vlSelf->PSpsaa)
                                               ? 2U
                                               : 3U) 
                                             << 0x10U) 
                                            | (((1U 
                                                 & vlSelf->PSpsaa)
                                                 ? 0U
                                                 : 1U) 
                                               << 0xbU))));
    vlSelf->PSI7t6[2U] = ((0x801fffffU & vlSelf->PSI7t6[2U]) 
                          | (0xffe00000U & ((((0x40U 
                                               & vlSelf->PSpsaa)
                                               ? 6U
                                               : 7U) 
                                             << 0x1aU) 
                                            | (((0x10U 
                                                 & vlSelf->PSpsaa)
                                                 ? 4U
                                                 : 5U) 
                                               << 0x15U))));
    vlSelf->PSI7t6[2U] = ((0x7fffffffU & vlSelf->PSI7t6[2U]) 
                          | (((0x100U & vlSelf->PSpsaa)
                               ? 8U : 9U) << 0x1fU));
    vlSelf->PSI7t6[3U] = ((0xfffffe00U & vlSelf->PSI7t6[3U]) 
                          | (0x7fffffffU & ((0x7ffffff0U 
                                             & (((0x400U 
                                                  & vlSelf->PSpsaa)
                                                  ? 0xaU
                                                  : 0xbU) 
                                                << 4U)) 
                                            | (((0x100U 
                                                 & vlSelf->PSpsaa)
                                                 ? 8U
                                                 : 9U) 
                                               >> 1U))));
    vlSelf->PSI7t6[3U] = ((0xfff801ffU & vlSelf->PSI7t6[3U]) 
                          | (0xfffffe00U & ((((0x4000U 
                                               & vlSelf->PSpsaa)
                                               ? 0xeU
                                               : 0xfU) 
                                             << 0xeU) 
                                            | (((0x1000U 
                                                 & vlSelf->PSpsaa)
                                                 ? 0xcU
                                                 : 0xdU) 
                                               << 9U))));
    vlSelf->PSI7t6[3U] = ((0xe007ffffU & vlSelf->PSI7t6[3U]) 
                          | (0xfff80000U & ((((0x40000U 
                                               & vlSelf->PSpsaa)
                                               ? 0x12U
                                               : 0x13U) 
                                             << 0x18U) 
                                            | (((0x10000U 
                                                 & vlSelf->PSpsaa)
                                                 ? 0x10U
                                                 : 0x11U) 
                                               << 0x13U))));
    vlSelf->PSI7t6[3U] = ((0x1fffffffU & vlSelf->PSI7t6[3U]) 
                          | (((0x100000U & vlSelf->PSpsaa)
                               ? 0x14U : 0x15U) << 0x1dU));
    vlSelf->PSI7t6[4U] = ((0xffffff80U & vlSelf->PSI7t6[4U]) 
                          | (0x1fffffffU & ((0x1ffffffcU 
                                             & (((0x400000U 
                                                  & vlSelf->PSpsaa)
                                                  ? 0x16U
                                                  : 0x17U) 
                                                << 2U)) 
                                            | (((0x100000U 
                                                 & vlSelf->PSpsaa)
                                                 ? 0x14U
                                                 : 0x15U) 
                                               >> 3U))));
    vlSelf->PSIR05 = ((0xfffe7fffU & vlSelf->PSIR05) 
                      | (((IData)((0U != (0xcU & vlSelf->PSpsaa))) 
                          << 0x10U) | ((IData)((0U 
                                                != 
                                                (3U 
                                                 & vlSelf->PSpsaa))) 
                                       << 0xfU)));
    vlSelf->PSIR05 = ((0xfff9ffffU & vlSelf->PSIR05) 
                      | (((IData)((0U != (0xc0U & vlSelf->PSpsaa))) 
                          << 0x12U) | ((IData)((0U 
                                                != 
                                                (0x30U 
                                                 & vlSelf->PSpsaa))) 
                                       << 0x11U)));
    vlSelf->PSIR05 = ((0xffe7ffffU & vlSelf->PSIR05) 
                      | (((IData)((0U != (0xc00U & vlSelf->PSpsaa))) 
                          << 0x14U) | ((IData)((0U 
                                                != 
                                                (0x300U 
                                                 & vlSelf->PSpsaa))) 
                                       << 0x13U)));
    vlSelf->PSIR05 = ((0xff9fffffU & vlSelf->PSIR05) 
                      | (((IData)((0U != (0xc000U & vlSelf->PSpsaa))) 
                          << 0x16U) | ((IData)((0U 
                                                != 
                                                (0x3000U 
                                                 & vlSelf->PSpsaa))) 
                                       << 0x15U)));
    vlSelf->PSIR05 = ((0xfe7fffffU & vlSelf->PSIR05) 
                      | (((IData)((0U != (0xc0000U 
                                          & vlSelf->PSpsaa))) 
                          << 0x18U) | ((IData)((0U 
                                                != 
                                                (0x30000U 
                                                 & vlSelf->PSpsaa))) 
                                       << 0x17U)));
    vlSelf->PSIR05 = ((0xf9ffffffU & vlSelf->PSIR05) 
                      | (((IData)((0U != (0xc00000U 
                                          & vlSelf->PSpsaa))) 
                          << 0x1aU) | ((IData)((0U 
                                                != 
                                                (0x300000U 
                                                 & vlSelf->PSpsaa))) 
                                       << 0x19U)));
    vlSelf->PSIR05 = ((0xf7ffffffU & vlSelf->PSIR05) 
                      | (0x8000000U & (vlSelf->PSpsaa 
                                       << 3U)));
    vlSelf->PS4e1r[2U] = ((0xffe007ffU & vlSelf->PS4e1r[2U]) 
                          | (0xfffff800U & ((((4U & vlSelf->PSIrLs)
                                               ? 2U
                                               : 3U) 
                                             << 0x10U) 
                                            | (((1U 
                                                 & vlSelf->PSIrLs)
                                                 ? 0U
                                                 : 1U) 
                                               << 0xbU))));
    vlSelf->PS4e1r[2U] = ((0x801fffffU & vlSelf->PS4e1r[2U]) 
                          | (0xffe00000U & ((((0x40U 
                                               & vlSelf->PSIrLs)
                                               ? 6U
                                               : 7U) 
                                             << 0x1aU) 
                                            | (((0x10U 
                                                 & vlSelf->PSIrLs)
                                                 ? 4U
                                                 : 5U) 
                                               << 0x15U))));
    vlSelf->PS4e1r[2U] = ((0x7fffffffU & vlSelf->PS4e1r[2U]) 
                          | (((0x100U & vlSelf->PSIrLs)
                               ? 8U : 9U) << 0x1fU));
    vlSelf->PS4e1r[3U] = ((0xfffffe00U & vlSelf->PS4e1r[3U]) 
                          | (0x7fffffffU & ((0x7ffffff0U 
                                             & (((0x400U 
                                                  & vlSelf->PSIrLs)
                                                  ? 0xaU
                                                  : 0xbU) 
                                                << 4U)) 
                                            | (((0x100U 
                                                 & vlSelf->PSIrLs)
                                                 ? 8U
                                                 : 9U) 
                                               >> 1U))));
    vlSelf->PS4e1r[3U] = ((0xfff801ffU & vlSelf->PS4e1r[3U]) 
                          | (0xfffffe00U & ((((0x4000U 
                                               & vlSelf->PSIrLs)
                                               ? 0xeU
                                               : 0xfU) 
                                             << 0xeU) 
                                            | (((0x1000U 
                                                 & vlSelf->PSIrLs)
                                                 ? 0xcU
                                                 : 0xdU) 
                                               << 9U))));
    vlSelf->PS4e1r[3U] = ((0xe007ffffU & vlSelf->PS4e1r[3U]) 
                          | (0xfff80000U & ((((0x40000U 
                                               & vlSelf->PSIrLs)
                                               ? 0x12U
                                               : 0x13U) 
                                             << 0x18U) 
                                            | (((0x10000U 
                                                 & vlSelf->PSIrLs)
                                                 ? 0x10U
                                                 : 0x11U) 
                                               << 0x13U))));
    vlSelf->PS4e1r[3U] = ((0x1fffffffU & vlSelf->PS4e1r[3U]) 
                          | (((0x100000U & vlSelf->PSIrLs)
                               ? 0x14U : 0x15U) << 0x1dU));
    vlSelf->PS4e1r[4U] = ((0xffffff80U & vlSelf->PS4e1r[4U]) 
                          | (0x1fffffffU & ((0x1ffffffcU 
                                             & (((0x400000U 
                                                  & vlSelf->PSIrLs)
                                                  ? 0x16U
                                                  : 0x17U) 
                                                << 2U)) 
                                            | (((0x100000U 
                                                 & vlSelf->PSIrLs)
                                                 ? 0x14U
                                                 : 0x15U) 
                                               >> 3U))));
    vlSelf->PSHHWZ = ((0xfffe7fffU & vlSelf->PSHHWZ) 
                      | (((IData)((0U != (0xcU & vlSelf->PSIrLs))) 
                          << 0x10U) | ((IData)((0U 
                                                != 
                                                (3U 
                                                 & vlSelf->PSIrLs))) 
                                       << 0xfU)));
    vlSelf->PSHHWZ = ((0xfff9ffffU & vlSelf->PSHHWZ) 
                      | (((IData)((0U != (0xc0U & vlSelf->PSIrLs))) 
                          << 0x12U) | ((IData)((0U 
                                                != 
                                                (0x30U 
                                                 & vlSelf->PSIrLs))) 
                                       << 0x11U)));
    vlSelf->PSHHWZ = ((0xffe7ffffU & vlSelf->PSHHWZ) 
                      | (((IData)((0U != (0xc00U & vlSelf->PSIrLs))) 
                          << 0x14U) | ((IData)((0U 
                                                != 
                                                (0x300U 
                                                 & vlSelf->PSIrLs))) 
                                       << 0x13U)));
    vlSelf->PSHHWZ = ((0xff9fffffU & vlSelf->PSHHWZ) 
                      | (((IData)((0U != (0xc000U & vlSelf->PSIrLs))) 
                          << 0x16U) | ((IData)((0U 
                                                != 
                                                (0x3000U 
                                                 & vlSelf->PSIrLs))) 
                                       << 0x15U)));
    vlSelf->PSHHWZ = ((0xfe7fffffU & vlSelf->PSHHWZ) 
                      | (((IData)((0U != (0xc0000U 
                                          & vlSelf->PSIrLs))) 
                          << 0x18U) | ((IData)((0U 
                                                != 
                                                (0x30000U 
                                                 & vlSelf->PSIrLs))) 
                                       << 0x17U)));
    vlSelf->PSHHWZ = ((0xf9ffffffU & vlSelf->PSHHWZ) 
                      | (((IData)((0U != (0xc00000U 
                                          & vlSelf->PSIrLs))) 
                          << 0x1aU) | ((IData)((0U 
                                                != 
                                                (0x300000U 
                                                 & vlSelf->PSIrLs))) 
                                       << 0x19U)));
    vlSelf->PSHHWZ = ((0xf7ffffffU & vlSelf->PSHHWZ) 
                      | (0x8000000U & (vlSelf->PSIrLs 
                                       << 3U)));
    vlSelf->PS6nDG[2U] = ((0xffe007ffU & vlSelf->PS6nDG[2U]) 
                          | (0xfffff800U & ((((4U & vlSelf->PSvddN)
                                               ? 2U
                                               : 3U) 
                                             << 0x10U) 
                                            | (((1U 
                                                 & vlSelf->PSvddN)
                                                 ? 0U
                                                 : 1U) 
                                               << 0xbU))));
    vlSelf->PS6nDG[2U] = ((0x801fffffU & vlSelf->PS6nDG[2U]) 
                          | (0xffe00000U & ((((0x40U 
                                               & vlSelf->PSvddN)
                                               ? 6U
                                               : 7U) 
                                             << 0x1aU) 
                                            | (((0x10U 
                                                 & vlSelf->PSvddN)
                                                 ? 4U
                                                 : 5U) 
                                               << 0x15U))));
    vlSelf->PS6nDG[2U] = ((0x7fffffffU & vlSelf->PS6nDG[2U]) 
                          | (((0x100U & vlSelf->PSvddN)
                               ? 8U : 9U) << 0x1fU));
    vlSelf->PS6nDG[3U] = ((0xfffffe00U & vlSelf->PS6nDG[3U]) 
                          | (0x7fffffffU & ((0x7ffffff0U 
                                             & (((0x400U 
                                                  & vlSelf->PSvddN)
                                                  ? 0xaU
                                                  : 0xbU) 
                                                << 4U)) 
                                            | (((0x100U 
                                                 & vlSelf->PSvddN)
                                                 ? 8U
                                                 : 9U) 
                                               >> 1U))));
    vlSelf->PS6nDG[3U] = ((0xfff801ffU & vlSelf->PS6nDG[3U]) 
                          | (0xfffffe00U & ((((0x4000U 
                                               & vlSelf->PSvddN)
                                               ? 0xeU
                                               : 0xfU) 
                                             << 0xeU) 
                                            | (((0x1000U 
                                                 & vlSelf->PSvddN)
                                                 ? 0xcU
                                                 : 0xdU) 
                                               << 9U))));
    vlSelf->PS6nDG[3U] = ((0xe007ffffU & vlSelf->PS6nDG[3U]) 
                          | (0xfff80000U & ((((0x40000U 
                                               & vlSelf->PSvddN)
                                               ? 0x12U
                                               : 0x13U) 
                                             << 0x18U) 
                                            | (((0x10000U 
                                                 & vlSelf->PSvddN)
                                                 ? 0x10U
                                                 : 0x11U) 
                                               << 0x13U))));
    vlSelf->PS6nDG[3U] = ((0x1fffffffU & vlSelf->PS6nDG[3U]) 
                          | (((0x100000U & vlSelf->PSvddN)
                               ? 0x14U : 0x15U) << 0x1dU));
    vlSelf->PS6nDG[4U] = ((0xffffff80U & vlSelf->PS6nDG[4U]) 
                          | (0x1fffffffU & ((0x1ffffffcU 
                                             & (((0x400000U 
                                                  & vlSelf->PSvddN)
                                                  ? 0x16U
                                                  : 0x17U) 
                                                << 2U)) 
                                            | (((0x100000U 
                                                 & vlSelf->PSvddN)
                                                 ? 0x14U
                                                 : 0x15U) 
                                               >> 3U))));
    vlSelf->PSPOYH = ((0xfffe7fffU & vlSelf->PSPOYH) 
                      | (((IData)((0U != (0xcU & vlSelf->PSvddN))) 
                          << 0x10U) | ((IData)((0U 
                                                != 
                                                (3U 
                                                 & vlSelf->PSvddN))) 
                                       << 0xfU)));
    vlSelf->PSPOYH = ((0xfff9ffffU & vlSelf->PSPOYH) 
                      | (((IData)((0U != (0xc0U & vlSelf->PSvddN))) 
                          << 0x12U) | ((IData)((0U 
                                                != 
                                                (0x30U 
                                                 & vlSelf->PSvddN))) 
                                       << 0x11U)));
    vlSelf->PSPOYH = ((0xffe7ffffU & vlSelf->PSPOYH) 
                      | (((IData)((0U != (0xc00U & vlSelf->PSvddN))) 
                          << 0x14U) | ((IData)((0U 
                                                != 
                                                (0x300U 
                                                 & vlSelf->PSvddN))) 
                                       << 0x13U)));
    vlSelf->PSPOYH = ((0xff9fffffU & vlSelf->PSPOYH) 
                      | (((IData)((0U != (0xc000U & vlSelf->PSvddN))) 
                          << 0x16U) | ((IData)((0U 
                                                != 
                                                (0x3000U 
                                                 & vlSelf->PSvddN))) 
                                       << 0x15U)));
    vlSelf->PSPOYH = ((0xfe7fffffU & vlSelf->PSPOYH) 
                      | (((IData)((0U != (0xc0000U 
                                          & vlSelf->PSvddN))) 
                          << 0x18U) | ((IData)((0U 
                                                != 
                                                (0x30000U 
                                                 & vlSelf->PSvddN))) 
                                       << 0x17U)));
    vlSelf->PSPOYH = ((0xf9ffffffU & vlSelf->PSPOYH) 
                      | (((IData)((0U != (0xc00000U 
                                          & vlSelf->PSvddN))) 
                          << 0x1aU) | ((IData)((0U 
                                                != 
                                                (0x300000U 
                                                 & vlSelf->PSvddN))) 
                                       << 0x19U)));
    vlSelf->PSPOYH = ((0xf7ffffffU & vlSelf->PSPOYH) 
                      | (0x8000000U & (vlSelf->PSvddN 
                                       << 3U)));
    vlSelf->PS3YCQ[2U] = ((0xffe007ffU & vlSelf->PS3YCQ[2U]) 
                          | (0xfffff800U & ((((4U & vlSelf->PSZfAY)
                                               ? 2U
                                               : 3U) 
                                             << 0x10U) 
                                            | (((1U 
                                                 & vlSelf->PSZfAY)
                                                 ? 0U
                                                 : 1U) 
                                               << 0xbU))));
    vlSelf->PS3YCQ[2U] = ((0x801fffffU & vlSelf->PS3YCQ[2U]) 
                          | (0xffe00000U & ((((0x40U 
                                               & vlSelf->PSZfAY)
                                               ? 6U
                                               : 7U) 
                                             << 0x1aU) 
                                            | (((0x10U 
                                                 & vlSelf->PSZfAY)
                                                 ? 4U
                                                 : 5U) 
                                               << 0x15U))));
    vlSelf->PS3YCQ[2U] = ((0x7fffffffU & vlSelf->PS3YCQ[2U]) 
                          | (((0x100U & vlSelf->PSZfAY)
                               ? 8U : 9U) << 0x1fU));
    vlSelf->PS3YCQ[3U] = ((0xfffffe00U & vlSelf->PS3YCQ[3U]) 
                          | (0x7fffffffU & ((0x7ffffff0U 
                                             & (((0x400U 
                                                  & vlSelf->PSZfAY)
                                                  ? 0xaU
                                                  : 0xbU) 
                                                << 4U)) 
                                            | (((0x100U 
                                                 & vlSelf->PSZfAY)
                                                 ? 8U
                                                 : 9U) 
                                               >> 1U))));
    vlSelf->PS3YCQ[3U] = ((0xfff801ffU & vlSelf->PS3YCQ[3U]) 
                          | (0xfffffe00U & ((((0x4000U 
                                               & vlSelf->PSZfAY)
                                               ? 0xeU
                                               : 0xfU) 
                                             << 0xeU) 
                                            | (((0x1000U 
                                                 & vlSelf->PSZfAY)
                                                 ? 0xcU
                                                 : 0xdU) 
                                               << 9U))));
    vlSelf->PS3YCQ[3U] = ((0xe007ffffU & vlSelf->PS3YCQ[3U]) 
                          | (0xfff80000U & ((((0x40000U 
                                               & vlSelf->PSZfAY)
                                               ? 0x12U
                                               : 0x13U) 
                                             << 0x18U) 
                                            | (((0x10000U 
                                                 & vlSelf->PSZfAY)
                                                 ? 0x10U
                                                 : 0x11U) 
                                               << 0x13U))));
    vlSelf->PS3YCQ[3U] = ((0x1fffffffU & vlSelf->PS3YCQ[3U]) 
                          | (((0x100000U & vlSelf->PSZfAY)
                               ? 0x14U : 0x15U) << 0x1dU));
    vlSelf->PS3YCQ[4U] = ((0xffffff80U & vlSelf->PS3YCQ[4U]) 
                          | (0x1fffffffU & ((0x1ffffffcU 
                                             & (((0x400000U 
                                                  & vlSelf->PSZfAY)
                                                  ? 0x16U
                                                  : 0x17U) 
                                                << 2U)) 
                                            | (((0x100000U 
                                                 & vlSelf->PSZfAY)
                                                 ? 0x14U
                                                 : 0x15U) 
                                               >> 3U))));
    vlSelf->PSfVJJ = ((0xfffe7fffU & vlSelf->PSfVJJ) 
                      | (((IData)((0U != (0xcU & vlSelf->PSZfAY))) 
                          << 0x10U) | ((IData)((0U 
                                                != 
                                                (3U 
                                                 & vlSelf->PSZfAY))) 
                                       << 0xfU)));
    vlSelf->PSfVJJ = ((0xfff9ffffU & vlSelf->PSfVJJ) 
                      | (((IData)((0U != (0xc0U & vlSelf->PSZfAY))) 
                          << 0x12U) | ((IData)((0U 
                                                != 
                                                (0x30U 
                                                 & vlSelf->PSZfAY))) 
                                       << 0x11U)));
    vlSelf->PSfVJJ = ((0xffe7ffffU & vlSelf->PSfVJJ) 
                      | (((IData)((0U != (0xc00U & vlSelf->PSZfAY))) 
                          << 0x14U) | ((IData)((0U 
                                                != 
                                                (0x300U 
                                                 & vlSelf->PSZfAY))) 
                                       << 0x13U)));
    vlSelf->PSfVJJ = ((0xff9fffffU & vlSelf->PSfVJJ) 
                      | (((IData)((0U != (0xc000U & vlSelf->PSZfAY))) 
                          << 0x16U) | ((IData)((0U 
                                                != 
                                                (0x3000U 
                                                 & vlSelf->PSZfAY))) 
                                       << 0x15U)));
    vlSelf->PSfVJJ = ((0xfe7fffffU & vlSelf->PSfVJJ) 
                      | (((IData)((0U != (0xc0000U 
                                          & vlSelf->PSZfAY))) 
                          << 0x18U) | ((IData)((0U 
                                                != 
                                                (0x30000U 
                                                 & vlSelf->PSZfAY))) 
                                       << 0x17U)));
    vlSelf->PSfVJJ = ((0xf9ffffffU & vlSelf->PSfVJJ) 
                      | (((IData)((0U != (0xc00000U 
                                          & vlSelf->PSZfAY))) 
                          << 0x1aU) | ((IData)((0U 
                                                != 
                                                (0x300000U 
                                                 & vlSelf->PSZfAY))) 
                                       << 0x19U)));
    vlSelf->PSfVJJ = ((0xf7ffffffU & vlSelf->PSfVJJ) 
                      | (0x8000000U & (vlSelf->PSZfAY 
                                       << 3U)));
    vlSelf->PSveW0[0xdU] = ((0x1ffffffU & vlSelf->PSveW0[0xdU]) 
                            | (((1U & vlSelf->PSW4d1[0U])
                                 ? 0U : 1U) << 0x19U));
    vlSelf->PSveW0[0xeU] = ((0xffffff80U & vlSelf->PSveW0[0xeU]) 
                            | (0x1ffffffU & (((4U & 
                                               vlSelf->PSW4d1[0U])
                                               ? 2U
                                               : 3U) 
                                             | (((1U 
                                                  & vlSelf->PSW4d1[0U])
                                                  ? 0U
                                                  : 1U) 
                                                >> 7U))));
    vlSelf->PSveW0[0xeU] = ((0xffe0007fU & vlSelf->PSveW0[0xeU]) 
                            | (0xffffff80U & ((((0x40U 
                                                 & vlSelf->PSW4d1[0U])
                                                 ? 6U
                                                 : 7U) 
                                               << 0xeU) 
                                              | (((0x10U 
                                                   & vlSelf->PSW4d1[0U])
                                                   ? 4U
                                                   : 5U) 
                                                 << 7U))));
    vlSelf->PSveW0[0xeU] = ((0x1fffffU & vlSelf->PSveW0[0xeU]) 
                            | (0xffe00000U & ((((0x400U 
                                                 & vlSelf->PSW4d1[0U])
                                                 ? 0xaU
                                                 : 0xbU) 
                                               << 0x1cU) 
                                              | (((0x100U 
                                                   & vlSelf->PSW4d1[0U])
                                                   ? 8U
                                                   : 9U) 
                                                 << 0x15U))));
    vlSelf->PSveW0[0xfU] = ((0xfffffff8U & vlSelf->PSveW0[0xfU]) 
                            | (0x1fffffU & ((0x1fffffU 
                                             & (((0x400U 
                                                  & vlSelf->PSW4d1[0U])
                                                  ? 0xaU
                                                  : 0xbU) 
                                                >> 4U)) 
                                            | (((0x100U 
                                                 & vlSelf->PSW4d1[0U])
                                                 ? 8U
                                                 : 9U) 
                                               >> 0xbU))));
    vlSelf->PSveW0[0xfU] = ((0xfffe0007U & vlSelf->PSveW0[0xfU]) 
                            | (0xfffffff8U & ((((0x4000U 
                                                 & vlSelf->PSW4d1[0U])
                                                 ? 0xeU
                                                 : 0xfU) 
                                               << 0xaU) 
                                              | (((0x1000U 
                                                   & vlSelf->PSW4d1[0U])
                                                   ? 0xcU
                                                   : 0xdU) 
                                                 << 3U))));
    vlSelf->PSveW0[0xfU] = ((0x8001ffffU & vlSelf->PSveW0[0xfU]) 
                            | (0xfffe0000U & ((((0x40000U 
                                                 & vlSelf->PSW4d1[0U])
                                                 ? 0x12U
                                                 : 0x13U) 
                                               << 0x18U) 
                                              | (((0x10000U 
                                                   & vlSelf->PSW4d1[0U])
                                                   ? 0x10U
                                                   : 0x11U) 
                                                 << 0x11U))));
    vlSelf->PSveW0[0xfU] = ((0x7fffffffU & vlSelf->PSveW0[0xfU]) 
                            | (((0x100000U & vlSelf->PSW4d1[0U])
                                 ? 0x14U : 0x15U) << 0x1fU));
    vlSelf->PSveW0[0x10U] = ((0xffffe000U & vlSelf->PSveW0[0x10U]) 
                             | (0x7fffffffU & ((0x7fffffc0U 
                                                & (((0x400000U 
                                                     & vlSelf->PSW4d1[0U])
                                                     ? 0x16U
                                                     : 0x17U) 
                                                   << 6U)) 
                                               | (((0x100000U 
                                                    & vlSelf->PSW4d1[0U])
                                                    ? 0x14U
                                                    : 0x15U) 
                                                  >> 1U))));
    vlSelf->PSveW0[0x10U] = ((0xf8001fffU & vlSelf->PSveW0[0x10U]) 
                             | (0xffffe000U & ((((0x4000000U 
                                                  & vlSelf->PSW4d1[0U])
                                                  ? 0x1aU
                                                  : 0x1bU) 
                                                << 0x14U) 
                                               | (((0x1000000U 
                                                    & vlSelf->PSW4d1[0U])
                                                    ? 0x18U
                                                    : 0x19U) 
                                                  << 0xdU))));
    vlSelf->PSveW0[0x10U] = ((0x7ffffffU & vlSelf->PSveW0[0x10U]) 
                             | (((0x10000000U & vlSelf->PSW4d1[0U])
                                  ? 0x1cU : 0x1dU) 
                                << 0x1bU));
    vlSelf->PSveW0[0x11U] = ((0xfffffe00U & vlSelf->PSveW0[0x11U]) 
                             | (0x7ffffffU & ((0x7fffffcU 
                                               & (((0x40000000U 
                                                    & vlSelf->PSW4d1[0U])
                                                    ? 0x1eU
                                                    : 0x1fU) 
                                                  << 2U)) 
                                              | (((0x10000000U 
                                                   & vlSelf->PSW4d1[0U])
                                                   ? 0x1cU
                                                   : 0x1dU) 
                                                 >> 5U))));
    vlSelf->PSveW0[0x11U] = ((0xff8001ffU & vlSelf->PSveW0[0x11U]) 
                             | (0xfffffe00U & ((((4U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x22U
                                                  : 0x23U) 
                                                << 0x10U) 
                                               | (((1U 
                                                    & vlSelf->PSW4d1[1U])
                                                    ? 0x20U
                                                    : 0x21U) 
                                                  << 9U))));
    vlSelf->PSveW0[0x11U] = ((0x7fffffU & vlSelf->PSveW0[0x11U]) 
                             | (0xff800000U & ((((0x40U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x26U
                                                  : 0x27U) 
                                                << 0x1eU) 
                                               | (((0x10U 
                                                    & vlSelf->PSW4d1[1U])
                                                    ? 0x24U
                                                    : 0x25U) 
                                                  << 0x17U))));
    vlSelf->PSveW0[0x12U] = ((0xffffffe0U & vlSelf->PSveW0[0x12U]) 
                             | (0x7fffffU & ((0x7fffffU 
                                              & (((0x40U 
                                                   & vlSelf->PSW4d1[1U])
                                                   ? 0x26U
                                                   : 0x27U) 
                                                 >> 2U)) 
                                             | (((0x10U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x24U
                                                  : 0x25U) 
                                                >> 9U))));
    vlSelf->PSveW0[0x12U] = ((0xfff8001fU & vlSelf->PSveW0[0x12U]) 
                             | (0xffffffe0U & ((((0x400U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x2aU
                                                  : 0x2bU) 
                                                << 0xcU) 
                                               | (((0x100U 
                                                    & vlSelf->PSW4d1[1U])
                                                    ? 0x28U
                                                    : 0x29U) 
                                                  << 5U))));
    vlSelf->PSveW0[0x12U] = ((0x7ffffU & vlSelf->PSveW0[0x12U]) 
                             | (0xfff80000U & ((((0x4000U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x2eU
                                                  : 0x2fU) 
                                                << 0x1aU) 
                                               | (((0x1000U 
                                                    & vlSelf->PSW4d1[1U])
                                                    ? 0x2cU
                                                    : 0x2dU) 
                                                  << 0x13U))));
    vlSelf->PSveW0[0x13U] = ((0xfffffffeU & vlSelf->PSveW0[0x13U]) 
                             | (0x7ffffU & ((0x7ffffU 
                                             & (((0x4000U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x2eU
                                                  : 0x2fU) 
                                                >> 6U)) 
                                            | (((0x1000U 
                                                 & vlSelf->PSW4d1[1U])
                                                 ? 0x2cU
                                                 : 0x2dU) 
                                               >> 0xdU))));
    vlSelf->PSveW0[0x13U] = ((0xffff8001U & vlSelf->PSveW0[0x13U]) 
                             | (0xfffffffeU & ((((0x40000U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x32U
                                                  : 0x33U) 
                                                << 8U) 
                                               | (((0x10000U 
                                                    & vlSelf->PSW4d1[1U])
                                                    ? 0x30U
                                                    : 0x31U) 
                                                  << 1U))));
    vlSelf->PSveW0[0x13U] = ((0xe0007fffU & vlSelf->PSveW0[0x13U]) 
                             | (0xffff8000U & ((((0x400000U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x36U
                                                  : 0x37U) 
                                                << 0x16U) 
                                               | (((0x100000U 
                                                    & vlSelf->PSW4d1[1U])
                                                    ? 0x34U
                                                    : 0x35U) 
                                                  << 0xfU))));
    vlSelf->PSveW0[0x13U] = ((0x1fffffffU & vlSelf->PSveW0[0x13U]) 
                             | (((0x1000000U & vlSelf->PSW4d1[1U])
                                  ? 0x38U : 0x39U) 
                                << 0x1dU));
    vlSelf->PSveW0[0x14U] = ((0xfffff800U & vlSelf->PSveW0[0x14U]) 
                             | (0x1fffffffU & ((0x1ffffff0U 
                                                & (((0x4000000U 
                                                     & vlSelf->PSW4d1[1U])
                                                     ? 0x3aU
                                                     : 0x3bU) 
                                                   << 4U)) 
                                               | (((0x1000000U 
                                                    & vlSelf->PSW4d1[1U])
                                                    ? 0x38U
                                                    : 0x39U) 
                                                  >> 3U))));
    vlSelf->PSveW0[0x14U] = ((0xfe0007ffU & vlSelf->PSveW0[0x14U]) 
                             | (0xfffff800U & ((((0x40000000U 
                                                  & vlSelf->PSW4d1[1U])
                                                  ? 0x3eU
                                                  : 0x3fU) 
                                                << 0x12U) 
                                               | (((0x10000000U 
                                                    & vlSelf->PSW4d1[1U])
                                                    ? 0x3cU
                                                    : 0x3dU) 
                                                  << 0xbU))));
    vlSelf->PSveW0[0x14U] = ((0x1ffffffU & vlSelf->PSveW0[0x14U]) 
                             | (((1U & vlSelf->PSW4d1[2U])
                                  ? 0x40U : 0x41U) 
                                << 0x19U));
    vlSelf->PSveW0[0x15U] = ((0xffffff80U & vlSelf->PSveW0[0x15U]) 
                             | (0x1ffffffU & (((4U 
                                                & vlSelf->PSW4d1[2U])
                                                ? 0x42U
                                                : 0x43U) 
                                              | (((1U 
                                                   & vlSelf->PSW4d1[2U])
                                                   ? 0x40U
                                                   : 0x41U) 
                                                 >> 7U))));
    vlSelf->PSveW0[0x15U] = ((0xffe0007fU & vlSelf->PSveW0[0x15U]) 
                             | (0xffffff80U & ((((0x40U 
                                                  & vlSelf->PSW4d1[2U])
                                                  ? 0x46U
                                                  : 0x47U) 
                                                << 0xeU) 
                                               | (((0x10U 
                                                    & vlSelf->PSW4d1[2U])
                                                    ? 0x44U
                                                    : 0x45U) 
                                                  << 7U))));
    vlSelf->PSveW0[0x15U] = ((0x1fffffU & vlSelf->PSveW0[0x15U]) 
                             | (0xffe00000U & ((((0x400U 
                                                  & vlSelf->PSW4d1[2U])
                                                  ? 0x4aU
                                                  : 0x4bU) 
                                                << 0x1cU) 
                                               | (((0x100U 
                                                    & vlSelf->PSW4d1[2U])
                                                    ? 0x48U
                                                    : 0x49U) 
                                                  << 0x15U))));
    vlSelf->PSveW0[0x16U] = ((0xfffffff8U & vlSelf->PSveW0[0x16U]) 
                             | (0x1fffffU & ((0x1fffffU 
                                              & (((0x400U 
                                                   & vlSelf->PSW4d1[2U])
                                                   ? 0x4aU
                                                   : 0x4bU) 
                                                 >> 4U)) 
                                             | (((0x100U 
                                                  & vlSelf->PSW4d1[2U])
                                                  ? 0x48U
                                                  : 0x49U) 
                                                >> 0xbU))));
    vlSelf->PSveW0[0x16U] = ((0xfffe0007U & vlSelf->PSveW0[0x16U]) 
                             | (0xfffffff8U & ((((0x4000U 
                                                  & vlSelf->PSW4d1[2U])
                                                  ? 0x4eU
                                                  : 0x4fU) 
                                                << 0xaU) 
                                               | (((0x1000U 
                                                    & vlSelf->PSW4d1[2U])
                                                    ? 0x4cU
                                                    : 0x4dU) 
                                                  << 3U))));
    vlSelf->PSveW0[0x16U] = ((0x8001ffffU & vlSelf->PSveW0[0x16U]) 
                             | (0xfffe0000U & ((((0x40000U 
                                                  & vlSelf->PSW4d1[2U])
                                                  ? 0x52U
                                                  : 0x53U) 
                                                << 0x18U) 
                                               | (((0x10000U 
                                                    & vlSelf->PSW4d1[2U])
                                                    ? 0x50U
                                                    : 0x51U) 
                                                  << 0x11U))));
    vlSelf->PSveW0[0x16U] = ((0x7fffffffU & vlSelf->PSveW0[0x16U]) 
                             | (((0x100000U & vlSelf->PSW4d1[2U])
                                  ? 0x54U : 0x55U) 
                                << 0x1fU));
    vlSelf->PSveW0[0x17U] = ((0xffffe000U & vlSelf->PSveW0[0x17U]) 
                             | (0x7fffffffU & ((0x7fffffc0U 
                                                & (((0x400000U 
                                                     & vlSelf->PSW4d1[2U])
                                                     ? 0x56U
                                                     : 0x57U) 
                                                   << 6U)) 
                                               | (((0x100000U 
                                                    & vlSelf->PSW4d1[2U])
                                                    ? 0x54U
                                                    : 0x55U) 
                                                  >> 1U))));
    vlSelf->PSveW0[0x17U] = ((0xf8001fffU & vlSelf->PSveW0[0x17U]) 
                             | (0xffffe000U & ((((0x4000000U 
                                                  & vlSelf->PSW4d1[2U])
                                                  ? 0x5aU
                                                  : 0x5bU) 
                                                << 0x14U) 
                                               | (((0x1000000U 
                                                    & vlSelf->PSW4d1[2U])
                                                    ? 0x58U
                                                    : 0x59U) 
                                                  << 0xdU))));
    vlSelf->PSveW0[0x17U] = ((0x7ffffffU & vlSelf->PSveW0[0x17U]) 
                             | (((0x10000000U & vlSelf->PSW4d1[2U])
                                  ? 0x5cU : 0x5dU) 
                                << 0x1bU));
    vlSelf->PSveW0[0x18U] = ((0xfffffe00U & vlSelf->PSveW0[0x18U]) 
                             | (0x7ffffffU & ((0x7fffffcU 
                                               & (((0x40000000U 
                                                    & vlSelf->PSW4d1[2U])
                                                    ? 0x5eU
                                                    : 0x5fU) 
                                                  << 2U)) 
                                              | (((0x10000000U 
                                                   & vlSelf->PSW4d1[2U])
                                                   ? 0x5cU
                                                   : 0x5dU) 
                                                 >> 5U))));
    vlSelf->PSveW0[0x18U] = ((0xff8001ffU & vlSelf->PSveW0[0x18U]) 
                             | (0xfffffe00U & ((((4U 
                                                  & vlSelf->PSW4d1[3U])
                                                  ? 0x62U
                                                  : 0x63U) 
                                                << 0x10U) 
                                               | (((1U 
                                                    & vlSelf->PSW4d1[3U])
                                                    ? 0x60U
                                                    : 0x61U) 
                                                  << 9U))));
    vlSelf->PSveW0[0x18U] = ((0x7fffffU & vlSelf->PSveW0[0x18U]) 
                             | (0xff800000U & ((((0x40U 
                                                  & vlSelf->PSW4d1[3U])
                                                  ? 0x66U
                                                  : 0x67U) 
                                                << 0x1eU) 
                                               | (((0x10U 
                                                    & vlSelf->PSW4d1[3U])
                                                    ? 0x64U
                                                    : 0x65U) 
                                                  << 0x17U))));
    vlSelf->PSveW0[0x19U] = ((0xffffffe0U & vlSelf->PSveW0[0x19U]) 
                             | (0x7fffffU & ((0x7fffffU 
                                              & (((0x40U 
                                                   & vlSelf->PSW4d1[3U])
                                                   ? 0x66U
                                                   : 0x67U) 
                                                 >> 2U)) 
                                             | (((0x10U 
                                                  & vlSelf->PSW4d1[3U])
                                                  ? 0x64U
                                                  : 0x65U) 
                                                >> 9U))));
    vlSelf->PSveW0[0x19U] = ((0xfff8001fU & vlSelf->PSveW0[0x19U]) 
                             | (0xffffffe0U & ((((0x400U 
                                                  & vlSelf->PSW4d1[3U])
                                                  ? 0x6aU
                                                  : 0x6bU) 
                                                << 0xcU) 
                                               | (((0x100U 
                                                    & vlSelf->PSW4d1[3U])
                                                    ? 0x68U
                                                    : 0x69U) 
                                                  << 5U))));
    vlSelf->PSvySI[1U] = ((0x7fffffffU & vlSelf->PSvySI[1U]) 
                          | (0x80000000U & ((vlSelf->PSW4d1[0U] 
                                             << 0x1fU) 
                                            | (0x80000000U 
                                               & (vlSelf->PSW4d1[0U] 
                                                  << 0x1eU)))));
    vlSelf->PSvySI[2U] = ((0xfffffffeU & vlSelf->PSvySI[2U]) 
                          | (1U & ((vlSelf->PSW4d1[0U] 
                                    >> 2U) | (vlSelf->PSW4d1[0U] 
                                              >> 3U))));
    vlSelf->PSvySI[2U] = ((0xfffffff9U & vlSelf->PSvySI[2U]) 
                          | (0xfffffffeU & ((4U & (
                                                   (0xffffffcU 
                                                    & (vlSelf->PSW4d1[0U] 
                                                       >> 4U)) 
                                                   | (0x7fffffcU 
                                                      & (vlSelf->PSW4d1[0U] 
                                                         >> 5U)))) 
                                            | (2U & 
                                               ((0x1ffffffeU 
                                                 & (vlSelf->PSW4d1[0U] 
                                                    >> 3U)) 
                                                | (0xffffffeU 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 4U)))))));
    vlSelf->PSvySI[2U] = ((0xffffffe7U & vlSelf->PSvySI[2U]) 
                          | (0xfffffff8U & ((0x10U 
                                             & ((0x3fffff0U 
                                                 & (vlSelf->PSW4d1[0U] 
                                                    >> 6U)) 
                                                | (0x1fffff0U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 7U)))) 
                                            | (8U & 
                                               ((0x7fffff8U 
                                                 & (vlSelf->PSW4d1[0U] 
                                                    >> 5U)) 
                                                | (0x3fffff8U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 6U)))))));
    vlSelf->PSvySI[2U] = ((0xffffff9fU & vlSelf->PSvySI[2U]) 
                          | (0xffffffe0U & ((0x40U 
                                             & ((0xffffc0U 
                                                 & (vlSelf->PSW4d1[0U] 
                                                    >> 8U)) 
                                                | (0x7fffc0U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 9U)))) 
                                            | (0x20U 
                                               & ((0x1ffffe0U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 7U)) 
                                                  | (0xffffe0U 
                                                     & (vlSelf->PSW4d1[0U] 
                                                        >> 8U)))))));
    vlSelf->PSvySI[2U] = ((0xfffffe7fU & vlSelf->PSvySI[2U]) 
                          | (0xffffff80U & ((0x100U 
                                             & ((0x3fff00U 
                                                 & (vlSelf->PSW4d1[0U] 
                                                    >> 0xaU)) 
                                                | (0x1fff00U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 0xbU)))) 
                                            | (0x80U 
                                               & ((0x7fff80U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 9U)) 
                                                  | (0x3fff80U 
                                                     & (vlSelf->PSW4d1[0U] 
                                                        >> 0xaU)))))));
    vlSelf->PSvySI[2U] = ((0xfffff9ffU & vlSelf->PSvySI[2U]) 
                          | (0xfffffe00U & ((0x400U 
                                             & ((0xffc00U 
                                                 & (vlSelf->PSW4d1[0U] 
                                                    >> 0xcU)) 
                                                | (0x7fc00U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 0xdU)))) 
                                            | (0x200U 
                                               & ((0x1ffe00U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 0xbU)) 
                                                  | (0xffe00U 
                                                     & (vlSelf->PSW4d1[0U] 
                                                        >> 0xcU)))))));
    vlSelf->PSvySI[2U] = ((0xffffe7ffU & vlSelf->PSvySI[2U]) 
                          | (0xfffff800U & ((0x1000U 
                                             & ((0x3f000U 
                                                 & (vlSelf->PSW4d1[0U] 
                                                    >> 0xeU)) 
                                                | (0x1f000U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 0xfU)))) 
                                            | (0x800U 
                                               & ((0x7f800U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 0xdU)) 
                                                  | (0x3f800U 
                                                     & (vlSelf->PSW4d1[0U] 
                                                        >> 0xeU)))))));
    vlSelf->PSvySI[2U] = ((0xffff9fffU & vlSelf->PSvySI[2U]) 
                          | (0xffffe000U & ((0x4000U 
                                             & ((0xc000U 
                                                 & (vlSelf->PSW4d1[0U] 
                                                    >> 0x10U)) 
                                                | (0x4000U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 0x11U)))) 
                                            | (0x2000U 
                                               & ((0x1e000U 
                                                   & (vlSelf->PSW4d1[0U] 
                                                      >> 0xfU)) 
                                                  | (0xe000U 
                                                     & (vlSelf->PSW4d1[0U] 
                                                        >> 0x10U)))))));
    vlSelf->PSvySI[2U] = ((0xfffe7fffU & vlSelf->PSvySI[2U]) 
                          | (0xffff8000U & ((0x10000U 
                                             & ((vlSelf->PSW4d1[1U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSW4d1[1U] 
                                                   << 0xdU))) 
                                            | (0x8000U 
                                               & ((vlSelf->PSW4d1[1U] 
                                                   << 0xfU) 
                                                  | (0xffff8000U 
                                                     & (vlSelf->PSW4d1[1U] 
                                                        << 0xeU)))))));
    vlSelf->PSvySI[2U] = ((0xfff9ffffU & vlSelf->PSvySI[2U]) 
                          | (0xfffe0000U & ((0x40000U 
                                             & ((vlSelf->PSW4d1[1U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSW4d1[1U] 
                                                   << 0xbU))) 
                                            | (0x20000U 
                                               & ((vlSelf->PSW4d1[1U] 
                                                   << 0xdU) 
                                                  | (vlSelf->PSW4d1[1U] 
                                                     << 0xcU))))));
    vlSelf->PSvySI[2U] = ((0xffe7ffffU & vlSelf->PSvySI[2U]) 
                          | (0xfff80000U & ((0x100000U 
                                             & ((vlSelf->PSW4d1[1U] 
                                                 << 0xaU) 
                                                | (vlSelf->PSW4d1[1U] 
                                                   << 9U))) 
                                            | (0x80000U 
                                               & ((vlSelf->PSW4d1[1U] 
                                                   << 0xbU) 
                                                  | (vlSelf->PSW4d1[1U] 
                                                     << 0xaU))))));
    vlSelf->PSvySI[2U] = ((0xff9fffffU & vlSelf->PSvySI[2U]) 
                          | (0xffe00000U & ((0x400000U 
                                             & ((vlSelf->PSW4d1[1U] 
                                                 << 8U) 
                                                | (vlSelf->PSW4d1[1U] 
                                                   << 7U))) 
                                            | (0x200000U 
                                               & ((vlSelf->PSW4d1[1U] 
                                                   << 9U) 
                                                  | (vlSelf->PSW4d1[1U] 
                                                     << 8U))))));
    vlSelf->PSvySI[2U] = ((0xfe7fffffU & vlSelf->PSvySI[2U]) 
                          | (0xff800000U & ((0x1000000U 
                                             & ((vlSelf->PSW4d1[1U] 
                                                 << 6U) 
                                                | (vlSelf->PSW4d1[1U] 
                                                   << 5U))) 
                                            | (0x800000U 
                                               & ((vlSelf->PSW4d1[1U] 
                                                   << 7U) 
                                                  | (vlSelf->PSW4d1[1U] 
                                                     << 6U))))));
    vlSelf->PSvySI[2U] = ((0xf9ffffffU & vlSelf->PSvySI[2U]) 
                          | (0xfe000000U & ((0x4000000U 
                                             & ((vlSelf->PSW4d1[1U] 
                                                 << 4U) 
                                                | (vlSelf->PSW4d1[1U] 
                                                   << 3U))) 
                                            | (0x2000000U 
                                               & ((vlSelf->PSW4d1[1U] 
                                                   << 5U) 
                                                  | (vlSelf->PSW4d1[1U] 
                                                     << 4U))))));
    vlSelf->PSvySI[2U] = ((0xe7ffffffU & vlSelf->PSvySI[2U]) 
                          | (0xf8000000U & ((0x10000000U 
                                             & ((vlSelf->PSW4d1[1U] 
                                                 << 2U) 
                                                | (vlSelf->PSW4d1[1U] 
                                                   << 1U))) 
                                            | (0x8000000U 
                                               & ((vlSelf->PSW4d1[1U] 
                                                   << 3U) 
                                                  | (vlSelf->PSW4d1[1U] 
                                                     << 2U))))));
    vlSelf->PSvySI[2U] = ((0x9fffffffU & vlSelf->PSvySI[2U]) 
                          | (0xe0000000U & ((0x40000000U 
                                             & ((0xc0000000U 
                                                 & vlSelf->PSW4d1[1U]) 
                                                | (0x40000000U 
                                                   & (vlSelf->PSW4d1[1U] 
                                                      >> 1U)))) 
                                            | (0x20000000U 
                                               & ((vlSelf->PSW4d1[1U] 
                                                   << 1U) 
                                                  | vlSelf->PSW4d1[1U])))));
    vlSelf->PSvySI[2U] = ((0x7fffffffU & vlSelf->PSvySI[2U]) 
                          | (0x80000000U & ((vlSelf->PSW4d1[2U] 
                                             << 0x1fU) 
                                            | (0x80000000U 
                                               & (vlSelf->PSW4d1[2U] 
                                                  << 0x1eU)))));
    vlSelf->PSvySI[3U] = ((0xfffffffeU & vlSelf->PSvySI[3U]) 
                          | (1U & ((vlSelf->PSW4d1[2U] 
                                    >> 2U) | (vlSelf->PSW4d1[2U] 
                                              >> 3U))));
    vlSelf->PSvySI[3U] = ((0xfffffff9U & vlSelf->PSvySI[3U]) 
                          | (0xfffffffeU & ((4U & (
                                                   (0xffffffcU 
                                                    & (vlSelf->PSW4d1[2U] 
                                                       >> 4U)) 
                                                   | (0x7fffffcU 
                                                      & (vlSelf->PSW4d1[2U] 
                                                         >> 5U)))) 
                                            | (2U & 
                                               ((0x1ffffffeU 
                                                 & (vlSelf->PSW4d1[2U] 
                                                    >> 3U)) 
                                                | (0xffffffeU 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 4U)))))));
    vlSelf->PSvySI[3U] = ((0xffffffe7U & vlSelf->PSvySI[3U]) 
                          | (0xfffffff8U & ((0x10U 
                                             & ((0x3fffff0U 
                                                 & (vlSelf->PSW4d1[2U] 
                                                    >> 6U)) 
                                                | (0x1fffff0U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 7U)))) 
                                            | (8U & 
                                               ((0x7fffff8U 
                                                 & (vlSelf->PSW4d1[2U] 
                                                    >> 5U)) 
                                                | (0x3fffff8U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 6U)))))));
    vlSelf->PSvySI[3U] = ((0xffffff9fU & vlSelf->PSvySI[3U]) 
                          | (0xffffffe0U & ((0x40U 
                                             & ((0xffffc0U 
                                                 & (vlSelf->PSW4d1[2U] 
                                                    >> 8U)) 
                                                | (0x7fffc0U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 9U)))) 
                                            | (0x20U 
                                               & ((0x1ffffe0U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 7U)) 
                                                  | (0xffffe0U 
                                                     & (vlSelf->PSW4d1[2U] 
                                                        >> 8U)))))));
    vlSelf->PSvySI[3U] = ((0xfffffe7fU & vlSelf->PSvySI[3U]) 
                          | (0xffffff80U & ((0x100U 
                                             & ((0x3fff00U 
                                                 & (vlSelf->PSW4d1[2U] 
                                                    >> 0xaU)) 
                                                | (0x1fff00U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 0xbU)))) 
                                            | (0x80U 
                                               & ((0x7fff80U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 9U)) 
                                                  | (0x3fff80U 
                                                     & (vlSelf->PSW4d1[2U] 
                                                        >> 0xaU)))))));
    vlSelf->PSvySI[3U] = ((0xfffff9ffU & vlSelf->PSvySI[3U]) 
                          | (0xfffffe00U & ((0x400U 
                                             & ((0xffc00U 
                                                 & (vlSelf->PSW4d1[2U] 
                                                    >> 0xcU)) 
                                                | (0x7fc00U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 0xdU)))) 
                                            | (0x200U 
                                               & ((0x1ffe00U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 0xbU)) 
                                                  | (0xffe00U 
                                                     & (vlSelf->PSW4d1[2U] 
                                                        >> 0xcU)))))));
    vlSelf->PSvySI[3U] = ((0xffffe7ffU & vlSelf->PSvySI[3U]) 
                          | (0xfffff800U & ((0x1000U 
                                             & ((0x3f000U 
                                                 & (vlSelf->PSW4d1[2U] 
                                                    >> 0xeU)) 
                                                | (0x1f000U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 0xfU)))) 
                                            | (0x800U 
                                               & ((0x7f800U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 0xdU)) 
                                                  | (0x3f800U 
                                                     & (vlSelf->PSW4d1[2U] 
                                                        >> 0xeU)))))));
    vlSelf->PSvySI[3U] = ((0xffff9fffU & vlSelf->PSvySI[3U]) 
                          | (0xffffe000U & ((0x4000U 
                                             & ((0xc000U 
                                                 & (vlSelf->PSW4d1[2U] 
                                                    >> 0x10U)) 
                                                | (0x4000U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 0x11U)))) 
                                            | (0x2000U 
                                               & ((0x1e000U 
                                                   & (vlSelf->PSW4d1[2U] 
                                                      >> 0xfU)) 
                                                  | (0xe000U 
                                                     & (vlSelf->PSW4d1[2U] 
                                                        >> 0x10U)))))));
    vlSelf->PSvySI[3U] = ((0xfffe7fffU & vlSelf->PSvySI[3U]) 
                          | (0xffff8000U & ((0x10000U 
                                             & ((vlSelf->PSW4d1[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSW4d1[3U] 
                                                   << 0xdU))) 
                                            | (0x8000U 
                                               & ((vlSelf->PSW4d1[3U] 
                                                   << 0xfU) 
                                                  | (0xffff8000U 
                                                     & (vlSelf->PSW4d1[3U] 
                                                        << 0xeU)))))));
    vlSelf->PSvySI[3U] = ((0xfff9ffffU & vlSelf->PSvySI[3U]) 
                          | (0xfffe0000U & ((0x40000U 
                                             & ((vlSelf->PSW4d1[3U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSW4d1[3U] 
                                                   << 0xbU))) 
                                            | (0x20000U 
                                               & ((vlSelf->PSW4d1[3U] 
                                                   << 0xdU) 
                                                  | (vlSelf->PSW4d1[3U] 
                                                     << 0xcU))))));
    vlSelf->PSvySI[3U] = ((0xffe7ffffU & vlSelf->PSvySI[3U]) 
                          | (0xfff80000U & ((0x100000U 
                                             & ((vlSelf->PSW4d1[3U] 
                                                 << 0xaU) 
                                                | (vlSelf->PSW4d1[3U] 
                                                   << 9U))) 
                                            | (0x80000U 
                                               & ((vlSelf->PSW4d1[3U] 
                                                   << 0xbU) 
                                                  | (vlSelf->PSW4d1[3U] 
                                                     << 0xaU))))));
    vlSelf->PSvySI[3U] = ((0xffdfffffU & vlSelf->PSvySI[3U]) 
                          | (0x200000U & (vlSelf->PSW4d1[3U] 
                                          << 9U)));
    vlSelf->PSq6A8[5U] = ((0x3ffffffU & vlSelf->PSq6A8[5U]) 
                          | (((1U & (IData)(vlSelf->PSoZuM))
                               ? 0U : 1U) << 0x1aU));
    vlSelf->PSq6A8[6U] = ((0xffffffc0U & vlSelf->PSq6A8[6U]) 
                          | (0x3ffffffU & (((1U & (IData)(
                                                          (vlSelf->PSoZuM 
                                                           >> 2U)))
                                             ? 2U : 3U) 
                                           | (((1U 
                                                & (IData)(vlSelf->PSoZuM))
                                                ? 0U
                                                : 1U) 
                                              >> 6U))));
    vlSelf->PSq6A8[6U] = ((0xfffc003fU & vlSelf->PSq6A8[6U]) 
                          | (0xffffffc0U & ((((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 6U)))
                                               ? 6U
                                               : 7U) 
                                             << 0xcU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 4U)))
                                                 ? 4U
                                                 : 5U) 
                                               << 6U))));
    vlSelf->PSq6A8[6U] = ((0xc003ffffU & vlSelf->PSq6A8[6U]) 
                          | (0xfffc0000U & ((((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0xaU)))
                                               ? 0xaU
                                               : 0xbU) 
                                             << 0x18U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 8U)))
                                                 ? 8U
                                                 : 9U) 
                                               << 0x12U))));
    vlSelf->PSq6A8[6U] = ((0x3fffffffU & vlSelf->PSq6A8[6U]) 
                          | (((1U & (IData)((vlSelf->PSoZuM 
                                             >> 0xcU)))
                               ? 0xcU : 0xdU) << 0x1eU));
    vlSelf->PSq6A8[7U] = ((0xfffffc00U & vlSelf->PSq6A8[7U]) 
                          | (0x3fffffffU & ((0x3ffffff0U 
                                             & (((1U 
                                                  & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0xeU)))
                                                  ? 0xeU
                                                  : 0xfU) 
                                                << 4U)) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 0xcU)))
                                                 ? 0xcU
                                                 : 0xdU) 
                                               >> 2U))));
    vlSelf->PSq6A8[7U] = ((0xffc003ffU & vlSelf->PSq6A8[7U]) 
                          | (0xfffffc00U & ((((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0x12U)))
                                               ? 0x12U
                                               : 0x13U) 
                                             << 0x10U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 0x10U)))
                                                 ? 0x10U
                                                 : 0x11U) 
                                               << 0xaU))));
    vlSelf->PSq6A8[7U] = ((0x3fffffU & vlSelf->PSq6A8[7U]) 
                          | (0xffc00000U & ((((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0x16U)))
                                               ? 0x16U
                                               : 0x17U) 
                                             << 0x1cU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 0x14U)))
                                                 ? 0x14U
                                                 : 0x15U) 
                                               << 0x16U))));
    vlSelf->PSq6A8[8U] = ((0xfffffffcU & vlSelf->PSq6A8[8U]) 
                          | (0x3fffffU & ((0x3fffffU 
                                           & (((1U 
                                                & (IData)(
                                                          (vlSelf->PSoZuM 
                                                           >> 0x16U)))
                                                ? 0x16U
                                                : 0x17U) 
                                              >> 4U)) 
                                          | (((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0x14U)))
                                               ? 0x14U
                                               : 0x15U) 
                                             >> 0xaU))));
    vlSelf->PSq6A8[8U] = ((0xffffc003U & vlSelf->PSq6A8[8U]) 
                          | (0xfffffffcU & ((((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0x1aU)))
                                               ? 0x1aU
                                               : 0x1bU) 
                                             << 8U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 0x18U)))
                                                 ? 0x18U
                                                 : 0x19U) 
                                               << 2U))));
    vlSelf->PSq6A8[8U] = ((0xfc003fffU & vlSelf->PSq6A8[8U]) 
                          | (0xffffc000U & ((((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0x1eU)))
                                               ? 0x1eU
                                               : 0x1fU) 
                                             << 0x14U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 0x1cU)))
                                                 ? 0x1cU
                                                 : 0x1dU) 
                                               << 0xeU))));
    vlSelf->PSq6A8[8U] = ((0x3ffffffU & vlSelf->PSq6A8[8U]) 
                          | (((1U & (IData)((vlSelf->PSoZuM 
                                             >> 0x20U)))
                               ? 0x20U : 0x21U) << 0x1aU));
    vlSelf->PSq6A8[9U] = ((0xffffffc0U & vlSelf->PSq6A8[9U]) 
                          | (0x3ffffffU & (((1U & (IData)(
                                                          (vlSelf->PSoZuM 
                                                           >> 0x22U)))
                                             ? 0x22U
                                             : 0x23U) 
                                           | (((1U 
                                                & (IData)(
                                                          (vlSelf->PSoZuM 
                                                           >> 0x20U)))
                                                ? 0x20U
                                                : 0x21U) 
                                              >> 6U))));
    vlSelf->PSq6A8[9U] = ((0xfffc003fU & vlSelf->PSq6A8[9U]) 
                          | (0xffffffc0U & ((((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0x26U)))
                                               ? 0x26U
                                               : 0x27U) 
                                             << 0xcU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 0x24U)))
                                                 ? 0x24U
                                                 : 0x25U) 
                                               << 6U))));
    vlSelf->PSq6A8[9U] = ((0xc003ffffU & vlSelf->PSq6A8[9U]) 
                          | (0xfffc0000U & ((((1U & (IData)(
                                                            (vlSelf->PSoZuM 
                                                             >> 0x2aU)))
                                               ? 0x2aU
                                               : 0x2bU) 
                                             << 0x18U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSoZuM 
                                                            >> 0x28U)))
                                                 ? 0x28U
                                                 : 0x29U) 
                                               << 0x12U))));
    vlSelf->PSq6A8[9U] = ((0x3fffffffU & vlSelf->PSq6A8[9U]) 
                          | (((1U & (IData)((vlSelf->PSoZuM 
                                             >> 0x2cU)))
                               ? 0x2cU : 0x2dU) << 0x1eU));
    vlSelf->PSq6A8[0xaU] = ((0xfffffc00U & vlSelf->PSq6A8[0xaU]) 
                            | (0x3fffffffU & ((0x3ffffff0U 
                                               & (((1U 
                                                    & (IData)(
                                                              (vlSelf->PSoZuM 
                                                               >> 0x2eU)))
                                                    ? 0x2eU
                                                    : 0x2fU) 
                                                  << 4U)) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PSoZuM 
                                                              >> 0x2cU)))
                                                   ? 0x2cU
                                                   : 0x2dU) 
                                                 >> 2U))));
    vlSelf->PSq6A8[0xaU] = ((0xffff03ffU & vlSelf->PSq6A8[0xaU]) 
                            | (((1U & (IData)((vlSelf->PSoZuM 
                                               >> 0x30U)))
                                 ? 0x30U : 0x31U) << 0xaU));
    vlSelf->PSIckZ = ((0xfffffffe7fffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xcULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (3ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x1fU));
    vlSelf->PSIckZ = ((0xfffffff9ffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x21U));
    vlSelf->PSIckZ = ((0xffffffe7ffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x23U));
    vlSelf->PSIckZ = ((0xffffff9fffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x25U));
    vlSelf->PSIckZ = ((0xfffffe7fffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x27U));
    vlSelf->PSIckZ = ((0xfffff9ffffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x29U));
    vlSelf->PSIckZ = ((0xffffe7ffffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x2bU));
    vlSelf->PSIckZ = ((0xffff9fffffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x2dU));
    vlSelf->PSIckZ = ((0xfffe7fffffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x2fU));
    vlSelf->PSIckZ = ((0xfff9ffffffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x31U));
    vlSelf->PSIckZ = ((0xffe7ffffffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x33U));
    vlSelf->PSIckZ = ((0xff9fffffffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000000ULL 
                                                     & vlSelf->PSoZuM))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000000ULL 
                                                              & vlSelf->PSoZuM)))))) 
                         << 0x35U));
    vlSelf->PSIckZ = ((0xfe7fffffffffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)(((2U & ((IData)(
                                                         (vlSelf->PSoZuM 
                                                          >> 0x32U)) 
                                                 << 1U)) 
                                          | (IData)(
                                                    (0ULL 
                                                     != 
                                                     (0x3000000000000ULL 
                                                      & vlSelf->PSoZuM)))))) 
                         << 0x37U));
    vlSelf->PSzMHi[5U] = ((0x3ffffffU & vlSelf->PSzMHi[5U]) 
                          | (((1U & (IData)(vlSelf->PSSFpT))
                               ? 0U : 1U) << 0x1aU));
    vlSelf->PSzMHi[6U] = ((0xffffffc0U & vlSelf->PSzMHi[6U]) 
                          | (0x3ffffffU & (((1U & (IData)(
                                                          (vlSelf->PSSFpT 
                                                           >> 2U)))
                                             ? 2U : 3U) 
                                           | (((1U 
                                                & (IData)(vlSelf->PSSFpT))
                                                ? 0U
                                                : 1U) 
                                              >> 6U))));
    vlSelf->PSzMHi[6U] = ((0xfffc003fU & vlSelf->PSzMHi[6U]) 
                          | (0xffffffc0U & ((((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 6U)))
                                               ? 6U
                                               : 7U) 
                                             << 0xcU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 4U)))
                                                 ? 4U
                                                 : 5U) 
                                               << 6U))));
    vlSelf->PSzMHi[6U] = ((0xc003ffffU & vlSelf->PSzMHi[6U]) 
                          | (0xfffc0000U & ((((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0xaU)))
                                               ? 0xaU
                                               : 0xbU) 
                                             << 0x18U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 8U)))
                                                 ? 8U
                                                 : 9U) 
                                               << 0x12U))));
    vlSelf->PSzMHi[6U] = ((0x3fffffffU & vlSelf->PSzMHi[6U]) 
                          | (((1U & (IData)((vlSelf->PSSFpT 
                                             >> 0xcU)))
                               ? 0xcU : 0xdU) << 0x1eU));
    vlSelf->PSzMHi[7U] = ((0xfffffc00U & vlSelf->PSzMHi[7U]) 
                          | (0x3fffffffU & ((0x3ffffff0U 
                                             & (((1U 
                                                  & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0xeU)))
                                                  ? 0xeU
                                                  : 0xfU) 
                                                << 4U)) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 0xcU)))
                                                 ? 0xcU
                                                 : 0xdU) 
                                               >> 2U))));
    vlSelf->PSzMHi[7U] = ((0xffc003ffU & vlSelf->PSzMHi[7U]) 
                          | (0xfffffc00U & ((((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0x12U)))
                                               ? 0x12U
                                               : 0x13U) 
                                             << 0x10U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 0x10U)))
                                                 ? 0x10U
                                                 : 0x11U) 
                                               << 0xaU))));
    vlSelf->PSzMHi[7U] = ((0x3fffffU & vlSelf->PSzMHi[7U]) 
                          | (0xffc00000U & ((((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0x16U)))
                                               ? 0x16U
                                               : 0x17U) 
                                             << 0x1cU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 0x14U)))
                                                 ? 0x14U
                                                 : 0x15U) 
                                               << 0x16U))));
    vlSelf->PSzMHi[8U] = ((0xfffffffcU & vlSelf->PSzMHi[8U]) 
                          | (0x3fffffU & ((0x3fffffU 
                                           & (((1U 
                                                & (IData)(
                                                          (vlSelf->PSSFpT 
                                                           >> 0x16U)))
                                                ? 0x16U
                                                : 0x17U) 
                                              >> 4U)) 
                                          | (((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0x14U)))
                                               ? 0x14U
                                               : 0x15U) 
                                             >> 0xaU))));
    vlSelf->PSzMHi[8U] = ((0xffffc003U & vlSelf->PSzMHi[8U]) 
                          | (0xfffffffcU & ((((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0x1aU)))
                                               ? 0x1aU
                                               : 0x1bU) 
                                             << 8U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 0x18U)))
                                                 ? 0x18U
                                                 : 0x19U) 
                                               << 2U))));
    vlSelf->PSzMHi[8U] = ((0xfc003fffU & vlSelf->PSzMHi[8U]) 
                          | (0xffffc000U & ((((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0x1eU)))
                                               ? 0x1eU
                                               : 0x1fU) 
                                             << 0x14U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 0x1cU)))
                                                 ? 0x1cU
                                                 : 0x1dU) 
                                               << 0xeU))));
    vlSelf->PSzMHi[8U] = ((0x3ffffffU & vlSelf->PSzMHi[8U]) 
                          | (((1U & (IData)((vlSelf->PSSFpT 
                                             >> 0x20U)))
                               ? 0x20U : 0x21U) << 0x1aU));
    vlSelf->PSzMHi[9U] = ((0xffffffc0U & vlSelf->PSzMHi[9U]) 
                          | (0x3ffffffU & (((1U & (IData)(
                                                          (vlSelf->PSSFpT 
                                                           >> 0x22U)))
                                             ? 0x22U
                                             : 0x23U) 
                                           | (((1U 
                                                & (IData)(
                                                          (vlSelf->PSSFpT 
                                                           >> 0x20U)))
                                                ? 0x20U
                                                : 0x21U) 
                                              >> 6U))));
    vlSelf->PSzMHi[9U] = ((0xfffc003fU & vlSelf->PSzMHi[9U]) 
                          | (0xffffffc0U & ((((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0x26U)))
                                               ? 0x26U
                                               : 0x27U) 
                                             << 0xcU) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 0x24U)))
                                                 ? 0x24U
                                                 : 0x25U) 
                                               << 6U))));
    vlSelf->PSzMHi[9U] = ((0xc003ffffU & vlSelf->PSzMHi[9U]) 
                          | (0xfffc0000U & ((((1U & (IData)(
                                                            (vlSelf->PSSFpT 
                                                             >> 0x2aU)))
                                               ? 0x2aU
                                               : 0x2bU) 
                                             << 0x18U) 
                                            | (((1U 
                                                 & (IData)(
                                                           (vlSelf->PSSFpT 
                                                            >> 0x28U)))
                                                 ? 0x28U
                                                 : 0x29U) 
                                               << 0x12U))));
    vlSelf->PSzMHi[9U] = ((0x3fffffffU & vlSelf->PSzMHi[9U]) 
                          | (((1U & (IData)((vlSelf->PSSFpT 
                                             >> 0x2cU)))
                               ? 0x2cU : 0x2dU) << 0x1eU));
    vlSelf->PSzMHi[0xaU] = ((0xfffffc00U & vlSelf->PSzMHi[0xaU]) 
                            | (0x3fffffffU & ((0x3ffffff0U 
                                               & (((1U 
                                                    & (IData)(
                                                              (vlSelf->PSSFpT 
                                                               >> 0x2eU)))
                                                    ? 0x2eU
                                                    : 0x2fU) 
                                                  << 4U)) 
                                              | (((1U 
                                                   & (IData)(
                                                             (vlSelf->PSSFpT 
                                                              >> 0x2cU)))
                                                   ? 0x2cU
                                                   : 0x2dU) 
                                                 >> 2U))));
    vlSelf->PSzMHi[0xaU] = ((0xffff03ffU & vlSelf->PSzMHi[0xaU]) 
                            | (((1U & (IData)((vlSelf->PSSFpT 
                                               >> 0x30U)))
                                 ? 0x30U : 0x31U) << 0xaU));
    vlSelf->PS8wu8 = ((0xfffffffe7fffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xcULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (3ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x1fU));
    vlSelf->PS8wu8 = ((0xfffffff9ffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x21U));
    vlSelf->PS8wu8 = ((0xffffffe7ffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x23U));
    vlSelf->PS8wu8 = ((0xffffff9fffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x25U));
    vlSelf->PS8wu8 = ((0xfffffe7fffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x27U));
    vlSelf->PS8wu8 = ((0xfffff9ffffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x29U));
    vlSelf->PS8wu8 = ((0xffffe7ffffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x2bU));
    vlSelf->PS8wu8 = ((0xffff9fffffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x2dU));
    vlSelf->PS8wu8 = ((0xfffe7fffffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x2fU));
    vlSelf->PS8wu8 = ((0xfff9ffffffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc000000000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x3000000000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x31U));
    vlSelf->PS8wu8 = ((0xffe7ffffffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc0000000000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x30000000000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x33U));
    vlSelf->PS8wu8 = ((0xff9fffffffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((((IData)(
                                                   (0ULL 
                                                    != 
                                                    (0xc00000000000ULL 
                                                     & vlSelf->PSSFpT))) 
                                           << 1U) | (IData)(
                                                            (0ULL 
                                                             != 
                                                             (0x300000000000ULL 
                                                              & vlSelf->PSSFpT)))))) 
                         << 0x35U));
    vlSelf->PS8wu8 = ((0xfe7fffffffffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)(((2U & ((IData)(
                                                         (vlSelf->PSSFpT 
                                                          >> 0x32U)) 
                                                 << 1U)) 
                                          | (IData)(
                                                    (0ULL 
                                                     != 
                                                     (0x3000000000000ULL 
                                                      & vlSelf->PSSFpT)))))) 
                         << 0x37U));
    vlSelf->PS2dxB = (0x3fU & (IData)(vlSelf->PSCfiX));
    PSyQbC = (7U & (IData)(vlSelf->PSx3li));
    PS9t0S = ((0x13fU >= (0x1ffU & (((IData)(4U) - (IData)(PSyQbC)) 
                                    << 6U))) ? (((0U 
                                                  == 
                                                  (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(PSyQbC)) 
                                                      << 6U)))
                                                  ? 0U
                                                  : 
                                                 (Vlane_e__ConstPool__PS2URe[
                                                  (((IData)(0x1fU) 
                                                    + 
                                                    (0x1ffU 
                                                     & (((IData)(4U) 
                                                         - (IData)(PSyQbC)) 
                                                        << 6U))) 
                                                   >> 5U)] 
                                                  << 
                                                  ((IData)(0x20U) 
                                                   - 
                                                   (0x1fU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSyQbC)) 
                                                       << 6U))))) 
                                                | (Vlane_e__ConstPool__PS2URe[
                                                   (0xeU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSyQbC)) 
                                                       << 1U))] 
                                                   >> 
                                                   (0x1fU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSyQbC)) 
                                                       << 6U))))
               : 0U);
    vlSelf->PSXfLK = (0x1fU & ((IData)(0xaU) - PS9t0S));
    vlSelf->PS4E6R = 0U;
    vlSelf->PSql71 = (0x1ffffffffULL & ((QData)((IData)(
                                                        (0xffffU 
                                                         & vlSelf->PSmvhX))) 
                                        << 0x11U));
    if ((1U & (IData)(vlSelf->PSMgii))) {
        vlSelf->PSXfLK = (0x1fU & ((IData)(0xfU) - 
                                   (0x3fU & (IData)(vlSelf->PSZKPP))));
        vlSelf->PSFyw2 = (3U & (IData)(vlSelf->PSGusA));
        {
            {
                {
                    {
                        if ((2U & (IData)(vlSelf->PSFyw2))) {
                            if ((1U & (IData)(vlSelf->PSFyw2))) {
                                vlSelf->PSbP2m = 0x40U;
                                goto __Vlabel16451;
                            } else {
                                vlSelf->PSbP2m = 0x20U;
                                goto __Vlabel16452;
                            }
                        } else if ((1U & (IData)(vlSelf->PSFyw2))) {
                            vlSelf->PSbP2m = 0x10U;
                            goto __Vlabel16453;
                        } else {
                            vlSelf->PSbP2m = 8U;
                            goto __Vlabel16454;
                        }
                        __Vlabel16454: ;
                    }
                    __Vlabel16453: ;
                }
                __Vlabel16452: ;
            }
            __Vlabel16451: ;
        }
        if (VL_GTES_III(1,32,32, VL_EXTENDS_II(32,6, 
                                               (0x3fU 
                                                & (IData)(vlSelf->PSZKPP))), 
                        ((vlSelf->PSbP2m - (IData)(1U)) 
                         + (1U & (IData)(vlSelf->PS85hp))))) {
            vlSelf->PSXfLK = 0U;
            vlSelf->PS4E6R = 1U;
        } else if (VL_GTS_III(1,32,32, 0xffffffffU, 
                              VL_EXTENDS_II(32,6, (0x3fU 
                                                   & (IData)(vlSelf->PSZKPP))))) {
            vlSelf->PSXfLK = 0x11U;
        }
    } else {
        vlSelf->PSPkC3 = (7U & (IData)(vlSelf->PSx3li));
        vlSelf->PSZnAM = ((0x13fU >= (0x1ffU & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSPkC3)) 
                                                   << 6U))))
                           ? (((0U == (0x1fU & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSPkC3)) 
                                                   << 6U))))
                                ? 0U : (Vlane_e__ConstPool__PS2URe[
                                        (((IData)(0x1fU) 
                                          + (0x1ffU 
                                             & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSPkC3)) 
                                                   << 6U)))) 
                                         >> 5U)] << 
                                        ((IData)(0x20U) 
                                         - (0x1fU & 
                                            ((IData)(0x20U) 
                                             + (((IData)(4U) 
                                                 - (IData)(vlSelf->PSPkC3)) 
                                                << 6U)))))) 
                              | (Vlane_e__ConstPool__PS2URe[
                                 (0xfU & (((IData)(0x20U) 
                                           + (((IData)(4U) 
                                               - (IData)(vlSelf->PSPkC3)) 
                                              << 6U)) 
                                          >> 5U))] 
                                 >> (0x1fU & ((IData)(0x20U) 
                                              + (((IData)(4U) 
                                                  - (IData)(vlSelf->PSPkC3)) 
                                                 << 6U)))))
                           : 0U);
        if ((1U & (VL_GTES_III(1,32,32, VL_EXTENDS_II(32,6, 
                                                      (0x3fU 
                                                       & (IData)(vlSelf->PSCfiX))), 
                               (VL_POWSS_III(32,32,32, (IData)(2U), vlSelf->PSZnAM, 1,0) 
                                - (IData)(1U))) | (
                                                   (~ (IData)(vlSelf->PSkTWC)) 
                                                   & ((IData)(vlSelf->PSA0Ou) 
                                                      >> 4U))))) {
            vlSelf->PSiUvo = (7U & (IData)(vlSelf->PSx3li));
            vlSelf->PSnb5Q = ((0x13fU >= (0x1ffU & 
                                          ((IData)(0x20U) 
                                           + (((IData)(4U) 
                                               - (IData)(vlSelf->PSiUvo)) 
                                              << 6U))))
                               ? (((0U == (0x1fU & 
                                           ((IData)(0x20U) 
                                            + (((IData)(4U) 
                                                - (IData)(vlSelf->PSiUvo)) 
                                               << 6U))))
                                    ? 0U : (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & ((IData)(0x20U) 
                                                    + 
                                                    (((IData)(4U) 
                                                      - (IData)(vlSelf->PSiUvo)) 
                                                     << 6U)))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & ((IData)(0x20U) 
                                                      + 
                                                      (((IData)(4U) 
                                                        - (IData)(vlSelf->PSiUvo)) 
                                                       << 6U)))))) 
                                  | (Vlane_e__ConstPool__PS2URe[
                                     (0xfU & (((IData)(0x20U) 
                                               + (((IData)(4U) 
                                                   - (IData)(vlSelf->PSiUvo)) 
                                                  << 6U)) 
                                              >> 5U))] 
                                     >> (0x1fU & ((IData)(0x20U) 
                                                  + 
                                                  (((IData)(4U) 
                                                    - (IData)(vlSelf->PSiUvo)) 
                                                   << 6U)))))
                               : 0U);
            vlSelf->PS2dxB = (0x3fU & (VL_POWSS_III(6,32,32, (IData)(2U), vlSelf->PSnb5Q, 1,0) 
                                       - (IData)(2U)));
            vlSelf->PSql71 = 0x1ffffffffULL;
            vlSelf->PS4E6R = 1U;
        } else {
            vlSelf->PSABI6 = (7U & (IData)(vlSelf->PSx3li));
            vlSelf->PSBtaP = ((0x13fU >= (0x1ffU & 
                                          (((IData)(4U) 
                                            - (IData)(vlSelf->PSABI6)) 
                                           << 6U)))
                               ? (((0U == (0x1fU & 
                                           (((IData)(4U) 
                                             - (IData)(vlSelf->PSABI6)) 
                                            << 6U)))
                                    ? 0U : (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PSABI6)) 
                                                    << 6U))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSABI6)) 
                                                      << 6U))))) 
                                  | (Vlane_e__ConstPool__PS2URe[
                                     (0xeU & (((IData)(4U) 
                                               - (IData)(vlSelf->PSABI6)) 
                                              << 1U))] 
                                     >> (0x1fU & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSABI6)) 
                                                  << 6U))))
                               : 0U);
            if ((VL_GTS_III(1,32,32, 1U, VL_EXTENDS_II(32,6, 
                                                       (0x3fU 
                                                        & (IData)(vlSelf->PSCfiX)))) 
                 & VL_GTES_III(1,32,32, VL_EXTENDS_II(32,6, 
                                                      (0x3fU 
                                                       & (IData)(vlSelf->PSCfiX))), 
                               (- vlSelf->PSBtaP)))) {
                vlSelf->PS2dxB = 0U;
                vlSelf->PSXfLK = (0x1fU & (((IData)(1U) 
                                            + (IData)(vlSelf->PSXfLK)) 
                                           - (0x3fU 
                                              & (IData)(vlSelf->PSCfiX))));
            } else {
                vlSelf->PSwVYo = (7U & (IData)(vlSelf->PSx3li));
                vlSelf->PSbhsN = ((0x13fU >= (0x1ffU 
                                              & (((IData)(4U) 
                                                  - (IData)(vlSelf->PSwVYo)) 
                                                 << 6U)))
                                   ? (((0U == (0x1fU 
                                               & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSwVYo)) 
                                                  << 6U)))
                                        ? 0U : (Vlane_e__ConstPool__PS2URe[
                                                (((IData)(0x1fU) 
                                                  + 
                                                  (0x1ffU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSwVYo)) 
                                                      << 6U))) 
                                                 >> 5U)] 
                                                << 
                                                ((IData)(0x20U) 
                                                 - 
                                                 (0x1fU 
                                                  & (((IData)(4U) 
                                                      - (IData)(vlSelf->PSwVYo)) 
                                                     << 6U))))) 
                                      | (Vlane_e__ConstPool__PS2URe[
                                         (0xeU & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSwVYo)) 
                                                  << 1U))] 
                                         >> (0x1fU 
                                             & (((IData)(4U) 
                                                 - (IData)(vlSelf->PSwVYo)) 
                                                << 6U))))
                                   : 0U);
                if (VL_LTS_III(1,32,32, VL_EXTENDS_II(32,6, 
                                                      (0x3fU 
                                                       & (IData)(vlSelf->PSCfiX))), 
                               (- vlSelf->PSbhsN))) {
                    vlSelf->PS2dxB = 0U;
                    vlSelf->PS0xDo = (7U & (IData)(vlSelf->PSx3li));
                    vlSelf->PSUHKd = ((0x13fU >= (0x1ffU 
                                                  & (((IData)(4U) 
                                                      - (IData)(vlSelf->PS0xDo)) 
                                                     << 6U)))
                                       ? (((0U == (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PS0xDo)) 
                                                      << 6U)))
                                            ? 0U : 
                                           (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PS0xDo)) 
                                                    << 6U))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PS0xDo)) 
                                                      << 6U))))) 
                                          | (Vlane_e__ConstPool__PS2URe[
                                             (0xeU 
                                              & (((IData)(4U) 
                                                  - (IData)(vlSelf->PS0xDo)) 
                                                 << 1U))] 
                                             >> (0x1fU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PS0xDo)) 
                                                    << 6U))))
                                       : 0U);
                    vlSelf->PSXfLK = (0x1fU & ((IData)(2U) 
                                               + ((IData)(vlSelf->PSXfLK) 
                                                  + vlSelf->PSUHKd)));
                }
            }
        }
    }
    vlSelf->PSXEVq = (0x3fU & (IData)(vlSelf->PSGFJO));
    PSK4i8 = (7U & (IData)(vlSelf->PSIM4T));
    PSAfsU = ((0x13fU >= (0x1ffU & (((IData)(4U) - (IData)(PSK4i8)) 
                                    << 6U))) ? (((0U 
                                                  == 
                                                  (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(PSK4i8)) 
                                                      << 6U)))
                                                  ? 0U
                                                  : 
                                                 (Vlane_e__ConstPool__PS2URe[
                                                  (((IData)(0x1fU) 
                                                    + 
                                                    (0x1ffU 
                                                     & (((IData)(4U) 
                                                         - (IData)(PSK4i8)) 
                                                        << 6U))) 
                                                   >> 5U)] 
                                                  << 
                                                  ((IData)(0x20U) 
                                                   - 
                                                   (0x1fU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSK4i8)) 
                                                       << 6U))))) 
                                                | (Vlane_e__ConstPool__PS2URe[
                                                   (0xeU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSK4i8)) 
                                                       << 1U))] 
                                                   >> 
                                                   (0x1fU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSK4i8)) 
                                                       << 6U))))
               : 0U);
    vlSelf->PSmC9h = (0x1fU & ((IData)(0xaU) - PSAfsU));
    vlSelf->PSYBrp = 0U;
    vlSelf->PSW5Ul = (0x1ffffffffULL & ((QData)((IData)(
                                                        (0xffffU 
                                                         & vlSelf->PSYjlY))) 
                                        << 0x11U));
    if ((1U & (IData)(vlSelf->PSfYx5))) {
        vlSelf->PSmC9h = (0x1fU & ((IData)(0xfU) - 
                                   (0x3fU & (IData)(vlSelf->PS6DDY))));
        vlSelf->PSI7Bi = (3U & (IData)(vlSelf->PS1MNM));
        {
            {
                {
                    {
                        if ((2U & (IData)(vlSelf->PSI7Bi))) {
                            if ((1U & (IData)(vlSelf->PSI7Bi))) {
                                vlSelf->PSl2m8 = 0x40U;
                                goto __Vlabel16455;
                            } else {
                                vlSelf->PSl2m8 = 0x20U;
                                goto __Vlabel16456;
                            }
                        } else if ((1U & (IData)(vlSelf->PSI7Bi))) {
                            vlSelf->PSl2m8 = 0x10U;
                            goto __Vlabel16457;
                        } else {
                            vlSelf->PSl2m8 = 8U;
                            goto __Vlabel16458;
                        }
                        __Vlabel16458: ;
                    }
                    __Vlabel16457: ;
                }
                __Vlabel16456: ;
            }
            __Vlabel16455: ;
        }
        if (VL_GTES_III(1,32,32, VL_EXTENDS_II(32,6, 
                                               (0x3fU 
                                                & (IData)(vlSelf->PS6DDY))), 
                        ((vlSelf->PSl2m8 - (IData)(1U)) 
                         + (1U & (IData)(vlSelf->PShAMo))))) {
            vlSelf->PSmC9h = 0U;
            vlSelf->PSYBrp = 1U;
        } else if (VL_GTS_III(1,32,32, 0xffffffffU, 
                              VL_EXTENDS_II(32,6, (0x3fU 
                                                   & (IData)(vlSelf->PS6DDY))))) {
            vlSelf->PSmC9h = 0x11U;
        }
    } else {
        vlSelf->PSSISR = (7U & (IData)(vlSelf->PSIM4T));
        vlSelf->PSEnZA = ((0x13fU >= (0x1ffU & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSSISR)) 
                                                   << 6U))))
                           ? (((0U == (0x1fU & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSSISR)) 
                                                   << 6U))))
                                ? 0U : (Vlane_e__ConstPool__PS2URe[
                                        (((IData)(0x1fU) 
                                          + (0x1ffU 
                                             & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSSISR)) 
                                                   << 6U)))) 
                                         >> 5U)] << 
                                        ((IData)(0x20U) 
                                         - (0x1fU & 
                                            ((IData)(0x20U) 
                                             + (((IData)(4U) 
                                                 - (IData)(vlSelf->PSSISR)) 
                                                << 6U)))))) 
                              | (Vlane_e__ConstPool__PS2URe[
                                 (0xfU & (((IData)(0x20U) 
                                           + (((IData)(4U) 
                                               - (IData)(vlSelf->PSSISR)) 
                                              << 6U)) 
                                          >> 5U))] 
                                 >> (0x1fU & ((IData)(0x20U) 
                                              + (((IData)(4U) 
                                                  - (IData)(vlSelf->PSSISR)) 
                                                 << 6U)))))
                           : 0U);
        if ((1U & (VL_GTES_III(1,32,32, VL_EXTENDS_II(32,6, 
                                                      (0x3fU 
                                                       & (IData)(vlSelf->PSGFJO))), 
                               (VL_POWSS_III(32,32,32, (IData)(2U), vlSelf->PSEnZA, 1,0) 
                                - (IData)(1U))) | (
                                                   (~ (IData)(vlSelf->PSBadf)) 
                                                   & ((IData)(vlSelf->PSn7Xr) 
                                                      >> 4U))))) {
            vlSelf->PScMRs = (7U & (IData)(vlSelf->PSIM4T));
            vlSelf->PSTeIB = ((0x13fU >= (0x1ffU & 
                                          ((IData)(0x20U) 
                                           + (((IData)(4U) 
                                               - (IData)(vlSelf->PScMRs)) 
                                              << 6U))))
                               ? (((0U == (0x1fU & 
                                           ((IData)(0x20U) 
                                            + (((IData)(4U) 
                                                - (IData)(vlSelf->PScMRs)) 
                                               << 6U))))
                                    ? 0U : (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & ((IData)(0x20U) 
                                                    + 
                                                    (((IData)(4U) 
                                                      - (IData)(vlSelf->PScMRs)) 
                                                     << 6U)))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & ((IData)(0x20U) 
                                                      + 
                                                      (((IData)(4U) 
                                                        - (IData)(vlSelf->PScMRs)) 
                                                       << 6U)))))) 
                                  | (Vlane_e__ConstPool__PS2URe[
                                     (0xfU & (((IData)(0x20U) 
                                               + (((IData)(4U) 
                                                   - (IData)(vlSelf->PScMRs)) 
                                                  << 6U)) 
                                              >> 5U))] 
                                     >> (0x1fU & ((IData)(0x20U) 
                                                  + 
                                                  (((IData)(4U) 
                                                    - (IData)(vlSelf->PScMRs)) 
                                                   << 6U)))))
                               : 0U);
            vlSelf->PSXEVq = (0x3fU & (VL_POWSS_III(6,32,32, (IData)(2U), vlSelf->PSTeIB, 1,0) 
                                       - (IData)(2U)));
            vlSelf->PSW5Ul = 0x1ffffffffULL;
            vlSelf->PSYBrp = 1U;
        } else {
            vlSelf->PSGrVA = (7U & (IData)(vlSelf->PSIM4T));
            vlSelf->PSAZPd = ((0x13fU >= (0x1ffU & 
                                          (((IData)(4U) 
                                            - (IData)(vlSelf->PSGrVA)) 
                                           << 6U)))
                               ? (((0U == (0x1fU & 
                                           (((IData)(4U) 
                                             - (IData)(vlSelf->PSGrVA)) 
                                            << 6U)))
                                    ? 0U : (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PSGrVA)) 
                                                    << 6U))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSGrVA)) 
                                                      << 6U))))) 
                                  | (Vlane_e__ConstPool__PS2URe[
                                     (0xeU & (((IData)(4U) 
                                               - (IData)(vlSelf->PSGrVA)) 
                                              << 1U))] 
                                     >> (0x1fU & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSGrVA)) 
                                                  << 6U))))
                               : 0U);
            if ((VL_GTS_III(1,32,32, 1U, VL_EXTENDS_II(32,6, 
                                                       (0x3fU 
                                                        & (IData)(vlSelf->PSGFJO)))) 
                 & VL_GTES_III(1,32,32, VL_EXTENDS_II(32,6, 
                                                      (0x3fU 
                                                       & (IData)(vlSelf->PSGFJO))), 
                               (- vlSelf->PSAZPd)))) {
                vlSelf->PSXEVq = 0U;
                vlSelf->PSmC9h = (0x1fU & (((IData)(1U) 
                                            + (IData)(vlSelf->PSmC9h)) 
                                           - (0x3fU 
                                              & (IData)(vlSelf->PSGFJO))));
            } else {
                vlSelf->PSzWLe = (7U & (IData)(vlSelf->PSIM4T));
                vlSelf->PSGhny = ((0x13fU >= (0x1ffU 
                                              & (((IData)(4U) 
                                                  - (IData)(vlSelf->PSzWLe)) 
                                                 << 6U)))
                                   ? (((0U == (0x1fU 
                                               & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSzWLe)) 
                                                  << 6U)))
                                        ? 0U : (Vlane_e__ConstPool__PS2URe[
                                                (((IData)(0x1fU) 
                                                  + 
                                                  (0x1ffU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSzWLe)) 
                                                      << 6U))) 
                                                 >> 5U)] 
                                                << 
                                                ((IData)(0x20U) 
                                                 - 
                                                 (0x1fU 
                                                  & (((IData)(4U) 
                                                      - (IData)(vlSelf->PSzWLe)) 
                                                     << 6U))))) 
                                      | (Vlane_e__ConstPool__PS2URe[
                                         (0xeU & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSzWLe)) 
                                                  << 1U))] 
                                         >> (0x1fU 
                                             & (((IData)(4U) 
                                                 - (IData)(vlSelf->PSzWLe)) 
                                                << 6U))))
                                   : 0U);
                if (VL_LTS_III(1,32,32, VL_EXTENDS_II(32,6, 
                                                      (0x3fU 
                                                       & (IData)(vlSelf->PSGFJO))), 
                               (- vlSelf->PSGhny))) {
                    vlSelf->PSXEVq = 0U;
                    vlSelf->PSecNT = (7U & (IData)(vlSelf->PSIM4T));
                    vlSelf->PSM9VM = ((0x13fU >= (0x1ffU 
                                                  & (((IData)(4U) 
                                                      - (IData)(vlSelf->PSecNT)) 
                                                     << 6U)))
                                       ? (((0U == (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSecNT)) 
                                                      << 6U)))
                                            ? 0U : 
                                           (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PSecNT)) 
                                                    << 6U))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSecNT)) 
                                                      << 6U))))) 
                                          | (Vlane_e__ConstPool__PS2URe[
                                             (0xeU 
                                              & (((IData)(4U) 
                                                  - (IData)(vlSelf->PSecNT)) 
                                                 << 1U))] 
                                             >> (0x1fU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PSecNT)) 
                                                    << 6U))))
                                       : 0U);
                    vlSelf->PSmC9h = (0x1fU & ((IData)(2U) 
                                               + ((IData)(vlSelf->PSmC9h) 
                                                  + vlSelf->PSM9VM)));
                }
            }
        }
    }
    vlSelf->PSwT74 = (0xfffU & vlSelf->PSnLiF);
    PSl6tO = (7U & (IData)(vlSelf->PSuhts));
    PSPq1M = ((0x13fU >= (0x1ffU & (((IData)(4U) - (IData)(PSl6tO)) 
                                    << 6U))) ? (((0U 
                                                  == 
                                                  (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(PSl6tO)) 
                                                      << 6U)))
                                                  ? 0U
                                                  : 
                                                 (Vlane_e__ConstPool__PS2URe[
                                                  (((IData)(0x1fU) 
                                                    + 
                                                    (0x1ffU 
                                                     & (((IData)(4U) 
                                                         - (IData)(PSl6tO)) 
                                                        << 6U))) 
                                                   >> 5U)] 
                                                  << 
                                                  ((IData)(0x20U) 
                                                   - 
                                                   (0x1fU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSl6tO)) 
                                                       << 6U))))) 
                                                | (Vlane_e__ConstPool__PS2URe[
                                                   (0xeU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSl6tO)) 
                                                       << 1U))] 
                                                   >> 
                                                   (0x1fU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PSl6tO)) 
                                                       << 6U))))
               : 0U);
    vlSelf->PSyDpY = (0x7fU & ((IData)(0x34U) - PSPq1M));
    vlSelf->PSiPBo = 0U;
    VL_EXTEND_WQ(129,64, PSlZls, (((QData)((IData)(
                                                   vlSelf->PSRl2r[1U])) 
                                   << 0x20U) | (QData)((IData)(
                                                               vlSelf->PSRl2r[0U]))));
    VL_SHIFTL_WWI(129,129,32, PSE2yI, PSlZls, 0x41U);
    vlSelf->PSS0B6[0U] = PSE2yI[0U];
    vlSelf->PSS0B6[1U] = PSE2yI[1U];
    vlSelf->PSS0B6[2U] = PSE2yI[2U];
    vlSelf->PSS0B6[3U] = PSE2yI[3U];
    vlSelf->PSS0B6[4U] = (1U & PSE2yI[4U]);
    if ((1U & (IData)(vlSelf->PSKWIU))) {
        vlSelf->PSyDpY = (0x7fU & ((IData)(0x3fU) - 
                                   (0xfffU & vlSelf->PSB51p)));
        vlSelf->PSBtBz = (3U & (IData)(vlSelf->PS4JRR));
        {
            {
                {
                    {
                        if ((2U & (IData)(vlSelf->PSBtBz))) {
                            if ((1U & (IData)(vlSelf->PSBtBz))) {
                                vlSelf->PS3m07 = 0x40U;
                                goto __Vlabel16459;
                            } else {
                                vlSelf->PS3m07 = 0x20U;
                                goto __Vlabel16460;
                            }
                        } else if ((1U & (IData)(vlSelf->PSBtBz))) {
                            vlSelf->PS3m07 = 0x10U;
                            goto __Vlabel16461;
                        } else {
                            vlSelf->PS3m07 = 8U;
                            goto __Vlabel16462;
                        }
                        __Vlabel16462: ;
                    }
                    __Vlabel16461: ;
                }
                __Vlabel16460: ;
            }
            __Vlabel16459: ;
        }
        if (VL_GTES_III(1,32,32, VL_EXTENDS_II(32,12, 
                                               (0xfffU 
                                                & vlSelf->PSB51p)), 
                        ((vlSelf->PS3m07 - (IData)(1U)) 
                         + (1U & (IData)(vlSelf->PS42Rs))))) {
            vlSelf->PSyDpY = 0U;
            vlSelf->PSiPBo = 1U;
        } else if (VL_GTS_III(1,32,32, 0xffffffffU, 
                              VL_EXTENDS_II(32,12, 
                                            (0xfffU 
                                             & vlSelf->PSB51p)))) {
            vlSelf->PSyDpY = 0x41U;
        }
    } else {
        vlSelf->PS2mCf = (7U & (IData)(vlSelf->PSuhts));
        vlSelf->PSQc6A = ((0x13fU >= (0x1ffU & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PS2mCf)) 
                                                   << 6U))))
                           ? (((0U == (0x1fU & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PS2mCf)) 
                                                   << 6U))))
                                ? 0U : (Vlane_e__ConstPool__PS2URe[
                                        (((IData)(0x1fU) 
                                          + (0x1ffU 
                                             & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PS2mCf)) 
                                                   << 6U)))) 
                                         >> 5U)] << 
                                        ((IData)(0x20U) 
                                         - (0x1fU & 
                                            ((IData)(0x20U) 
                                             + (((IData)(4U) 
                                                 - (IData)(vlSelf->PS2mCf)) 
                                                << 6U)))))) 
                              | (Vlane_e__ConstPool__PS2URe[
                                 (0xfU & (((IData)(0x20U) 
                                           + (((IData)(4U) 
                                               - (IData)(vlSelf->PS2mCf)) 
                                              << 6U)) 
                                          >> 5U))] 
                                 >> (0x1fU & ((IData)(0x20U) 
                                              + (((IData)(4U) 
                                                  - (IData)(vlSelf->PS2mCf)) 
                                                 << 6U)))))
                           : 0U);
        if ((1U & (VL_GTES_III(1,32,32, VL_EXTENDS_II(32,12, 
                                                      (0xfffU 
                                                       & vlSelf->PSnLiF)), 
                               (VL_POWSS_III(32,32,32, (IData)(2U), vlSelf->PSQc6A, 1,0) 
                                - (IData)(1U))) | (
                                                   (~ (IData)(vlSelf->PSN9qa)) 
                                                   & ((IData)(vlSelf->PSoAAB) 
                                                      >> 4U))))) {
            vlSelf->PSNFN8 = (7U & (IData)(vlSelf->PSuhts));
            vlSelf->PSZAop = ((0x13fU >= (0x1ffU & 
                                          ((IData)(0x20U) 
                                           + (((IData)(4U) 
                                               - (IData)(vlSelf->PSNFN8)) 
                                              << 6U))))
                               ? (((0U == (0x1fU & 
                                           ((IData)(0x20U) 
                                            + (((IData)(4U) 
                                                - (IData)(vlSelf->PSNFN8)) 
                                               << 6U))))
                                    ? 0U : (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & ((IData)(0x20U) 
                                                    + 
                                                    (((IData)(4U) 
                                                      - (IData)(vlSelf->PSNFN8)) 
                                                     << 6U)))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & ((IData)(0x20U) 
                                                      + 
                                                      (((IData)(4U) 
                                                        - (IData)(vlSelf->PSNFN8)) 
                                                       << 6U)))))) 
                                  | (Vlane_e__ConstPool__PS2URe[
                                     (0xfU & (((IData)(0x20U) 
                                               + (((IData)(4U) 
                                                   - (IData)(vlSelf->PSNFN8)) 
                                                  << 6U)) 
                                              >> 5U))] 
                                     >> (0x1fU & ((IData)(0x20U) 
                                                  + 
                                                  (((IData)(4U) 
                                                    - (IData)(vlSelf->PSNFN8)) 
                                                   << 6U)))))
                               : 0U);
            vlSelf->PSwT74 = (0xfffU & (VL_POWSS_III(12,32,32, (IData)(2U), vlSelf->PSZAop, 1,0) 
                                        - (IData)(2U)));
            vlSelf->PSS0B6[0U] = 0xffffffffU;
            vlSelf->PSS0B6[1U] = 0xffffffffU;
            vlSelf->PSS0B6[2U] = 0xffffffffU;
            vlSelf->PSS0B6[3U] = 0xffffffffU;
            vlSelf->PSS0B6[4U] = 1U;
            vlSelf->PSiPBo = 1U;
        } else {
            vlSelf->PS5W11 = (7U & (IData)(vlSelf->PSuhts));
            vlSelf->PSmb0o = ((0x13fU >= (0x1ffU & 
                                          (((IData)(4U) 
                                            - (IData)(vlSelf->PS5W11)) 
                                           << 6U)))
                               ? (((0U == (0x1fU & 
                                           (((IData)(4U) 
                                             - (IData)(vlSelf->PS5W11)) 
                                            << 6U)))
                                    ? 0U : (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PS5W11)) 
                                                    << 6U))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PS5W11)) 
                                                      << 6U))))) 
                                  | (Vlane_e__ConstPool__PS2URe[
                                     (0xeU & (((IData)(4U) 
                                               - (IData)(vlSelf->PS5W11)) 
                                              << 1U))] 
                                     >> (0x1fU & (((IData)(4U) 
                                                   - (IData)(vlSelf->PS5W11)) 
                                                  << 6U))))
                               : 0U);
            if ((VL_GTS_III(1,32,32, 1U, VL_EXTENDS_II(32,12, 
                                                       (0xfffU 
                                                        & vlSelf->PSnLiF))) 
                 & VL_GTES_III(1,32,32, VL_EXTENDS_II(32,12, 
                                                      (0xfffU 
                                                       & vlSelf->PSnLiF)), 
                               (- vlSelf->PSmb0o)))) {
                vlSelf->PSwT74 = 0U;
                vlSelf->PSyDpY = (0x7fU & (((IData)(1U) 
                                            + (IData)(vlSelf->PSyDpY)) 
                                           - (0xfffU 
                                              & vlSelf->PSnLiF)));
            } else {
                vlSelf->PSjNE4 = (7U & (IData)(vlSelf->PSuhts));
                vlSelf->PSdbgP = ((0x13fU >= (0x1ffU 
                                              & (((IData)(4U) 
                                                  - (IData)(vlSelf->PSjNE4)) 
                                                 << 6U)))
                                   ? (((0U == (0x1fU 
                                               & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSjNE4)) 
                                                  << 6U)))
                                        ? 0U : (Vlane_e__ConstPool__PS2URe[
                                                (((IData)(0x1fU) 
                                                  + 
                                                  (0x1ffU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSjNE4)) 
                                                      << 6U))) 
                                                 >> 5U)] 
                                                << 
                                                ((IData)(0x20U) 
                                                 - 
                                                 (0x1fU 
                                                  & (((IData)(4U) 
                                                      - (IData)(vlSelf->PSjNE4)) 
                                                     << 6U))))) 
                                      | (Vlane_e__ConstPool__PS2URe[
                                         (0xeU & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSjNE4)) 
                                                  << 1U))] 
                                         >> (0x1fU 
                                             & (((IData)(4U) 
                                                 - (IData)(vlSelf->PSjNE4)) 
                                                << 6U))))
                                   : 0U);
                if (VL_LTS_III(1,32,32, VL_EXTENDS_II(32,12, 
                                                      (0xfffU 
                                                       & vlSelf->PSnLiF)), 
                               (- vlSelf->PSdbgP))) {
                    vlSelf->PSwT74 = 0U;
                    vlSelf->PS7kVg = (7U & (IData)(vlSelf->PSuhts));
                    vlSelf->PSnXBL = ((0x13fU >= (0x1ffU 
                                                  & (((IData)(4U) 
                                                      - (IData)(vlSelf->PS7kVg)) 
                                                     << 6U)))
                                       ? (((0U == (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PS7kVg)) 
                                                      << 6U)))
                                            ? 0U : 
                                           (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PS7kVg)) 
                                                    << 6U))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PS7kVg)) 
                                                      << 6U))))) 
                                          | (Vlane_e__ConstPool__PS2URe[
                                             (0xeU 
                                              & (((IData)(4U) 
                                                  - (IData)(vlSelf->PS7kVg)) 
                                                 << 1U))] 
                                             >> (0x1fU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PS7kVg)) 
                                                    << 6U))))
                                       : 0U);
                    vlSelf->PSyDpY = (0x7fU & ((IData)(2U) 
                                               + ((IData)(vlSelf->PSyDpY) 
                                                  + vlSelf->PSnXBL)));
                }
            }
        }
    }
    vlSelf->PS4ptK = (0xfffU & vlSelf->PSwOG6);
    PS6zm3 = (7U & (IData)(vlSelf->PSEehP));
    PSacXn = ((0x13fU >= (0x1ffU & (((IData)(4U) - (IData)(PS6zm3)) 
                                    << 6U))) ? (((0U 
                                                  == 
                                                  (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(PS6zm3)) 
                                                      << 6U)))
                                                  ? 0U
                                                  : 
                                                 (Vlane_e__ConstPool__PS2URe[
                                                  (((IData)(0x1fU) 
                                                    + 
                                                    (0x1ffU 
                                                     & (((IData)(4U) 
                                                         - (IData)(PS6zm3)) 
                                                        << 6U))) 
                                                   >> 5U)] 
                                                  << 
                                                  ((IData)(0x20U) 
                                                   - 
                                                   (0x1fU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PS6zm3)) 
                                                       << 6U))))) 
                                                | (Vlane_e__ConstPool__PS2URe[
                                                   (0xeU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PS6zm3)) 
                                                       << 1U))] 
                                                   >> 
                                                   (0x1fU 
                                                    & (((IData)(4U) 
                                                        - (IData)(PS6zm3)) 
                                                       << 6U))))
               : 0U);
    vlSelf->PSWqXS = (0x7fU & ((IData)(0x34U) - PSacXn));
    vlSelf->PSNVtn = 0U;
    VL_EXTEND_WQ(129,64, PSButB, (((QData)((IData)(
                                                   vlSelf->PS3B9h[1U])) 
                                   << 0x20U) | (QData)((IData)(
                                                               vlSelf->PS3B9h[0U]))));
    VL_SHIFTL_WWI(129,129,32, PSfMdB, PSButB, 0x41U);
    vlSelf->PSEx6P[0U] = PSfMdB[0U];
    vlSelf->PSEx6P[1U] = PSfMdB[1U];
    vlSelf->PSEx6P[2U] = PSfMdB[2U];
    vlSelf->PSEx6P[3U] = PSfMdB[3U];
    vlSelf->PSEx6P[4U] = (1U & PSfMdB[4U]);
    if ((1U & (IData)(vlSelf->PSEUW3))) {
        vlSelf->PSWqXS = (0x7fU & ((IData)(0x3fU) - 
                                   (0xfffU & vlSelf->PS8TA9)));
        vlSelf->PSnlct = (3U & (IData)(vlSelf->PSHl8Z));
        {
            {
                {
                    {
                        if ((2U & (IData)(vlSelf->PSnlct))) {
                            if ((1U & (IData)(vlSelf->PSnlct))) {
                                vlSelf->PS8lyN = 0x40U;
                                goto __Vlabel16463;
                            } else {
                                vlSelf->PS8lyN = 0x20U;
                                goto __Vlabel16464;
                            }
                        } else if ((1U & (IData)(vlSelf->PSnlct))) {
                            vlSelf->PS8lyN = 0x10U;
                            goto __Vlabel16465;
                        } else {
                            vlSelf->PS8lyN = 8U;
                            goto __Vlabel16466;
                        }
                        __Vlabel16466: ;
                    }
                    __Vlabel16465: ;
                }
                __Vlabel16464: ;
            }
            __Vlabel16463: ;
        }
        if (VL_GTES_III(1,32,32, VL_EXTENDS_II(32,12, 
                                               (0xfffU 
                                                & vlSelf->PS8TA9)), 
                        ((vlSelf->PS8lyN - (IData)(1U)) 
                         + (1U & (IData)(vlSelf->PSBh2x))))) {
            vlSelf->PSWqXS = 0U;
            vlSelf->PSNVtn = 1U;
        } else if (VL_GTS_III(1,32,32, 0xffffffffU, 
                              VL_EXTENDS_II(32,12, 
                                            (0xfffU 
                                             & vlSelf->PS8TA9)))) {
            vlSelf->PSWqXS = 0x41U;
        }
    } else {
        vlSelf->PSijnj = (7U & (IData)(vlSelf->PSEehP));
        vlSelf->PSuJQJ = ((0x13fU >= (0x1ffU & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSijnj)) 
                                                   << 6U))))
                           ? (((0U == (0x1fU & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSijnj)) 
                                                   << 6U))))
                                ? 0U : (Vlane_e__ConstPool__PS2URe[
                                        (((IData)(0x1fU) 
                                          + (0x1ffU 
                                             & ((IData)(0x20U) 
                                                + (
                                                   ((IData)(4U) 
                                                    - (IData)(vlSelf->PSijnj)) 
                                                   << 6U)))) 
                                         >> 5U)] << 
                                        ((IData)(0x20U) 
                                         - (0x1fU & 
                                            ((IData)(0x20U) 
                                             + (((IData)(4U) 
                                                 - (IData)(vlSelf->PSijnj)) 
                                                << 6U)))))) 
                              | (Vlane_e__ConstPool__PS2URe[
                                 (0xfU & (((IData)(0x20U) 
                                           + (((IData)(4U) 
                                               - (IData)(vlSelf->PSijnj)) 
                                              << 6U)) 
                                          >> 5U))] 
                                 >> (0x1fU & ((IData)(0x20U) 
                                              + (((IData)(4U) 
                                                  - (IData)(vlSelf->PSijnj)) 
                                                 << 6U)))))
                           : 0U);
        if ((1U & (VL_GTES_III(1,32,32, VL_EXTENDS_II(32,12, 
                                                      (0xfffU 
                                                       & vlSelf->PSwOG6)), 
                               (VL_POWSS_III(32,32,32, (IData)(2U), vlSelf->PSuJQJ, 1,0) 
                                - (IData)(1U))) | (
                                                   (~ (IData)(vlSelf->PSihnm)) 
                                                   & ((IData)(vlSelf->PSDTcc) 
                                                      >> 4U))))) {
            vlSelf->PSO3AI = (7U & (IData)(vlSelf->PSEehP));
            vlSelf->PSFbUR = ((0x13fU >= (0x1ffU & 
                                          ((IData)(0x20U) 
                                           + (((IData)(4U) 
                                               - (IData)(vlSelf->PSO3AI)) 
                                              << 6U))))
                               ? (((0U == (0x1fU & 
                                           ((IData)(0x20U) 
                                            + (((IData)(4U) 
                                                - (IData)(vlSelf->PSO3AI)) 
                                               << 6U))))
                                    ? 0U : (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & ((IData)(0x20U) 
                                                    + 
                                                    (((IData)(4U) 
                                                      - (IData)(vlSelf->PSO3AI)) 
                                                     << 6U)))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & ((IData)(0x20U) 
                                                      + 
                                                      (((IData)(4U) 
                                                        - (IData)(vlSelf->PSO3AI)) 
                                                       << 6U)))))) 
                                  | (Vlane_e__ConstPool__PS2URe[
                                     (0xfU & (((IData)(0x20U) 
                                               + (((IData)(4U) 
                                                   - (IData)(vlSelf->PSO3AI)) 
                                                  << 6U)) 
                                              >> 5U))] 
                                     >> (0x1fU & ((IData)(0x20U) 
                                                  + 
                                                  (((IData)(4U) 
                                                    - (IData)(vlSelf->PSO3AI)) 
                                                   << 6U)))))
                               : 0U);
            vlSelf->PS4ptK = (0xfffU & (VL_POWSS_III(12,32,32, (IData)(2U), vlSelf->PSFbUR, 1,0) 
                                        - (IData)(2U)));
            vlSelf->PSEx6P[0U] = 0xffffffffU;
            vlSelf->PSEx6P[1U] = 0xffffffffU;
            vlSelf->PSEx6P[2U] = 0xffffffffU;
            vlSelf->PSEx6P[3U] = 0xffffffffU;
            vlSelf->PSEx6P[4U] = 1U;
            vlSelf->PSNVtn = 1U;
        } else {
            vlSelf->PSUgAX = (7U & (IData)(vlSelf->PSEehP));
            vlSelf->PSFFLE = ((0x13fU >= (0x1ffU & 
                                          (((IData)(4U) 
                                            - (IData)(vlSelf->PSUgAX)) 
                                           << 6U)))
                               ? (((0U == (0x1fU & 
                                           (((IData)(4U) 
                                             - (IData)(vlSelf->PSUgAX)) 
                                            << 6U)))
                                    ? 0U : (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PSUgAX)) 
                                                    << 6U))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSUgAX)) 
                                                      << 6U))))) 
                                  | (Vlane_e__ConstPool__PS2URe[
                                     (0xeU & (((IData)(4U) 
                                               - (IData)(vlSelf->PSUgAX)) 
                                              << 1U))] 
                                     >> (0x1fU & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSUgAX)) 
                                                  << 6U))))
                               : 0U);
            if ((VL_GTS_III(1,32,32, 1U, VL_EXTENDS_II(32,12, 
                                                       (0xfffU 
                                                        & vlSelf->PSwOG6))) 
                 & VL_GTES_III(1,32,32, VL_EXTENDS_II(32,12, 
                                                      (0xfffU 
                                                       & vlSelf->PSwOG6)), 
                               (- vlSelf->PSFFLE)))) {
                vlSelf->PS4ptK = 0U;
                vlSelf->PSWqXS = (0x7fU & (((IData)(1U) 
                                            + (IData)(vlSelf->PSWqXS)) 
                                           - (0xfffU 
                                              & vlSelf->PSwOG6)));
            } else {
                vlSelf->PSpATE = (7U & (IData)(vlSelf->PSEehP));
                vlSelf->PS9Zn8 = ((0x13fU >= (0x1ffU 
                                              & (((IData)(4U) 
                                                  - (IData)(vlSelf->PSpATE)) 
                                                 << 6U)))
                                   ? (((0U == (0x1fU 
                                               & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSpATE)) 
                                                  << 6U)))
                                        ? 0U : (Vlane_e__ConstPool__PS2URe[
                                                (((IData)(0x1fU) 
                                                  + 
                                                  (0x1ffU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSpATE)) 
                                                      << 6U))) 
                                                 >> 5U)] 
                                                << 
                                                ((IData)(0x20U) 
                                                 - 
                                                 (0x1fU 
                                                  & (((IData)(4U) 
                                                      - (IData)(vlSelf->PSpATE)) 
                                                     << 6U))))) 
                                      | (Vlane_e__ConstPool__PS2URe[
                                         (0xeU & (((IData)(4U) 
                                                   - (IData)(vlSelf->PSpATE)) 
                                                  << 1U))] 
                                         >> (0x1fU 
                                             & (((IData)(4U) 
                                                 - (IData)(vlSelf->PSpATE)) 
                                                << 6U))))
                                   : 0U);
                if (VL_LTS_III(1,32,32, VL_EXTENDS_II(32,12, 
                                                      (0xfffU 
                                                       & vlSelf->PSwOG6)), 
                               (- vlSelf->PS9Zn8))) {
                    vlSelf->PS4ptK = 0U;
                    vlSelf->PSdFAs = (7U & (IData)(vlSelf->PSEehP));
                    vlSelf->PSEHUY = ((0x13fU >= (0x1ffU 
                                                  & (((IData)(4U) 
                                                      - (IData)(vlSelf->PSdFAs)) 
                                                     << 6U)))
                                       ? (((0U == (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSdFAs)) 
                                                      << 6U)))
                                            ? 0U : 
                                           (Vlane_e__ConstPool__PS2URe[
                                            (((IData)(0x1fU) 
                                              + (0x1ffU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PSdFAs)) 
                                                    << 6U))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & (((IData)(4U) 
                                                       - (IData)(vlSelf->PSdFAs)) 
                                                      << 6U))))) 
                                          | (Vlane_e__ConstPool__PS2URe[
                                             (0xeU 
                                              & (((IData)(4U) 
                                                  - (IData)(vlSelf->PSdFAs)) 
                                                 << 1U))] 
                                             >> (0x1fU 
                                                 & (((IData)(4U) 
                                                     - (IData)(vlSelf->PSdFAs)) 
                                                    << 6U))))
                                       : 0U);
                    vlSelf->PSWqXS = (0x7fU & ((IData)(2U) 
                                               + ((IData)(vlSelf->PSWqXS) 
                                                  + vlSelf->PSEHUY)));
                }
            }
        }
    }
    vlSelf->PSIR05 = ((0xfffffffeU & vlSelf->PSIR05) 
                      | (IData)((0U != (6U & vlSelf->PSIR05))));
    vlSelf->PSIR05 = ((0xfffffffdU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x18U & vlSelf->PSIR05))) 
                         << 1U));
    vlSelf->PSIR05 = ((0xfffffffbU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x60U & vlSelf->PSIR05))) 
                         << 2U));
    vlSelf->PSIR05 = ((0xfffffff7U & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x180U & vlSelf->PSIR05))) 
                         << 3U));
    vlSelf->PSIR05 = ((0xffffffefU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x600U & vlSelf->PSIR05))) 
                         << 4U));
    vlSelf->PSIR05 = ((0xffffffdfU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x1800U & vlSelf->PSIR05))) 
                         << 5U));
    vlSelf->PSIR05 = ((0xffffffbfU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x6000U & vlSelf->PSIR05))) 
                         << 6U));
    vlSelf->PSIR05 = ((0xffffff7fU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x18000U & vlSelf->PSIR05))) 
                         << 7U));
    vlSelf->PSIR05 = ((0xfffffeffU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x60000U & vlSelf->PSIR05))) 
                         << 8U));
    vlSelf->PSIR05 = ((0xfffffdffU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x180000U 
                                         & vlSelf->PSIR05))) 
                         << 9U));
    vlSelf->PSIR05 = ((0xfffffbffU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x600000U 
                                         & vlSelf->PSIR05))) 
                         << 0xaU));
    vlSelf->PSIR05 = ((0xfffff7ffU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x1800000U 
                                         & vlSelf->PSIR05))) 
                         << 0xbU));
    vlSelf->PSIR05 = ((0xffffefffU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x6000000U 
                                         & vlSelf->PSIR05))) 
                         << 0xcU));
    vlSelf->PSIR05 = ((0xffffdfffU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x18000000U 
                                         & vlSelf->PSIR05))) 
                         << 0xdU));
    vlSelf->PSIR05 = ((0xffffbfffU & vlSelf->PSIR05) 
                      | ((IData)((0U != (0x60000000U 
                                         & vlSelf->PSIR05))) 
                         << 0xeU));
    vlSelf->PSI7t6[0U] = ((0xffffffe0U & vlSelf->PSI7t6[0U]) 
                          | (0x1fU & ((2U & vlSelf->PSIR05)
                                       ? ((vlSelf->PSI7t6[0U] 
                                           << 0x1bU) 
                                          | (vlSelf->PSI7t6[0U] 
                                             >> 5U))
                                       : ((vlSelf->PSI7t6[0U] 
                                           << 0x16U) 
                                          | (vlSelf->PSI7t6[0U] 
                                             >> 0xaU)))));
    vlSelf->PSI7t6[0U] = ((0xfffffc1fU & vlSelf->PSI7t6[0U]) 
                          | (0x3e0U & (((8U & vlSelf->PSIR05)
                                         ? ((vlSelf->PSI7t6[0U] 
                                             << 0x11U) 
                                            | (vlSelf->PSI7t6[0U] 
                                               >> 0xfU))
                                         : ((vlSelf->PSI7t6[0U] 
                                             << 0xcU) 
                                            | (vlSelf->PSI7t6[0U] 
                                               >> 0x14U))) 
                                       << 5U)));
    vlSelf->PSI7t6[0U] = ((0xffff83ffU & vlSelf->PSI7t6[0U]) 
                          | (0x7c00U & (((0x20U & vlSelf->PSIR05)
                                          ? ((vlSelf->PSI7t6[0U] 
                                              << 7U) 
                                             | (vlSelf->PSI7t6[0U] 
                                                >> 0x19U))
                                          : ((vlSelf->PSI7t6[1U] 
                                              << 2U) 
                                             | (vlSelf->PSI7t6[0U] 
                                                >> 0x1eU))) 
                                        << 0xaU)));
    vlSelf->PSI7t6[0U] = ((0xfff07fffU & vlSelf->PSI7t6[0U]) 
                          | (0xf8000U & (((0x80U & vlSelf->PSIR05)
                                           ? ((vlSelf->PSI7t6[1U] 
                                               << 0x1dU) 
                                              | (vlSelf->PSI7t6[1U] 
                                                 >> 3U))
                                           : ((vlSelf->PSI7t6[1U] 
                                               << 0x18U) 
                                              | (vlSelf->PSI7t6[1U] 
                                                 >> 8U))) 
                                         << 0xfU)));
    vlSelf->PSI7t6[0U] = ((0xfe0fffffU & vlSelf->PSI7t6[0U]) 
                          | (0x1f00000U & (((0x200U 
                                             & vlSelf->PSIR05)
                                             ? ((vlSelf->PSI7t6[1U] 
                                                 << 0x13U) 
                                                | (vlSelf->PSI7t6[1U] 
                                                   >> 0xdU))
                                             : ((vlSelf->PSI7t6[1U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSI7t6[1U] 
                                                   >> 0x12U))) 
                                           << 0x14U)));
    vlSelf->PSI7t6[0U] = ((0xc1ffffffU & vlSelf->PSI7t6[0U]) 
                          | (0x3e000000U & (((0x800U 
                                              & vlSelf->PSIR05)
                                              ? ((vlSelf->PSI7t6[1U] 
                                                  << 9U) 
                                                 | (vlSelf->PSI7t6[1U] 
                                                    >> 0x17U))
                                              : ((vlSelf->PSI7t6[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSI7t6[1U] 
                                                    >> 0x1cU))) 
                                            << 0x19U)));
    PS9yPE = (0x1fU & ((0x2000U & vlSelf->PSIR05) ? 
                       ((vlSelf->PSI7t6[2U] << 0x1fU) 
                        | (vlSelf->PSI7t6[2U] >> 1U))
                        : ((vlSelf->PSI7t6[2U] << 0x1aU) 
                           | (vlSelf->PSI7t6[2U] >> 6U))));
    vlSelf->PSI7t6[0U] = ((0x3fffffffU & vlSelf->PSI7t6[0U]) 
                          | (((0x2000U & vlSelf->PSIR05)
                               ? ((vlSelf->PSI7t6[2U] 
                                   << 0x1fU) | (vlSelf->PSI7t6[2U] 
                                                >> 1U))
                               : ((vlSelf->PSI7t6[2U] 
                                   << 0x1aU) | (vlSelf->PSI7t6[2U] 
                                                >> 6U))) 
                             << 0x1eU));
    vlSelf->PSI7t6[1U] = ((0xfffffff8U & vlSelf->PSI7t6[1U]) 
                          | (PS9yPE >> 2U));
    vlSelf->PSI7t6[1U] = ((0xffffff07U & vlSelf->PSI7t6[1U]) 
                          | (0xf8U & (((0x8000U & vlSelf->PSIR05)
                                        ? ((vlSelf->PSI7t6[2U] 
                                            << 0x15U) 
                                           | (vlSelf->PSI7t6[2U] 
                                              >> 0xbU))
                                        : ((vlSelf->PSI7t6[2U] 
                                            << 0x10U) 
                                           | (vlSelf->PSI7t6[2U] 
                                              >> 0x10U))) 
                                      << 3U)));
    vlSelf->PSI7t6[1U] = ((0xffffe0ffU & vlSelf->PSI7t6[1U]) 
                          | (0x1f00U & (((0x20000U 
                                          & vlSelf->PSIR05)
                                          ? ((vlSelf->PSI7t6[2U] 
                                              << 0xbU) 
                                             | (vlSelf->PSI7t6[2U] 
                                                >> 0x15U))
                                          : ((vlSelf->PSI7t6[2U] 
                                              << 6U) 
                                             | (vlSelf->PSI7t6[2U] 
                                                >> 0x1aU))) 
                                        << 8U)));
    vlSelf->PSI7t6[1U] = ((0xfffc1fffU & vlSelf->PSI7t6[1U]) 
                          | (0x3e000U & (((0x80000U 
                                           & vlSelf->PSIR05)
                                           ? ((vlSelf->PSI7t6[3U] 
                                               << 1U) 
                                              | (vlSelf->PSI7t6[2U] 
                                                 >> 0x1fU))
                                           : ((vlSelf->PSI7t6[3U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSI7t6[3U] 
                                                 >> 4U))) 
                                         << 0xdU)));
    vlSelf->PSI7t6[1U] = ((0xff83ffffU & vlSelf->PSI7t6[1U]) 
                          | (0x7c0000U & (((0x200000U 
                                            & vlSelf->PSIR05)
                                            ? ((vlSelf->PSI7t6[3U] 
                                                << 0x17U) 
                                               | (vlSelf->PSI7t6[3U] 
                                                  >> 9U))
                                            : ((vlSelf->PSI7t6[3U] 
                                                << 0x12U) 
                                               | (vlSelf->PSI7t6[3U] 
                                                  >> 0xeU))) 
                                          << 0x12U)));
    vlSelf->PSI7t6[1U] = ((0xf07fffffU & vlSelf->PSI7t6[1U]) 
                          | (0xf800000U & (((0x800000U 
                                             & vlSelf->PSIR05)
                                             ? ((vlSelf->PSI7t6[3U] 
                                                 << 0xdU) 
                                                | (vlSelf->PSI7t6[3U] 
                                                   >> 0x13U))
                                             : ((vlSelf->PSI7t6[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSI7t6[3U] 
                                                   >> 0x18U))) 
                                           << 0x17U)));
    PSlLZg = (0x1fU & ((0x2000000U & vlSelf->PSIR05)
                        ? ((vlSelf->PSI7t6[4U] << 3U) 
                           | (vlSelf->PSI7t6[3U] >> 0x1dU))
                        : ((vlSelf->PSI7t6[4U] << 0x1eU) 
                           | (vlSelf->PSI7t6[4U] >> 2U))));
    vlSelf->PSI7t6[1U] = ((0xfffffffU & vlSelf->PSI7t6[1U]) 
                          | (((0x2000000U & vlSelf->PSIR05)
                               ? ((vlSelf->PSI7t6[4U] 
                                   << 3U) | (vlSelf->PSI7t6[3U] 
                                             >> 0x1dU))
                               : ((vlSelf->PSI7t6[4U] 
                                   << 0x1eU) | (vlSelf->PSI7t6[4U] 
                                                >> 2U))) 
                             << 0x1cU));
    vlSelf->PSI7t6[2U] = ((0xfffffffeU & vlSelf->PSI7t6[2U]) 
                          | (PSlLZg >> 4U));
    vlSelf->PSI7t6[2U] = ((0xffffffc1U & vlSelf->PSI7t6[2U]) 
                          | (0x3eU & (((0x8000000U 
                                        & vlSelf->PSIR05)
                                        ? ((vlSelf->PSI7t6[4U] 
                                            << 0x19U) 
                                           | (vlSelf->PSI7t6[4U] 
                                              >> 7U))
                                        : ((vlSelf->PSI7t6[4U] 
                                            << 0x14U) 
                                           | (vlSelf->PSI7t6[4U] 
                                              >> 0xcU))) 
                                      << 1U)));
    vlSelf->PSI7t6[2U] = ((0xfffff83fU & vlSelf->PSI7t6[2U]) 
                          | (0x7c0U & (((0x20000000U 
                                         & vlSelf->PSIR05)
                                         ? ((vlSelf->PSI7t6[4U] 
                                             << 0xfU) 
                                            | (vlSelf->PSI7t6[4U] 
                                               >> 0x11U))
                                         : ((vlSelf->PSI7t6[4U] 
                                             << 0xaU) 
                                            | (vlSelf->PSI7t6[4U] 
                                               >> 0x16U))) 
                                       << 6U)));
    vlSelf->PSM0kR = (0x7fU & ((VL_GTES_III(1,32,32, 0U, 
                                            VL_EXTENDS_II(32,7, 
                                                          (0x7fU 
                                                           & (IData)(vlSelf->PSn9ZS)))) 
                                | ((IData)(vlSelf->PS5kRx) 
                                   & VL_GTES_III(1,32,32, 2U, 
                                                 VL_EXTENDS_II(32,7, 
                                                               (0x7fU 
                                                                & (IData)(vlSelf->PSn9ZS))))))
                                ? ((VL_LTES_III(1,32,32, 0U, 
                                                ((IData)(1U) 
                                                 + 
                                                 (VL_EXTENDS_II(32,7, 
                                                                (0x7fU 
                                                                 & (IData)(vlSelf->PSRNBR))) 
                                                  - 
                                                  VL_EXTENDS_II(32,6, 
                                                                (0x1fU 
                                                                 & vlSelf->PSI7t6[0U]))))) 
                                    & vlSelf->PSIR05)
                                    ? ((IData)(1U) 
                                       + (VL_EXTENDS_II(7,7, 
                                                        (0x7fU 
                                                         & (IData)(vlSelf->PSRNBR))) 
                                          - VL_EXTENDS_II(7,6, 
                                                          (0x1fU 
                                                           & vlSelf->PSI7t6[0U]))))
                                    : 0U) : (IData)(vlSelf->PSHGur)));
    vlSelf->PSPkU5 = (0x3fffffffffULL & ((0x1fffffffffULL 
                                          & (((QData)((IData)(
                                                              vlSelf->PSSUwc[1U])) 
                                              << 0x20U) 
                                             | (QData)((IData)(
                                                               vlSelf->PSSUwc[0U])))) 
                                         << (0x3fU 
                                             & ((VL_GTES_III(1,32,32, 0U, 
                                                             VL_EXTENDS_II(32,7, 
                                                                           (0x7fU 
                                                                            & (IData)(vlSelf->PSn9ZS)))) 
                                                 | ((IData)(vlSelf->PS5kRx) 
                                                    & VL_GTES_III(1,32,32, 2U, 
                                                                  VL_EXTENDS_II(32,7, 
                                                                                (0x7fU 
                                                                                & (IData)(vlSelf->PSn9ZS))))))
                                                 ? 
                                                ((VL_LTES_III(1,32,32, 0U, 
                                                              ((IData)(1U) 
                                                               + 
                                                               (VL_EXTENDS_II(32,7, 
                                                                              (0x7fU 
                                                                               & (IData)(vlSelf->PSRNBR))) 
                                                                - 
                                                                VL_EXTENDS_II(32,6, 
                                                                              (0x1fU 
                                                                               & vlSelf->PSI7t6[0U]))))) 
                                                  & vlSelf->PSIR05)
                                                  ? 
                                                 ((IData)(0xdU) 
                                                  + 
                                                  (0x1fU 
                                                   & vlSelf->PSI7t6[0U]))
                                                  : 
                                                 ((IData)(0xdU) 
                                                  + 
                                                  VL_EXTENDS_II(6,7, 
                                                                (0x7fU 
                                                                 & (IData)(vlSelf->PSRNBR)))))
                                                 : (IData)(vlSelf->PSz0ic)))));
    vlSelf->PSHHWZ = ((0xfffffffeU & vlSelf->PSHHWZ) 
                      | (IData)((0U != (6U & vlSelf->PSHHWZ))));
    vlSelf->PSHHWZ = ((0xfffffffdU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x18U & vlSelf->PSHHWZ))) 
                         << 1U));
    vlSelf->PSHHWZ = ((0xfffffffbU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x60U & vlSelf->PSHHWZ))) 
                         << 2U));
    vlSelf->PSHHWZ = ((0xfffffff7U & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x180U & vlSelf->PSHHWZ))) 
                         << 3U));
    vlSelf->PSHHWZ = ((0xffffffefU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x600U & vlSelf->PSHHWZ))) 
                         << 4U));
    vlSelf->PSHHWZ = ((0xffffffdfU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x1800U & vlSelf->PSHHWZ))) 
                         << 5U));
    vlSelf->PSHHWZ = ((0xffffffbfU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x6000U & vlSelf->PSHHWZ))) 
                         << 6U));
    vlSelf->PSHHWZ = ((0xffffff7fU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x18000U & vlSelf->PSHHWZ))) 
                         << 7U));
    vlSelf->PSHHWZ = ((0xfffffeffU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x60000U & vlSelf->PSHHWZ))) 
                         << 8U));
    vlSelf->PSHHWZ = ((0xfffffdffU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x180000U 
                                         & vlSelf->PSHHWZ))) 
                         << 9U));
    vlSelf->PSHHWZ = ((0xfffffbffU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x600000U 
                                         & vlSelf->PSHHWZ))) 
                         << 0xaU));
    vlSelf->PSHHWZ = ((0xfffff7ffU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x1800000U 
                                         & vlSelf->PSHHWZ))) 
                         << 0xbU));
    vlSelf->PSHHWZ = ((0xffffefffU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x6000000U 
                                         & vlSelf->PSHHWZ))) 
                         << 0xcU));
    vlSelf->PSHHWZ = ((0xffffdfffU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x18000000U 
                                         & vlSelf->PSHHWZ))) 
                         << 0xdU));
    vlSelf->PSHHWZ = ((0xffffbfffU & vlSelf->PSHHWZ) 
                      | ((IData)((0U != (0x60000000U 
                                         & vlSelf->PSHHWZ))) 
                         << 0xeU));
    vlSelf->PS4e1r[0U] = ((0xffffffe0U & vlSelf->PS4e1r[0U]) 
                          | (0x1fU & ((2U & vlSelf->PSHHWZ)
                                       ? ((vlSelf->PS4e1r[0U] 
                                           << 0x1bU) 
                                          | (vlSelf->PS4e1r[0U] 
                                             >> 5U))
                                       : ((vlSelf->PS4e1r[0U] 
                                           << 0x16U) 
                                          | (vlSelf->PS4e1r[0U] 
                                             >> 0xaU)))));
    vlSelf->PS4e1r[0U] = ((0xfffffc1fU & vlSelf->PS4e1r[0U]) 
                          | (0x3e0U & (((8U & vlSelf->PSHHWZ)
                                         ? ((vlSelf->PS4e1r[0U] 
                                             << 0x11U) 
                                            | (vlSelf->PS4e1r[0U] 
                                               >> 0xfU))
                                         : ((vlSelf->PS4e1r[0U] 
                                             << 0xcU) 
                                            | (vlSelf->PS4e1r[0U] 
                                               >> 0x14U))) 
                                       << 5U)));
    vlSelf->PS4e1r[0U] = ((0xffff83ffU & vlSelf->PS4e1r[0U]) 
                          | (0x7c00U & (((0x20U & vlSelf->PSHHWZ)
                                          ? ((vlSelf->PS4e1r[0U] 
                                              << 7U) 
                                             | (vlSelf->PS4e1r[0U] 
                                                >> 0x19U))
                                          : ((vlSelf->PS4e1r[1U] 
                                              << 2U) 
                                             | (vlSelf->PS4e1r[0U] 
                                                >> 0x1eU))) 
                                        << 0xaU)));
    vlSelf->PS4e1r[0U] = ((0xfff07fffU & vlSelf->PS4e1r[0U]) 
                          | (0xf8000U & (((0x80U & vlSelf->PSHHWZ)
                                           ? ((vlSelf->PS4e1r[1U] 
                                               << 0x1dU) 
                                              | (vlSelf->PS4e1r[1U] 
                                                 >> 3U))
                                           : ((vlSelf->PS4e1r[1U] 
                                               << 0x18U) 
                                              | (vlSelf->PS4e1r[1U] 
                                                 >> 8U))) 
                                         << 0xfU)));
    vlSelf->PS4e1r[0U] = ((0xfe0fffffU & vlSelf->PS4e1r[0U]) 
                          | (0x1f00000U & (((0x200U 
                                             & vlSelf->PSHHWZ)
                                             ? ((vlSelf->PS4e1r[1U] 
                                                 << 0x13U) 
                                                | (vlSelf->PS4e1r[1U] 
                                                   >> 0xdU))
                                             : ((vlSelf->PS4e1r[1U] 
                                                 << 0xeU) 
                                                | (vlSelf->PS4e1r[1U] 
                                                   >> 0x12U))) 
                                           << 0x14U)));
    vlSelf->PS4e1r[0U] = ((0xc1ffffffU & vlSelf->PS4e1r[0U]) 
                          | (0x3e000000U & (((0x800U 
                                              & vlSelf->PSHHWZ)
                                              ? ((vlSelf->PS4e1r[1U] 
                                                  << 9U) 
                                                 | (vlSelf->PS4e1r[1U] 
                                                    >> 0x17U))
                                              : ((vlSelf->PS4e1r[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PS4e1r[1U] 
                                                    >> 0x1cU))) 
                                            << 0x19U)));
    PS1QET = (0x1fU & ((0x2000U & vlSelf->PSHHWZ) ? 
                       ((vlSelf->PS4e1r[2U] << 0x1fU) 
                        | (vlSelf->PS4e1r[2U] >> 1U))
                        : ((vlSelf->PS4e1r[2U] << 0x1aU) 
                           | (vlSelf->PS4e1r[2U] >> 6U))));
    vlSelf->PS4e1r[0U] = ((0x3fffffffU & vlSelf->PS4e1r[0U]) 
                          | (((0x2000U & vlSelf->PSHHWZ)
                               ? ((vlSelf->PS4e1r[2U] 
                                   << 0x1fU) | (vlSelf->PS4e1r[2U] 
                                                >> 1U))
                               : ((vlSelf->PS4e1r[2U] 
                                   << 0x1aU) | (vlSelf->PS4e1r[2U] 
                                                >> 6U))) 
                             << 0x1eU));
    vlSelf->PS4e1r[1U] = ((0xfffffff8U & vlSelf->PS4e1r[1U]) 
                          | (PS1QET >> 2U));
    vlSelf->PS4e1r[1U] = ((0xffffff07U & vlSelf->PS4e1r[1U]) 
                          | (0xf8U & (((0x8000U & vlSelf->PSHHWZ)
                                        ? ((vlSelf->PS4e1r[2U] 
                                            << 0x15U) 
                                           | (vlSelf->PS4e1r[2U] 
                                              >> 0xbU))
                                        : ((vlSelf->PS4e1r[2U] 
                                            << 0x10U) 
                                           | (vlSelf->PS4e1r[2U] 
                                              >> 0x10U))) 
                                      << 3U)));
    vlSelf->PS4e1r[1U] = ((0xffffe0ffU & vlSelf->PS4e1r[1U]) 
                          | (0x1f00U & (((0x20000U 
                                          & vlSelf->PSHHWZ)
                                          ? ((vlSelf->PS4e1r[2U] 
                                              << 0xbU) 
                                             | (vlSelf->PS4e1r[2U] 
                                                >> 0x15U))
                                          : ((vlSelf->PS4e1r[2U] 
                                              << 6U) 
                                             | (vlSelf->PS4e1r[2U] 
                                                >> 0x1aU))) 
                                        << 8U)));
    vlSelf->PS4e1r[1U] = ((0xfffc1fffU & vlSelf->PS4e1r[1U]) 
                          | (0x3e000U & (((0x80000U 
                                           & vlSelf->PSHHWZ)
                                           ? ((vlSelf->PS4e1r[3U] 
                                               << 1U) 
                                              | (vlSelf->PS4e1r[2U] 
                                                 >> 0x1fU))
                                           : ((vlSelf->PS4e1r[3U] 
                                               << 0x1cU) 
                                              | (vlSelf->PS4e1r[3U] 
                                                 >> 4U))) 
                                         << 0xdU)));
    vlSelf->PS4e1r[1U] = ((0xff83ffffU & vlSelf->PS4e1r[1U]) 
                          | (0x7c0000U & (((0x200000U 
                                            & vlSelf->PSHHWZ)
                                            ? ((vlSelf->PS4e1r[3U] 
                                                << 0x17U) 
                                               | (vlSelf->PS4e1r[3U] 
                                                  >> 9U))
                                            : ((vlSelf->PS4e1r[3U] 
                                                << 0x12U) 
                                               | (vlSelf->PS4e1r[3U] 
                                                  >> 0xeU))) 
                                          << 0x12U)));
    vlSelf->PS4e1r[1U] = ((0xf07fffffU & vlSelf->PS4e1r[1U]) 
                          | (0xf800000U & (((0x800000U 
                                             & vlSelf->PSHHWZ)
                                             ? ((vlSelf->PS4e1r[3U] 
                                                 << 0xdU) 
                                                | (vlSelf->PS4e1r[3U] 
                                                   >> 0x13U))
                                             : ((vlSelf->PS4e1r[3U] 
                                                 << 8U) 
                                                | (vlSelf->PS4e1r[3U] 
                                                   >> 0x18U))) 
                                           << 0x17U)));
    PSwiA0 = (0x1fU & ((0x2000000U & vlSelf->PSHHWZ)
                        ? ((vlSelf->PS4e1r[4U] << 3U) 
                           | (vlSelf->PS4e1r[3U] >> 0x1dU))
                        : ((vlSelf->PS4e1r[4U] << 0x1eU) 
                           | (vlSelf->PS4e1r[4U] >> 2U))));
    vlSelf->PS4e1r[1U] = ((0xfffffffU & vlSelf->PS4e1r[1U]) 
                          | (((0x2000000U & vlSelf->PSHHWZ)
                               ? ((vlSelf->PS4e1r[4U] 
                                   << 3U) | (vlSelf->PS4e1r[3U] 
                                             >> 0x1dU))
                               : ((vlSelf->PS4e1r[4U] 
                                   << 0x1eU) | (vlSelf->PS4e1r[4U] 
                                                >> 2U))) 
                             << 0x1cU));
    vlSelf->PS4e1r[2U] = ((0xfffffffeU & vlSelf->PS4e1r[2U]) 
                          | (PSwiA0 >> 4U));
    vlSelf->PS4e1r[2U] = ((0xffffffc1U & vlSelf->PS4e1r[2U]) 
                          | (0x3eU & (((0x8000000U 
                                        & vlSelf->PSHHWZ)
                                        ? ((vlSelf->PS4e1r[4U] 
                                            << 0x19U) 
                                           | (vlSelf->PS4e1r[4U] 
                                              >> 7U))
                                        : ((vlSelf->PS4e1r[4U] 
                                            << 0x14U) 
                                           | (vlSelf->PS4e1r[4U] 
                                              >> 0xcU))) 
                                      << 1U)));
    vlSelf->PS4e1r[2U] = ((0xfffff83fU & vlSelf->PS4e1r[2U]) 
                          | (0x7c0U & (((0x20000000U 
                                         & vlSelf->PSHHWZ)
                                         ? ((vlSelf->PS4e1r[4U] 
                                             << 0xfU) 
                                            | (vlSelf->PS4e1r[4U] 
                                               >> 0x11U))
                                         : ((vlSelf->PS4e1r[4U] 
                                             << 0xaU) 
                                            | (vlSelf->PS4e1r[4U] 
                                               >> 0x16U))) 
                                       << 6U)));
    vlSelf->PS3e4A = (0x7fU & ((VL_GTES_III(1,32,32, 0U, 
                                            VL_EXTENDS_II(32,7, 
                                                          (0x7fU 
                                                           & (IData)(vlSelf->PSFdCz)))) 
                                | ((IData)(vlSelf->PSPlHB) 
                                   & VL_GTES_III(1,32,32, 2U, 
                                                 VL_EXTENDS_II(32,7, 
                                                               (0x7fU 
                                                                & (IData)(vlSelf->PSFdCz))))))
                                ? ((VL_LTES_III(1,32,32, 0U, 
                                                ((IData)(1U) 
                                                 + 
                                                 (VL_EXTENDS_II(32,7, 
                                                                (0x7fU 
                                                                 & (IData)(vlSelf->PSm7SV))) 
                                                  - 
                                                  VL_EXTENDS_II(32,6, 
                                                                (0x1fU 
                                                                 & vlSelf->PS4e1r[0U]))))) 
                                    & vlSelf->PSHHWZ)
                                    ? ((IData)(1U) 
                                       + (VL_EXTENDS_II(7,7, 
                                                        (0x7fU 
                                                         & (IData)(vlSelf->PSm7SV))) 
                                          - VL_EXTENDS_II(7,6, 
                                                          (0x1fU 
                                                           & vlSelf->PS4e1r[0U]))))
                                    : 0U) : (IData)(vlSelf->PSaG5o)));
    vlSelf->PStYQ3 = (0x3fffffffffULL & ((0x1fffffffffULL 
                                          & (((QData)((IData)(
                                                              vlSelf->PSFCfp[1U])) 
                                              << 0x20U) 
                                             | (QData)((IData)(
                                                               vlSelf->PSFCfp[0U])))) 
                                         << (0x3fU 
                                             & ((VL_GTES_III(1,32,32, 0U, 
                                                             VL_EXTENDS_II(32,7, 
                                                                           (0x7fU 
                                                                            & (IData)(vlSelf->PSFdCz)))) 
                                                 | ((IData)(vlSelf->PSPlHB) 
                                                    & VL_GTES_III(1,32,32, 2U, 
                                                                  VL_EXTENDS_II(32,7, 
                                                                                (0x7fU 
                                                                                & (IData)(vlSelf->PSFdCz))))))
                                                 ? 
                                                ((VL_LTES_III(1,32,32, 0U, 
                                                              ((IData)(1U) 
                                                               + 
                                                               (VL_EXTENDS_II(32,7, 
                                                                              (0x7fU 
                                                                               & (IData)(vlSelf->PSm7SV))) 
                                                                - 
                                                                VL_EXTENDS_II(32,6, 
                                                                              (0x1fU 
                                                                               & vlSelf->PS4e1r[0U]))))) 
                                                  & vlSelf->PSHHWZ)
                                                  ? 
                                                 ((IData)(0xdU) 
                                                  + 
                                                  (0x1fU 
                                                   & vlSelf->PS4e1r[0U]))
                                                  : 
                                                 ((IData)(0xdU) 
                                                  + 
                                                  VL_EXTENDS_II(6,7, 
                                                                (0x7fU 
                                                                 & (IData)(vlSelf->PSm7SV)))))
                                                 : (IData)(vlSelf->PSV3Tj)))));
    vlSelf->PSPOYH = ((0xfffffffeU & vlSelf->PSPOYH) 
                      | (IData)((0U != (6U & vlSelf->PSPOYH))));
    vlSelf->PSPOYH = ((0xfffffffdU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x18U & vlSelf->PSPOYH))) 
                         << 1U));
    vlSelf->PSPOYH = ((0xfffffffbU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x60U & vlSelf->PSPOYH))) 
                         << 2U));
    vlSelf->PSPOYH = ((0xfffffff7U & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x180U & vlSelf->PSPOYH))) 
                         << 3U));
    vlSelf->PSPOYH = ((0xffffffefU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x600U & vlSelf->PSPOYH))) 
                         << 4U));
    vlSelf->PSPOYH = ((0xffffffdfU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x1800U & vlSelf->PSPOYH))) 
                         << 5U));
    vlSelf->PSPOYH = ((0xffffffbfU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x6000U & vlSelf->PSPOYH))) 
                         << 6U));
    vlSelf->PSPOYH = ((0xffffff7fU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x18000U & vlSelf->PSPOYH))) 
                         << 7U));
    vlSelf->PSPOYH = ((0xfffffeffU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x60000U & vlSelf->PSPOYH))) 
                         << 8U));
    vlSelf->PSPOYH = ((0xfffffdffU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x180000U 
                                         & vlSelf->PSPOYH))) 
                         << 9U));
    vlSelf->PSPOYH = ((0xfffffbffU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x600000U 
                                         & vlSelf->PSPOYH))) 
                         << 0xaU));
    vlSelf->PSPOYH = ((0xfffff7ffU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x1800000U 
                                         & vlSelf->PSPOYH))) 
                         << 0xbU));
    vlSelf->PSPOYH = ((0xffffefffU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x6000000U 
                                         & vlSelf->PSPOYH))) 
                         << 0xcU));
    vlSelf->PSPOYH = ((0xffffdfffU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x18000000U 
                                         & vlSelf->PSPOYH))) 
                         << 0xdU));
    vlSelf->PSPOYH = ((0xffffbfffU & vlSelf->PSPOYH) 
                      | ((IData)((0U != (0x60000000U 
                                         & vlSelf->PSPOYH))) 
                         << 0xeU));
    vlSelf->PS6nDG[0U] = ((0xffffffe0U & vlSelf->PS6nDG[0U]) 
                          | (0x1fU & ((2U & vlSelf->PSPOYH)
                                       ? ((vlSelf->PS6nDG[0U] 
                                           << 0x1bU) 
                                          | (vlSelf->PS6nDG[0U] 
                                             >> 5U))
                                       : ((vlSelf->PS6nDG[0U] 
                                           << 0x16U) 
                                          | (vlSelf->PS6nDG[0U] 
                                             >> 0xaU)))));
    vlSelf->PS6nDG[0U] = ((0xfffffc1fU & vlSelf->PS6nDG[0U]) 
                          | (0x3e0U & (((8U & vlSelf->PSPOYH)
                                         ? ((vlSelf->PS6nDG[0U] 
                                             << 0x11U) 
                                            | (vlSelf->PS6nDG[0U] 
                                               >> 0xfU))
                                         : ((vlSelf->PS6nDG[0U] 
                                             << 0xcU) 
                                            | (vlSelf->PS6nDG[0U] 
                                               >> 0x14U))) 
                                       << 5U)));
}
