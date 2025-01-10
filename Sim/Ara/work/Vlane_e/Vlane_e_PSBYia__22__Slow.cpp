// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlane_e.h for the primary calling header

#include "Vlane_e_PSBYia.h"
#include "Vlane_e_PSplPG.h"

#include "verilated_dpi.h"

void Vlane_e_PSBYia__PSz3tu(Vlane_e_PSBYia* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vlane_e_PSplPG* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlane_e_PSBYia__PSz3tu\n"); );
    // Variables
    CData PSP2Lh;
    CData PSBjQV;
    CData PS8HKZ;
    CData PSaxr7;
    CData PSUiiH;
    CData PSYtgg;
    CData PSPPWD;
    CData PSye2j;
    CData PSeFQ6;
    CData PSFJd9;
    CData PSlNNU;
    CData PSNOHO;
    CData PSSha4;
    CData PSMkYI;
    CData PS3HWw;
    CData PSAIgD;
    CData PSSoIR;
    CData PS7xNA;
    CData PSGFHW;
    CData PShynm;
    CData PSAzWK;
    CData PSBuBY;
    CData PSBoeu;
    CData PSHBOU;
    CData PSe9gI;
    CData PS8np0;
    CData PSLz8Y;
    CData PSgzne;
    CData PSACAB;
    CData PSebYB;
    CData PSnLJl;
    CData PSNt5F;
    CData PSDM36;
    CData PSU5y7;
    CData PSup3T;
    SData PSaiLd;
    SData PS2BQO;
    SData PS2TF2;
    SData PSt6Q8;
    SData PSbTIc;
    SData PS1AVg;
    SData PSXIen;
    SData PSmNYf;
    SData PSfGC8;
    SData PSCune;
    SData PSqATS;
    SData PSAOej;
    SData PSq1V8;
    SData PSbwq8;
    SData PSIm5L;
    SData PSUKFR;
    SData PSmBKQ;
    SData PSCCdF;
    SData PSyfXQ;
    SData PSQKjA;
    SData PSGlwU;
    SData PSRsZE;
    SData PSd527;
    SData PSpTGk;
    SData PS9Y9d;
    SData PSymfT;
    SData PSgyYB;
    SData PS8Msg;
    IData PSBAgr;
    IData PSSURN;
    VlWide<3> PSDAA2;
    IData PSELhs;
    IData PSvKD0;
    IData PSTwO1;
    VlWide<3> PSSV1e;
    IData PSjLIN;
    IData PSzxvc;
    IData PSAEI2;
    VlWide<6> PS8e4c;
    VlWide<4> PSFGfR;
    IData PSuE7l;
    IData PSmbOI;
    IData PSHXYw;
    IData PSzM28;
    VlWide<5> PSxL7G;
    VlWide<5> PSNPnY;
    CData PSfJpd;
    CData PSyutZ;
    CData PSPv8a;
    CData PSQV33;
    CData PSBsuU;
    CData PSESoy;
    CData PSFwHW;
    CData PSsljg;
    CData PSIu84;
    CData PS8GO4;
    CData PSuEkW;
    CData PSrVFY;
    CData PSDLgb;
    CData PSCcnN;
    CData PSuuqO;
    CData PSNJVu;
    VlWide<6> PSRIVU;
    VlWide<6> PSNRoV;
    VlWide<6> PSGmY6;
    CData PS1k3F;
    CData PSclXN;
    CData PSHuEN;
    CData PScsyq;
    VlWide<3> PS1BZk;
    VlWide<3> PSN8e1;
    VlWide<3> PSrdUa;
    CData PStLjc;
    CData PS8VUi;
    CData PSxJzo;
    CData PSOibO;
    VlWide<3> PSOs0W;
    VlWide<3> PSyPAK;
    VlWide<3> PSQxN8;
    VlWide<5> PSTBZf;
    VlWide<5> PSMOlI;
    VlWide<6> PSlL1N;
    VlWide<6> PSAxNB;
    VlWide<3> PSr4XX;
    VlWide<3> PSFB2e;
    VlWide<3> PSQbaq;
    VlWide<3> PSwh0M;
    VlWide<3> PSK8Pi;
    QData PS0ijR;
    QData PSo4BV;
    QData PSBXAW;
    QData PSWWsD;
    QData PSF3n4;
    QData PS2aUm;
    QData PSJKFD;
    QData PSBSb7;
    QData PSY3Am;
    QData PSCKR1;
    QData PScnmb;
    QData PSBJ5U;
    QData PSzoz6;
    QData PS7QGE;
    QData PSIXLa;
    QData PSBPZO;
    QData PSCkOM;
    QData PSxFmV;
    QData PSLFov;
    QData PSUVSt;
    // Body
    vlSelf->PS6nDG[0U] = ((0xffff83ffU & vlSelf->PS6nDG[0U]) 
                          | (0x7c00U & (((0x20U & vlSelf->PSPOYH)
                                          ? ((vlSelf->PS6nDG[0U] 
                                              << 7U) 
                                             | (vlSelf->PS6nDG[0U] 
                                                >> 0x19U))
                                          : ((vlSelf->PS6nDG[1U] 
                                              << 2U) 
                                             | (vlSelf->PS6nDG[0U] 
                                                >> 0x1eU))) 
                                        << 0xaU)));
    vlSelf->PS6nDG[0U] = ((0xfff07fffU & vlSelf->PS6nDG[0U]) 
                          | (0xf8000U & (((0x80U & vlSelf->PSPOYH)
                                           ? ((vlSelf->PS6nDG[1U] 
                                               << 0x1dU) 
                                              | (vlSelf->PS6nDG[1U] 
                                                 >> 3U))
                                           : ((vlSelf->PS6nDG[1U] 
                                               << 0x18U) 
                                              | (vlSelf->PS6nDG[1U] 
                                                 >> 8U))) 
                                         << 0xfU)));
    vlSelf->PS6nDG[0U] = ((0xfe0fffffU & vlSelf->PS6nDG[0U]) 
                          | (0x1f00000U & (((0x200U 
                                             & vlSelf->PSPOYH)
                                             ? ((vlSelf->PS6nDG[1U] 
                                                 << 0x13U) 
                                                | (vlSelf->PS6nDG[1U] 
                                                   >> 0xdU))
                                             : ((vlSelf->PS6nDG[1U] 
                                                 << 0xeU) 
                                                | (vlSelf->PS6nDG[1U] 
                                                   >> 0x12U))) 
                                           << 0x14U)));
    vlSelf->PS6nDG[0U] = ((0xc1ffffffU & vlSelf->PS6nDG[0U]) 
                          | (0x3e000000U & (((0x800U 
                                              & vlSelf->PSPOYH)
                                              ? ((vlSelf->PS6nDG[1U] 
                                                  << 9U) 
                                                 | (vlSelf->PS6nDG[1U] 
                                                    >> 0x17U))
                                              : ((vlSelf->PS6nDG[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PS6nDG[1U] 
                                                    >> 0x1cU))) 
                                            << 0x19U)));
    PSfJpd = (0x1fU & ((0x2000U & vlSelf->PSPOYH) ? 
                       ((vlSelf->PS6nDG[2U] << 0x1fU) 
                        | (vlSelf->PS6nDG[2U] >> 1U))
                        : ((vlSelf->PS6nDG[2U] << 0x1aU) 
                           | (vlSelf->PS6nDG[2U] >> 6U))));
    vlSelf->PS6nDG[0U] = ((0x3fffffffU & vlSelf->PS6nDG[0U]) 
                          | (((0x2000U & vlSelf->PSPOYH)
                               ? ((vlSelf->PS6nDG[2U] 
                                   << 0x1fU) | (vlSelf->PS6nDG[2U] 
                                                >> 1U))
                               : ((vlSelf->PS6nDG[2U] 
                                   << 0x1aU) | (vlSelf->PS6nDG[2U] 
                                                >> 6U))) 
                             << 0x1eU));
    vlSelf->PS6nDG[1U] = ((0xfffffff8U & vlSelf->PS6nDG[1U]) 
                          | (PSfJpd >> 2U));
    vlSelf->PS6nDG[1U] = ((0xffffff07U & vlSelf->PS6nDG[1U]) 
                          | (0xf8U & (((0x8000U & vlSelf->PSPOYH)
                                        ? ((vlSelf->PS6nDG[2U] 
                                            << 0x15U) 
                                           | (vlSelf->PS6nDG[2U] 
                                              >> 0xbU))
                                        : ((vlSelf->PS6nDG[2U] 
                                            << 0x10U) 
                                           | (vlSelf->PS6nDG[2U] 
                                              >> 0x10U))) 
                                      << 3U)));
    vlSelf->PS6nDG[1U] = ((0xffffe0ffU & vlSelf->PS6nDG[1U]) 
                          | (0x1f00U & (((0x20000U 
                                          & vlSelf->PSPOYH)
                                          ? ((vlSelf->PS6nDG[2U] 
                                              << 0xbU) 
                                             | (vlSelf->PS6nDG[2U] 
                                                >> 0x15U))
                                          : ((vlSelf->PS6nDG[2U] 
                                              << 6U) 
                                             | (vlSelf->PS6nDG[2U] 
                                                >> 0x1aU))) 
                                        << 8U)));
    vlSelf->PS6nDG[1U] = ((0xfffc1fffU & vlSelf->PS6nDG[1U]) 
                          | (0x3e000U & (((0x80000U 
                                           & vlSelf->PSPOYH)
                                           ? ((vlSelf->PS6nDG[3U] 
                                               << 1U) 
                                              | (vlSelf->PS6nDG[2U] 
                                                 >> 0x1fU))
                                           : ((vlSelf->PS6nDG[3U] 
                                               << 0x1cU) 
                                              | (vlSelf->PS6nDG[3U] 
                                                 >> 4U))) 
                                         << 0xdU)));
    vlSelf->PS6nDG[1U] = ((0xff83ffffU & vlSelf->PS6nDG[1U]) 
                          | (0x7c0000U & (((0x200000U 
                                            & vlSelf->PSPOYH)
                                            ? ((vlSelf->PS6nDG[3U] 
                                                << 0x17U) 
                                               | (vlSelf->PS6nDG[3U] 
                                                  >> 9U))
                                            : ((vlSelf->PS6nDG[3U] 
                                                << 0x12U) 
                                               | (vlSelf->PS6nDG[3U] 
                                                  >> 0xeU))) 
                                          << 0x12U)));
    vlSelf->PS6nDG[1U] = ((0xf07fffffU & vlSelf->PS6nDG[1U]) 
                          | (0xf800000U & (((0x800000U 
                                             & vlSelf->PSPOYH)
                                             ? ((vlSelf->PS6nDG[3U] 
                                                 << 0xdU) 
                                                | (vlSelf->PS6nDG[3U] 
                                                   >> 0x13U))
                                             : ((vlSelf->PS6nDG[3U] 
                                                 << 8U) 
                                                | (vlSelf->PS6nDG[3U] 
                                                   >> 0x18U))) 
                                           << 0x17U)));
    PSyutZ = (0x1fU & ((0x2000000U & vlSelf->PSPOYH)
                        ? ((vlSelf->PS6nDG[4U] << 3U) 
                           | (vlSelf->PS6nDG[3U] >> 0x1dU))
                        : ((vlSelf->PS6nDG[4U] << 0x1eU) 
                           | (vlSelf->PS6nDG[4U] >> 2U))));
    vlSelf->PS6nDG[1U] = ((0xfffffffU & vlSelf->PS6nDG[1U]) 
                          | (((0x2000000U & vlSelf->PSPOYH)
                               ? ((vlSelf->PS6nDG[4U] 
                                   << 3U) | (vlSelf->PS6nDG[3U] 
                                             >> 0x1dU))
                               : ((vlSelf->PS6nDG[4U] 
                                   << 0x1eU) | (vlSelf->PS6nDG[4U] 
                                                >> 2U))) 
                             << 0x1cU));
    vlSelf->PS6nDG[2U] = ((0xfffffffeU & vlSelf->PS6nDG[2U]) 
                          | (PSyutZ >> 4U));
    vlSelf->PS6nDG[2U] = ((0xffffffc1U & vlSelf->PS6nDG[2U]) 
                          | (0x3eU & (((0x8000000U 
                                        & vlSelf->PSPOYH)
                                        ? ((vlSelf->PS6nDG[4U] 
                                            << 0x19U) 
                                           | (vlSelf->PS6nDG[4U] 
                                              >> 7U))
                                        : ((vlSelf->PS6nDG[4U] 
                                            << 0x14U) 
                                           | (vlSelf->PS6nDG[4U] 
                                              >> 0xcU))) 
                                      << 1U)));
    vlSelf->PS6nDG[2U] = ((0xfffff83fU & vlSelf->PS6nDG[2U]) 
                          | (0x7c0U & (((0x20000000U 
                                         & vlSelf->PSPOYH)
                                         ? ((vlSelf->PS6nDG[4U] 
                                             << 0xfU) 
                                            | (vlSelf->PS6nDG[4U] 
                                               >> 0x11U))
                                         : ((vlSelf->PS6nDG[4U] 
                                             << 0xaU) 
                                            | (vlSelf->PS6nDG[4U] 
                                               >> 0x16U))) 
                                       << 6U)));
    PSye2j = (0x7fU & ((VL_GTES_III(1,32,32, 0U, VL_EXTENDS_II(32,7, 
                                                               (0x7fU 
                                                                & (IData)(vlSelf->PSx9Gm)))) 
                        | ((IData)(vlSelf->PSeRYH) 
                           & VL_GTES_III(1,32,32, 2U, 
                                         VL_EXTENDS_II(32,7, 
                                                       (0x7fU 
                                                        & (IData)(vlSelf->PSx9Gm))))))
                        ? ((VL_LTES_III(1,32,32, 0U, 
                                        ((IData)(1U) 
                                         + (VL_EXTENDS_II(32,7, 
                                                          (0x7fU 
                                                           & (IData)(vlSelf->PSRQVi))) 
                                            - VL_EXTENDS_II(32,6, 
                                                            (0x1fU 
                                                             & vlSelf->PS6nDG[0U]))))) 
                            & vlSelf->PSPOYH) ? ((IData)(1U) 
                                                 + 
                                                 (VL_EXTENDS_II(7,7, 
                                                                (0x7fU 
                                                                 & (IData)(vlSelf->PSRQVi))) 
                                                  - 
                                                  VL_EXTENDS_II(7,6, 
                                                                (0x1fU 
                                                                 & vlSelf->PS6nDG[0U]))))
                            : 0U) : (IData)(vlSelf->PSxGBg)));
    PSJKFD = (0x3fffffffffULL & ((0x1fffffffffULL & 
                                  (((QData)((IData)(
                                                    vlSelf->PSGH8p[1U])) 
                                    << 0x20U) | (QData)((IData)(
                                                                vlSelf->PSGH8p[0U])))) 
                                 << (0x3fU & ((VL_GTES_III(1,32,32, 0U, 
                                                           VL_EXTENDS_II(32,7, 
                                                                         (0x7fU 
                                                                          & (IData)(vlSelf->PSx9Gm)))) 
                                               | ((IData)(vlSelf->PSeRYH) 
                                                  & VL_GTES_III(1,32,32, 2U, 
                                                                VL_EXTENDS_II(32,7, 
                                                                              (0x7fU 
                                                                               & (IData)(vlSelf->PSx9Gm))))))
                                               ? ((
                                                   VL_LTES_III(1,32,32, 0U, 
                                                               ((IData)(1U) 
                                                                + 
                                                                (VL_EXTENDS_II(32,7, 
                                                                               (0x7fU 
                                                                                & (IData)(vlSelf->PSRQVi))) 
                                                                 - 
                                                                 VL_EXTENDS_II(32,6, 
                                                                               (0x1fU 
                                                                                & vlSelf->PS6nDG[0U]))))) 
                                                   & vlSelf->PSPOYH)
                                                   ? 
                                                  ((IData)(0xdU) 
                                                   + 
                                                   (0x1fU 
                                                    & vlSelf->PS6nDG[0U]))
                                                   : 
                                                  ((IData)(0xdU) 
                                                   + 
                                                   VL_EXTENDS_II(6,7, 
                                                                 (0x7fU 
                                                                  & (IData)(vlSelf->PSRQVi)))))
                                               : (IData)(vlSelf->PSEBYB)))));
    vlSelf->PSfVJJ = ((0xfffffffeU & vlSelf->PSfVJJ) 
                      | (IData)((0U != (6U & vlSelf->PSfVJJ))));
    vlSelf->PSfVJJ = ((0xfffffffdU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x18U & vlSelf->PSfVJJ))) 
                         << 1U));
    vlSelf->PSfVJJ = ((0xfffffffbU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x60U & vlSelf->PSfVJJ))) 
                         << 2U));
    vlSelf->PSfVJJ = ((0xfffffff7U & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x180U & vlSelf->PSfVJJ))) 
                         << 3U));
    vlSelf->PSfVJJ = ((0xffffffefU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x600U & vlSelf->PSfVJJ))) 
                         << 4U));
    vlSelf->PSfVJJ = ((0xffffffdfU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x1800U & vlSelf->PSfVJJ))) 
                         << 5U));
    vlSelf->PSfVJJ = ((0xffffffbfU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x6000U & vlSelf->PSfVJJ))) 
                         << 6U));
    vlSelf->PSfVJJ = ((0xffffff7fU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x18000U & vlSelf->PSfVJJ))) 
                         << 7U));
    vlSelf->PSfVJJ = ((0xfffffeffU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x60000U & vlSelf->PSfVJJ))) 
                         << 8U));
    vlSelf->PSfVJJ = ((0xfffffdffU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x180000U 
                                         & vlSelf->PSfVJJ))) 
                         << 9U));
    vlSelf->PSfVJJ = ((0xfffffbffU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x600000U 
                                         & vlSelf->PSfVJJ))) 
                         << 0xaU));
    vlSelf->PSfVJJ = ((0xfffff7ffU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x1800000U 
                                         & vlSelf->PSfVJJ))) 
                         << 0xbU));
    vlSelf->PSfVJJ = ((0xffffefffU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x6000000U 
                                         & vlSelf->PSfVJJ))) 
                         << 0xcU));
    vlSelf->PSfVJJ = ((0xffffdfffU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x18000000U 
                                         & vlSelf->PSfVJJ))) 
                         << 0xdU));
    vlSelf->PSfVJJ = ((0xffffbfffU & vlSelf->PSfVJJ) 
                      | ((IData)((0U != (0x60000000U 
                                         & vlSelf->PSfVJJ))) 
                         << 0xeU));
    vlSelf->PS3YCQ[0U] = ((0xffffffe0U & vlSelf->PS3YCQ[0U]) 
                          | (0x1fU & ((2U & vlSelf->PSfVJJ)
                                       ? ((vlSelf->PS3YCQ[0U] 
                                           << 0x1bU) 
                                          | (vlSelf->PS3YCQ[0U] 
                                             >> 5U))
                                       : ((vlSelf->PS3YCQ[0U] 
                                           << 0x16U) 
                                          | (vlSelf->PS3YCQ[0U] 
                                             >> 0xaU)))));
    vlSelf->PS3YCQ[0U] = ((0xfffffc1fU & vlSelf->PS3YCQ[0U]) 
                          | (0x3e0U & (((8U & vlSelf->PSfVJJ)
                                         ? ((vlSelf->PS3YCQ[0U] 
                                             << 0x11U) 
                                            | (vlSelf->PS3YCQ[0U] 
                                               >> 0xfU))
                                         : ((vlSelf->PS3YCQ[0U] 
                                             << 0xcU) 
                                            | (vlSelf->PS3YCQ[0U] 
                                               >> 0x14U))) 
                                       << 5U)));
    vlSelf->PS3YCQ[0U] = ((0xffff83ffU & vlSelf->PS3YCQ[0U]) 
                          | (0x7c00U & (((0x20U & vlSelf->PSfVJJ)
                                          ? ((vlSelf->PS3YCQ[0U] 
                                              << 7U) 
                                             | (vlSelf->PS3YCQ[0U] 
                                                >> 0x19U))
                                          : ((vlSelf->PS3YCQ[1U] 
                                              << 2U) 
                                             | (vlSelf->PS3YCQ[0U] 
                                                >> 0x1eU))) 
                                        << 0xaU)));
    vlSelf->PS3YCQ[0U] = ((0xfff07fffU & vlSelf->PS3YCQ[0U]) 
                          | (0xf8000U & (((0x80U & vlSelf->PSfVJJ)
                                           ? ((vlSelf->PS3YCQ[1U] 
                                               << 0x1dU) 
                                              | (vlSelf->PS3YCQ[1U] 
                                                 >> 3U))
                                           : ((vlSelf->PS3YCQ[1U] 
                                               << 0x18U) 
                                              | (vlSelf->PS3YCQ[1U] 
                                                 >> 8U))) 
                                         << 0xfU)));
    vlSelf->PS3YCQ[0U] = ((0xfe0fffffU & vlSelf->PS3YCQ[0U]) 
                          | (0x1f00000U & (((0x200U 
                                             & vlSelf->PSfVJJ)
                                             ? ((vlSelf->PS3YCQ[1U] 
                                                 << 0x13U) 
                                                | (vlSelf->PS3YCQ[1U] 
                                                   >> 0xdU))
                                             : ((vlSelf->PS3YCQ[1U] 
                                                 << 0xeU) 
                                                | (vlSelf->PS3YCQ[1U] 
                                                   >> 0x12U))) 
                                           << 0x14U)));
    vlSelf->PS3YCQ[0U] = ((0xc1ffffffU & vlSelf->PS3YCQ[0U]) 
                          | (0x3e000000U & (((0x800U 
                                              & vlSelf->PSfVJJ)
                                              ? ((vlSelf->PS3YCQ[1U] 
                                                  << 9U) 
                                                 | (vlSelf->PS3YCQ[1U] 
                                                    >> 0x17U))
                                              : ((vlSelf->PS3YCQ[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PS3YCQ[1U] 
                                                    >> 0x1cU))) 
                                            << 0x19U)));
    PSPv8a = (0x1fU & ((0x2000U & vlSelf->PSfVJJ) ? 
                       ((vlSelf->PS3YCQ[2U] << 0x1fU) 
                        | (vlSelf->PS3YCQ[2U] >> 1U))
                        : ((vlSelf->PS3YCQ[2U] << 0x1aU) 
                           | (vlSelf->PS3YCQ[2U] >> 6U))));
    vlSelf->PS3YCQ[0U] = ((0x3fffffffU & vlSelf->PS3YCQ[0U]) 
                          | (((0x2000U & vlSelf->PSfVJJ)
                               ? ((vlSelf->PS3YCQ[2U] 
                                   << 0x1fU) | (vlSelf->PS3YCQ[2U] 
                                                >> 1U))
                               : ((vlSelf->PS3YCQ[2U] 
                                   << 0x1aU) | (vlSelf->PS3YCQ[2U] 
                                                >> 6U))) 
                             << 0x1eU));
    vlSelf->PS3YCQ[1U] = ((0xfffffff8U & vlSelf->PS3YCQ[1U]) 
                          | (PSPv8a >> 2U));
    vlSelf->PS3YCQ[1U] = ((0xffffff07U & vlSelf->PS3YCQ[1U]) 
                          | (0xf8U & (((0x8000U & vlSelf->PSfVJJ)
                                        ? ((vlSelf->PS3YCQ[2U] 
                                            << 0x15U) 
                                           | (vlSelf->PS3YCQ[2U] 
                                              >> 0xbU))
                                        : ((vlSelf->PS3YCQ[2U] 
                                            << 0x10U) 
                                           | (vlSelf->PS3YCQ[2U] 
                                              >> 0x10U))) 
                                      << 3U)));
    vlSelf->PS3YCQ[1U] = ((0xffffe0ffU & vlSelf->PS3YCQ[1U]) 
                          | (0x1f00U & (((0x20000U 
                                          & vlSelf->PSfVJJ)
                                          ? ((vlSelf->PS3YCQ[2U] 
                                              << 0xbU) 
                                             | (vlSelf->PS3YCQ[2U] 
                                                >> 0x15U))
                                          : ((vlSelf->PS3YCQ[2U] 
                                              << 6U) 
                                             | (vlSelf->PS3YCQ[2U] 
                                                >> 0x1aU))) 
                                        << 8U)));
    vlSelf->PS3YCQ[1U] = ((0xfffc1fffU & vlSelf->PS3YCQ[1U]) 
                          | (0x3e000U & (((0x80000U 
                                           & vlSelf->PSfVJJ)
                                           ? ((vlSelf->PS3YCQ[3U] 
                                               << 1U) 
                                              | (vlSelf->PS3YCQ[2U] 
                                                 >> 0x1fU))
                                           : ((vlSelf->PS3YCQ[3U] 
                                               << 0x1cU) 
                                              | (vlSelf->PS3YCQ[3U] 
                                                 >> 4U))) 
                                         << 0xdU)));
    vlSelf->PS3YCQ[1U] = ((0xff83ffffU & vlSelf->PS3YCQ[1U]) 
                          | (0x7c0000U & (((0x200000U 
                                            & vlSelf->PSfVJJ)
                                            ? ((vlSelf->PS3YCQ[3U] 
                                                << 0x17U) 
                                               | (vlSelf->PS3YCQ[3U] 
                                                  >> 9U))
                                            : ((vlSelf->PS3YCQ[3U] 
                                                << 0x12U) 
                                               | (vlSelf->PS3YCQ[3U] 
                                                  >> 0xeU))) 
                                          << 0x12U)));
    vlSelf->PS3YCQ[1U] = ((0xf07fffffU & vlSelf->PS3YCQ[1U]) 
                          | (0xf800000U & (((0x800000U 
                                             & vlSelf->PSfVJJ)
                                             ? ((vlSelf->PS3YCQ[3U] 
                                                 << 0xdU) 
                                                | (vlSelf->PS3YCQ[3U] 
                                                   >> 0x13U))
                                             : ((vlSelf->PS3YCQ[3U] 
                                                 << 8U) 
                                                | (vlSelf->PS3YCQ[3U] 
                                                   >> 0x18U))) 
                                           << 0x17U)));
    PSQV33 = (0x1fU & ((0x2000000U & vlSelf->PSfVJJ)
                        ? ((vlSelf->PS3YCQ[4U] << 3U) 
                           | (vlSelf->PS3YCQ[3U] >> 0x1dU))
                        : ((vlSelf->PS3YCQ[4U] << 0x1eU) 
                           | (vlSelf->PS3YCQ[4U] >> 2U))));
    vlSelf->PS3YCQ[1U] = ((0xfffffffU & vlSelf->PS3YCQ[1U]) 
                          | (((0x2000000U & vlSelf->PSfVJJ)
                               ? ((vlSelf->PS3YCQ[4U] 
                                   << 3U) | (vlSelf->PS3YCQ[3U] 
                                             >> 0x1dU))
                               : ((vlSelf->PS3YCQ[4U] 
                                   << 0x1eU) | (vlSelf->PS3YCQ[4U] 
                                                >> 2U))) 
                             << 0x1cU));
    vlSelf->PS3YCQ[2U] = ((0xfffffffeU & vlSelf->PS3YCQ[2U]) 
                          | (PSQV33 >> 4U));
    vlSelf->PS3YCQ[2U] = ((0xffffffc1U & vlSelf->PS3YCQ[2U]) 
                          | (0x3eU & (((0x8000000U 
                                        & vlSelf->PSfVJJ)
                                        ? ((vlSelf->PS3YCQ[4U] 
                                            << 0x19U) 
                                           | (vlSelf->PS3YCQ[4U] 
                                              >> 7U))
                                        : ((vlSelf->PS3YCQ[4U] 
                                            << 0x14U) 
                                           | (vlSelf->PS3YCQ[4U] 
                                              >> 0xcU))) 
                                      << 1U)));
    vlSelf->PS3YCQ[2U] = ((0xfffff83fU & vlSelf->PS3YCQ[2U]) 
                          | (0x7c0U & (((0x20000000U 
                                         & vlSelf->PSfVJJ)
                                         ? ((vlSelf->PS3YCQ[4U] 
                                             << 0xfU) 
                                            | (vlSelf->PS3YCQ[4U] 
                                               >> 0x11U))
                                         : ((vlSelf->PS3YCQ[4U] 
                                             << 0xaU) 
                                            | (vlSelf->PS3YCQ[4U] 
                                               >> 0x16U))) 
                                       << 6U)));
    PSlNNU = (0x7fU & ((VL_GTES_III(1,32,32, 0U, VL_EXTENDS_II(32,7, 
                                                               (0x7fU 
                                                                & (IData)(vlSelf->PS5HiH)))) 
                        | ((IData)(vlSelf->PSGKIJ) 
                           & VL_GTES_III(1,32,32, 2U, 
                                         VL_EXTENDS_II(32,7, 
                                                       (0x7fU 
                                                        & (IData)(vlSelf->PS5HiH))))))
                        ? ((VL_LTES_III(1,32,32, 0U, 
                                        ((IData)(1U) 
                                         + (VL_EXTENDS_II(32,7, 
                                                          (0x7fU 
                                                           & (IData)(vlSelf->PSvikV))) 
                                            - VL_EXTENDS_II(32,6, 
                                                            (0x1fU 
                                                             & vlSelf->PS3YCQ[0U]))))) 
                            & vlSelf->PSfVJJ) ? ((IData)(1U) 
                                                 + 
                                                 (VL_EXTENDS_II(7,7, 
                                                                (0x7fU 
                                                                 & (IData)(vlSelf->PSvikV))) 
                                                  - 
                                                  VL_EXTENDS_II(7,6, 
                                                                (0x1fU 
                                                                 & vlSelf->PS3YCQ[0U]))))
                            : 0U) : (IData)(vlSelf->PSRAG9)));
    PSBSb7 = (0x3fffffffffULL & ((0x1fffffffffULL & 
                                  (((QData)((IData)(
                                                    vlSelf->PSv0cQ[1U])) 
                                    << 0x20U) | (QData)((IData)(
                                                                vlSelf->PSv0cQ[0U])))) 
                                 << (0x3fU & ((VL_GTES_III(1,32,32, 0U, 
                                                           VL_EXTENDS_II(32,7, 
                                                                         (0x7fU 
                                                                          & (IData)(vlSelf->PS5HiH)))) 
                                               | ((IData)(vlSelf->PSGKIJ) 
                                                  & VL_GTES_III(1,32,32, 2U, 
                                                                VL_EXTENDS_II(32,7, 
                                                                              (0x7fU 
                                                                               & (IData)(vlSelf->PS5HiH))))))
                                               ? ((
                                                   VL_LTES_III(1,32,32, 0U, 
                                                               ((IData)(1U) 
                                                                + 
                                                                (VL_EXTENDS_II(32,7, 
                                                                               (0x7fU 
                                                                                & (IData)(vlSelf->PSvikV))) 
                                                                 - 
                                                                 VL_EXTENDS_II(32,6, 
                                                                               (0x1fU 
                                                                                & vlSelf->PS3YCQ[0U]))))) 
                                                   & vlSelf->PSfVJJ)
                                                   ? 
                                                  ((IData)(0xdU) 
                                                   + 
                                                   (0x1fU 
                                                    & vlSelf->PS3YCQ[0U]))
                                                   : 
                                                  ((IData)(0xdU) 
                                                   + 
                                                   VL_EXTENDS_II(6,7, 
                                                                 (0x7fU 
                                                                  & (IData)(vlSelf->PSvikV)))))
                                               : (IData)(vlSelf->PSyjhZ)))));
    vlSelf->PSvySI[0U] = ((0xfffffffeU & vlSelf->PSvySI[0U]) 
                          | (1U & ((vlSelf->PSvySI[0U] 
                                    >> 1U) | (vlSelf->PSvySI[0U] 
                                              >> 2U))));
    vlSelf->PSvySI[0U] = ((0xfffffffdU & vlSelf->PSvySI[0U]) 
                          | (2U & ((0x3ffffffeU & (
                                                   vlSelf->PSvySI[0U] 
                                                   >> 2U)) 
                                   | (0x1ffffffeU & 
                                      (vlSelf->PSvySI[0U] 
                                       >> 3U)))));
    vlSelf->PSvySI[0U] = ((0xfffffffbU & vlSelf->PSvySI[0U]) 
                          | (4U & ((0x1ffffffcU & (
                                                   vlSelf->PSvySI[0U] 
                                                   >> 3U)) 
                                   | (0xffffffcU & 
                                      (vlSelf->PSvySI[0U] 
                                       >> 4U)))));
    vlSelf->PSvySI[0U] = ((0xfffffff7U & vlSelf->PSvySI[0U]) 
                          | (8U & ((0xffffff8U & (vlSelf->PSvySI[0U] 
                                                  >> 4U)) 
                                   | (0x7fffff8U & 
                                      (vlSelf->PSvySI[0U] 
                                       >> 5U)))));
    vlSelf->PSvySI[0U] = ((0xffffffefU & vlSelf->PSvySI[0U]) 
                          | (0x10U & ((0x7fffff0U & 
                                       (vlSelf->PSvySI[0U] 
                                        >> 5U)) | (0x3fffff0U 
                                                   & (vlSelf->PSvySI[0U] 
                                                      >> 6U)))));
    vlSelf->PSvySI[0U] = ((0xffffffdfU & vlSelf->PSvySI[0U]) 
                          | (0x20U & ((0x3ffffe0U & 
                                       (vlSelf->PSvySI[0U] 
                                        >> 6U)) | (0x1ffffe0U 
                                                   & (vlSelf->PSvySI[0U] 
                                                      >> 7U)))));
    vlSelf->PSvySI[0U] = ((0xffffffbfU & vlSelf->PSvySI[0U]) 
                          | (0x40U & ((0x1ffffc0U & 
                                       (vlSelf->PSvySI[0U] 
                                        >> 7U)) | (0xffffc0U 
                                                   & (vlSelf->PSvySI[0U] 
                                                      >> 8U)))));
    vlSelf->PSvySI[0U] = ((0xffffff7fU & vlSelf->PSvySI[0U]) 
                          | (0x80U & ((0xffff80U & 
                                       (vlSelf->PSvySI[0U] 
                                        >> 8U)) | (0x7fff80U 
                                                   & (vlSelf->PSvySI[0U] 
                                                      >> 9U)))));
    vlSelf->PSvySI[0U] = ((0xfffffeffU & vlSelf->PSvySI[0U]) 
                          | (0x100U & ((0x7fff00U & 
                                        (vlSelf->PSvySI[0U] 
                                         >> 9U)) | 
                                       (0x3fff00U & 
                                        (vlSelf->PSvySI[0U] 
                                         >> 0xaU)))));
    vlSelf->PSvySI[0U] = ((0xfffffdffU & vlSelf->PSvySI[0U]) 
                          | (0x200U & ((0x3ffe00U & 
                                        (vlSelf->PSvySI[0U] 
                                         >> 0xaU)) 
                                       | (0x1ffe00U 
                                          & (vlSelf->PSvySI[0U] 
                                             >> 0xbU)))));
    vlSelf->PSvySI[0U] = ((0xfffffbffU & vlSelf->PSvySI[0U]) 
                          | (0x400U & ((0x1ffc00U & 
                                        (vlSelf->PSvySI[0U] 
                                         >> 0xbU)) 
                                       | (0xffc00U 
                                          & (vlSelf->PSvySI[0U] 
                                             >> 0xcU)))));
    vlSelf->PSvySI[0U] = ((0xfffff7ffU & vlSelf->PSvySI[0U]) 
                          | (0x800U & ((0xff800U & 
                                        (vlSelf->PSvySI[0U] 
                                         >> 0xcU)) 
                                       | (0x7f800U 
                                          & (vlSelf->PSvySI[0U] 
                                             >> 0xdU)))));
    vlSelf->PSvySI[0U] = ((0xffffefffU & vlSelf->PSvySI[0U]) 
                          | (0x1000U & ((0x7f000U & 
                                         (vlSelf->PSvySI[0U] 
                                          >> 0xdU)) 
                                        | (0x3f000U 
                                           & (vlSelf->PSvySI[0U] 
                                              >> 0xeU)))));
    vlSelf->PSvySI[0U] = ((0xffffdfffU & vlSelf->PSvySI[0U]) 
                          | (0x2000U & ((0x3e000U & 
                                         (vlSelf->PSvySI[0U] 
                                          >> 0xeU)) 
                                        | (0x1e000U 
                                           & (vlSelf->PSvySI[0U] 
                                              >> 0xfU)))));
    vlSelf->PSvySI[0U] = ((0xffffbfffU & vlSelf->PSvySI[0U]) 
                          | (0x4000U & ((0x1c000U & 
                                         (vlSelf->PSvySI[0U] 
                                          >> 0xfU)) 
                                        | (0xc000U 
                                           & (vlSelf->PSvySI[0U] 
                                              >> 0x10U)))));
    vlSelf->PSvySI[0U] = ((0xffff7fffU & vlSelf->PSvySI[0U]) 
                          | (0x8000U & ((0x8000U & 
                                         (vlSelf->PSvySI[0U] 
                                          >> 0x10U)) 
                                        | (vlSelf->PSvySI[1U] 
                                           << 0xfU))));
    vlSelf->PSvySI[0U] = ((0xfffeffffU & vlSelf->PSvySI[0U]) 
                          | (0x10000U & ((vlSelf->PSvySI[1U] 
                                          << 0xfU) 
                                         | (vlSelf->PSvySI[1U] 
                                            << 0xeU))));
    vlSelf->PSvySI[0U] = ((0xfffdffffU & vlSelf->PSvySI[0U]) 
                          | (0x20000U & ((vlSelf->PSvySI[1U] 
                                          << 0xeU) 
                                         | (vlSelf->PSvySI[1U] 
                                            << 0xdU))));
    vlSelf->PSvySI[0U] = ((0xfffbffffU & vlSelf->PSvySI[0U]) 
                          | (0x40000U & ((vlSelf->PSvySI[1U] 
                                          << 0xdU) 
                                         | (vlSelf->PSvySI[1U] 
                                            << 0xcU))));
    vlSelf->PSvySI[0U] = ((0xfff7ffffU & vlSelf->PSvySI[0U]) 
                          | (0x80000U & ((vlSelf->PSvySI[1U] 
                                          << 0xcU) 
                                         | (vlSelf->PSvySI[1U] 
                                            << 0xbU))));
    vlSelf->PSvySI[0U] = ((0xffefffffU & vlSelf->PSvySI[0U]) 
                          | (0x100000U & ((vlSelf->PSvySI[1U] 
                                           << 0xbU) 
                                          | (vlSelf->PSvySI[1U] 
                                             << 0xaU))));
    vlSelf->PSvySI[0U] = ((0xffdfffffU & vlSelf->PSvySI[0U]) 
                          | (0x200000U & ((vlSelf->PSvySI[1U] 
                                           << 0xaU) 
                                          | (vlSelf->PSvySI[1U] 
                                             << 9U))));
    vlSelf->PSvySI[0U] = ((0xffbfffffU & vlSelf->PSvySI[0U]) 
                          | (0x400000U & ((vlSelf->PSvySI[1U] 
                                           << 9U) | 
                                          (vlSelf->PSvySI[1U] 
                                           << 8U))));
    vlSelf->PSvySI[0U] = ((0xff7fffffU & vlSelf->PSvySI[0U]) 
                          | (0x800000U & ((vlSelf->PSvySI[1U] 
                                           << 8U) | 
                                          (vlSelf->PSvySI[1U] 
                                           << 7U))));
    vlSelf->PSvySI[0U] = ((0xfeffffffU & vlSelf->PSvySI[0U]) 
                          | (0x1000000U & ((vlSelf->PSvySI[1U] 
                                            << 7U) 
                                           | (vlSelf->PSvySI[1U] 
                                              << 6U))));
    vlSelf->PSvySI[0U] = ((0xfdffffffU & vlSelf->PSvySI[0U]) 
                          | (0x2000000U & ((vlSelf->PSvySI[1U] 
                                            << 6U) 
                                           | (vlSelf->PSvySI[1U] 
                                              << 5U))));
    vlSelf->PSvySI[0U] = ((0xfbffffffU & vlSelf->PSvySI[0U]) 
                          | (0x4000000U & ((vlSelf->PSvySI[1U] 
                                            << 5U) 
                                           | (vlSelf->PSvySI[1U] 
                                              << 4U))));
    vlSelf->PSvySI[0U] = ((0xf7ffffffU & vlSelf->PSvySI[0U]) 
                          | (0x8000000U & ((vlSelf->PSvySI[1U] 
                                            << 4U) 
                                           | (vlSelf->PSvySI[1U] 
                                              << 3U))));
    vlSelf->PSvySI[0U] = ((0xefffffffU & vlSelf->PSvySI[0U]) 
                          | (0x10000000U & ((vlSelf->PSvySI[1U] 
                                             << 3U) 
                                            | (vlSelf->PSvySI[1U] 
                                               << 2U))));
    vlSelf->PSvySI[0U] = ((0xdfffffffU & vlSelf->PSvySI[0U]) 
                          | (0x20000000U & ((vlSelf->PSvySI[1U] 
                                             << 2U) 
                                            | (vlSelf->PSvySI[1U] 
                                               << 1U))));
    vlSelf->PSvySI[0U] = ((0xbfffffffU & vlSelf->PSvySI[0U]) 
                          | (0x40000000U & ((vlSelf->PSvySI[1U] 
                                             << 1U) 
                                            | vlSelf->PSvySI[1U])));
    vlSelf->PSvySI[0U] = ((0x7fffffffU & vlSelf->PSvySI[0U]) 
                          | (0x80000000U & ((0x80000000U 
                                             & vlSelf->PSvySI[1U]) 
                                            | (vlSelf->PSvySI[2U] 
                                               << 0x1fU))));
    vlSelf->PSvySI[1U] = ((0xfffffffeU & vlSelf->PSvySI[1U]) 
                          | (1U & ((vlSelf->PSvySI[2U] 
                                    >> 1U) | (vlSelf->PSvySI[2U] 
                                              >> 2U))));
    vlSelf->PSvySI[1U] = ((0xfffffffdU & vlSelf->PSvySI[1U]) 
                          | (2U & ((0x3ffffffeU & (
                                                   vlSelf->PSvySI[2U] 
                                                   >> 2U)) 
                                   | (0x1ffffffeU & 
                                      (vlSelf->PSvySI[2U] 
                                       >> 3U)))));
    vlSelf->PSvySI[1U] = ((0xfffffffbU & vlSelf->PSvySI[1U]) 
                          | (4U & ((0x1ffffffcU & (
                                                   vlSelf->PSvySI[2U] 
                                                   >> 3U)) 
                                   | (0xffffffcU & 
                                      (vlSelf->PSvySI[2U] 
                                       >> 4U)))));
    vlSelf->PSvySI[1U] = ((0xfffffff7U & vlSelf->PSvySI[1U]) 
                          | (8U & ((0xffffff8U & (vlSelf->PSvySI[2U] 
                                                  >> 4U)) 
                                   | (0x7fffff8U & 
                                      (vlSelf->PSvySI[2U] 
                                       >> 5U)))));
    vlSelf->PSvySI[1U] = ((0xffffffefU & vlSelf->PSvySI[1U]) 
                          | (0x10U & ((0x7fffff0U & 
                                       (vlSelf->PSvySI[2U] 
                                        >> 5U)) | (0x3fffff0U 
                                                   & (vlSelf->PSvySI[2U] 
                                                      >> 6U)))));
    vlSelf->PSvySI[1U] = ((0xffffffdfU & vlSelf->PSvySI[1U]) 
                          | (0x20U & ((0x3ffffe0U & 
                                       (vlSelf->PSvySI[2U] 
                                        >> 6U)) | (0x1ffffe0U 
                                                   & (vlSelf->PSvySI[2U] 
                                                      >> 7U)))));
    vlSelf->PSvySI[1U] = ((0xffffffbfU & vlSelf->PSvySI[1U]) 
                          | (0x40U & ((0x1ffffc0U & 
                                       (vlSelf->PSvySI[2U] 
                                        >> 7U)) | (0xffffc0U 
                                                   & (vlSelf->PSvySI[2U] 
                                                      >> 8U)))));
    vlSelf->PSvySI[1U] = ((0xffffff7fU & vlSelf->PSvySI[1U]) 
                          | (0x80U & ((0xffff80U & 
                                       (vlSelf->PSvySI[2U] 
                                        >> 8U)) | (0x7fff80U 
                                                   & (vlSelf->PSvySI[2U] 
                                                      >> 9U)))));
    vlSelf->PSvySI[1U] = ((0xfffffeffU & vlSelf->PSvySI[1U]) 
                          | (0x100U & ((0x7fff00U & 
                                        (vlSelf->PSvySI[2U] 
                                         >> 9U)) | 
                                       (0x3fff00U & 
                                        (vlSelf->PSvySI[2U] 
                                         >> 0xaU)))));
    vlSelf->PSvySI[1U] = ((0xfffffdffU & vlSelf->PSvySI[1U]) 
                          | (0x200U & ((0x3ffe00U & 
                                        (vlSelf->PSvySI[2U] 
                                         >> 0xaU)) 
                                       | (0x1ffe00U 
                                          & (vlSelf->PSvySI[2U] 
                                             >> 0xbU)))));
    vlSelf->PSvySI[1U] = ((0xfffffbffU & vlSelf->PSvySI[1U]) 
                          | (0x400U & ((0x1ffc00U & 
                                        (vlSelf->PSvySI[2U] 
                                         >> 0xbU)) 
                                       | (0xffc00U 
                                          & (vlSelf->PSvySI[2U] 
                                             >> 0xcU)))));
    vlSelf->PSvySI[1U] = ((0xfffff7ffU & vlSelf->PSvySI[1U]) 
                          | (0x800U & ((0xff800U & 
                                        (vlSelf->PSvySI[2U] 
                                         >> 0xcU)) 
                                       | (0x7f800U 
                                          & (vlSelf->PSvySI[2U] 
                                             >> 0xdU)))));
    vlSelf->PSvySI[1U] = ((0xffffefffU & vlSelf->PSvySI[1U]) 
                          | (0x1000U & ((0x7f000U & 
                                         (vlSelf->PSvySI[2U] 
                                          >> 0xdU)) 
                                        | (0x3f000U 
                                           & (vlSelf->PSvySI[2U] 
                                              >> 0xeU)))));
    vlSelf->PSvySI[1U] = ((0xffffdfffU & vlSelf->PSvySI[1U]) 
                          | (0x2000U & ((0x3e000U & 
                                         (vlSelf->PSvySI[2U] 
                                          >> 0xeU)) 
                                        | (0x1e000U 
                                           & (vlSelf->PSvySI[2U] 
                                              >> 0xfU)))));
    vlSelf->PSvySI[1U] = ((0xffffbfffU & vlSelf->PSvySI[1U]) 
                          | (0x4000U & ((0x1c000U & 
                                         (vlSelf->PSvySI[2U] 
                                          >> 0xfU)) 
                                        | (0xc000U 
                                           & (vlSelf->PSvySI[2U] 
                                              >> 0x10U)))));
    vlSelf->PSvySI[1U] = ((0xffff7fffU & vlSelf->PSvySI[1U]) 
                          | (0x8000U & ((0x8000U & 
                                         (vlSelf->PSvySI[2U] 
                                          >> 0x10U)) 
                                        | (vlSelf->PSvySI[3U] 
                                           << 0xfU))));
    vlSelf->PSvySI[1U] = ((0xfffeffffU & vlSelf->PSvySI[1U]) 
                          | (0x10000U & ((vlSelf->PSvySI[3U] 
                                          << 0xfU) 
                                         | (vlSelf->PSvySI[3U] 
                                            << 0xeU))));
    vlSelf->PSvySI[1U] = ((0xfffdffffU & vlSelf->PSvySI[1U]) 
                          | (0x20000U & ((vlSelf->PSvySI[3U] 
                                          << 0xeU) 
                                         | (vlSelf->PSvySI[3U] 
                                            << 0xdU))));
    vlSelf->PSvySI[1U] = ((0xfffbffffU & vlSelf->PSvySI[1U]) 
                          | (0x40000U & ((vlSelf->PSvySI[3U] 
                                          << 0xdU) 
                                         | (vlSelf->PSvySI[3U] 
                                            << 0xcU))));
    vlSelf->PSvySI[1U] = ((0xfff7ffffU & vlSelf->PSvySI[1U]) 
                          | (0x80000U & ((vlSelf->PSvySI[3U] 
                                          << 0xcU) 
                                         | (vlSelf->PSvySI[3U] 
                                            << 0xbU))));
    vlSelf->PSvySI[1U] = ((0xffefffffU & vlSelf->PSvySI[1U]) 
                          | (0x100000U & ((vlSelf->PSvySI[3U] 
                                           << 0xbU) 
                                          | (vlSelf->PSvySI[3U] 
                                             << 0xaU))));
    vlSelf->PSvySI[1U] = ((0xffdfffffU & vlSelf->PSvySI[1U]) 
                          | (0x200000U & ((vlSelf->PSvySI[3U] 
                                           << 0xaU) 
                                          | (vlSelf->PSvySI[3U] 
                                             << 9U))));
    vlSelf->PSvySI[1U] = ((0xffbfffffU & vlSelf->PSvySI[1U]) 
                          | (0x400000U & ((vlSelf->PSvySI[3U] 
                                           << 9U) | 
                                          (vlSelf->PSvySI[3U] 
                                           << 8U))));
    vlSelf->PSvySI[1U] = ((0xff7fffffU & vlSelf->PSvySI[1U]) 
                          | (0x800000U & ((vlSelf->PSvySI[3U] 
                                           << 8U) | 
                                          (vlSelf->PSvySI[3U] 
                                           << 7U))));
    vlSelf->PSvySI[1U] = ((0xfeffffffU & vlSelf->PSvySI[1U]) 
                          | (0x1000000U & ((vlSelf->PSvySI[3U] 
                                            << 7U) 
                                           | (vlSelf->PSvySI[3U] 
                                              << 6U))));
    vlSelf->PSvySI[1U] = ((0xfdffffffU & vlSelf->PSvySI[1U]) 
                          | (0x2000000U & ((vlSelf->PSvySI[3U] 
                                            << 6U) 
                                           | (vlSelf->PSvySI[3U] 
                                              << 5U))));
    vlSelf->PSvySI[1U] = ((0xfbffffffU & vlSelf->PSvySI[1U]) 
                          | (0x4000000U & ((vlSelf->PSvySI[3U] 
                                            << 5U) 
                                           | (vlSelf->PSvySI[3U] 
                                              << 4U))));
    vlSelf->PSvySI[1U] = ((0xf7ffffffU & vlSelf->PSvySI[1U]) 
                          | (0x8000000U & ((vlSelf->PSvySI[3U] 
                                            << 4U) 
                                           | (vlSelf->PSvySI[3U] 
                                              << 3U))));
    vlSelf->PSvySI[1U] = ((0xefffffffU & vlSelf->PSvySI[1U]) 
                          | (0x10000000U & ((vlSelf->PSvySI[3U] 
                                             << 3U) 
                                            | (vlSelf->PSvySI[3U] 
                                               << 2U))));
    vlSelf->PSvySI[1U] = ((0xdfffffffU & vlSelf->PSvySI[1U]) 
                          | (0x20000000U & ((vlSelf->PSvySI[3U] 
                                             << 2U) 
                                            | (vlSelf->PSvySI[3U] 
                                               << 1U))));
    vlSelf->PSvySI[1U] = ((0xbfffffffU & vlSelf->PSvySI[1U]) 
                          | (0x40000000U & ((vlSelf->PSvySI[3U] 
                                             << 1U) 
                                            | vlSelf->PSvySI[3U])));
    vlSelf->PSveW0[0U] = ((0xffffff80U & vlSelf->PSveW0[0U]) 
                          | (0x7fU & ((2U & vlSelf->PSvySI[0U])
                                       ? ((vlSelf->PSveW0[0U] 
                                           << 0x19U) 
                                          | (vlSelf->PSveW0[0U] 
                                             >> 7U))
                                       : ((vlSelf->PSveW0[0U] 
                                           << 0x12U) 
                                          | (vlSelf->PSveW0[0U] 
                                             >> 0xeU)))));
    vlSelf->PSveW0[0U] = ((0xffffc07fU & vlSelf->PSveW0[0U]) 
                          | (0x3f80U & (((8U & vlSelf->PSvySI[0U])
                                          ? ((vlSelf->PSveW0[0U] 
                                              << 0xbU) 
                                             | (vlSelf->PSveW0[0U] 
                                                >> 0x15U))
                                          : ((vlSelf->PSveW0[1U] 
                                              << 4U) 
                                             | (vlSelf->PSveW0[0U] 
                                                >> 0x1cU))) 
                                        << 7U)));
    vlSelf->PSveW0[0U] = ((0xffe03fffU & vlSelf->PSveW0[0U]) 
                          | (0x1fc000U & (((0x20U & 
                                            vlSelf->PSvySI[0U])
                                            ? ((vlSelf->PSveW0[1U] 
                                                << 0x1dU) 
                                               | (vlSelf->PSveW0[1U] 
                                                  >> 3U))
                                            : ((vlSelf->PSveW0[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSveW0[1U] 
                                                  >> 0xaU))) 
                                          << 0xeU)));
    vlSelf->PSveW0[0U] = ((0xf01fffffU & vlSelf->PSveW0[0U]) 
                          | (0xfe00000U & (((0x80U 
                                             & vlSelf->PSvySI[0U])
                                             ? ((vlSelf->PSveW0[1U] 
                                                 << 0xfU) 
                                                | (vlSelf->PSveW0[1U] 
                                                   >> 0x11U))
                                             : ((vlSelf->PSveW0[1U] 
                                                 << 8U) 
                                                | (vlSelf->PSveW0[1U] 
                                                   >> 0x18U))) 
                                           << 0x15U)));
    PSBsuU = (0x7fU & ((0x200U & vlSelf->PSvySI[0U])
                        ? ((vlSelf->PSveW0[2U] << 1U) 
                           | (vlSelf->PSveW0[1U] >> 0x1fU))
                        : ((vlSelf->PSveW0[2U] << 0x1aU) 
                           | (vlSelf->PSveW0[2U] >> 6U))));
    vlSelf->PSveW0[0U] = ((0xfffffffU & vlSelf->PSveW0[0U]) 
                          | (((0x200U & vlSelf->PSvySI[0U])
                               ? ((vlSelf->PSveW0[2U] 
                                   << 1U) | (vlSelf->PSveW0[1U] 
                                             >> 0x1fU))
                               : ((vlSelf->PSveW0[2U] 
                                   << 0x1aU) | (vlSelf->PSveW0[2U] 
                                                >> 6U))) 
                             << 0x1cU));
    vlSelf->PSveW0[1U] = ((0xfffffff8U & vlSelf->PSveW0[1U]) 
                          | (PSBsuU >> 4U));
    vlSelf->PSveW0[1U] = ((0xfffffc07U & vlSelf->PSveW0[1U]) 
                          | (0x3f8U & (((0x800U & vlSelf->PSvySI[0U])
                                         ? ((vlSelf->PSveW0[2U] 
                                             << 0x13U) 
                                            | (vlSelf->PSveW0[2U] 
                                               >> 0xdU))
                                         : ((vlSelf->PSveW0[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSveW0[2U] 
                                               >> 0x14U))) 
                                       << 3U)));
    vlSelf->PSveW0[1U] = ((0xfffe03ffU & vlSelf->PSveW0[1U]) 
                          | (0x1fc00U & (((0x2000U 
                                           & vlSelf->PSvySI[0U])
                                           ? ((vlSelf->PSveW0[3U] 
                                               << 5U) 
                                              | (vlSelf->PSveW0[2U] 
                                                 >> 0x1bU))
                                           : ((vlSelf->PSveW0[3U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSveW0[3U] 
                                                 >> 2U))) 
                                         << 0xaU)));
    vlSelf->PSveW0[1U] = ((0xff01ffffU & vlSelf->PSveW0[1U]) 
                          | (0xfe0000U & (((0x8000U 
                                            & vlSelf->PSvySI[0U])
                                            ? ((vlSelf->PSveW0[3U] 
                                                << 0x17U) 
                                               | (vlSelf->PSveW0[3U] 
                                                  >> 9U))
                                            : ((vlSelf->PSveW0[3U] 
                                                << 0x10U) 
                                               | (vlSelf->PSveW0[3U] 
                                                  >> 0x10U))) 
                                          << 0x11U)));
    vlSelf->PSveW0[1U] = ((0x80ffffffU & vlSelf->PSveW0[1U]) 
                          | (0x7f000000U & (((0x20000U 
                                              & vlSelf->PSvySI[0U])
                                              ? ((vlSelf->PSveW0[3U] 
                                                  << 9U) 
                                                 | (vlSelf->PSveW0[3U] 
                                                    >> 0x17U))
                                              : ((vlSelf->PSveW0[4U] 
                                                  << 2U) 
                                                 | (vlSelf->PSveW0[3U] 
                                                    >> 0x1eU))) 
                                            << 0x18U)));
    PSESoy = (0x7fU & ((0x80000U & vlSelf->PSvySI[0U])
                        ? ((vlSelf->PSveW0[4U] << 0x1bU) 
                           | (vlSelf->PSveW0[4U] >> 5U))
                        : ((vlSelf->PSveW0[4U] << 0x14U) 
                           | (vlSelf->PSveW0[4U] >> 0xcU))));
    vlSelf->PSveW0[1U] = ((0x7fffffffU & vlSelf->PSveW0[1U]) 
                          | (((0x80000U & vlSelf->PSvySI[0U])
                               ? ((vlSelf->PSveW0[4U] 
                                   << 0x1bU) | (vlSelf->PSveW0[4U] 
                                                >> 5U))
                               : ((vlSelf->PSveW0[4U] 
                                   << 0x14U) | (vlSelf->PSveW0[4U] 
                                                >> 0xcU))) 
                             << 0x1fU));
    vlSelf->PSveW0[2U] = ((0xffffffc0U & vlSelf->PSveW0[2U]) 
                          | (PSESoy >> 1U));
    vlSelf->PSveW0[2U] = ((0xffffe03fU & vlSelf->PSveW0[2U]) 
                          | (0x1fc0U & (((0x200000U 
                                          & vlSelf->PSvySI[0U])
                                          ? ((vlSelf->PSveW0[4U] 
                                              << 0xdU) 
                                             | (vlSelf->PSveW0[4U] 
                                                >> 0x13U))
                                          : ((vlSelf->PSveW0[5U] 
                                              << 6U) 
                                             | (vlSelf->PSveW0[4U] 
                                                >> 0x1aU))) 
                                        << 6U)));
    vlSelf->PSveW0[2U] = ((0xfff01fffU & vlSelf->PSveW0[2U]) 
                          | (0xfe000U & (((0x800000U 
                                           & vlSelf->PSvySI[0U])
                                           ? ((vlSelf->PSveW0[5U] 
                                               << 0x1fU) 
                                              | (vlSelf->PSveW0[5U] 
                                                 >> 1U))
                                           : ((vlSelf->PSveW0[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSveW0[5U] 
                                                 >> 8U))) 
                                         << 0xdU)));
    vlSelf->PSveW0[2U] = ((0xf80fffffU & vlSelf->PSveW0[2U]) 
                          | (0x7f00000U & (((0x2000000U 
                                             & vlSelf->PSvySI[0U])
                                             ? ((vlSelf->PSveW0[5U] 
                                                 << 0x11U) 
                                                | (vlSelf->PSveW0[5U] 
                                                   >> 0xfU))
                                             : ((vlSelf->PSveW0[5U] 
                                                 << 0xaU) 
                                                | (vlSelf->PSveW0[5U] 
                                                   >> 0x16U))) 
                                           << 0x14U)));
    PSFwHW = (0x7fU & ((0x8000000U & vlSelf->PSvySI[0U])
                        ? ((vlSelf->PSveW0[6U] << 3U) 
                           | (vlSelf->PSveW0[5U] >> 0x1dU))
                        : ((vlSelf->PSveW0[6U] << 0x1cU) 
                           | (vlSelf->PSveW0[6U] >> 4U))));
    vlSelf->PSveW0[2U] = ((0x7ffffffU & vlSelf->PSveW0[2U]) 
                          | (((0x8000000U & vlSelf->PSvySI[0U])
                               ? ((vlSelf->PSveW0[6U] 
                                   << 3U) | (vlSelf->PSveW0[5U] 
                                             >> 0x1dU))
                               : ((vlSelf->PSveW0[6U] 
                                   << 0x1cU) | (vlSelf->PSveW0[6U] 
                                                >> 4U))) 
                             << 0x1bU));
    vlSelf->PSveW0[3U] = ((0xfffffffcU & vlSelf->PSveW0[3U]) 
                          | (PSFwHW >> 5U));
    vlSelf->PSveW0[3U] = ((0xfffffe03U & vlSelf->PSveW0[3U]) 
                          | (0x1fcU & (((0x20000000U 
                                         & vlSelf->PSvySI[0U])
                                         ? ((vlSelf->PSveW0[6U] 
                                             << 0x15U) 
                                            | (vlSelf->PSveW0[6U] 
                                               >> 0xbU))
                                         : ((vlSelf->PSveW0[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSveW0[6U] 
                                               >> 0x12U))) 
                                       << 2U)));
    vlSelf->PSveW0[3U] = ((0xffff01ffU & vlSelf->PSveW0[3U]) 
                          | (0xfe00U & (((vlSelf->PSvySI[0U] 
                                          >> 0x1fU)
                                          ? ((vlSelf->PSveW0[6U] 
                                              << 7U) 
                                             | (vlSelf->PSveW0[6U] 
                                                >> 0x19U))
                                          : vlSelf->PSveW0[7U]) 
                                        << 9U)));
    vlSelf->PSveW0[3U] = ((0xff80ffffU & vlSelf->PSveW0[3U]) 
                          | (0x7f0000U & (((2U & vlSelf->PSvySI[1U])
                                            ? ((vlSelf->PSveW0[7U] 
                                                << 0x19U) 
                                               | (vlSelf->PSveW0[7U] 
                                                  >> 7U))
                                            : ((vlSelf->PSveW0[7U] 
                                                << 0x12U) 
                                               | (vlSelf->PSveW0[7U] 
                                                  >> 0xeU))) 
                                          << 0x10U)));
    vlSelf->PSveW0[3U] = ((0xc07fffffU & vlSelf->PSveW0[3U]) 
                          | (0x3f800000U & (((8U & 
                                              vlSelf->PSvySI[1U])
                                              ? ((vlSelf->PSveW0[7U] 
                                                  << 0xbU) 
                                                 | (vlSelf->PSveW0[7U] 
                                                    >> 0x15U))
                                              : ((vlSelf->PSveW0[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSveW0[7U] 
                                                    >> 0x1cU))) 
                                            << 0x17U)));
    PSsljg = (0x7fU & ((0x20U & vlSelf->PSvySI[1U])
                        ? ((vlSelf->PSveW0[8U] << 0x1dU) 
                           | (vlSelf->PSveW0[8U] >> 3U))
                        : ((vlSelf->PSveW0[8U] << 0x16U) 
                           | (vlSelf->PSveW0[8U] >> 0xaU))));
    vlSelf->PSveW0[3U] = ((0x3fffffffU & vlSelf->PSveW0[3U]) 
                          | (((0x20U & vlSelf->PSvySI[1U])
                               ? ((vlSelf->PSveW0[8U] 
                                   << 0x1dU) | (vlSelf->PSveW0[8U] 
                                                >> 3U))
                               : ((vlSelf->PSveW0[8U] 
                                   << 0x16U) | (vlSelf->PSveW0[8U] 
                                                >> 0xaU))) 
                             << 0x1eU));
    vlSelf->PSveW0[4U] = ((0xffffffe0U & vlSelf->PSveW0[4U]) 
                          | (PSsljg >> 2U));
    vlSelf->PSveW0[4U] = ((0xfffff01fU & vlSelf->PSveW0[4U]) 
                          | (0xfe0U & (((0x80U & vlSelf->PSvySI[1U])
                                         ? ((vlSelf->PSveW0[8U] 
                                             << 0xfU) 
                                            | (vlSelf->PSveW0[8U] 
                                               >> 0x11U))
                                         : ((vlSelf->PSveW0[8U] 
                                             << 8U) 
                                            | (vlSelf->PSveW0[8U] 
                                               >> 0x18U))) 
                                       << 5U)));
    vlSelf->PSveW0[4U] = ((0xfff80fffU & vlSelf->PSveW0[4U]) 
                          | (0x7f000U & (((0x200U & 
                                           vlSelf->PSvySI[1U])
                                           ? ((vlSelf->PSveW0[9U] 
                                               << 1U) 
                                              | (vlSelf->PSveW0[8U] 
                                                 >> 0x1fU))
                                           : ((vlSelf->PSveW0[9U] 
                                               << 0x1aU) 
                                              | (vlSelf->PSveW0[9U] 
                                                 >> 6U))) 
                                         << 0xcU)));
    vlSelf->PSveW0[4U] = ((0xfc07ffffU & vlSelf->PSveW0[4U]) 
                          | (0x3f80000U & (((0x800U 
                                             & vlSelf->PSvySI[1U])
                                             ? ((vlSelf->PSveW0[9U] 
                                                 << 0x13U) 
                                                | (vlSelf->PSveW0[9U] 
                                                   >> 0xdU))
                                             : ((vlSelf->PSveW0[9U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSveW0[9U] 
                                                   >> 0x14U))) 
                                           << 0x13U)));
    PSIu84 = (0x7fU & ((0x2000U & vlSelf->PSvySI[1U])
                        ? ((vlSelf->PSveW0[0xaU] << 5U) 
                           | (vlSelf->PSveW0[9U] >> 0x1bU))
                        : ((vlSelf->PSveW0[0xaU] << 0x1eU) 
                           | (vlSelf->PSveW0[0xaU] 
                              >> 2U))));
    vlSelf->PSveW0[4U] = ((0x3ffffffU & vlSelf->PSveW0[4U]) 
                          | (((0x2000U & vlSelf->PSvySI[1U])
                               ? ((vlSelf->PSveW0[0xaU] 
                                   << 5U) | (vlSelf->PSveW0[9U] 
                                             >> 0x1bU))
                               : ((vlSelf->PSveW0[0xaU] 
                                   << 0x1eU) | (vlSelf->PSveW0[0xaU] 
                                                >> 2U))) 
                             << 0x1aU));
    vlSelf->PSveW0[5U] = ((0xfffffffeU & vlSelf->PSveW0[5U]) 
                          | (PSIu84 >> 6U));
    vlSelf->PSveW0[5U] = ((0xffffff01U & vlSelf->PSveW0[5U]) 
                          | (0xfeU & (((0x8000U & vlSelf->PSvySI[1U])
                                        ? ((vlSelf->PSveW0[0xaU] 
                                            << 0x17U) 
                                           | (vlSelf->PSveW0[0xaU] 
                                              >> 9U))
                                        : ((vlSelf->PSveW0[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSveW0[0xaU] 
                                              >> 0x10U))) 
                                      << 1U)));
    vlSelf->PSveW0[5U] = ((0xffff80ffU & vlSelf->PSveW0[5U]) 
                          | (0x7f00U & (((0x20000U 
                                          & vlSelf->PSvySI[1U])
                                          ? ((vlSelf->PSveW0[0xaU] 
                                              << 9U) 
                                             | (vlSelf->PSveW0[0xaU] 
                                                >> 0x17U))
                                          : ((vlSelf->PSveW0[0xbU] 
                                              << 2U) 
                                             | (vlSelf->PSveW0[0xaU] 
                                                >> 0x1eU))) 
                                        << 8U)));
    vlSelf->PSveW0[5U] = ((0xffc07fffU & vlSelf->PSveW0[5U]) 
                          | (0x3f8000U & (((0x80000U 
                                            & vlSelf->PSvySI[1U])
                                            ? ((vlSelf->PSveW0[0xbU] 
                                                << 0x1bU) 
                                               | (vlSelf->PSveW0[0xbU] 
                                                  >> 5U))
                                            : ((vlSelf->PSveW0[0xbU] 
                                                << 0x14U) 
                                               | (vlSelf->PSveW0[0xbU] 
                                                  >> 0xcU))) 
                                          << 0xfU)));
    vlSelf->PSveW0[5U] = ((0xe03fffffU & vlSelf->PSveW0[5U]) 
                          | (0x1fc00000U & (((0x200000U 
                                              & vlSelf->PSvySI[1U])
                                              ? ((vlSelf->PSveW0[0xbU] 
                                                  << 0xdU) 
                                                 | (vlSelf->PSveW0[0xbU] 
                                                    >> 0x13U))
                                              : ((vlSelf->PSveW0[0xcU] 
                                                  << 6U) 
                                                 | (vlSelf->PSveW0[0xbU] 
                                                    >> 0x1aU))) 
                                            << 0x16U)));
    PS8GO4 = (0x7fU & ((0x800000U & vlSelf->PSvySI[1U])
                        ? ((vlSelf->PSveW0[0xcU] << 0x1fU) 
                           | (vlSelf->PSveW0[0xcU] 
                              >> 1U)) : ((vlSelf->PSveW0[0xcU] 
                                          << 0x18U) 
                                         | (vlSelf->PSveW0[0xcU] 
                                            >> 8U))));
    vlSelf->PSveW0[5U] = ((0x1fffffffU & vlSelf->PSveW0[5U]) 
                          | (((0x800000U & vlSelf->PSvySI[1U])
                               ? ((vlSelf->PSveW0[0xcU] 
                                   << 0x1fU) | (vlSelf->PSveW0[0xcU] 
                                                >> 1U))
                               : ((vlSelf->PSveW0[0xcU] 
                                   << 0x18U) | (vlSelf->PSveW0[0xcU] 
                                                >> 8U))) 
                             << 0x1dU));
    vlSelf->PSveW0[6U] = ((0xfffffff0U & vlSelf->PSveW0[6U]) 
                          | (PS8GO4 >> 3U));
    vlSelf->PSveW0[6U] = ((0xfffff80fU & vlSelf->PSveW0[6U]) 
                          | (0x7f0U & (((0x2000000U 
                                         & vlSelf->PSvySI[1U])
                                         ? ((vlSelf->PSveW0[0xcU] 
                                             << 0x11U) 
                                            | (vlSelf->PSveW0[0xcU] 
                                               >> 0xfU))
                                         : ((vlSelf->PSveW0[0xcU] 
                                             << 0xaU) 
                                            | (vlSelf->PSveW0[0xcU] 
                                               >> 0x16U))) 
                                       << 4U)));
    vlSelf->PSveW0[6U] = ((0xfffc07ffU & vlSelf->PSveW0[6U]) 
                          | (0x3f800U & (((0x8000000U 
                                           & vlSelf->PSvySI[1U])
                                           ? ((vlSelf->PSveW0[0xdU] 
                                               << 3U) 
                                              | (vlSelf->PSveW0[0xcU] 
                                                 >> 0x1dU))
                                           : ((vlSelf->PSveW0[0xdU] 
                                               << 0x1cU) 
                                              | (vlSelf->PSveW0[0xdU] 
                                                 >> 4U))) 
                                         << 0xbU)));
    vlSelf->PSveW0[6U] = ((0xfe03ffffU & vlSelf->PSveW0[6U]) 
                          | (0x1fc0000U & (((0x20000000U 
                                             & vlSelf->PSvySI[1U])
                                             ? ((vlSelf->PSveW0[0xdU] 
                                                 << 0x15U) 
                                                | (vlSelf->PSveW0[0xdU] 
                                                   >> 0xbU))
                                             : ((vlSelf->PSveW0[0xdU] 
                                                 << 0xeU) 
                                                | (vlSelf->PSveW0[0xdU] 
                                                   >> 0x12U))) 
                                           << 0x12U)));
    vlSelf->PSveW0[6U] = ((0x1ffffffU & vlSelf->PSveW0[6U]) 
                          | (((vlSelf->PSvySI[1U] >> 0x1fU)
                               ? ((vlSelf->PSveW0[0xdU] 
                                   << 7U) | (vlSelf->PSveW0[0xdU] 
                                             >> 0x19U))
                               : vlSelf->PSveW0[0xeU]) 
                             << 0x19U));
    vlSelf->PSveW0[7U] = ((0xffffff80U & vlSelf->PSveW0[7U]) 
                          | (0x7fU & ((2U & vlSelf->PSvySI[2U])
                                       ? ((vlSelf->PSveW0[0xeU] 
                                           << 0x19U) 
                                          | (vlSelf->PSveW0[0xeU] 
                                             >> 7U))
                                       : ((vlSelf->PSveW0[0xeU] 
                                           << 0x12U) 
                                          | (vlSelf->PSveW0[0xeU] 
                                             >> 0xeU)))));
    vlSelf->PSveW0[7U] = ((0xffffc07fU & vlSelf->PSveW0[7U]) 
                          | (0x3f80U & (((8U & vlSelf->PSvySI[2U])
                                          ? ((vlSelf->PSveW0[0xeU] 
                                              << 0xbU) 
                                             | (vlSelf->PSveW0[0xeU] 
                                                >> 0x15U))
                                          : ((vlSelf->PSveW0[0xfU] 
                                              << 4U) 
                                             | (vlSelf->PSveW0[0xeU] 
                                                >> 0x1cU))) 
                                        << 7U)));
    vlSelf->PSveW0[7U] = ((0xffe03fffU & vlSelf->PSveW0[7U]) 
                          | (0x1fc000U & (((0x20U & 
                                            vlSelf->PSvySI[2U])
                                            ? ((vlSelf->PSveW0[0xfU] 
                                                << 0x1dU) 
                                               | (vlSelf->PSveW0[0xfU] 
                                                  >> 3U))
                                            : ((vlSelf->PSveW0[0xfU] 
                                                << 0x16U) 
                                               | (vlSelf->PSveW0[0xfU] 
                                                  >> 0xaU))) 
                                          << 0xeU)));
    vlSelf->PSveW0[7U] = ((0xf01fffffU & vlSelf->PSveW0[7U]) 
                          | (0xfe00000U & (((0x80U 
                                             & vlSelf->PSvySI[2U])
                                             ? ((vlSelf->PSveW0[0xfU] 
                                                 << 0xfU) 
                                                | (vlSelf->PSveW0[0xfU] 
                                                   >> 0x11U))
                                             : ((vlSelf->PSveW0[0xfU] 
                                                 << 8U) 
                                                | (vlSelf->PSveW0[0xfU] 
                                                   >> 0x18U))) 
                                           << 0x15U)));
    PSuEkW = (0x7fU & ((0x200U & vlSelf->PSvySI[2U])
                        ? ((vlSelf->PSveW0[0x10U] << 1U) 
                           | (vlSelf->PSveW0[0xfU] 
                              >> 0x1fU)) : ((vlSelf->PSveW0[0x10U] 
                                             << 0x1aU) 
                                            | (vlSelf->PSveW0[0x10U] 
                                               >> 6U))));
    vlSelf->PSveW0[7U] = ((0xfffffffU & vlSelf->PSveW0[7U]) 
                          | (((0x200U & vlSelf->PSvySI[2U])
                               ? ((vlSelf->PSveW0[0x10U] 
                                   << 1U) | (vlSelf->PSveW0[0xfU] 
                                             >> 0x1fU))
                               : ((vlSelf->PSveW0[0x10U] 
                                   << 0x1aU) | (vlSelf->PSveW0[0x10U] 
                                                >> 6U))) 
                             << 0x1cU));
    vlSelf->PSveW0[8U] = ((0xfffffff8U & vlSelf->PSveW0[8U]) 
                          | (PSuEkW >> 4U));
    vlSelf->PSveW0[8U] = ((0xfffffc07U & vlSelf->PSveW0[8U]) 
                          | (0x3f8U & (((0x800U & vlSelf->PSvySI[2U])
                                         ? ((vlSelf->PSveW0[0x10U] 
                                             << 0x13U) 
                                            | (vlSelf->PSveW0[0x10U] 
                                               >> 0xdU))
                                         : ((vlSelf->PSveW0[0x10U] 
                                             << 0xcU) 
                                            | (vlSelf->PSveW0[0x10U] 
                                               >> 0x14U))) 
                                       << 3U)));
    vlSelf->PSveW0[8U] = ((0xfffe03ffU & vlSelf->PSveW0[8U]) 
                          | (0x1fc00U & (((0x2000U 
                                           & vlSelf->PSvySI[2U])
                                           ? ((vlSelf->PSveW0[0x11U] 
                                               << 5U) 
                                              | (vlSelf->PSveW0[0x10U] 
                                                 >> 0x1bU))
                                           : ((vlSelf->PSveW0[0x11U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSveW0[0x11U] 
                                                 >> 2U))) 
                                         << 0xaU)));
    vlSelf->PSveW0[8U] = ((0xff01ffffU & vlSelf->PSveW0[8U]) 
                          | (0xfe0000U & (((0x8000U 
                                            & vlSelf->PSvySI[2U])
                                            ? ((vlSelf->PSveW0[0x11U] 
                                                << 0x17U) 
                                               | (vlSelf->PSveW0[0x11U] 
                                                  >> 9U))
                                            : ((vlSelf->PSveW0[0x11U] 
                                                << 0x10U) 
                                               | (vlSelf->PSveW0[0x11U] 
                                                  >> 0x10U))) 
                                          << 0x11U)));
    vlSelf->PSveW0[8U] = ((0x80ffffffU & vlSelf->PSveW0[8U]) 
                          | (0x7f000000U & (((0x20000U 
                                              & vlSelf->PSvySI[2U])
                                              ? ((vlSelf->PSveW0[0x11U] 
                                                  << 9U) 
                                                 | (vlSelf->PSveW0[0x11U] 
                                                    >> 0x17U))
                                              : ((vlSelf->PSveW0[0x12U] 
                                                  << 2U) 
                                                 | (vlSelf->PSveW0[0x11U] 
                                                    >> 0x1eU))) 
                                            << 0x18U)));
    PSrVFY = (0x7fU & ((0x80000U & vlSelf->PSvySI[2U])
                        ? ((vlSelf->PSveW0[0x12U] << 0x1bU) 
                           | (vlSelf->PSveW0[0x12U] 
                              >> 5U)) : ((vlSelf->PSveW0[0x12U] 
                                          << 0x14U) 
                                         | (vlSelf->PSveW0[0x12U] 
                                            >> 0xcU))));
    vlSelf->PSveW0[8U] = ((0x7fffffffU & vlSelf->PSveW0[8U]) 
                          | (((0x80000U & vlSelf->PSvySI[2U])
                               ? ((vlSelf->PSveW0[0x12U] 
                                   << 0x1bU) | (vlSelf->PSveW0[0x12U] 
                                                >> 5U))
                               : ((vlSelf->PSveW0[0x12U] 
                                   << 0x14U) | (vlSelf->PSveW0[0x12U] 
                                                >> 0xcU))) 
                             << 0x1fU));
    vlSelf->PSveW0[9U] = ((0xffffffc0U & vlSelf->PSveW0[9U]) 
                          | (PSrVFY >> 1U));
    vlSelf->PSveW0[9U] = ((0xffffe03fU & vlSelf->PSveW0[9U]) 
                          | (0x1fc0U & (((0x200000U 
                                          & vlSelf->PSvySI[2U])
                                          ? ((vlSelf->PSveW0[0x12U] 
                                              << 0xdU) 
                                             | (vlSelf->PSveW0[0x12U] 
                                                >> 0x13U))
                                          : ((vlSelf->PSveW0[0x13U] 
                                              << 6U) 
                                             | (vlSelf->PSveW0[0x12U] 
                                                >> 0x1aU))) 
                                        << 6U)));
    vlSelf->PSveW0[9U] = ((0xfff01fffU & vlSelf->PSveW0[9U]) 
                          | (0xfe000U & (((0x800000U 
                                           & vlSelf->PSvySI[2U])
                                           ? ((vlSelf->PSveW0[0x13U] 
                                               << 0x1fU) 
                                              | (vlSelf->PSveW0[0x13U] 
                                                 >> 1U))
                                           : ((vlSelf->PSveW0[0x13U] 
                                               << 0x18U) 
                                              | (vlSelf->PSveW0[0x13U] 
                                                 >> 8U))) 
                                         << 0xdU)));
    vlSelf->PSveW0[9U] = ((0xf80fffffU & vlSelf->PSveW0[9U]) 
                          | (0x7f00000U & (((0x2000000U 
                                             & vlSelf->PSvySI[2U])
                                             ? ((vlSelf->PSveW0[0x13U] 
                                                 << 0x11U) 
                                                | (vlSelf->PSveW0[0x13U] 
                                                   >> 0xfU))
                                             : ((vlSelf->PSveW0[0x13U] 
                                                 << 0xaU) 
                                                | (vlSelf->PSveW0[0x13U] 
                                                   >> 0x16U))) 
                                           << 0x14U)));
    PSDLgb = (0x7fU & ((0x8000000U & vlSelf->PSvySI[2U])
                        ? ((vlSelf->PSveW0[0x14U] << 3U) 
                           | (vlSelf->PSveW0[0x13U] 
                              >> 0x1dU)) : ((vlSelf->PSveW0[0x14U] 
                                             << 0x1cU) 
                                            | (vlSelf->PSveW0[0x14U] 
                                               >> 4U))));
    vlSelf->PSveW0[9U] = ((0x7ffffffU & vlSelf->PSveW0[9U]) 
                          | (((0x8000000U & vlSelf->PSvySI[2U])
                               ? ((vlSelf->PSveW0[0x14U] 
                                   << 3U) | (vlSelf->PSveW0[0x13U] 
                                             >> 0x1dU))
                               : ((vlSelf->PSveW0[0x14U] 
                                   << 0x1cU) | (vlSelf->PSveW0[0x14U] 
                                                >> 4U))) 
                             << 0x1bU));
    vlSelf->PSveW0[0xaU] = ((0xfffffffcU & vlSelf->PSveW0[0xaU]) 
                            | (PSDLgb >> 5U));
    vlSelf->PSveW0[0xaU] = ((0xfffffe03U & vlSelf->PSveW0[0xaU]) 
                            | (0x1fcU & (((0x20000000U 
                                           & vlSelf->PSvySI[2U])
                                           ? ((vlSelf->PSveW0[0x14U] 
                                               << 0x15U) 
                                              | (vlSelf->PSveW0[0x14U] 
                                                 >> 0xbU))
                                           : ((vlSelf->PSveW0[0x14U] 
                                               << 0xeU) 
                                              | (vlSelf->PSveW0[0x14U] 
                                                 >> 0x12U))) 
                                         << 2U)));
    vlSelf->PSveW0[0xaU] = ((0xffff01ffU & vlSelf->PSveW0[0xaU]) 
                            | (0xfe00U & (((vlSelf->PSvySI[2U] 
                                            >> 0x1fU)
                                            ? ((vlSelf->PSveW0[0x14U] 
                                                << 7U) 
                                               | (vlSelf->PSveW0[0x14U] 
                                                  >> 0x19U))
                                            : vlSelf->PSveW0[0x15U]) 
                                          << 9U)));
    vlSelf->PSveW0[0xaU] = ((0xff80ffffU & vlSelf->PSveW0[0xaU]) 
                            | (0x7f0000U & (((2U & 
                                              vlSelf->PSvySI[3U])
                                              ? ((vlSelf->PSveW0[0x15U] 
                                                  << 0x19U) 
                                                 | (vlSelf->PSveW0[0x15U] 
                                                    >> 7U))
                                              : ((vlSelf->PSveW0[0x15U] 
                                                  << 0x12U) 
                                                 | (vlSelf->PSveW0[0x15U] 
                                                    >> 0xeU))) 
                                            << 0x10U)));
    vlSelf->PSveW0[0xaU] = ((0xc07fffffU & vlSelf->PSveW0[0xaU]) 
                            | (0x3f800000U & (((8U 
                                                & vlSelf->PSvySI[3U])
                                                ? (
                                                   (vlSelf->PSveW0[0x15U] 
                                                    << 0xbU) 
                                                   | (vlSelf->PSveW0[0x15U] 
                                                      >> 0x15U))
                                                : (
                                                   (vlSelf->PSveW0[0x16U] 
                                                    << 4U) 
                                                   | (vlSelf->PSveW0[0x15U] 
                                                      >> 0x1cU))) 
                                              << 0x17U)));
    PSCcnN = (0x7fU & ((0x20U & vlSelf->PSvySI[3U])
                        ? ((vlSelf->PSveW0[0x16U] << 0x1dU) 
                           | (vlSelf->PSveW0[0x16U] 
                              >> 3U)) : ((vlSelf->PSveW0[0x16U] 
                                          << 0x16U) 
                                         | (vlSelf->PSveW0[0x16U] 
                                            >> 0xaU))));
    vlSelf->PSveW0[0xaU] = ((0x3fffffffU & vlSelf->PSveW0[0xaU]) 
                            | (((0x20U & vlSelf->PSvySI[3U])
                                 ? ((vlSelf->PSveW0[0x16U] 
                                     << 0x1dU) | (vlSelf->PSveW0[0x16U] 
                                                  >> 3U))
                                 : ((vlSelf->PSveW0[0x16U] 
                                     << 0x16U) | (vlSelf->PSveW0[0x16U] 
                                                  >> 0xaU))) 
                               << 0x1eU));
    vlSelf->PSveW0[0xbU] = ((0xffffffe0U & vlSelf->PSveW0[0xbU]) 
                            | (PSCcnN >> 2U));
    vlSelf->PSveW0[0xbU] = ((0xfffff01fU & vlSelf->PSveW0[0xbU]) 
                            | (0xfe0U & (((0x80U & 
                                           vlSelf->PSvySI[3U])
                                           ? ((vlSelf->PSveW0[0x16U] 
                                               << 0xfU) 
                                              | (vlSelf->PSveW0[0x16U] 
                                                 >> 0x11U))
                                           : ((vlSelf->PSveW0[0x16U] 
                                               << 8U) 
                                              | (vlSelf->PSveW0[0x16U] 
                                                 >> 0x18U))) 
                                         << 5U)));
    vlSelf->PSveW0[0xbU] = ((0xfff80fffU & vlSelf->PSveW0[0xbU]) 
                            | (0x7f000U & (((0x200U 
                                             & vlSelf->PSvySI[3U])
                                             ? ((vlSelf->PSveW0[0x17U] 
                                                 << 1U) 
                                                | (vlSelf->PSveW0[0x16U] 
                                                   >> 0x1fU))
                                             : ((vlSelf->PSveW0[0x17U] 
                                                 << 0x1aU) 
                                                | (vlSelf->PSveW0[0x17U] 
                                                   >> 6U))) 
                                           << 0xcU)));
    vlSelf->PSveW0[0xbU] = ((0xfc07ffffU & vlSelf->PSveW0[0xbU]) 
                            | (0x3f80000U & (((0x800U 
                                               & vlSelf->PSvySI[3U])
                                               ? ((
                                                   vlSelf->PSveW0[0x17U] 
                                                   << 0x13U) 
                                                  | (vlSelf->PSveW0[0x17U] 
                                                     >> 0xdU))
                                               : ((
                                                   vlSelf->PSveW0[0x17U] 
                                                   << 0xcU) 
                                                  | (vlSelf->PSveW0[0x17U] 
                                                     >> 0x14U))) 
                                             << 0x13U)));
    PSuuqO = (0x7fU & ((0x2000U & vlSelf->PSvySI[3U])
                        ? ((vlSelf->PSveW0[0x18U] << 5U) 
                           | (vlSelf->PSveW0[0x17U] 
                              >> 0x1bU)) : ((vlSelf->PSveW0[0x18U] 
                                             << 0x1eU) 
                                            | (vlSelf->PSveW0[0x18U] 
                                               >> 2U))));
    vlSelf->PSveW0[0xbU] = ((0x3ffffffU & vlSelf->PSveW0[0xbU]) 
                            | (((0x2000U & vlSelf->PSvySI[3U])
                                 ? ((vlSelf->PSveW0[0x18U] 
                                     << 5U) | (vlSelf->PSveW0[0x17U] 
                                               >> 0x1bU))
                                 : ((vlSelf->PSveW0[0x18U] 
                                     << 0x1eU) | (vlSelf->PSveW0[0x18U] 
                                                  >> 2U))) 
                               << 0x1aU));
    vlSelf->PSveW0[0xcU] = ((0xfffffffeU & vlSelf->PSveW0[0xcU]) 
                            | (PSuuqO >> 6U));
    vlSelf->PSveW0[0xcU] = ((0xffffff01U & vlSelf->PSveW0[0xcU]) 
                            | (0xfeU & (((0x8000U & 
                                          vlSelf->PSvySI[3U])
                                          ? ((vlSelf->PSveW0[0x18U] 
                                              << 0x17U) 
                                             | (vlSelf->PSveW0[0x18U] 
                                                >> 9U))
                                          : ((vlSelf->PSveW0[0x18U] 
                                              << 0x10U) 
                                             | (vlSelf->PSveW0[0x18U] 
                                                >> 0x10U))) 
                                        << 1U)));
    vlSelf->PSveW0[0xcU] = ((0xffff80ffU & vlSelf->PSveW0[0xcU]) 
                            | (0x7f00U & (((0x20000U 
                                            & vlSelf->PSvySI[3U])
                                            ? ((vlSelf->PSveW0[0x18U] 
                                                << 9U) 
                                               | (vlSelf->PSveW0[0x18U] 
                                                  >> 0x17U))
                                            : ((vlSelf->PSveW0[0x19U] 
                                                << 2U) 
                                               | (vlSelf->PSveW0[0x18U] 
                                                  >> 0x1eU))) 
                                          << 8U)));
    vlSelf->PSveW0[0xcU] = ((0xffc07fffU & vlSelf->PSveW0[0xcU]) 
                            | (0x3f8000U & (((0x80000U 
                                              & vlSelf->PSvySI[3U])
                                              ? ((vlSelf->PSveW0[0x19U] 
                                                  << 0x1bU) 
                                                 | (vlSelf->PSveW0[0x19U] 
                                                    >> 5U))
                                              : ((vlSelf->PSveW0[0x19U] 
                                                  << 0x14U) 
                                                 | (vlSelf->PSveW0[0x19U] 
                                                    >> 0xcU))) 
                                            << 0xfU)));
    vlSelf->PSveW0[0xcU] = ((0xe03fffffU & vlSelf->PSveW0[0xcU]) 
                            | (0x1fc00000U & (((0x200000U 
                                                & vlSelf->PSvySI[3U])
                                                ? (
                                                   (vlSelf->PSveW0[0x19U] 
                                                    << 0xdU) 
                                                   | (vlSelf->PSveW0[0x19U] 
                                                      >> 0x13U))
                                                : (
                                                   (vlSelf->PSveW0[0x1aU] 
                                                    << 6U) 
                                                   | (vlSelf->PSveW0[0x19U] 
                                                      >> 0x1aU))) 
                                              << 0x16U)));
    PSNJVu = (0x7fU & ((0x800000U & vlSelf->PSvySI[3U])
                        ? ((vlSelf->PSveW0[0x1aU] << 0x1fU) 
                           | (vlSelf->PSveW0[0x1aU] 
                              >> 1U)) : ((vlSelf->PSveW0[0x1aU] 
                                          << 0x18U) 
                                         | (vlSelf->PSveW0[0x1aU] 
                                            >> 8U))));
    vlSelf->PSveW0[0xcU] = ((0x1fffffffU & vlSelf->PSveW0[0xcU]) 
                            | (((0x800000U & vlSelf->PSvySI[3U])
                                 ? ((vlSelf->PSveW0[0x1aU] 
                                     << 0x1fU) | (vlSelf->PSveW0[0x1aU] 
                                                  >> 1U))
                                 : ((vlSelf->PSveW0[0x1aU] 
                                     << 0x18U) | (vlSelf->PSveW0[0x1aU] 
                                                  >> 8U))) 
                               << 0x1dU));
    vlSelf->PSveW0[0xdU] = ((0xfffffff0U & vlSelf->PSveW0[0xdU]) 
                            | (PSNJVu >> 3U));
    vlSelf->PSveW0[0xdU] = ((0xfffff80fU & vlSelf->PSveW0[0xdU]) 
                            | (0x7f0U & (((0x2000000U 
                                           & vlSelf->PSvySI[3U])
                                           ? ((vlSelf->PSveW0[0x1aU] 
                                               << 0x11U) 
                                              | (vlSelf->PSveW0[0x1aU] 
                                                 >> 0xfU))
                                           : ((vlSelf->PSveW0[0x1aU] 
                                               << 0xaU) 
                                              | (vlSelf->PSveW0[0x1aU] 
                                                 >> 0x16U))) 
                                         << 4U)));
    vlSelf->PSveW0[0xdU] = ((0xfffc07ffU & vlSelf->PSveW0[0xdU]) 
                            | (0x3f800U & (((0x8000000U 
                                             & vlSelf->PSvySI[3U])
                                             ? ((vlSelf->PSveW0[0x1bU] 
                                                 << 3U) 
                                                | (vlSelf->PSveW0[0x1aU] 
                                                   >> 0x1dU))
                                             : ((vlSelf->PSveW0[0x1bU] 
                                                 << 0x1cU) 
                                                | (vlSelf->PSveW0[0x1bU] 
                                                   >> 4U))) 
                                           << 0xbU)));
    vlSelf->PSveW0[0xdU] = ((0xfe03ffffU & vlSelf->PSveW0[0xdU]) 
                            | (0x1fc0000U & (((0x20000000U 
                                               & vlSelf->PSvySI[3U])
                                               ? ((
                                                   vlSelf->PSveW0[0x1bU] 
                                                   << 0x15U) 
                                                  | (vlSelf->PSveW0[0x1bU] 
                                                     >> 0xbU))
                                               : ((
                                                   vlSelf->PSveW0[0x1bU] 
                                                   << 0xeU) 
                                                  | (vlSelf->PSveW0[0x1bU] 
                                                     >> 0x12U))) 
                                             << 0x12U)));
    PSbTIc = (0x1fffU & ((VL_GTES_III(1,32,32, 0U, 
                                      VL_EXTENDS_II(32,13, 
                                                    (0x1fffU 
                                                     & (IData)(vlSelf->PSPHhC)))) 
                          | ((IData)(vlSelf->PSpLKn) 
                             & VL_GTES_III(1,32,32, 2U, 
                                           VL_EXTENDS_II(32,13, 
                                                         (0x1fffU 
                                                          & (IData)(vlSelf->PSPHhC))))))
                          ? ((VL_LTES_III(1,32,32, 0U, 
                                          ((IData)(1U) 
                                           + (VL_EXTENDS_II(32,13, 
                                                            (0x1fffU 
                                                             & (IData)(vlSelf->PSuaJV))) 
                                              - VL_EXTENDS_II(32,8, 
                                                              (0x7fU 
                                                               & vlSelf->PSveW0[0U]))))) 
                              & vlSelf->PSvySI[0U])
                              ? ((IData)(1U) + (VL_EXTENDS_II(13,13, 
                                                              (0x1fffU 
                                                               & (IData)(vlSelf->PSuaJV))) 
                                                - VL_EXTENDS_II(13,8, 
                                                                (0x7fU 
                                                                 & vlSelf->PSveW0[0U]))))
                              : 0U) : (IData)(vlSelf->PSdNMK)));
    PSRIVU[0U] = vlSelf->PS8c4f[0U];
    PSRIVU[1U] = vlSelf->PS8c4f[1U];
    PSRIVU[2U] = vlSelf->PS8c4f[2U];
    PSRIVU[3U] = vlSelf->PS8c4f[3U];
    PSRIVU[4U] = vlSelf->PS8c4f[4U];
    PSRIVU[5U] = (7U & vlSelf->PS8c4f[5U]);
    VL_EXTEND_WW(164,163, PSNRoV, PSRIVU);
    VL_SHIFTL_WWI(164,164,8, PSGmY6, PSNRoV, (0xffU 
                                              & ((VL_GTES_III(1,32,32, 0U, 
                                                              VL_EXTENDS_II(32,13, 
                                                                            (0x1fffU 
                                                                             & (IData)(vlSelf->PSPHhC)))) 
                                                  | ((IData)(vlSelf->PSpLKn) 
                                                     & VL_GTES_III(1,32,32, 2U, 
                                                                   VL_EXTENDS_II(32,13, 
                                                                                (0x1fffU 
                                                                                & (IData)(vlSelf->PSPHhC))))))
                                                  ? 
                                                 ((VL_LTES_III(1,32,32, 0U, 
                                                               ((IData)(1U) 
                                                                + 
                                                                (VL_EXTENDS_II(32,13, 
                                                                               (0x1fffU 
                                                                                & (IData)(vlSelf->PSuaJV))) 
                                                                 - 
                                                                 VL_EXTENDS_II(32,8, 
                                                                               (0x7fU 
                                                                                & vlSelf->PSveW0[0U]))))) 
                                                   & vlSelf->PSvySI[0U])
                                                   ? 
                                                  ((IData)(0x37U) 
                                                   + 
                                                   (0x7fU 
                                                    & vlSelf->PSveW0[0U]))
                                                   : 
                                                  ((IData)(0x37U) 
                                                   + 
                                                   VL_EXTENDS_II(8,13, 
                                                                 (0x1fffU 
                                                                  & (IData)(vlSelf->PSuaJV)))))
                                                  : vlSelf->PS1dxj)));
    PS8e4c[0U] = PSGmY6[0U];
    PS8e4c[1U] = PSGmY6[1U];
    PS8e4c[2U] = PSGmY6[2U];
    PS8e4c[3U] = PSGmY6[3U];
    PS8e4c[4U] = PSGmY6[4U];
    PS8e4c[5U] = (0xfU & PSGmY6[5U]);
    vlSelf->PSIckZ = ((0xfffffffffffffffeULL & vlSelf->PSIckZ) 
                      | (IData)((IData)((0ULL != (6ULL 
                                                  & vlSelf->PSIckZ)))));
    vlSelf->PSIckZ = ((0xfffffffffffffffdULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 1U));
    vlSelf->PSIckZ = ((0xfffffffffffffffbULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 2U));
    vlSelf->PSIckZ = ((0xfffffffffffffff7ULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 3U));
    vlSelf->PSIckZ = ((0xffffffffffffffefULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 4U));
    vlSelf->PSIckZ = ((0xffffffffffffffdfULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 5U));
    vlSelf->PSIckZ = ((0xffffffffffffffbfULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 6U));
    vlSelf->PSIckZ = ((0xffffffffffffff7fULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 7U));
    vlSelf->PSIckZ = ((0xfffffffffffffeffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 8U));
    vlSelf->PSIckZ = ((0xfffffffffffffdffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 9U));
    vlSelf->PSIckZ = ((0xfffffffffffffbffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0xaU));
    vlSelf->PSIckZ = ((0xfffffffffffff7ffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0xbU));
    vlSelf->PSIckZ = ((0xffffffffffffefffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0xcU));
    vlSelf->PSIckZ = ((0xffffffffffffdfffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0xdU));
    vlSelf->PSIckZ = ((0xffffffffffffbfffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0xeU));
    vlSelf->PSIckZ = ((0xffffffffffff7fffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0xfU));
    vlSelf->PSIckZ = ((0xfffffffffffeffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x10U));
    vlSelf->PSIckZ = ((0xfffffffffffdffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x11U));
    vlSelf->PSIckZ = ((0xfffffffffffbffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x12U));
    vlSelf->PSIckZ = ((0xfffffffffff7ffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x13U));
    vlSelf->PSIckZ = ((0xffffffffffefffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x14U));
    vlSelf->PSIckZ = ((0xffffffffffdfffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x15U));
    vlSelf->PSIckZ = ((0xffffffffffbfffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x16U));
    vlSelf->PSIckZ = ((0xffffffffff7fffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x17U));
    vlSelf->PSIckZ = ((0xfffffffffeffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x18U));
    vlSelf->PSIckZ = ((0xfffffffffdffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x19U));
    vlSelf->PSIckZ = ((0xfffffffffbffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x1aU));
    vlSelf->PSIckZ = ((0xfffffffff7ffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x1bU));
    vlSelf->PSIckZ = ((0xffffffffefffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x1cU));
    vlSelf->PSIckZ = ((0xffffffffdfffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x1dU));
    vlSelf->PSIckZ = ((0xffffffffbfffffffULL & vlSelf->PSIckZ) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000000ULL 
                                                   & vlSelf->PSIckZ))))) 
                         << 0x1eU));
    vlSelf->PSq6A8[0U] = ((0xffffffc0U & vlSelf->PSq6A8[0U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSIckZ 
                                                     >> 1U)))
                                       ? ((vlSelf->PSq6A8[0U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSq6A8[0U] 
                                             >> 6U))
                                       : ((vlSelf->PSq6A8[0U] 
                                           << 0x14U) 
                                          | (vlSelf->PSq6A8[0U] 
                                             >> 0xcU)))));
    vlSelf->PSq6A8[0U] = ((0xfffff03fU & vlSelf->PSq6A8[0U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSIckZ 
                                                       >> 3U)))
                                         ? ((vlSelf->PSq6A8[0U] 
                                             << 0xeU) 
                                            | (vlSelf->PSq6A8[0U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSq6A8[0U] 
                                             << 8U) 
                                            | (vlSelf->PSq6A8[0U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSq6A8[0U] = ((0xfffc0fffU & vlSelf->PSq6A8[0U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSIckZ 
                                                         >> 5U)))
                                           ? ((vlSelf->PSq6A8[1U] 
                                               << 2U) 
                                              | (vlSelf->PSq6A8[0U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSq6A8[1U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSq6A8[1U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSq6A8[0U] = ((0xff03ffffU & vlSelf->PSq6A8[0U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSIckZ 
                                                          >> 7U)))
                                            ? ((vlSelf->PSq6A8[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSq6A8[1U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSq6A8[1U] 
                                                << 0x10U) 
                                               | (vlSelf->PSq6A8[1U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSq6A8[0U] = ((0xc0ffffffU & vlSelf->PSq6A8[0U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSIckZ 
                                                            >> 9U)))
                                              ? ((vlSelf->PSq6A8[1U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSq6A8[1U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSq6A8[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSq6A8[1U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PS1k3F = (0x3fU & ((1U & (IData)((vlSelf->PSIckZ 
                                      >> 0xbU))) ? 
                       ((vlSelf->PSq6A8[2U] << 0x1eU) 
                        | (vlSelf->PSq6A8[2U] >> 2U))
                        : ((vlSelf->PSq6A8[2U] << 0x18U) 
                           | (vlSelf->PSq6A8[2U] >> 8U))));
    vlSelf->PSq6A8[0U] = ((0x3fffffffU & vlSelf->PSq6A8[0U]) 
                          | (((1U & (IData)((vlSelf->PSIckZ 
                                             >> 0xbU)))
                               ? ((vlSelf->PSq6A8[2U] 
                                   << 0x1eU) | (vlSelf->PSq6A8[2U] 
                                                >> 2U))
                               : ((vlSelf->PSq6A8[2U] 
                                   << 0x18U) | (vlSelf->PSq6A8[2U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSq6A8[1U] = ((0xfffffff0U & vlSelf->PSq6A8[1U]) 
                          | (PS1k3F >> 2U));
    vlSelf->PSq6A8[1U] = ((0xfffffc0fU & vlSelf->PSq6A8[1U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSIckZ 
                                                       >> 0xdU)))
                                         ? ((vlSelf->PSq6A8[2U] 
                                             << 0x12U) 
                                            | (vlSelf->PSq6A8[2U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSq6A8[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSq6A8[2U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSq6A8[1U] = ((0xffff03ffU & vlSelf->PSq6A8[1U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSIckZ 
                                                        >> 0xfU)))
                                          ? ((vlSelf->PSq6A8[2U] 
                                              << 6U) 
                                             | (vlSelf->PSq6A8[2U] 
                                                >> 0x1aU))
                                          : vlSelf->PSq6A8[3U]) 
                                        << 0xaU)));
    vlSelf->PSq6A8[1U] = ((0xffc0ffffU & vlSelf->PSq6A8[1U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSIckZ 
                                                          >> 0x11U)))
                                            ? ((vlSelf->PSq6A8[3U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSq6A8[3U] 
                                                  >> 6U))
                                            : ((vlSelf->PSq6A8[3U] 
                                                << 0x14U) 
                                               | (vlSelf->PSq6A8[3U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSq6A8[1U] = ((0xf03fffffU & vlSelf->PSq6A8[1U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSIckZ 
                                                           >> 0x13U)))
                                             ? ((vlSelf->PSq6A8[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSq6A8[3U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSq6A8[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSq6A8[3U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSclXN = (0x3fU & ((1U & (IData)((vlSelf->PSIckZ 
                                      >> 0x15U))) ? 
                       ((vlSelf->PSq6A8[4U] << 2U) 
                        | (vlSelf->PSq6A8[3U] >> 0x1eU))
                        : ((vlSelf->PSq6A8[4U] << 0x1cU) 
                           | (vlSelf->PSq6A8[4U] >> 4U))));
    vlSelf->PSq6A8[1U] = ((0xfffffffU & vlSelf->PSq6A8[1U]) 
                          | (((1U & (IData)((vlSelf->PSIckZ 
                                             >> 0x15U)))
                               ? ((vlSelf->PSq6A8[4U] 
                                   << 2U) | (vlSelf->PSq6A8[3U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSq6A8[4U] 
                                   << 0x1cU) | (vlSelf->PSq6A8[4U] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSq6A8[2U] = ((0xfffffffcU & vlSelf->PSq6A8[2U]) 
                          | (PSclXN >> 4U));
    vlSelf->PSq6A8[2U] = ((0xffffff03U & vlSelf->PSq6A8[2U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSIckZ 
                                                      >> 0x17U)))
                                        ? ((vlSelf->PSq6A8[4U] 
                                            << 0x16U) 
                                           | (vlSelf->PSq6A8[4U] 
                                              >> 0xaU))
                                        : ((vlSelf->PSq6A8[4U] 
                                            << 0x10U) 
                                           | (vlSelf->PSq6A8[4U] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSq6A8[2U] = ((0xffffc0ffU & vlSelf->PSq6A8[2U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSIckZ 
                                                        >> 0x19U)))
                                          ? ((vlSelf->PSq6A8[4U] 
                                              << 0xaU) 
                                             | (vlSelf->PSq6A8[4U] 
                                                >> 0x16U))
                                          : ((vlSelf->PSq6A8[5U] 
                                              << 4U) 
                                             | (vlSelf->PSq6A8[4U] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSq6A8[2U] = ((0xfff03fffU & vlSelf->PSq6A8[2U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSIckZ 
                                                         >> 0x1bU)))
                                           ? ((vlSelf->PSq6A8[5U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSq6A8[5U] 
                                                 >> 2U))
                                           : ((vlSelf->PSq6A8[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSq6A8[5U] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSq6A8[2U] = ((0xfc0fffffU & vlSelf->PSq6A8[2U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSIckZ 
                                                           >> 0x1dU)))
                                             ? ((vlSelf->PSq6A8[5U] 
                                                 << 0x12U) 
                                                | (vlSelf->PSq6A8[5U] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSq6A8[5U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSq6A8[5U] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSq6A8[2U] = ((0x3ffffffU & vlSelf->PSq6A8[2U]) 
                          | (((1U & (IData)((vlSelf->PSIckZ 
                                             >> 0x1fU)))
                               ? ((vlSelf->PSq6A8[5U] 
                                   << 6U) | (vlSelf->PSq6A8[5U] 
                                             >> 0x1aU))
                               : vlSelf->PSq6A8[6U]) 
                             << 0x1aU));
    vlSelf->PSq6A8[3U] = ((0xffffffc0U & vlSelf->PSq6A8[3U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PSIckZ 
                                                     >> 0x21U)))
                                       ? ((vlSelf->PSq6A8[6U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSq6A8[6U] 
                                             >> 6U))
                                       : ((vlSelf->PSq6A8[6U] 
                                           << 0x14U) 
                                          | (vlSelf->PSq6A8[6U] 
                                             >> 0xcU)))));
    vlSelf->PSq6A8[3U] = ((0xfffff03fU & vlSelf->PSq6A8[3U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PSIckZ 
                                                       >> 0x23U)))
                                         ? ((vlSelf->PSq6A8[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSq6A8[6U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSq6A8[6U] 
                                             << 8U) 
                                            | (vlSelf->PSq6A8[6U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSq6A8[3U] = ((0xfffc0fffU & vlSelf->PSq6A8[3U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PSIckZ 
                                                         >> 0x25U)))
                                           ? ((vlSelf->PSq6A8[7U] 
                                               << 2U) 
                                              | (vlSelf->PSq6A8[6U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSq6A8[7U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSq6A8[7U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSq6A8[3U] = ((0xff03ffffU & vlSelf->PSq6A8[3U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PSIckZ 
                                                          >> 0x27U)))
                                            ? ((vlSelf->PSq6A8[7U] 
                                                << 0x16U) 
                                               | (vlSelf->PSq6A8[7U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSq6A8[7U] 
                                                << 0x10U) 
                                               | (vlSelf->PSq6A8[7U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSq6A8[3U] = ((0xc0ffffffU & vlSelf->PSq6A8[3U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PSIckZ 
                                                            >> 0x29U)))
                                              ? ((vlSelf->PSq6A8[7U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSq6A8[7U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSq6A8[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSq6A8[7U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSHuEN = (0x3fU & ((1U & (IData)((vlSelf->PSIckZ 
                                      >> 0x2bU))) ? 
                       ((vlSelf->PSq6A8[8U] << 0x1eU) 
                        | (vlSelf->PSq6A8[8U] >> 2U))
                        : ((vlSelf->PSq6A8[8U] << 0x18U) 
                           | (vlSelf->PSq6A8[8U] >> 8U))));
    vlSelf->PSq6A8[3U] = ((0x3fffffffU & vlSelf->PSq6A8[3U]) 
                          | (((1U & (IData)((vlSelf->PSIckZ 
                                             >> 0x2bU)))
                               ? ((vlSelf->PSq6A8[8U] 
                                   << 0x1eU) | (vlSelf->PSq6A8[8U] 
                                                >> 2U))
                               : ((vlSelf->PSq6A8[8U] 
                                   << 0x18U) | (vlSelf->PSq6A8[8U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSq6A8[4U] = ((0xfffffff0U & vlSelf->PSq6A8[4U]) 
                          | (PSHuEN >> 2U));
    vlSelf->PSq6A8[4U] = ((0xfffffc0fU & vlSelf->PSq6A8[4U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PSIckZ 
                                                       >> 0x2dU)))
                                         ? ((vlSelf->PSq6A8[8U] 
                                             << 0x12U) 
                                            | (vlSelf->PSq6A8[8U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSq6A8[8U] 
                                             << 0xcU) 
                                            | (vlSelf->PSq6A8[8U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSq6A8[4U] = ((0xffff03ffU & vlSelf->PSq6A8[4U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PSIckZ 
                                                        >> 0x2fU)))
                                          ? ((vlSelf->PSq6A8[8U] 
                                              << 6U) 
                                             | (vlSelf->PSq6A8[8U] 
                                                >> 0x1aU))
                                          : vlSelf->PSq6A8[9U]) 
                                        << 0xaU)));
    vlSelf->PSq6A8[4U] = ((0xffc0ffffU & vlSelf->PSq6A8[4U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PSIckZ 
                                                          >> 0x31U)))
                                            ? ((vlSelf->PSq6A8[9U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSq6A8[9U] 
                                                  >> 6U))
                                            : ((vlSelf->PSq6A8[9U] 
                                                << 0x14U) 
                                               | (vlSelf->PSq6A8[9U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSq6A8[4U] = ((0xf03fffffU & vlSelf->PSq6A8[4U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PSIckZ 
                                                           >> 0x33U)))
                                             ? ((vlSelf->PSq6A8[9U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSq6A8[9U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSq6A8[9U] 
                                                 << 8U) 
                                                | (vlSelf->PSq6A8[9U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PScsyq = (0x3fU & ((1U & (IData)((vlSelf->PSIckZ 
                                      >> 0x35U))) ? 
                       ((vlSelf->PSq6A8[0xaU] << 2U) 
                        | (vlSelf->PSq6A8[9U] >> 0x1eU))
                        : ((vlSelf->PSq6A8[0xaU] << 0x1cU) 
                           | (vlSelf->PSq6A8[0xaU] 
                              >> 4U))));
    vlSelf->PSq6A8[4U] = ((0xfffffffU & vlSelf->PSq6A8[4U]) 
                          | (((1U & (IData)((vlSelf->PSIckZ 
                                             >> 0x35U)))
                               ? ((vlSelf->PSq6A8[0xaU] 
                                   << 2U) | (vlSelf->PSq6A8[9U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSq6A8[0xaU] 
                                   << 0x1cU) | (vlSelf->PSq6A8[0xaU] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSq6A8[5U] = ((0xfffffffcU & vlSelf->PSq6A8[5U]) 
                          | (PScsyq >> 4U));
    vlSelf->PSq6A8[5U] = ((0xffffff03U & vlSelf->PSq6A8[5U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PSIckZ 
                                                      >> 0x37U)))
                                        ? ((vlSelf->PSq6A8[0xaU] 
                                            << 0x16U) 
                                           | (vlSelf->PSq6A8[0xaU] 
                                              >> 0xaU))
                                        : ((vlSelf->PSq6A8[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSq6A8[0xaU] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSq6A8[5U] = ((0xffffc0ffU & vlSelf->PSq6A8[5U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PSIckZ 
                                                        >> 0x39U)))
                                          ? ((vlSelf->PSq6A8[0xaU] 
                                              << 0xaU) 
                                             | (vlSelf->PSq6A8[0xaU] 
                                                >> 0x16U))
                                          : ((vlSelf->PSq6A8[0xbU] 
                                              << 4U) 
                                             | (vlSelf->PSq6A8[0xaU] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSq6A8[5U] = ((0xfff03fffU & vlSelf->PSq6A8[5U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PSIckZ 
                                                         >> 0x3bU)))
                                           ? ((vlSelf->PSq6A8[0xbU] 
                                               << 0x1eU) 
                                              | (vlSelf->PSq6A8[0xbU] 
                                                 >> 2U))
                                           : ((vlSelf->PSq6A8[0xbU] 
                                               << 0x18U) 
                                              | (vlSelf->PSq6A8[0xbU] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSq6A8[5U] = ((0xfc0fffffU & vlSelf->PSq6A8[5U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PSIckZ 
                                                           >> 0x3dU)))
                                             ? ((vlSelf->PSq6A8[0xbU] 
                                                 << 0x12U) 
                                                | (vlSelf->PSq6A8[0xbU] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSq6A8[0xbU] 
                                                 << 0xcU) 
                                                | (vlSelf->PSq6A8[0xbU] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    PSaiLd = (0x3ffU & ((VL_GTES_III(1,32,32, 0U, VL_EXTENDS_II(32,10, 
                                                                (0x3ffU 
                                                                 & vlSelf->PStiRI))) 
                         | ((IData)(vlSelf->PSbW7P) 
                            & VL_GTES_III(1,32,32, 2U, 
                                          VL_EXTENDS_II(32,10, 
                                                        (0x3ffU 
                                                         & vlSelf->PStiRI)))))
                         ? ((VL_LTES_III(1,32,32, 0U, 
                                         ((IData)(1U) 
                                          + (VL_EXTENDS_II(32,10, 
                                                           (0x3ffU 
                                                            & vlSelf->PSZrId)) 
                                             - VL_EXTENDS_II(32,7, 
                                                             (0x3fU 
                                                              & vlSelf->PSq6A8[0U]))))) 
                             & (IData)(vlSelf->PSIckZ))
                             ? ((IData)(1U) + (VL_EXTENDS_II(10,10, 
                                                             (0x3ffU 
                                                              & vlSelf->PSZrId)) 
                                               - VL_EXTENDS_II(10,7, 
                                                               (0x3fU 
                                                                & vlSelf->PSq6A8[0U]))))
                             : 0U) : vlSelf->PS953l));
    PS1BZk[0U] = vlSelf->PScTBB[0U];
    PS1BZk[1U] = vlSelf->PScTBB[1U];
    PS1BZk[2U] = (0xfffU & vlSelf->PScTBB[2U]);
    VL_EXTEND_WW(77,76, PSN8e1, PS1BZk);
    VL_SHIFTL_WWI(77,77,7, PSrdUa, PSN8e1, (0x7fU & 
                                            ((VL_GTES_III(1,32,32, 0U, 
                                                          VL_EXTENDS_II(32,10, 
                                                                        (0x3ffU 
                                                                         & vlSelf->PStiRI))) 
                                              | ((IData)(vlSelf->PSbW7P) 
                                                 & VL_GTES_III(1,32,32, 2U, 
                                                               VL_EXTENDS_II(32,10, 
                                                                             (0x3ffU 
                                                                              & vlSelf->PStiRI)))))
                                              ? ((VL_LTES_III(1,32,32, 0U, 
                                                              ((IData)(1U) 
                                                               + 
                                                               (VL_EXTENDS_II(32,10, 
                                                                              (0x3ffU 
                                                                               & vlSelf->PSZrId)) 
                                                                - 
                                                                VL_EXTENDS_II(32,7, 
                                                                              (0x3fU 
                                                                               & vlSelf->PSq6A8[0U]))))) 
                                                  & (IData)(vlSelf->PSIckZ))
                                                  ? 
                                                 ((IData)(0x1aU) 
                                                  + 
                                                  (0x3fU 
                                                   & vlSelf->PSq6A8[0U]))
                                                  : 
                                                 ((IData)(0x1aU) 
                                                  + 
                                                  VL_EXTENDS_II(7,10, 
                                                                (0x3ffU 
                                                                 & vlSelf->PSZrId))))
                                              : vlSelf->PSd63h)));
    PSDAA2[0U] = PSrdUa[0U];
    PSDAA2[1U] = PSrdUa[1U];
    PSDAA2[2U] = (0x1fffU & PSrdUa[2U]);
    vlSelf->PS8wu8 = ((0xfffffffffffffffeULL & vlSelf->PS8wu8) 
                      | (IData)((IData)((0ULL != (6ULL 
                                                  & vlSelf->PS8wu8)))));
    vlSelf->PS8wu8 = ((0xfffffffffffffffdULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 1U));
    vlSelf->PS8wu8 = ((0xfffffffffffffffbULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 2U));
    vlSelf->PS8wu8 = ((0xfffffffffffffff7ULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 3U));
    vlSelf->PS8wu8 = ((0xffffffffffffffefULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 4U));
    vlSelf->PS8wu8 = ((0xffffffffffffffdfULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 5U));
    vlSelf->PS8wu8 = ((0xffffffffffffffbfULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 6U));
    vlSelf->PS8wu8 = ((0xffffffffffffff7fULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 7U));
    vlSelf->PS8wu8 = ((0xfffffffffffffeffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 8U));
    vlSelf->PS8wu8 = ((0xfffffffffffffdffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 9U));
    vlSelf->PS8wu8 = ((0xfffffffffffffbffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0xaU));
    vlSelf->PS8wu8 = ((0xfffffffffffff7ffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0xbU));
    vlSelf->PS8wu8 = ((0xffffffffffffefffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0xcU));
    vlSelf->PS8wu8 = ((0xffffffffffffdfffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0xdU));
    vlSelf->PS8wu8 = ((0xffffffffffffbfffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0xeU));
    vlSelf->PS8wu8 = ((0xffffffffffff7fffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0xfU));
    vlSelf->PS8wu8 = ((0xfffffffffffeffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x10U));
    vlSelf->PS8wu8 = ((0xfffffffffffdffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x11U));
    vlSelf->PS8wu8 = ((0xfffffffffffbffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x12U));
    vlSelf->PS8wu8 = ((0xfffffffffff7ffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x13U));
    vlSelf->PS8wu8 = ((0xffffffffffefffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x14U));
    vlSelf->PS8wu8 = ((0xffffffffffdfffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x15U));
    vlSelf->PS8wu8 = ((0xffffffffffbfffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x16U));
    vlSelf->PS8wu8 = ((0xffffffffff7fffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x17U));
    vlSelf->PS8wu8 = ((0xfffffffffeffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x18U));
    vlSelf->PS8wu8 = ((0xfffffffffdffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x18000000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x19U));
    vlSelf->PS8wu8 = ((0xfffffffffbffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x60000000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x1aU));
    vlSelf->PS8wu8 = ((0xfffffffff7ffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x180000000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x1bU));
    vlSelf->PS8wu8 = ((0xffffffffefffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x600000000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x1cU));
    vlSelf->PS8wu8 = ((0xffffffffdfffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x1800000000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x1dU));
    vlSelf->PS8wu8 = ((0xffffffffbfffffffULL & vlSelf->PS8wu8) 
                      | ((QData)((IData)((IData)((0ULL 
                                                  != 
                                                  (0x6000000000000000ULL 
                                                   & vlSelf->PS8wu8))))) 
                         << 0x1eU));
    vlSelf->PSzMHi[0U] = ((0xffffffc0U & vlSelf->PSzMHi[0U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PS8wu8 
                                                     >> 1U)))
                                       ? ((vlSelf->PSzMHi[0U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSzMHi[0U] 
                                             >> 6U))
                                       : ((vlSelf->PSzMHi[0U] 
                                           << 0x14U) 
                                          | (vlSelf->PSzMHi[0U] 
                                             >> 0xcU)))));
    vlSelf->PSzMHi[0U] = ((0xfffff03fU & vlSelf->PSzMHi[0U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PS8wu8 
                                                       >> 3U)))
                                         ? ((vlSelf->PSzMHi[0U] 
                                             << 0xeU) 
                                            | (vlSelf->PSzMHi[0U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSzMHi[0U] 
                                             << 8U) 
                                            | (vlSelf->PSzMHi[0U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSzMHi[0U] = ((0xfffc0fffU & vlSelf->PSzMHi[0U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PS8wu8 
                                                         >> 5U)))
                                           ? ((vlSelf->PSzMHi[1U] 
                                               << 2U) 
                                              | (vlSelf->PSzMHi[0U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSzMHi[1U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSzMHi[1U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSzMHi[0U] = ((0xff03ffffU & vlSelf->PSzMHi[0U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PS8wu8 
                                                          >> 7U)))
                                            ? ((vlSelf->PSzMHi[1U] 
                                                << 0x16U) 
                                               | (vlSelf->PSzMHi[1U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSzMHi[1U] 
                                                << 0x10U) 
                                               | (vlSelf->PSzMHi[1U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSzMHi[0U] = ((0xc0ffffffU & vlSelf->PSzMHi[0U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PS8wu8 
                                                            >> 9U)))
                                              ? ((vlSelf->PSzMHi[1U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSzMHi[1U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSzMHi[2U] 
                                                  << 4U) 
                                                 | (vlSelf->PSzMHi[1U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PStLjc = (0x3fU & ((1U & (IData)((vlSelf->PS8wu8 
                                      >> 0xbU))) ? 
                       ((vlSelf->PSzMHi[2U] << 0x1eU) 
                        | (vlSelf->PSzMHi[2U] >> 2U))
                        : ((vlSelf->PSzMHi[2U] << 0x18U) 
                           | (vlSelf->PSzMHi[2U] >> 8U))));
    vlSelf->PSzMHi[0U] = ((0x3fffffffU & vlSelf->PSzMHi[0U]) 
                          | (((1U & (IData)((vlSelf->PS8wu8 
                                             >> 0xbU)))
                               ? ((vlSelf->PSzMHi[2U] 
                                   << 0x1eU) | (vlSelf->PSzMHi[2U] 
                                                >> 2U))
                               : ((vlSelf->PSzMHi[2U] 
                                   << 0x18U) | (vlSelf->PSzMHi[2U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSzMHi[1U] = ((0xfffffff0U & vlSelf->PSzMHi[1U]) 
                          | (PStLjc >> 2U));
    vlSelf->PSzMHi[1U] = ((0xfffffc0fU & vlSelf->PSzMHi[1U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PS8wu8 
                                                       >> 0xdU)))
                                         ? ((vlSelf->PSzMHi[2U] 
                                             << 0x12U) 
                                            | (vlSelf->PSzMHi[2U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSzMHi[2U] 
                                             << 0xcU) 
                                            | (vlSelf->PSzMHi[2U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSzMHi[1U] = ((0xffff03ffU & vlSelf->PSzMHi[1U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PS8wu8 
                                                        >> 0xfU)))
                                          ? ((vlSelf->PSzMHi[2U] 
                                              << 6U) 
                                             | (vlSelf->PSzMHi[2U] 
                                                >> 0x1aU))
                                          : vlSelf->PSzMHi[3U]) 
                                        << 0xaU)));
    vlSelf->PSzMHi[1U] = ((0xffc0ffffU & vlSelf->PSzMHi[1U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PS8wu8 
                                                          >> 0x11U)))
                                            ? ((vlSelf->PSzMHi[3U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSzMHi[3U] 
                                                  >> 6U))
                                            : ((vlSelf->PSzMHi[3U] 
                                                << 0x14U) 
                                               | (vlSelf->PSzMHi[3U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSzMHi[1U] = ((0xf03fffffU & vlSelf->PSzMHi[1U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PS8wu8 
                                                           >> 0x13U)))
                                             ? ((vlSelf->PSzMHi[3U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSzMHi[3U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSzMHi[3U] 
                                                 << 8U) 
                                                | (vlSelf->PSzMHi[3U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PS8VUi = (0x3fU & ((1U & (IData)((vlSelf->PS8wu8 
                                      >> 0x15U))) ? 
                       ((vlSelf->PSzMHi[4U] << 2U) 
                        | (vlSelf->PSzMHi[3U] >> 0x1eU))
                        : ((vlSelf->PSzMHi[4U] << 0x1cU) 
                           | (vlSelf->PSzMHi[4U] >> 4U))));
    vlSelf->PSzMHi[1U] = ((0xfffffffU & vlSelf->PSzMHi[1U]) 
                          | (((1U & (IData)((vlSelf->PS8wu8 
                                             >> 0x15U)))
                               ? ((vlSelf->PSzMHi[4U] 
                                   << 2U) | (vlSelf->PSzMHi[3U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSzMHi[4U] 
                                   << 0x1cU) | (vlSelf->PSzMHi[4U] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSzMHi[2U] = ((0xfffffffcU & vlSelf->PSzMHi[2U]) 
                          | (PS8VUi >> 4U));
    vlSelf->PSzMHi[2U] = ((0xffffff03U & vlSelf->PSzMHi[2U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PS8wu8 
                                                      >> 0x17U)))
                                        ? ((vlSelf->PSzMHi[4U] 
                                            << 0x16U) 
                                           | (vlSelf->PSzMHi[4U] 
                                              >> 0xaU))
                                        : ((vlSelf->PSzMHi[4U] 
                                            << 0x10U) 
                                           | (vlSelf->PSzMHi[4U] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSzMHi[2U] = ((0xffffc0ffU & vlSelf->PSzMHi[2U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PS8wu8 
                                                        >> 0x19U)))
                                          ? ((vlSelf->PSzMHi[4U] 
                                              << 0xaU) 
                                             | (vlSelf->PSzMHi[4U] 
                                                >> 0x16U))
                                          : ((vlSelf->PSzMHi[5U] 
                                              << 4U) 
                                             | (vlSelf->PSzMHi[4U] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSzMHi[2U] = ((0xfff03fffU & vlSelf->PSzMHi[2U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PS8wu8 
                                                         >> 0x1bU)))
                                           ? ((vlSelf->PSzMHi[5U] 
                                               << 0x1eU) 
                                              | (vlSelf->PSzMHi[5U] 
                                                 >> 2U))
                                           : ((vlSelf->PSzMHi[5U] 
                                               << 0x18U) 
                                              | (vlSelf->PSzMHi[5U] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSzMHi[2U] = ((0xfc0fffffU & vlSelf->PSzMHi[2U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PS8wu8 
                                                           >> 0x1dU)))
                                             ? ((vlSelf->PSzMHi[5U] 
                                                 << 0x12U) 
                                                | (vlSelf->PSzMHi[5U] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSzMHi[5U] 
                                                 << 0xcU) 
                                                | (vlSelf->PSzMHi[5U] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    vlSelf->PSzMHi[2U] = ((0x3ffffffU & vlSelf->PSzMHi[2U]) 
                          | (((1U & (IData)((vlSelf->PS8wu8 
                                             >> 0x1fU)))
                               ? ((vlSelf->PSzMHi[5U] 
                                   << 6U) | (vlSelf->PSzMHi[5U] 
                                             >> 0x1aU))
                               : vlSelf->PSzMHi[6U]) 
                             << 0x1aU));
    vlSelf->PSzMHi[3U] = ((0xffffffc0U & vlSelf->PSzMHi[3U]) 
                          | (0x3fU & ((1U & (IData)(
                                                    (vlSelf->PS8wu8 
                                                     >> 0x21U)))
                                       ? ((vlSelf->PSzMHi[6U] 
                                           << 0x1aU) 
                                          | (vlSelf->PSzMHi[6U] 
                                             >> 6U))
                                       : ((vlSelf->PSzMHi[6U] 
                                           << 0x14U) 
                                          | (vlSelf->PSzMHi[6U] 
                                             >> 0xcU)))));
    vlSelf->PSzMHi[3U] = ((0xfffff03fU & vlSelf->PSzMHi[3U]) 
                          | (0xfc0U & (((1U & (IData)(
                                                      (vlSelf->PS8wu8 
                                                       >> 0x23U)))
                                         ? ((vlSelf->PSzMHi[6U] 
                                             << 0xeU) 
                                            | (vlSelf->PSzMHi[6U] 
                                               >> 0x12U))
                                         : ((vlSelf->PSzMHi[6U] 
                                             << 8U) 
                                            | (vlSelf->PSzMHi[6U] 
                                               >> 0x18U))) 
                                       << 6U)));
    vlSelf->PSzMHi[3U] = ((0xfffc0fffU & vlSelf->PSzMHi[3U]) 
                          | (0x3f000U & (((1U & (IData)(
                                                        (vlSelf->PS8wu8 
                                                         >> 0x25U)))
                                           ? ((vlSelf->PSzMHi[7U] 
                                               << 2U) 
                                              | (vlSelf->PSzMHi[6U] 
                                                 >> 0x1eU))
                                           : ((vlSelf->PSzMHi[7U] 
                                               << 0x1cU) 
                                              | (vlSelf->PSzMHi[7U] 
                                                 >> 4U))) 
                                         << 0xcU)));
    vlSelf->PSzMHi[3U] = ((0xff03ffffU & vlSelf->PSzMHi[3U]) 
                          | (0xfc0000U & (((1U & (IData)(
                                                         (vlSelf->PS8wu8 
                                                          >> 0x27U)))
                                            ? ((vlSelf->PSzMHi[7U] 
                                                << 0x16U) 
                                               | (vlSelf->PSzMHi[7U] 
                                                  >> 0xaU))
                                            : ((vlSelf->PSzMHi[7U] 
                                                << 0x10U) 
                                               | (vlSelf->PSzMHi[7U] 
                                                  >> 0x10U))) 
                                          << 0x12U)));
    vlSelf->PSzMHi[3U] = ((0xc0ffffffU & vlSelf->PSzMHi[3U]) 
                          | (0x3f000000U & (((1U & (IData)(
                                                           (vlSelf->PS8wu8 
                                                            >> 0x29U)))
                                              ? ((vlSelf->PSzMHi[7U] 
                                                  << 0xaU) 
                                                 | (vlSelf->PSzMHi[7U] 
                                                    >> 0x16U))
                                              : ((vlSelf->PSzMHi[8U] 
                                                  << 4U) 
                                                 | (vlSelf->PSzMHi[7U] 
                                                    >> 0x1cU))) 
                                            << 0x18U)));
    PSxJzo = (0x3fU & ((1U & (IData)((vlSelf->PS8wu8 
                                      >> 0x2bU))) ? 
                       ((vlSelf->PSzMHi[8U] << 0x1eU) 
                        | (vlSelf->PSzMHi[8U] >> 2U))
                        : ((vlSelf->PSzMHi[8U] << 0x18U) 
                           | (vlSelf->PSzMHi[8U] >> 8U))));
    vlSelf->PSzMHi[3U] = ((0x3fffffffU & vlSelf->PSzMHi[3U]) 
                          | (((1U & (IData)((vlSelf->PS8wu8 
                                             >> 0x2bU)))
                               ? ((vlSelf->PSzMHi[8U] 
                                   << 0x1eU) | (vlSelf->PSzMHi[8U] 
                                                >> 2U))
                               : ((vlSelf->PSzMHi[8U] 
                                   << 0x18U) | (vlSelf->PSzMHi[8U] 
                                                >> 8U))) 
                             << 0x1eU));
    vlSelf->PSzMHi[4U] = ((0xfffffff0U & vlSelf->PSzMHi[4U]) 
                          | (PSxJzo >> 2U));
    vlSelf->PSzMHi[4U] = ((0xfffffc0fU & vlSelf->PSzMHi[4U]) 
                          | (0x3f0U & (((1U & (IData)(
                                                      (vlSelf->PS8wu8 
                                                       >> 0x2dU)))
                                         ? ((vlSelf->PSzMHi[8U] 
                                             << 0x12U) 
                                            | (vlSelf->PSzMHi[8U] 
                                               >> 0xeU))
                                         : ((vlSelf->PSzMHi[8U] 
                                             << 0xcU) 
                                            | (vlSelf->PSzMHi[8U] 
                                               >> 0x14U))) 
                                       << 4U)));
    vlSelf->PSzMHi[4U] = ((0xffff03ffU & vlSelf->PSzMHi[4U]) 
                          | (0xfc00U & (((1U & (IData)(
                                                       (vlSelf->PS8wu8 
                                                        >> 0x2fU)))
                                          ? ((vlSelf->PSzMHi[8U] 
                                              << 6U) 
                                             | (vlSelf->PSzMHi[8U] 
                                                >> 0x1aU))
                                          : vlSelf->PSzMHi[9U]) 
                                        << 0xaU)));
    vlSelf->PSzMHi[4U] = ((0xffc0ffffU & vlSelf->PSzMHi[4U]) 
                          | (0x3f0000U & (((1U & (IData)(
                                                         (vlSelf->PS8wu8 
                                                          >> 0x31U)))
                                            ? ((vlSelf->PSzMHi[9U] 
                                                << 0x1aU) 
                                               | (vlSelf->PSzMHi[9U] 
                                                  >> 6U))
                                            : ((vlSelf->PSzMHi[9U] 
                                                << 0x14U) 
                                               | (vlSelf->PSzMHi[9U] 
                                                  >> 0xcU))) 
                                          << 0x10U)));
    vlSelf->PSzMHi[4U] = ((0xf03fffffU & vlSelf->PSzMHi[4U]) 
                          | (0xfc00000U & (((1U & (IData)(
                                                          (vlSelf->PS8wu8 
                                                           >> 0x33U)))
                                             ? ((vlSelf->PSzMHi[9U] 
                                                 << 0xeU) 
                                                | (vlSelf->PSzMHi[9U] 
                                                   >> 0x12U))
                                             : ((vlSelf->PSzMHi[9U] 
                                                 << 8U) 
                                                | (vlSelf->PSzMHi[9U] 
                                                   >> 0x18U))) 
                                           << 0x16U)));
    PSOibO = (0x3fU & ((1U & (IData)((vlSelf->PS8wu8 
                                      >> 0x35U))) ? 
                       ((vlSelf->PSzMHi[0xaU] << 2U) 
                        | (vlSelf->PSzMHi[9U] >> 0x1eU))
                        : ((vlSelf->PSzMHi[0xaU] << 0x1cU) 
                           | (vlSelf->PSzMHi[0xaU] 
                              >> 4U))));
    vlSelf->PSzMHi[4U] = ((0xfffffffU & vlSelf->PSzMHi[4U]) 
                          | (((1U & (IData)((vlSelf->PS8wu8 
                                             >> 0x35U)))
                               ? ((vlSelf->PSzMHi[0xaU] 
                                   << 2U) | (vlSelf->PSzMHi[9U] 
                                             >> 0x1eU))
                               : ((vlSelf->PSzMHi[0xaU] 
                                   << 0x1cU) | (vlSelf->PSzMHi[0xaU] 
                                                >> 4U))) 
                             << 0x1cU));
    vlSelf->PSzMHi[5U] = ((0xfffffffcU & vlSelf->PSzMHi[5U]) 
                          | (PSOibO >> 4U));
    vlSelf->PSzMHi[5U] = ((0xffffff03U & vlSelf->PSzMHi[5U]) 
                          | (0xfcU & (((1U & (IData)(
                                                     (vlSelf->PS8wu8 
                                                      >> 0x37U)))
                                        ? ((vlSelf->PSzMHi[0xaU] 
                                            << 0x16U) 
                                           | (vlSelf->PSzMHi[0xaU] 
                                              >> 0xaU))
                                        : ((vlSelf->PSzMHi[0xaU] 
                                            << 0x10U) 
                                           | (vlSelf->PSzMHi[0xaU] 
                                              >> 0x10U))) 
                                      << 2U)));
    vlSelf->PSzMHi[5U] = ((0xffffc0ffU & vlSelf->PSzMHi[5U]) 
                          | (0x3f00U & (((1U & (IData)(
                                                       (vlSelf->PS8wu8 
                                                        >> 0x39U)))
                                          ? ((vlSelf->PSzMHi[0xaU] 
                                              << 0xaU) 
                                             | (vlSelf->PSzMHi[0xaU] 
                                                >> 0x16U))
                                          : ((vlSelf->PSzMHi[0xbU] 
                                              << 4U) 
                                             | (vlSelf->PSzMHi[0xaU] 
                                                >> 0x1cU))) 
                                        << 8U)));
    vlSelf->PSzMHi[5U] = ((0xfff03fffU & vlSelf->PSzMHi[5U]) 
                          | (0xfc000U & (((1U & (IData)(
                                                        (vlSelf->PS8wu8 
                                                         >> 0x3bU)))
                                           ? ((vlSelf->PSzMHi[0xbU] 
                                               << 0x1eU) 
                                              | (vlSelf->PSzMHi[0xbU] 
                                                 >> 2U))
                                           : ((vlSelf->PSzMHi[0xbU] 
                                               << 0x18U) 
                                              | (vlSelf->PSzMHi[0xbU] 
                                                 >> 8U))) 
                                         << 0xeU)));
    vlSelf->PSzMHi[5U] = ((0xfc0fffffU & vlSelf->PSzMHi[5U]) 
                          | (0x3f00000U & (((1U & (IData)(
                                                          (vlSelf->PS8wu8 
                                                           >> 0x3dU)))
                                             ? ((vlSelf->PSzMHi[0xbU] 
                                                 << 0x12U) 
                                                | (vlSelf->PSzMHi[0xbU] 
                                                   >> 0xeU))
                                             : ((vlSelf->PSzMHi[0xbU] 
                                                 << 0xcU) 
                                                | (vlSelf->PSzMHi[0xbU] 
                                                   >> 0x14U))) 
                                           << 0x14U)));
    PS2TF2 = (0x3ffU & ((VL_GTES_III(1,32,32, 0U, VL_EXTENDS_II(32,10, 
                                                                (0x3ffU 
                                                                 & vlSelf->PS7Bjk))) 
                         | ((IData)(vlSelf->PS6IZJ) 
                            & VL_GTES_III(1,32,32, 2U, 
                                          VL_EXTENDS_II(32,10, 
                                                        (0x3ffU 
                                                         & vlSelf->PS7Bjk)))))
                         ? ((VL_LTES_III(1,32,32, 0U, 
                                         ((IData)(1U) 
                                          + (VL_EXTENDS_II(32,10, 
                                                           (0x3ffU 
                                                            & vlSelf->PSD2nM)) 
                                             - VL_EXTENDS_II(32,7, 
                                                             (0x3fU 
                                                              & vlSelf->PSzMHi[0U]))))) 
                             & (IData)(vlSelf->PS8wu8))
                             ? ((IData)(1U) + (VL_EXTENDS_II(10,10, 
                                                             (0x3ffU 
                                                              & vlSelf->PSD2nM)) 
                                               - VL_EXTENDS_II(10,7, 
                                                               (0x3fU 
                                                                & vlSelf->PSzMHi[0U]))))
                             : 0U) : vlSelf->PSbXmX));
    PSOs0W[0U] = vlSelf->PSxOdi[0U];
    PSOs0W[1U] = vlSelf->PSxOdi[1U];
    PSOs0W[2U] = (0xfffU & vlSelf->PSxOdi[2U]);
    VL_EXTEND_WW(77,76, PSyPAK, PSOs0W);
    VL_SHIFTL_WWI(77,77,7, PSQxN8, PSyPAK, (0x7fU & 
                                            ((VL_GTES_III(1,32,32, 0U, 
                                                          VL_EXTENDS_II(32,10, 
                                                                        (0x3ffU 
                                                                         & vlSelf->PS7Bjk))) 
                                              | ((IData)(vlSelf->PS6IZJ) 
                                                 & VL_GTES_III(1,32,32, 2U, 
                                                               VL_EXTENDS_II(32,10, 
                                                                             (0x3ffU 
                                                                              & vlSelf->PS7Bjk)))))
                                              ? ((VL_LTES_III(1,32,32, 0U, 
                                                              ((IData)(1U) 
                                                               + 
                                                               (VL_EXTENDS_II(32,10, 
                                                                              (0x3ffU 
                                                                               & vlSelf->PSD2nM)) 
                                                                - 
                                                                VL_EXTENDS_II(32,7, 
                                                                              (0x3fU 
                                                                               & vlSelf->PSzMHi[0U]))))) 
                                                  & (IData)(vlSelf->PS8wu8))
                                                  ? 
                                                 ((IData)(0x1aU) 
                                                  + 
                                                  (0x3fU 
                                                   & vlSelf->PSzMHi[0U]))
                                                  : 
                                                 ((IData)(0x1aU) 
                                                  + 
                                                  VL_EXTENDS_II(7,10, 
                                                                (0x3ffU 
                                                                 & vlSelf->PSD2nM))))
                                              : vlSelf->PSOReO)));
    PSSV1e[0U] = PSQxN8[0U];
    PSSV1e[1U] = PSQxN8[1U];
    PSSV1e[2U] = (0x1fffU & PSQxN8[2U]);
    PSLFov = (0x1ffffffffULL & (vlSelf->PSql71 >> (IData)(vlSelf->PSXfLK)));
    PSUVSt = (0x1ffffffffULL & (vlSelf->PSW5Ul >> (IData)(vlSelf->PSmC9h)));
    VL_SHIFTR_WWI(129,129,7, PSTBZf, vlSelf->PSS0B6, (IData)(vlSelf->PSyDpY));
    PSNPnY[0U] = PSTBZf[0U];
    PSNPnY[1U] = PSTBZf[1U];
    PSNPnY[2U] = PSTBZf[2U];
    PSNPnY[3U] = PSTBZf[3U];
    PSNPnY[4U] = (1U & PSTBZf[4U]);
    VL_SHIFTR_WWI(129,129,7, PSMOlI, vlSelf->PSEx6P, (IData)(vlSelf->PSWqXS));
    PSxL7G[0U] = PSMOlI[0U];
    PSxL7G[1U] = PSMOlI[1U];
    PSxL7G[2U] = PSMOlI[2U];
    PSxL7G[3U] = PSMOlI[3U];
    PSxL7G[4U] = (1U & PSMOlI[4U]);
    PSuE7l = (0x1ffffffU & (IData)(vlSelf->PSPkU5));
    if ((1U & (IData)((vlSelf->PSPkU5 >> 0x25U)))) {
        PSuE7l = (0x1ffffffU & (IData)((vlSelf->PSPkU5 
                                        >> 1U)));
    } else if ((1U & (~ (IData)((vlSelf->PSPkU5 >> 0x24U))))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(vlSelf->PSM0kR)))) {
            PSuE7l = (0x1ffffffU & (IData)((0x3fffffffffULL 
                                            & (vlSelf->PSPkU5 
                                               << 1U))));
        }
    }
    PSXIen = (0xfffU & (IData)((vlSelf->PSPkU5 >> 0x19U)));
    if ((1U & (IData)((vlSelf->PSPkU5 >> 0x25U)))) {
        PSXIen = (0xfffU & (IData)((vlSelf->PSPkU5 
                                    >> 0x1aU)));
    } else if ((1U & (~ (IData)((vlSelf->PSPkU5 >> 0x24U))))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(vlSelf->PSM0kR)))) {
            PSXIen = (0xfffU & (IData)((0x1fffULL & 
                                        (vlSelf->PSPkU5 
                                         >> 0x18U))));
        }
    }
    PSaxr7 = vlSelf->PSM0kR;
    if ((1U & (IData)((vlSelf->PSPkU5 >> 0x25U)))) {
        PSaxr7 = (0x7fU & ((IData)(1U) + VL_EXTENDS_II(7,7, (IData)(vlSelf->PSM0kR))));
    } else if ((1U & (~ (IData)((vlSelf->PSPkU5 >> 0x24U))))) {
        PSaxr7 = (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(vlSelf->PSM0kR)))
                   ? (0x7fU & (VL_EXTENDS_II(7,7, (IData)(vlSelf->PSM0kR)) 
                               - (IData)(1U))) : 0U);
    }
    PSmbOI = (0x1ffffffU & (IData)(vlSelf->PStYQ3));
    if ((1U & (IData)((vlSelf->PStYQ3 >> 0x25U)))) {
        PSmbOI = (0x1ffffffU & (IData)((vlSelf->PStYQ3 
                                        >> 1U)));
    } else if ((1U & (~ (IData)((vlSelf->PStYQ3 >> 0x24U))))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(vlSelf->PS3e4A)))) {
            PSmbOI = (0x1ffffffU & (IData)((0x3fffffffffULL 
                                            & (vlSelf->PStYQ3 
                                               << 1U))));
        }
    }
    PSCune = (0xfffU & (IData)((vlSelf->PStYQ3 >> 0x19U)));
    if ((1U & (IData)((vlSelf->PStYQ3 >> 0x25U)))) {
        PSCune = (0xfffU & (IData)((vlSelf->PStYQ3 
                                    >> 0x1aU)));
    } else if ((1U & (~ (IData)((vlSelf->PStYQ3 >> 0x24U))))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(vlSelf->PS3e4A)))) {
            PSCune = (0xfffU & (IData)((0x1fffULL & 
                                        (vlSelf->PStYQ3 
                                         >> 0x18U))));
        }
    }
    PSYtgg = vlSelf->PS3e4A;
    if ((1U & (IData)((vlSelf->PStYQ3 >> 0x25U)))) {
        PSYtgg = (0x7fU & ((IData)(1U) + VL_EXTENDS_II(7,7, (IData)(vlSelf->PS3e4A))));
    } else if ((1U & (~ (IData)((vlSelf->PStYQ3 >> 0x24U))))) {
        PSYtgg = (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(vlSelf->PS3e4A)))
                   ? (0x7fU & (VL_EXTENDS_II(7,7, (IData)(vlSelf->PS3e4A)) 
                               - (IData)(1U))) : 0U);
    }
    PSHXYw = (0x1ffffffU & (IData)(PSJKFD));
    if ((1U & (IData)((PSJKFD >> 0x25U)))) {
        PSHXYw = (0x1ffffffU & (IData)((PSJKFD >> 1U)));
    } else if ((1U & (~ (IData)((PSJKFD >> 0x24U))))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(PSye2j)))) {
            PSHXYw = (0x1ffffffU & (IData)((0x3fffffffffULL 
                                            & (PSJKFD 
                                               << 1U))));
        }
    }
    PSq1V8 = (0xfffU & (IData)((PSJKFD >> 0x19U)));
    if ((1U & (IData)((PSJKFD >> 0x25U)))) {
        PSq1V8 = (0xfffU & (IData)((PSJKFD >> 0x1aU)));
    } else if ((1U & (~ (IData)((PSJKFD >> 0x24U))))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(PSye2j)))) {
            PSq1V8 = (0xfffU & (IData)((0x1fffULL & 
                                        (PSJKFD >> 0x18U))));
        }
    }
    PSeFQ6 = PSye2j;
    if ((1U & (IData)((PSJKFD >> 0x25U)))) {
        PSeFQ6 = (0x7fU & ((IData)(1U) + VL_EXTENDS_II(7,7, (IData)(PSye2j))));
    } else if ((1U & (~ (IData)((PSJKFD >> 0x24U))))) {
        PSeFQ6 = (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(PSye2j)))
                   ? (0x7fU & (VL_EXTENDS_II(7,7, (IData)(PSye2j)) 
                               - (IData)(1U))) : 0U);
    }
    PSzM28 = (0x1ffffffU & (IData)(PSBSb7));
    if ((1U & (IData)((PSBSb7 >> 0x25U)))) {
        PSzM28 = (0x1ffffffU & (IData)((PSBSb7 >> 1U)));
    } else if ((1U & (~ (IData)((PSBSb7 >> 0x24U))))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(PSlNNU)))) {
            PSzM28 = (0x1ffffffU & (IData)((0x3fffffffffULL 
                                            & (PSBSb7 
                                               << 1U))));
        }
    }
    PSUKFR = (0xfffU & (IData)((PSBSb7 >> 0x19U)));
    if ((1U & (IData)((PSBSb7 >> 0x25U)))) {
        PSUKFR = (0xfffU & (IData)((PSBSb7 >> 0x1aU)));
    } else if ((1U & (~ (IData)((PSBSb7 >> 0x24U))))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(PSlNNU)))) {
            PSUKFR = (0xfffU & (IData)((0x1fffULL & 
                                        (PSBSb7 >> 0x18U))));
        }
    }
    PSNOHO = PSlNNU;
    if ((1U & (IData)((PSBSb7 >> 0x25U)))) {
        PSNOHO = (0x7fU & ((IData)(1U) + VL_EXTENDS_II(7,7, (IData)(PSlNNU))));
    } else if ((1U & (~ (IData)((PSBSb7 >> 0x24U))))) {
        PSNOHO = (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,7, (IData)(PSlNNU)))
                   ? (0x7fU & (VL_EXTENDS_II(7,7, (IData)(PSlNNU)) 
                               - (IData)(1U))) : 0U);
    }
    PSFGfR[0U] = PS8e4c[0U];
    PSFGfR[1U] = PS8e4c[1U];
    PSFGfR[2U] = PS8e4c[2U];
    PSFGfR[3U] = (0x1fffU & PS8e4c[3U]);
    if ((8U & PS8e4c[5U])) {
        PSFGfR[0U] = ((PS8e4c[1U] << 0x1fU) | (PS8e4c[0U] 
                                               >> 1U));
        PSFGfR[1U] = ((PS8e4c[2U] << 0x1fU) | (PS8e4c[1U] 
                                               >> 1U));
        PSFGfR[2U] = ((PS8e4c[3U] << 0x1fU) | (PS8e4c[2U] 
                                               >> 1U));
        PSFGfR[3U] = (0x1fffU & (PS8e4c[3U] >> 1U));
    } else if ((1U & (~ (PS8e4c[5U] >> 2U)))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,13, (IData)(PSbTIc)))) {
            VL_SHIFTL_WWI(164,164,32, PSlL1N, PS8e4c, 1U);
            PSFGfR[0U] = PSlL1N[0U];
            PSFGfR[1U] = PSlL1N[1U];
            PSFGfR[2U] = PSlL1N[2U];
            PSFGfR[3U] = (0x1fffU & PSlL1N[3U]);
        }
    }
    PSWWsD = (0x3fffffffffffffULL & (((QData)((IData)(
                                                      PS8e4c[5U])) 
                                      << 0x33U) | (
                                                   ((QData)((IData)(
                                                                    PS8e4c[4U])) 
                                                    << 0x13U) 
                                                   | ((QData)((IData)(
                                                                      PS8e4c[3U])) 
                                                      >> 0xdU))));
    if ((8U & PS8e4c[5U])) {
        PSWWsD = (0x3fffffffffffffULL & (((QData)((IData)(
                                                          PS8e4c[5U])) 
                                          << 0x32U) 
                                         | (((QData)((IData)(
                                                             PS8e4c[4U])) 
                                             << 0x12U) 
                                            | ((QData)((IData)(
                                                               PS8e4c[3U])) 
                                               >> 0xeU))));
    } else if ((1U & (~ (PS8e4c[5U] >> 2U)))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,13, (IData)(PSbTIc)))) {
            VL_SHIFTL_WWI(164,164,32, PSAxNB, PS8e4c, 1U);
            PSWWsD = (0x3fffffffffffffULL & (((QData)((IData)(
                                                              (0xfU 
                                                               & PSAxNB[5U]))) 
                                              << 0x33U) 
                                             | (((QData)((IData)(
                                                                 PSAxNB[4U])) 
                                                 << 0x13U) 
                                                | ((QData)((IData)(
                                                                   PSAxNB[3U])) 
                                                   >> 0xdU))));
        }
    }
    PS1AVg = PSbTIc;
    if ((8U & PS8e4c[5U])) {
        PS1AVg = (0x1fffU & ((IData)(1U) + VL_EXTENDS_II(13,13, (IData)(PSbTIc))));
    } else if ((1U & (~ (PS8e4c[5U] >> 2U)))) {
        PS1AVg = (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,13, (IData)(PSbTIc)))
                   ? (0x1fffU & (VL_EXTENDS_II(13,13, (IData)(PSbTIc)) 
                                 - (IData)(1U))) : 0U);
    }
    PSo4BV = (0x7ffffffffffffULL & (((QData)((IData)(
                                                     PSDAA2[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 PSDAA2[0U]))));
    if ((0x1000U & PSDAA2[2U])) {
        PSo4BV = (0x7ffffffffffffULL & (((QData)((IData)(
                                                         PSDAA2[1U])) 
                                         << 0x1fU) 
                                        | ((QData)((IData)(
                                                           PSDAA2[0U])) 
                                           >> 1U)));
    } else if ((1U & (~ (PSDAA2[2U] >> 0xbU)))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,10, (IData)(PSaiLd)))) {
            VL_SHIFTL_WWI(77,77,32, PSr4XX, PSDAA2, 1U);
            PSo4BV = (0x7ffffffffffffULL & (((QData)((IData)(
                                                             PSr4XX[1U])) 
                                             << 0x20U) 
                                            | (QData)((IData)(
                                                              PSr4XX[0U]))));
        }
    }
    PSELhs = (0x1ffffffU & ((PSDAA2[2U] << 0xdU) | 
                            (PSDAA2[1U] >> 0x13U)));
    if ((0x1000U & PSDAA2[2U])) {
        PSELhs = (0x1ffffffU & ((PSDAA2[2U] << 0xcU) 
                                | (PSDAA2[1U] >> 0x14U)));
    } else if ((1U & (~ (PSDAA2[2U] >> 0xbU)))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,10, (IData)(PSaiLd)))) {
            VL_SHIFTL_WWI(77,77,32, PSFB2e, PSDAA2, 1U);
            PSELhs = (0x1ffffffU & ((0x3ffe000U & (
                                                   PSFB2e[2U] 
                                                   << 0xdU)) 
                                    | (PSFB2e[1U] >> 0x13U)));
        }
    }
    PS2BQO = PSaiLd;
    if ((0x1000U & PSDAA2[2U])) {
        PS2BQO = (0x3ffU & ((IData)(1U) + VL_EXTENDS_II(10,10, (IData)(PSaiLd))));
    } else if ((1U & (~ (PSDAA2[2U] >> 0xbU)))) {
        PS2BQO = (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,10, (IData)(PSaiLd)))
                   ? (0x3ffU & (VL_EXTENDS_II(10,10, (IData)(PSaiLd)) 
                                - (IData)(1U))) : 0U);
    }
    PSBXAW = (0x7ffffffffffffULL & (((QData)((IData)(
                                                     PSSV1e[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 PSSV1e[0U]))));
    if ((0x1000U & PSSV1e[2U])) {
        PSBXAW = (0x7ffffffffffffULL & (((QData)((IData)(
                                                         PSSV1e[1U])) 
                                         << 0x1fU) 
                                        | ((QData)((IData)(
                                                           PSSV1e[0U])) 
                                           >> 1U)));
    } else if ((1U & (~ (PSSV1e[2U] >> 0xbU)))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,10, (IData)(PS2TF2)))) {
            VL_SHIFTL_WWI(77,77,32, PSQbaq, PSSV1e, 1U);
            PSBXAW = (0x7ffffffffffffULL & (((QData)((IData)(
                                                             PSQbaq[1U])) 
                                             << 0x20U) 
                                            | (QData)((IData)(
                                                              PSQbaq[0U]))));
        }
    }
    PSjLIN = (0x1ffffffU & ((PSSV1e[2U] << 0xdU) | 
                            (PSSV1e[1U] >> 0x13U)));
    if ((0x1000U & PSSV1e[2U])) {
        PSjLIN = (0x1ffffffU & ((PSSV1e[2U] << 0xcU) 
                                | (PSSV1e[1U] >> 0x14U)));
    } else if ((1U & (~ (PSSV1e[2U] >> 0xbU)))) {
        if (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,10, (IData)(PS2TF2)))) {
            VL_SHIFTL_WWI(77,77,32, PSwh0M, PSSV1e, 1U);
            PSjLIN = (0x1ffffffU & ((0x3ffe000U & (
                                                   PSwh0M[2U] 
                                                   << 0xdU)) 
                                    | (PSwh0M[1U] >> 0x13U)));
        }
    }
    PSt6Q8 = PS2TF2;
    if ((0x1000U & PSSV1e[2U])) {
        PSt6Q8 = (0x3ffU & ((IData)(1U) + VL_EXTENDS_II(10,10, (IData)(PS2TF2))));
    } else if ((1U & (~ (PSSV1e[2U] >> 0xbU)))) {
        PSt6Q8 = (VL_LTS_III(1,32,32, 1U, VL_EXTENDS_II(32,10, (IData)(PS2TF2)))
                   ? (0x3ffU & (VL_EXTENDS_II(10,10, (IData)(PS2TF2)) 
                                - (IData)(1U))) : 0U);
    }
    vlSelf->PSuFia = ((0xffffffff0000ffffULL & vlSelf->PSuFia) 
                      | ((QData)((IData)(((0x8000U 
                                           & ((IData)(
                                                      (PSLFov 
                                                       >> 0x20U)) 
                                              << 0xfU)) 
                                          | ((0x4000U 
                                              & ((IData)(
                                                         (PSLFov 
                                                          >> 0x20U)) 
                                                 << 0xeU)) 
                                             | ((0x2000U 
                                                 & ((IData)(
                                                            (PSLFov 
                                                             >> 0x20U)) 
                                                    << 0xdU)) 
                                                | ((0x1000U 
                                                    & ((IData)(
                                                               (PSLFov 
                                                                >> 0x20U)) 
                                                       << 0xcU)) 
                                                   | ((0x800U 
                                                       & ((IData)(
                                                                  (PSLFov 
                                                                   >> 0x20U)) 
                                                          << 0xbU)) 
                                                      | ((0x400U 
                                                          & ((IData)(
                                                                     (PSLFov 
                                                                      >> 0x20U)) 
                                                             << 0xaU)) 
                                                         | ((0x200U 
                                                             & ((IData)(
                                                                        (PSLFov 
                                                                         >> 0x20U)) 
                                                                << 9U)) 
                                                            | ((0x100U 
                                                                & ((IData)(
                                                                           (PSLFov 
                                                                            >> 0x20U)) 
                                                                   << 8U)) 
                                                               | ((0x80U 
                                                                   & ((IData)(
                                                                              (PSLFov 
                                                                               >> 0x20U)) 
                                                                      << 7U)) 
                                                                  | ((0x40U 
                                                                      & ((IData)(
                                                                                (PSLFov 
                                                                                >> 0x20U)) 
                                                                         << 6U)) 
                                                                     | ((0x20U 
                                                                         & ((IData)(
                                                                                (PSLFov 
                                                                                >> 0x20U)) 
                                                                            << 5U)) 
                                                                        | ((0x10U 
                                                                            & ((IData)(
                                                                                (PSLFov 
                                                                                >> 0x20U)) 
                                                                               << 4U)) 
                                                                           | ((8U 
                                                                               & ((IData)(
                                                                                (PSLFov 
                                                                                >> 0x20U)) 
                                                                                << 3U)) 
                                                                              | ((4U 
                                                                                & ((IData)(
                                                                                (PSLFov 
                                                                                >> 0x20U)) 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & ((IData)(
                                                                                (PSLFov 
                                                                                >> 0x20U)) 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & (IData)(
                                                                                (PSLFov 
                                                                                >> 0x20U)))))))))))))))))))) 
                         << 0x10U));
    vlSelf->PSuFia = ((0xffffffff0000ffffULL & vlSelf->PSuFia) 
                      | ((QData)((IData)((0xffffU & (IData)(
                                                            (PSLFov 
                                                             >> 0x11U))))) 
                         << 0x10U));
    vlSelf->PSeb1n[1U] = ((0xffff0000U & vlSelf->PSeb1n[1U]) 
                          | ((0x7c00U & ((IData)(vlSelf->PS2dxB) 
                                         << 0xaU)) 
                             | (0x3ffU & (IData)((PSLFov 
                                                  >> 0x16U)))));
    PS8np0 = ((2U & ((IData)((PSLFov >> 0x15U)) << 1U)) 
              | (0U != (0x1fffffU & (IData)(PSLFov))));
    PSLz8Y = ((2U & ((IData)((PSLFov >> 0x10U)) << 1U)) 
              | (0U != (0xffffU & (IData)(PSLFov))));
    vlSelf->PSRlBe = ((0xffffffff0000ffffULL & vlSelf->PSRlBe) 
                      | ((QData)((IData)(((0x8000U 
                                           & ((IData)(
                                                      (PSUVSt 
                                                       >> 0x20U)) 
                                              << 0xfU)) 
                                          | ((0x4000U 
                                              & ((IData)(
                                                         (PSUVSt 
                                                          >> 0x20U)) 
                                                 << 0xeU)) 
                                             | ((0x2000U 
                                                 & ((IData)(
                                                            (PSUVSt 
                                                             >> 0x20U)) 
                                                    << 0xdU)) 
                                                | ((0x1000U 
                                                    & ((IData)(
                                                               (PSUVSt 
                                                                >> 0x20U)) 
                                                       << 0xcU)) 
                                                   | ((0x800U 
                                                       & ((IData)(
                                                                  (PSUVSt 
                                                                   >> 0x20U)) 
                                                          << 0xbU)) 
                                                      | ((0x400U 
                                                          & ((IData)(
                                                                     (PSUVSt 
                                                                      >> 0x20U)) 
                                                             << 0xaU)) 
                                                         | ((0x200U 
                                                             & ((IData)(
                                                                        (PSUVSt 
                                                                         >> 0x20U)) 
                                                                << 9U)) 
                                                            | ((0x100U 
                                                                & ((IData)(
                                                                           (PSUVSt 
                                                                            >> 0x20U)) 
                                                                   << 8U)) 
                                                               | ((0x80U 
                                                                   & ((IData)(
                                                                              (PSUVSt 
                                                                               >> 0x20U)) 
                                                                      << 7U)) 
                                                                  | ((0x40U 
                                                                      & ((IData)(
                                                                                (PSUVSt 
                                                                                >> 0x20U)) 
                                                                         << 6U)) 
                                                                     | ((0x20U 
                                                                         & ((IData)(
                                                                                (PSUVSt 
                                                                                >> 0x20U)) 
                                                                            << 5U)) 
                                                                        | ((0x10U 
                                                                            & ((IData)(
                                                                                (PSUVSt 
                                                                                >> 0x20U)) 
                                                                               << 4U)) 
                                                                           | ((8U 
                                                                               & ((IData)(
                                                                                (PSUVSt 
                                                                                >> 0x20U)) 
                                                                                << 3U)) 
                                                                              | ((4U 
                                                                                & ((IData)(
                                                                                (PSUVSt 
                                                                                >> 0x20U)) 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & ((IData)(
                                                                                (PSUVSt 
                                                                                >> 0x20U)) 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & (IData)(
                                                                                (PSUVSt 
                                                                                >> 0x20U)))))))))))))))))))) 
                         << 0x10U));
    vlSelf->PSRlBe = ((0xffffffff0000ffffULL & vlSelf->PSRlBe) 
                      | ((QData)((IData)((0xffffU & (IData)(
                                                            (PSUVSt 
                                                             >> 0x11U))))) 
                         << 0x10U));
    vlSelf->PSPt3p[1U] = ((0xffff0000U & vlSelf->PSPt3p[1U]) 
                          | ((0x7c00U & ((IData)(vlSelf->PSXEVq) 
                                         << 0xaU)) 
                             | (0x3ffU & (IData)((PSUVSt 
                                                  >> 0x16U)))));
    PSnLJl = ((2U & ((IData)((PSUVSt >> 0x15U)) << 1U)) 
              | (0U != (0x1fffffU & (IData)(PSUVSt))));
    PSNt5F = ((2U & ((IData)((PSUVSt >> 0x10U)) << 1U)) 
              | (0U != (0xffffU & (IData)(PSUVSt))));
    vlSelf->PSLi1B[2U] = (IData)((((QData)((IData)(
                                                   ((0x80000000U 
                                                     & (PSNPnY[2U] 
                                                        << 0xfU)) 
                                                    | ((0x40000000U 
                                                        & (PSNPnY[2U] 
                                                           << 0xeU)) 
                                                       | ((0x20000000U 
                                                           & (PSNPnY[2U] 
                                                              << 0xdU)) 
                                                          | ((0x10000000U 
                                                              & (PSNPnY[2U] 
                                                                 << 0xcU)) 
                                                             | ((0x8000000U 
                                                                 & (PSNPnY[2U] 
                                                                    << 0xbU)) 
                                                                | ((0x4000000U 
                                                                    & (PSNPnY[2U] 
                                                                       << 0xaU)) 
                                                                   | ((0x2000000U 
                                                                       & (PSNPnY[2U] 
                                                                          << 9U)) 
                                                                      | ((0x1000000U 
                                                                          & (PSNPnY[2U] 
                                                                             << 8U)) 
                                                                         | ((0x800000U 
                                                                             & (PSNPnY[2U] 
                                                                                << 7U)) 
                                                                            | ((0x400000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 6U)) 
                                                                               | ((0x200000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 5U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 4U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 3U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 2U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 1U)) 
                                                                                | ((0x10000U 
                                                                                & PSNPnY[2U]) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 1U)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 2U)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 3U)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 4U)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 5U)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 6U)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 7U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 9U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xaU)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xbU)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xcU)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xdU)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xeU)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xfU)) 
                                                                                | (1U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0x10U))))))))))))))))))))))))))))))))))) 
                                   << 0x20U) | (QData)((IData)(
                                                               ((0x80000000U 
                                                                 & (PSNPnY[2U] 
                                                                    << 0xfU)) 
                                                                | ((0x40000000U 
                                                                    & (PSNPnY[2U] 
                                                                       << 0xeU)) 
                                                                   | ((0x20000000U 
                                                                       & (PSNPnY[2U] 
                                                                          << 0xdU)) 
                                                                      | ((0x10000000U 
                                                                          & (PSNPnY[2U] 
                                                                             << 0xcU)) 
                                                                         | ((0x8000000U 
                                                                             & (PSNPnY[2U] 
                                                                                << 0xbU)) 
                                                                            | ((0x4000000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 0xaU)) 
                                                                               | ((0x2000000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 9U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 8U)) 
                                                                                | ((0x800000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 7U)) 
                                                                                | ((0x400000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 6U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 5U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 4U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 3U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 2U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 1U)) 
                                                                                | ((0x10000U 
                                                                                & PSNPnY[2U]) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 1U)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 2U)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 3U)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 4U)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 5U)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 6U)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 7U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 9U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xaU)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xbU)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xcU)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xdU)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xeU)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xfU)) 
                                                                                | (1U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0x10U)))))))))))))))))))))))))))))))))))));
    vlSelf->PSLi1B[3U] = (IData)(((((QData)((IData)(
                                                    ((0x80000000U 
                                                      & (PSNPnY[2U] 
                                                         << 0xfU)) 
                                                     | ((0x40000000U 
                                                         & (PSNPnY[2U] 
                                                            << 0xeU)) 
                                                        | ((0x20000000U 
                                                            & (PSNPnY[2U] 
                                                               << 0xdU)) 
                                                           | ((0x10000000U 
                                                               & (PSNPnY[2U] 
                                                                  << 0xcU)) 
                                                              | ((0x8000000U 
                                                                  & (PSNPnY[2U] 
                                                                     << 0xbU)) 
                                                                 | ((0x4000000U 
                                                                     & (PSNPnY[2U] 
                                                                        << 0xaU)) 
                                                                    | ((0x2000000U 
                                                                        & (PSNPnY[2U] 
                                                                           << 9U)) 
                                                                       | ((0x1000000U 
                                                                           & (PSNPnY[2U] 
                                                                              << 8U)) 
                                                                          | ((0x800000U 
                                                                              & (PSNPnY[2U] 
                                                                                << 7U)) 
                                                                             | ((0x400000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 6U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 5U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 4U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 3U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 2U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 1U)) 
                                                                                | ((0x10000U 
                                                                                & PSNPnY[2U]) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 1U)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 2U)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 3U)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 4U)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 5U)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 6U)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 7U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 9U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xaU)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xbU)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xcU)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xdU)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xeU)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xfU)) 
                                                                                | (1U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0x10U))))))))))))))))))))))))))))))))))) 
                                    << 0x20U) | (QData)((IData)(
                                                                ((0x80000000U 
                                                                  & (PSNPnY[2U] 
                                                                     << 0xfU)) 
                                                                 | ((0x40000000U 
                                                                     & (PSNPnY[2U] 
                                                                        << 0xeU)) 
                                                                    | ((0x20000000U 
                                                                        & (PSNPnY[2U] 
                                                                           << 0xdU)) 
                                                                       | ((0x10000000U 
                                                                           & (PSNPnY[2U] 
                                                                              << 0xcU)) 
                                                                          | ((0x8000000U 
                                                                              & (PSNPnY[2U] 
                                                                                << 0xbU)) 
                                                                             | ((0x4000000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 0xaU)) 
                                                                                | ((0x2000000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 9U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 8U)) 
                                                                                | ((0x800000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 7U)) 
                                                                                | ((0x400000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 6U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 5U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 4U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 3U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 2U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[2U] 
                                                                                << 1U)) 
                                                                                | ((0x10000U 
                                                                                & PSNPnY[2U]) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 1U)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 2U)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 3U)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 4U)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 5U)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 6U)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 7U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 9U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xaU)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xbU)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xcU)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xdU)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xeU)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0xfU)) 
                                                                                | (1U 
                                                                                & (PSNPnY[2U] 
                                                                                >> 0x10U)))))))))))))))))))))))))))))))))))) 
                                  >> 0x20U));
    vlSelf->PSLi1B[2U] = ((0xffff0000U & vlSelf->PSLi1B[2U]) 
                          | (0xffffU & (PSNPnY[2U] 
                                        >> 1U)));
    vlSelf->PSLi1B[4U] = (IData)((((QData)((IData)(
                                                   ((PSNPnY[3U] 
                                                     << 0x1fU) 
                                                    | ((0x40000000U 
                                                        & (PSNPnY[3U] 
                                                           << 0x1eU)) 
                                                       | ((0x20000000U 
                                                           & (PSNPnY[3U] 
                                                              << 0x1dU)) 
                                                          | ((0x10000000U 
                                                              & (PSNPnY[3U] 
                                                                 << 0x1cU)) 
                                                             | ((0x8000000U 
                                                                 & (PSNPnY[3U] 
                                                                    << 0x1bU)) 
                                                                | ((0x4000000U 
                                                                    & (PSNPnY[3U] 
                                                                       << 0x1aU)) 
                                                                   | ((0x2000000U 
                                                                       & (PSNPnY[3U] 
                                                                          << 0x19U)) 
                                                                      | ((0x1000000U 
                                                                          & (PSNPnY[3U] 
                                                                             << 0x18U)) 
                                                                         | ((0x800000U 
                                                                             & (PSNPnY[3U] 
                                                                                << 0x17U)) 
                                                                            | ((0x400000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x16U)) 
                                                                               | ((0x200000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[3U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[3U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[3U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[3U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[3U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[3U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[3U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[3U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[3U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSNPnY[3U])))))))))))))))))))))))))))))))))) 
                                   << 0x20U) | (QData)((IData)(
                                                               ((PSNPnY[3U] 
                                                                 << 0x1fU) 
                                                                | ((0x40000000U 
                                                                    & (PSNPnY[3U] 
                                                                       << 0x1eU)) 
                                                                   | ((0x20000000U 
                                                                       & (PSNPnY[3U] 
                                                                          << 0x1dU)) 
                                                                      | ((0x10000000U 
                                                                          & (PSNPnY[3U] 
                                                                             << 0x1cU)) 
                                                                         | ((0x8000000U 
                                                                             & (PSNPnY[3U] 
                                                                                << 0x1bU)) 
                                                                            | ((0x4000000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x1aU)) 
                                                                               | ((0x2000000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x19U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x18U)) 
                                                                                | ((0x800000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x17U)) 
                                                                                | ((0x400000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[3U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[3U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[3U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[3U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[3U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[3U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[3U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[3U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[3U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSNPnY[3U]))))))))))))))))))))))))))))))))))));
    vlSelf->PSLi1B[5U] = (IData)(((((QData)((IData)(
                                                    ((PSNPnY[3U] 
                                                      << 0x1fU) 
                                                     | ((0x40000000U 
                                                         & (PSNPnY[3U] 
                                                            << 0x1eU)) 
                                                        | ((0x20000000U 
                                                            & (PSNPnY[3U] 
                                                               << 0x1dU)) 
                                                           | ((0x10000000U 
                                                               & (PSNPnY[3U] 
                                                                  << 0x1cU)) 
                                                              | ((0x8000000U 
                                                                  & (PSNPnY[3U] 
                                                                     << 0x1bU)) 
                                                                 | ((0x4000000U 
                                                                     & (PSNPnY[3U] 
                                                                        << 0x1aU)) 
                                                                    | ((0x2000000U 
                                                                        & (PSNPnY[3U] 
                                                                           << 0x19U)) 
                                                                       | ((0x1000000U 
                                                                           & (PSNPnY[3U] 
                                                                              << 0x18U)) 
                                                                          | ((0x800000U 
                                                                              & (PSNPnY[3U] 
                                                                                << 0x17U)) 
                                                                             | ((0x400000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[3U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[3U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[3U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[3U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[3U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[3U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[3U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[3U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[3U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSNPnY[3U])))))))))))))))))))))))))))))))))) 
                                    << 0x20U) | (QData)((IData)(
                                                                ((PSNPnY[3U] 
                                                                  << 0x1fU) 
                                                                 | ((0x40000000U 
                                                                     & (PSNPnY[3U] 
                                                                        << 0x1eU)) 
                                                                    | ((0x20000000U 
                                                                        & (PSNPnY[3U] 
                                                                           << 0x1dU)) 
                                                                       | ((0x10000000U 
                                                                           & (PSNPnY[3U] 
                                                                              << 0x1cU)) 
                                                                          | ((0x8000000U 
                                                                              & (PSNPnY[3U] 
                                                                                << 0x1bU)) 
                                                                             | ((0x4000000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x1aU)) 
                                                                                | ((0x2000000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x19U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x18U)) 
                                                                                | ((0x800000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x17U)) 
                                                                                | ((0x400000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[3U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[3U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[3U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[3U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[3U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[3U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[3U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[3U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[3U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[3U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSNPnY[3U]))))))))))))))))))))))))))))))))))) 
                                  >> 0x20U));
    vlSelf->PSLi1B[4U] = ((PSNPnY[3U] << 0x1fU) | (
                                                   PSNPnY[2U] 
                                                   >> 1U));
    vlSelf->PSLi1B[6U] = (IData)((((QData)((IData)(
                                                   ((PSNPnY[4U] 
                                                     << 0x1fU) 
                                                    | ((0x40000000U 
                                                        & (PSNPnY[4U] 
                                                           << 0x1eU)) 
                                                       | ((0x20000000U 
                                                           & (PSNPnY[4U] 
                                                              << 0x1dU)) 
                                                          | ((0x10000000U 
                                                              & (PSNPnY[4U] 
                                                                 << 0x1cU)) 
                                                             | ((0x8000000U 
                                                                 & (PSNPnY[4U] 
                                                                    << 0x1bU)) 
                                                                | ((0x4000000U 
                                                                    & (PSNPnY[4U] 
                                                                       << 0x1aU)) 
                                                                   | ((0x2000000U 
                                                                       & (PSNPnY[4U] 
                                                                          << 0x19U)) 
                                                                      | ((0x1000000U 
                                                                          & (PSNPnY[4U] 
                                                                             << 0x18U)) 
                                                                         | ((0x800000U 
                                                                             & (PSNPnY[4U] 
                                                                                << 0x17U)) 
                                                                            | ((0x400000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x16U)) 
                                                                               | ((0x200000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[4U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[4U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[4U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[4U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[4U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[4U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[4U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[4U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[4U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSNPnY[4U])))))))))))))))))))))))))))))))))) 
                                   << 0x20U) | (QData)((IData)(
                                                               ((PSNPnY[4U] 
                                                                 << 0x1fU) 
                                                                | ((0x40000000U 
                                                                    & (PSNPnY[4U] 
                                                                       << 0x1eU)) 
                                                                   | ((0x20000000U 
                                                                       & (PSNPnY[4U] 
                                                                          << 0x1dU)) 
                                                                      | ((0x10000000U 
                                                                          & (PSNPnY[4U] 
                                                                             << 0x1cU)) 
                                                                         | ((0x8000000U 
                                                                             & (PSNPnY[4U] 
                                                                                << 0x1bU)) 
                                                                            | ((0x4000000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x1aU)) 
                                                                               | ((0x2000000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x19U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x18U)) 
                                                                                | ((0x800000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x17U)) 
                                                                                | ((0x400000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[4U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[4U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[4U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[4U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[4U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[4U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[4U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[4U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[4U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSNPnY[4U]))))))))))))))))))))))))))))))))))));
    vlSelf->PSLi1B[7U] = (IData)(((((QData)((IData)(
                                                    ((PSNPnY[4U] 
                                                      << 0x1fU) 
                                                     | ((0x40000000U 
                                                         & (PSNPnY[4U] 
                                                            << 0x1eU)) 
                                                        | ((0x20000000U 
                                                            & (PSNPnY[4U] 
                                                               << 0x1dU)) 
                                                           | ((0x10000000U 
                                                               & (PSNPnY[4U] 
                                                                  << 0x1cU)) 
                                                              | ((0x8000000U 
                                                                  & (PSNPnY[4U] 
                                                                     << 0x1bU)) 
                                                                 | ((0x4000000U 
                                                                     & (PSNPnY[4U] 
                                                                        << 0x1aU)) 
                                                                    | ((0x2000000U 
                                                                        & (PSNPnY[4U] 
                                                                           << 0x19U)) 
                                                                       | ((0x1000000U 
                                                                           & (PSNPnY[4U] 
                                                                              << 0x18U)) 
                                                                          | ((0x800000U 
                                                                              & (PSNPnY[4U] 
                                                                                << 0x17U)) 
                                                                             | ((0x400000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[4U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[4U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[4U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[4U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[4U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[4U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[4U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[4U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[4U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSNPnY[4U])))))))))))))))))))))))))))))))))) 
                                    << 0x20U) | (QData)((IData)(
                                                                ((PSNPnY[4U] 
                                                                  << 0x1fU) 
                                                                 | ((0x40000000U 
                                                                     & (PSNPnY[4U] 
                                                                        << 0x1eU)) 
                                                                    | ((0x20000000U 
                                                                        & (PSNPnY[4U] 
                                                                           << 0x1dU)) 
                                                                       | ((0x10000000U 
                                                                           & (PSNPnY[4U] 
                                                                              << 0x1cU)) 
                                                                          | ((0x8000000U 
                                                                              & (PSNPnY[4U] 
                                                                                << 0x1bU)) 
                                                                             | ((0x4000000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x1aU)) 
                                                                                | ((0x2000000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x19U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x18U)) 
                                                                                | ((0x800000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x17U)) 
                                                                                | ((0x400000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSNPnY[4U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSNPnY[4U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSNPnY[4U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSNPnY[4U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSNPnY[4U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSNPnY[4U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSNPnY[4U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSNPnY[4U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSNPnY[4U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSNPnY[4U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSNPnY[4U]))))))))))))))))))))))))))))))))))) 
                                  >> 0x20U));
    vlSelf->PSLi1B[6U] = (IData)((((QData)((IData)(
                                                   PSNPnY[4U])) 
                                   << 0x3fU) | (((QData)((IData)(
                                                                 PSNPnY[3U])) 
                                                 << 0x1fU) 
                                                | ((QData)((IData)(
                                                                   PSNPnY[2U])) 
                                                   >> 1U))));
    vlSelf->PSLi1B[7U] = (IData)(((((QData)((IData)(
                                                    PSNPnY[4U])) 
                                    << 0x3fU) | (((QData)((IData)(
                                                                  PSNPnY[3U])) 
                                                  << 0x1fU) 
                                                 | ((QData)((IData)(
                                                                    PSNPnY[2U])) 
                                                    >> 1U))) 
                                  >> 0x20U));
    vlSelf->PSnzGA[0U] = (IData)((QData)((IData)(((0x7f800000U 
                                                   & ((IData)(vlSelf->PSwT74) 
                                                      << 0x17U)) 
                                                  | (0x7fffffU 
                                                     & ((PSNPnY[3U] 
                                                         << 0x14U) 
                                                        | (PSNPnY[2U] 
                                                           >> 0xcU)))))));
    vlSelf->PSnzGA[1U] = (IData)(((QData)((IData)((
                                                   (0x7f800000U 
                                                    & ((IData)(vlSelf->PSwT74) 
                                                       << 0x17U)) 
                                                   | (0x7fffffU 
                                                      & ((PSNPnY[3U] 
                                                          << 0x14U) 
                                                         | (PSNPnY[2U] 
                                                            >> 0xcU)))))) 
                                  >> 0x20U));
    vlSelf->PSnzGA[2U] = (IData)((((QData)((IData)(
                                                   (0x7ffU 
                                                    & (IData)(vlSelf->PSwT74)))) 
                                   << 0x34U) | (0xfffffffffffffULL 
                                                & (((QData)((IData)(
                                                                    PSNPnY[3U])) 
                                                    << 0x14U) 
                                                   | ((QData)((IData)(
                                                                      PSNPnY[2U])) 
                                                      >> 0xcU)))));
    vlSelf->PSnzGA[3U] = (IData)(((((QData)((IData)(
                                                    (0x7ffU 
                                                     & (IData)(vlSelf->PSwT74)))) 
                                    << 0x34U) | (0xfffffffffffffULL 
                                                 & (((QData)((IData)(
                                                                     PSNPnY[3U])) 
                                                     << 0x14U) 
                                                    | ((QData)((IData)(
                                                                       PSNPnY[2U])) 
                                                       >> 0xcU)))) 
                                  >> 0x20U));
    vlSelf->PSnzGA[4U] = (IData)((QData)((IData)(((0x7c00U 
                                                   & ((IData)(vlSelf->PSwT74) 
                                                      << 0xaU)) 
                                                  | (0x3ffU 
                                                     & (PSNPnY[2U] 
                                                        >> 0xcU))))));
    vlSelf->PSnzGA[5U] = (IData)(((QData)((IData)((
                                                   (0x7c00U 
                                                    & ((IData)(vlSelf->PSwT74) 
                                                       << 0xaU)) 
                                                   | (0x3ffU 
                                                      & (PSNPnY[2U] 
                                                         >> 0xcU))))) 
                                  >> 0x20U));
    PSAzWK = ((2U & (PSNPnY[2U] >> 0xaU)) | (0U != 
                                             ((PSNPnY[0U] 
                                               | PSNPnY[1U]) 
                                              | (0x7ffU 
                                                 & PSNPnY[2U]))));
    PSBuBY = ((2U & (PSNPnY[2U] << 1U)) | (0U != (((QData)((IData)(
                                                                   PSNPnY[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    PSNPnY[0U])))));
    vlSelf->PS5aQ0[2U] = (IData)((((QData)((IData)(
                                                   ((0x80000000U 
                                                     & (PSxL7G[2U] 
                                                        << 0xfU)) 
                                                    | ((0x40000000U 
                                                        & (PSxL7G[2U] 
                                                           << 0xeU)) 
                                                       | ((0x20000000U 
                                                           & (PSxL7G[2U] 
                                                              << 0xdU)) 
                                                          | ((0x10000000U 
                                                              & (PSxL7G[2U] 
                                                                 << 0xcU)) 
                                                             | ((0x8000000U 
                                                                 & (PSxL7G[2U] 
                                                                    << 0xbU)) 
                                                                | ((0x4000000U 
                                                                    & (PSxL7G[2U] 
                                                                       << 0xaU)) 
                                                                   | ((0x2000000U 
                                                                       & (PSxL7G[2U] 
                                                                          << 9U)) 
                                                                      | ((0x1000000U 
                                                                          & (PSxL7G[2U] 
                                                                             << 8U)) 
                                                                         | ((0x800000U 
                                                                             & (PSxL7G[2U] 
                                                                                << 7U)) 
                                                                            | ((0x400000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 6U)) 
                                                                               | ((0x200000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 5U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 4U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 3U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 2U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 1U)) 
                                                                                | ((0x10000U 
                                                                                & PSxL7G[2U]) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 1U)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 2U)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 3U)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 4U)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 5U)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 6U)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 7U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 9U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xaU)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xbU)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xcU)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xdU)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xeU)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xfU)) 
                                                                                | (1U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0x10U))))))))))))))))))))))))))))))))))) 
                                   << 0x20U) | (QData)((IData)(
                                                               ((0x80000000U 
                                                                 & (PSxL7G[2U] 
                                                                    << 0xfU)) 
                                                                | ((0x40000000U 
                                                                    & (PSxL7G[2U] 
                                                                       << 0xeU)) 
                                                                   | ((0x20000000U 
                                                                       & (PSxL7G[2U] 
                                                                          << 0xdU)) 
                                                                      | ((0x10000000U 
                                                                          & (PSxL7G[2U] 
                                                                             << 0xcU)) 
                                                                         | ((0x8000000U 
                                                                             & (PSxL7G[2U] 
                                                                                << 0xbU)) 
                                                                            | ((0x4000000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 0xaU)) 
                                                                               | ((0x2000000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 9U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 8U)) 
                                                                                | ((0x800000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 7U)) 
                                                                                | ((0x400000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 6U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 5U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 4U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 3U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 2U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 1U)) 
                                                                                | ((0x10000U 
                                                                                & PSxL7G[2U]) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 1U)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 2U)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 3U)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 4U)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 5U)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 6U)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 7U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 9U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xaU)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xbU)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xcU)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xdU)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xeU)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xfU)) 
                                                                                | (1U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0x10U)))))))))))))))))))))))))))))))))))));
    vlSelf->PS5aQ0[3U] = (IData)(((((QData)((IData)(
                                                    ((0x80000000U 
                                                      & (PSxL7G[2U] 
                                                         << 0xfU)) 
                                                     | ((0x40000000U 
                                                         & (PSxL7G[2U] 
                                                            << 0xeU)) 
                                                        | ((0x20000000U 
                                                            & (PSxL7G[2U] 
                                                               << 0xdU)) 
                                                           | ((0x10000000U 
                                                               & (PSxL7G[2U] 
                                                                  << 0xcU)) 
                                                              | ((0x8000000U 
                                                                  & (PSxL7G[2U] 
                                                                     << 0xbU)) 
                                                                 | ((0x4000000U 
                                                                     & (PSxL7G[2U] 
                                                                        << 0xaU)) 
                                                                    | ((0x2000000U 
                                                                        & (PSxL7G[2U] 
                                                                           << 9U)) 
                                                                       | ((0x1000000U 
                                                                           & (PSxL7G[2U] 
                                                                              << 8U)) 
                                                                          | ((0x800000U 
                                                                              & (PSxL7G[2U] 
                                                                                << 7U)) 
                                                                             | ((0x400000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 6U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 5U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 4U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 3U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 2U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 1U)) 
                                                                                | ((0x10000U 
                                                                                & PSxL7G[2U]) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 1U)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 2U)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 3U)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 4U)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 5U)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 6U)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 7U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 9U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xaU)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xbU)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xcU)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xdU)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xeU)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xfU)) 
                                                                                | (1U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0x10U))))))))))))))))))))))))))))))))))) 
                                    << 0x20U) | (QData)((IData)(
                                                                ((0x80000000U 
                                                                  & (PSxL7G[2U] 
                                                                     << 0xfU)) 
                                                                 | ((0x40000000U 
                                                                     & (PSxL7G[2U] 
                                                                        << 0xeU)) 
                                                                    | ((0x20000000U 
                                                                        & (PSxL7G[2U] 
                                                                           << 0xdU)) 
                                                                       | ((0x10000000U 
                                                                           & (PSxL7G[2U] 
                                                                              << 0xcU)) 
                                                                          | ((0x8000000U 
                                                                              & (PSxL7G[2U] 
                                                                                << 0xbU)) 
                                                                             | ((0x4000000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 0xaU)) 
                                                                                | ((0x2000000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 9U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 8U)) 
                                                                                | ((0x800000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 7U)) 
                                                                                | ((0x400000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 6U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 5U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 4U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 3U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 2U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[2U] 
                                                                                << 1U)) 
                                                                                | ((0x10000U 
                                                                                & PSxL7G[2U]) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 1U)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 2U)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 3U)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 4U)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 5U)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 6U)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 7U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 9U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xaU)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xbU)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xcU)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xdU)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xeU)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0xfU)) 
                                                                                | (1U 
                                                                                & (PSxL7G[2U] 
                                                                                >> 0x10U)))))))))))))))))))))))))))))))))))) 
                                  >> 0x20U));
    vlSelf->PS5aQ0[2U] = ((0xffff0000U & vlSelf->PS5aQ0[2U]) 
                          | (0xffffU & (PSxL7G[2U] 
                                        >> 1U)));
    vlSelf->PS5aQ0[4U] = (IData)((((QData)((IData)(
                                                   ((PSxL7G[3U] 
                                                     << 0x1fU) 
                                                    | ((0x40000000U 
                                                        & (PSxL7G[3U] 
                                                           << 0x1eU)) 
                                                       | ((0x20000000U 
                                                           & (PSxL7G[3U] 
                                                              << 0x1dU)) 
                                                          | ((0x10000000U 
                                                              & (PSxL7G[3U] 
                                                                 << 0x1cU)) 
                                                             | ((0x8000000U 
                                                                 & (PSxL7G[3U] 
                                                                    << 0x1bU)) 
                                                                | ((0x4000000U 
                                                                    & (PSxL7G[3U] 
                                                                       << 0x1aU)) 
                                                                   | ((0x2000000U 
                                                                       & (PSxL7G[3U] 
                                                                          << 0x19U)) 
                                                                      | ((0x1000000U 
                                                                          & (PSxL7G[3U] 
                                                                             << 0x18U)) 
                                                                         | ((0x800000U 
                                                                             & (PSxL7G[3U] 
                                                                                << 0x17U)) 
                                                                            | ((0x400000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x16U)) 
                                                                               | ((0x200000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[3U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[3U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[3U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[3U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[3U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[3U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[3U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[3U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[3U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSxL7G[3U])))))))))))))))))))))))))))))))))) 
                                   << 0x20U) | (QData)((IData)(
                                                               ((PSxL7G[3U] 
                                                                 << 0x1fU) 
                                                                | ((0x40000000U 
                                                                    & (PSxL7G[3U] 
                                                                       << 0x1eU)) 
                                                                   | ((0x20000000U 
                                                                       & (PSxL7G[3U] 
                                                                          << 0x1dU)) 
                                                                      | ((0x10000000U 
                                                                          & (PSxL7G[3U] 
                                                                             << 0x1cU)) 
                                                                         | ((0x8000000U 
                                                                             & (PSxL7G[3U] 
                                                                                << 0x1bU)) 
                                                                            | ((0x4000000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x1aU)) 
                                                                               | ((0x2000000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x19U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x18U)) 
                                                                                | ((0x800000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x17U)) 
                                                                                | ((0x400000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[3U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[3U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[3U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[3U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[3U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[3U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[3U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[3U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[3U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSxL7G[3U]))))))))))))))))))))))))))))))))))));
    vlSelf->PS5aQ0[5U] = (IData)(((((QData)((IData)(
                                                    ((PSxL7G[3U] 
                                                      << 0x1fU) 
                                                     | ((0x40000000U 
                                                         & (PSxL7G[3U] 
                                                            << 0x1eU)) 
                                                        | ((0x20000000U 
                                                            & (PSxL7G[3U] 
                                                               << 0x1dU)) 
                                                           | ((0x10000000U 
                                                               & (PSxL7G[3U] 
                                                                  << 0x1cU)) 
                                                              | ((0x8000000U 
                                                                  & (PSxL7G[3U] 
                                                                     << 0x1bU)) 
                                                                 | ((0x4000000U 
                                                                     & (PSxL7G[3U] 
                                                                        << 0x1aU)) 
                                                                    | ((0x2000000U 
                                                                        & (PSxL7G[3U] 
                                                                           << 0x19U)) 
                                                                       | ((0x1000000U 
                                                                           & (PSxL7G[3U] 
                                                                              << 0x18U)) 
                                                                          | ((0x800000U 
                                                                              & (PSxL7G[3U] 
                                                                                << 0x17U)) 
                                                                             | ((0x400000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[3U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[3U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[3U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[3U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[3U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[3U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[3U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[3U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[3U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSxL7G[3U])))))))))))))))))))))))))))))))))) 
                                    << 0x20U) | (QData)((IData)(
                                                                ((PSxL7G[3U] 
                                                                  << 0x1fU) 
                                                                 | ((0x40000000U 
                                                                     & (PSxL7G[3U] 
                                                                        << 0x1eU)) 
                                                                    | ((0x20000000U 
                                                                        & (PSxL7G[3U] 
                                                                           << 0x1dU)) 
                                                                       | ((0x10000000U 
                                                                           & (PSxL7G[3U] 
                                                                              << 0x1cU)) 
                                                                          | ((0x8000000U 
                                                                              & (PSxL7G[3U] 
                                                                                << 0x1bU)) 
                                                                             | ((0x4000000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x1aU)) 
                                                                                | ((0x2000000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x19U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x18U)) 
                                                                                | ((0x800000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x17U)) 
                                                                                | ((0x400000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[3U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[3U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[3U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[3U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[3U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[3U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[3U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[3U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[3U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[3U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSxL7G[3U]))))))))))))))))))))))))))))))))))) 
                                  >> 0x20U));
    vlSelf->PS5aQ0[4U] = ((PSxL7G[3U] << 0x1fU) | (
                                                   PSxL7G[2U] 
                                                   >> 1U));
    vlSelf->PS5aQ0[6U] = (IData)((((QData)((IData)(
                                                   ((PSxL7G[4U] 
                                                     << 0x1fU) 
                                                    | ((0x40000000U 
                                                        & (PSxL7G[4U] 
                                                           << 0x1eU)) 
                                                       | ((0x20000000U 
                                                           & (PSxL7G[4U] 
                                                              << 0x1dU)) 
                                                          | ((0x10000000U 
                                                              & (PSxL7G[4U] 
                                                                 << 0x1cU)) 
                                                             | ((0x8000000U 
                                                                 & (PSxL7G[4U] 
                                                                    << 0x1bU)) 
                                                                | ((0x4000000U 
                                                                    & (PSxL7G[4U] 
                                                                       << 0x1aU)) 
                                                                   | ((0x2000000U 
                                                                       & (PSxL7G[4U] 
                                                                          << 0x19U)) 
                                                                      | ((0x1000000U 
                                                                          & (PSxL7G[4U] 
                                                                             << 0x18U)) 
                                                                         | ((0x800000U 
                                                                             & (PSxL7G[4U] 
                                                                                << 0x17U)) 
                                                                            | ((0x400000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x16U)) 
                                                                               | ((0x200000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[4U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[4U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[4U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[4U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[4U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[4U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[4U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[4U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[4U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSxL7G[4U])))))))))))))))))))))))))))))))))) 
                                   << 0x20U) | (QData)((IData)(
                                                               ((PSxL7G[4U] 
                                                                 << 0x1fU) 
                                                                | ((0x40000000U 
                                                                    & (PSxL7G[4U] 
                                                                       << 0x1eU)) 
                                                                   | ((0x20000000U 
                                                                       & (PSxL7G[4U] 
                                                                          << 0x1dU)) 
                                                                      | ((0x10000000U 
                                                                          & (PSxL7G[4U] 
                                                                             << 0x1cU)) 
                                                                         | ((0x8000000U 
                                                                             & (PSxL7G[4U] 
                                                                                << 0x1bU)) 
                                                                            | ((0x4000000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x1aU)) 
                                                                               | ((0x2000000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x19U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x18U)) 
                                                                                | ((0x800000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x17U)) 
                                                                                | ((0x400000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[4U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[4U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[4U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[4U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[4U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[4U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[4U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[4U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[4U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSxL7G[4U]))))))))))))))))))))))))))))))))))));
    vlSelf->PS5aQ0[7U] = (IData)(((((QData)((IData)(
                                                    ((PSxL7G[4U] 
                                                      << 0x1fU) 
                                                     | ((0x40000000U 
                                                         & (PSxL7G[4U] 
                                                            << 0x1eU)) 
                                                        | ((0x20000000U 
                                                            & (PSxL7G[4U] 
                                                               << 0x1dU)) 
                                                           | ((0x10000000U 
                                                               & (PSxL7G[4U] 
                                                                  << 0x1cU)) 
                                                              | ((0x8000000U 
                                                                  & (PSxL7G[4U] 
                                                                     << 0x1bU)) 
                                                                 | ((0x4000000U 
                                                                     & (PSxL7G[4U] 
                                                                        << 0x1aU)) 
                                                                    | ((0x2000000U 
                                                                        & (PSxL7G[4U] 
                                                                           << 0x19U)) 
                                                                       | ((0x1000000U 
                                                                           & (PSxL7G[4U] 
                                                                              << 0x18U)) 
                                                                          | ((0x800000U 
                                                                              & (PSxL7G[4U] 
                                                                                << 0x17U)) 
                                                                             | ((0x400000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[4U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[4U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[4U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[4U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[4U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[4U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[4U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[4U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[4U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSxL7G[4U])))))))))))))))))))))))))))))))))) 
                                    << 0x20U) | (QData)((IData)(
                                                                ((PSxL7G[4U] 
                                                                  << 0x1fU) 
                                                                 | ((0x40000000U 
                                                                     & (PSxL7G[4U] 
                                                                        << 0x1eU)) 
                                                                    | ((0x20000000U 
                                                                        & (PSxL7G[4U] 
                                                                           << 0x1dU)) 
                                                                       | ((0x10000000U 
                                                                           & (PSxL7G[4U] 
                                                                              << 0x1cU)) 
                                                                          | ((0x8000000U 
                                                                              & (PSxL7G[4U] 
                                                                                << 0x1bU)) 
                                                                             | ((0x4000000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x1aU)) 
                                                                                | ((0x2000000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x19U)) 
                                                                                | ((0x1000000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x18U)) 
                                                                                | ((0x800000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x17U)) 
                                                                                | ((0x400000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x16U)) 
                                                                                | ((0x200000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x15U)) 
                                                                                | ((0x100000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & (PSxL7G[4U] 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & (PSxL7G[4U] 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & (PSxL7G[4U] 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & (PSxL7G[4U] 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & (PSxL7G[4U] 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & (PSxL7G[4U] 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & (PSxL7G[4U] 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & (PSxL7G[4U] 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & (PSxL7G[4U] 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & (PSxL7G[4U] 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & PSxL7G[4U]))))))))))))))))))))))))))))))))))) 
                                  >> 0x20U));
    vlSelf->PS5aQ0[6U] = (IData)((((QData)((IData)(
                                                   PSxL7G[4U])) 
                                   << 0x3fU) | (((QData)((IData)(
                                                                 PSxL7G[3U])) 
                                                 << 0x1fU) 
                                                | ((QData)((IData)(
                                                                   PSxL7G[2U])) 
                                                   >> 1U))));
    vlSelf->PS5aQ0[7U] = (IData)(((((QData)((IData)(
                                                    PSxL7G[4U])) 
                                    << 0x3fU) | (((QData)((IData)(
                                                                  PSxL7G[3U])) 
                                                  << 0x1fU) 
                                                 | ((QData)((IData)(
                                                                    PSxL7G[2U])) 
                                                    >> 1U))) 
                                  >> 0x20U));
    vlSelf->PSAj6s[0U] = (IData)((QData)((IData)(((0x7f800000U 
                                                   & ((IData)(vlSelf->PS4ptK) 
                                                      << 0x17U)) 
                                                  | (0x7fffffU 
                                                     & ((PSxL7G[3U] 
                                                         << 0x14U) 
                                                        | (PSxL7G[2U] 
                                                           >> 0xcU)))))));
    vlSelf->PSAj6s[1U] = (IData)(((QData)((IData)((
                                                   (0x7f800000U 
                                                    & ((IData)(vlSelf->PS4ptK) 
                                                       << 0x17U)) 
                                                   | (0x7fffffU 
                                                      & ((PSxL7G[3U] 
                                                          << 0x14U) 
                                                         | (PSxL7G[2U] 
                                                            >> 0xcU)))))) 
                                  >> 0x20U));
    vlSelf->PSAj6s[2U] = (IData)((((QData)((IData)(
                                                   (0x7ffU 
                                                    & (IData)(vlSelf->PS4ptK)))) 
                                   << 0x34U) | (0xfffffffffffffULL 
                                                & (((QData)((IData)(
                                                                    PSxL7G[3U])) 
                                                    << 0x14U) 
                                                   | ((QData)((IData)(
                                                                      PSxL7G[2U])) 
                                                      >> 0xcU)))));
    vlSelf->PSAj6s[3U] = (IData)(((((QData)((IData)(
                                                    (0x7ffU 
                                                     & (IData)(vlSelf->PS4ptK)))) 
                                    << 0x34U) | (0xfffffffffffffULL 
                                                 & (((QData)((IData)(
                                                                     PSxL7G[3U])) 
                                                     << 0x14U) 
                                                    | ((QData)((IData)(
                                                                       PSxL7G[2U])) 
                                                       >> 0xcU)))) 
                                  >> 0x20U));
    vlSelf->PSAj6s[4U] = (IData)((QData)((IData)(((0x7c00U 
                                                   & ((IData)(vlSelf->PS4ptK) 
                                                      << 0xaU)) 
                                                  | (0x3ffU 
                                                     & (PSxL7G[2U] 
                                                        >> 0xcU))))));
    vlSelf->PSAj6s[5U] = (IData)(((QData)((IData)((
                                                   (0x7c00U 
                                                    & ((IData)(vlSelf->PS4ptK) 
                                                       << 0xaU)) 
                                                   | (0x3ffU 
                                                      & (PSxL7G[2U] 
                                                         >> 0xcU))))) 
                                  >> 0x20U));
    PSAIgD = ((2U & (PSxL7G[2U] >> 0xaU)) | (0U != 
                                             ((PSxL7G[0U] 
                                               | PSxL7G[1U]) 
                                              | (0x7ffU 
                                                 & PSxL7G[2U]))));
    PSSoIR = ((2U & (PSxL7G[2U] << 1U)) | (0U != (((QData)((IData)(
                                                                   PSxL7G[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    PSxL7G[0U])))));
    PSmNYf = (((VL_LTES_III(1,32,32, 0x1fU, VL_EXTENDS_II(32,7, (IData)(PSaxr7)))
                 ? 0x1eU : (0x1fU & (IData)(PSaxr7))) 
               << 0xaU) | (VL_LTES_III(1,32,32, 0x1fU, 
                                       VL_EXTENDS_II(32,7, (IData)(PSaxr7)))
                            ? 0x3ffU : (0x3ffU & ((IData)(PSXIen) 
                                                  >> 1U))));
    PSUiiH = (VL_LTES_III(1,32,32, 0x1fU, VL_EXTENDS_II(32,7, (IData)(PSaxr7)))
               ? 3U : ((2U & ((IData)(PSXIen) << 1U)) 
                       | (1U & ((0U != PSuE7l) | (IData)(vlSelf->PSfIxT)))));
    PSqATS = (((VL_LTES_III(1,32,32, 0x1fU, VL_EXTENDS_II(32,7, (IData)(PSYtgg)))
                 ? 0x1eU : (0x1fU & (IData)(PSYtgg))) 
               << 0xaU) | (VL_LTES_III(1,32,32, 0x1fU, 
                                       VL_EXTENDS_II(32,7, (IData)(PSYtgg)))
                            ? 0x3ffU : (0x3ffU & ((IData)(PSCune) 
                                                  >> 1U))));
    PSPPWD = (VL_LTES_III(1,32,32, 0x1fU, VL_EXTENDS_II(32,7, (IData)(PSYtgg)))
               ? 3U : ((2U & ((IData)(PSCune) << 1U)) 
                       | (1U & ((0U != PSmbOI) | (IData)(vlSelf->PSrfaO)))));
    PSbwq8 = (((VL_LTES_III(1,32,32, 0x1fU, VL_EXTENDS_II(32,7, (IData)(PSeFQ6)))
                 ? 0x1eU : (0x1fU & (IData)(PSeFQ6))) 
               << 0xaU) | (VL_LTES_III(1,32,32, 0x1fU, 
                                       VL_EXTENDS_II(32,7, (IData)(PSeFQ6)))
                            ? 0x3ffU : (0x3ffU & ((IData)(PSq1V8) 
                                                  >> 1U))));
    PSFJd9 = (VL_LTES_III(1,32,32, 0x1fU, VL_EXTENDS_II(32,7, (IData)(PSeFQ6)))
               ? 3U : ((2U & ((IData)(PSq1V8) << 1U)) 
                       | (1U & ((0U != PSHXYw) | (IData)(vlSelf->PStHr1)))));
    PSmBKQ = (((VL_LTES_III(1,32,32, 0x1fU, VL_EXTENDS_II(32,7, (IData)(PSNOHO)))
                 ? 0x1eU : (0x1fU & (IData)(PSNOHO))) 
               << 0xaU) | (VL_LTES_III(1,32,32, 0x1fU, 
                                       VL_EXTENDS_II(32,7, (IData)(PSNOHO)))
                            ? 0x3ffU : (0x3ffU & ((IData)(PSUKFR) 
                                                  >> 1U))));
    PSSha4 = (VL_LTES_III(1,32,32, 0x1fU, VL_EXTENDS_II(32,7, (IData)(PSNOHO)))
               ? 3U : ((2U & ((IData)(PSUKFR) << 1U)) 
                       | (1U & ((0U != PSzM28) | (IData)(vlSelf->PS7jPs)))));
    PSF3n4 = (((QData)((IData)((VL_LTES_III(1,32,32, 0x7ffU, 
                                            VL_EXTENDS_II(32,13, (IData)(PS1AVg)))
                                 ? 0x7feU : (0x7ffU 
                                             & (IData)(PS1AVg))))) 
               << 0x34U) | (VL_LTES_III(1,32,32, 0x7ffU, 
                                        VL_EXTENDS_II(32,13, (IData)(PS1AVg)))
                             ? 0xfffffffffffffULL : 
                            (0xfffffffffffffULL & (PSWWsD 
                                                   >> 1U))));
    PS8HKZ = (VL_LTES_III(1,32,32, 0x7ffU, VL_EXTENDS_II(32,13, (IData)(PS1AVg)))
               ? 3U : ((2U & ((IData)(PSWWsD) << 1U)) 
                       | (1U & ((0U != (((PSFGfR[0U] 
                                          | PSFGfR[1U]) 
                                         | PSFGfR[2U]) 
                                        | PSFGfR[3U])) 
                                | (IData)(vlSelf->PSQyGc)))));
    PSvKD0 = (((VL_LTES_III(1,32,32, 0xffU, VL_EXTENDS_II(32,10, (IData)(PS2BQO)))
                 ? 0xfeU : (0xffU & (IData)(PS2BQO))) 
               << 0x17U) | (VL_LTES_III(1,32,32, 0xffU, 
                                        VL_EXTENDS_II(32,10, (IData)(PS2BQO)))
                             ? 0x7fffffU : (0x7fffffU 
                                            & (PSELhs 
                                               >> 1U))));
    PSP2Lh = (VL_LTES_III(1,32,32, 0xffU, VL_EXTENDS_II(32,10, (IData)(PS2BQO)))
               ? 3U : ((2U & (PSELhs << 1U)) | (1U 
                                                & ((0U 
                                                    != PSo4BV) 
                                                   | (IData)(vlSelf->PSDBLG)))));
    PSzxvc = (((VL_LTES_III(1,32,32, 0xffU, VL_EXTENDS_II(32,10, (IData)(PSt6Q8)))
                 ? 0xfeU : (0xffU & (IData)(PSt6Q8))) 
               << 0x17U) | (VL_LTES_III(1,32,32, 0xffU, 
                                        VL_EXTENDS_II(32,10, (IData)(PSt6Q8)))
                             ? 0x7fffffU : (0x7fffffU 
                                            & (PSjLIN 
                                               >> 1U))));
    PSBjQV = (VL_LTES_III(1,32,32, 0xffU, VL_EXTENDS_II(32,10, (IData)(PSt6Q8)))
               ? 3U : ((2U & (PSjLIN << 1U)) | (1U 
                                                & ((0U 
                                                    != PSBXAW) 
                                                   | (IData)(vlSelf->PS18Zg)))));
    if ((1U & (IData)(vlSelf->PSMgii))) {
        PSGlwU = (0xffffU & (IData)((vlSelf->PSuFia 
                                     >> (0x30U & ((IData)(vlSelf->PSGusA) 
                                                  << 4U)))));
        PSgzne = PSLz8Y;
    } else {
        PSGlwU = (0xffffU & ((0x4fU >= (0x70U & ((IData)(vlSelf->PSx3li) 
                                                 << 4U)))
                              ? (((0U == (0x10U & ((IData)(vlSelf->PSx3li) 
                                                   << 4U)))
                                   ? 0U : (vlSelf->PSeb1n[
                                           (((IData)(0xfU) 
                                             + (0x70U 
                                                & ((IData)(vlSelf->PSx3li) 
                                                   << 4U))) 
                                            >> 5U)] 
                                           << ((IData)(0x20U) 
                                               - (0x10U 
                                                  & ((IData)(vlSelf->PSx3li) 
                                                     << 4U))))) 
                                 | (vlSelf->PSeb1n[
                                    (3U & ((IData)(vlSelf->PSx3li) 
                                           >> 1U))] 
                                    >> (0x10U & ((IData)(vlSelf->PSx3li) 
                                                 << 4U))))
                              : 0U));
        PSgzne = PS8np0;
    }
    if ((1U & (IData)(vlSelf->PSfYx5))) {
        PS9Y9d = (0xffffU & (IData)((vlSelf->PSRlBe 
                                     >> (0x30U & ((IData)(vlSelf->PS1MNM) 
                                                  << 4U)))));
        PSDM36 = PSNt5F;
    } else {
        PS9Y9d = (0xffffU & ((0x4fU >= (0x70U & ((IData)(vlSelf->PSIM4T) 
                                                 << 4U)))
                              ? (((0U == (0x10U & ((IData)(vlSelf->PSIM4T) 
                                                   << 4U)))
                                   ? 0U : (vlSelf->PSPt3p[
                                           (((IData)(0xfU) 
                                             + (0x70U 
                                                & ((IData)(vlSelf->PSIM4T) 
                                                   << 4U))) 
                                            >> 5U)] 
                                           << ((IData)(0x20U) 
                                               - (0x10U 
                                                  & ((IData)(vlSelf->PSIM4T) 
                                                     << 4U))))) 
                                 | (vlSelf->PSPt3p[
                                    (3U & ((IData)(vlSelf->PSIM4T) 
                                           >> 1U))] 
                                    >> (0x10U & ((IData)(vlSelf->PSIM4T) 
                                                 << 4U))))
                              : 0U));
        PSDM36 = PSnLJl;
    }
    if ((1U & (IData)(vlSelf->PSKWIU))) {
        PSIXLa = (((QData)((IData)(vlSelf->PSLi1B[(
                                                   ((IData)(0x3fU) 
                                                    + 
                                                    (0xc0U 
                                                     & ((IData)(vlSelf->PS4JRR) 
                                                        << 6U))) 
                                                   >> 5U)])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSLi1B[
                                               (6U 
                                                & ((IData)(vlSelf->PS4JRR) 
                                                   << 1U))])));
        PSBoeu = PSBuBY;
    } else {
        PSIXLa = ((0x13fU >= (0x1c0U & ((IData)(vlSelf->PSuhts) 
                                        << 6U))) ? 
                  (((QData)((IData)(vlSelf->PSnzGA[
                                    (((IData)(0x3fU) 
                                      + (0x1c0U & ((IData)(vlSelf->PSuhts) 
                                                   << 6U))) 
                                     >> 5U)])) << 0x20U) 
                   | (QData)((IData)(vlSelf->PSnzGA[
                                     (0xeU & ((IData)(vlSelf->PSuhts) 
                                              << 1U))])))
                   : 0ULL);
        PSBoeu = PSAzWK;
    }
    if ((1U & (IData)(vlSelf->PSEUW3))) {
        PScnmb = (((QData)((IData)(vlSelf->PS5aQ0[(
                                                   ((IData)(0x3fU) 
                                                    + 
                                                    (0xc0U 
                                                     & ((IData)(vlSelf->PSHl8Z) 
                                                        << 6U))) 
                                                   >> 5U)])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS5aQ0[
                                               (6U 
                                                & ((IData)(vlSelf->PSHl8Z) 
                                                   << 1U))])));
        PS7xNA = PSSoIR;
    } else {
        PScnmb = ((0x13fU >= (0x1c0U & ((IData)(vlSelf->PSEehP) 
                                        << 6U))) ? 
                  (((QData)((IData)(vlSelf->PSAj6s[
                                    (((IData)(0x3fU) 
                                      + (0x1c0U & ((IData)(vlSelf->PSEehP) 
                                                   << 6U))) 
                                     >> 5U)])) << 0x20U) 
                   | (QData)((IData)(vlSelf->PSAj6s[
                                     (0xeU & ((IData)(vlSelf->PSEehP) 
                                              << 1U))])))
                   : 0ULL);
        PS7xNA = PSAIgD;
    }
    PSfGC8 = (0x7fffU & ((IData)(PSmNYf) + (1U & ((4U 
                                                   & (IData)(vlSelf->PSGAFK))
                                                   ? 
                                                  (((IData)(vlSelf->PSGAFK) 
                                                    >> 1U) 
                                                   | ((1U 
                                                       & (IData)(vlSelf->PSGAFK))
                                                       ? 
                                                      ((~ (IData)(PSmNYf)) 
                                                       & (0U 
                                                          != (IData)(PSUiiH)))
                                                       : 
                                                      ((IData)(PSUiiH) 
                                                       >> 1U)))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelf->PSGAFK))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelf->PSGAFK))
                                                     ? 
                                                    ((0U 
                                                      != (IData)(PSUiiH)) 
                                                     & (~ (IData)(vlSelf->PS1ws7)))
                                                     : 
                                                    ((0U 
                                                      != (IData)(PSUiiH)) 
                                                     & (IData)(vlSelf->PS1ws7)))
                                                    : 
                                                   ((~ (IData)(vlSelf->PSGAFK)) 
                                                    & (((IData)(PSUiiH) 
                                                        >> 1U) 
                                                       & ((IData)(PSUiiH) 
                                                          | (IData)(PSmNYf)))))))));
    PSAOej = (0x7fffU & ((IData)(PSqATS) + (1U & ((4U 
                                                   & (IData)(vlSelf->PSrUuo))
                                                   ? 
                                                  (((IData)(vlSelf->PSrUuo) 
                                                    >> 1U) 
                                                   | ((1U 
                                                       & (IData)(vlSelf->PSrUuo))
                                                       ? 
                                                      ((~ (IData)(PSqATS)) 
                                                       & (0U 
                                                          != (IData)(PSPPWD)))
                                                       : 
                                                      ((IData)(PSPPWD) 
                                                       >> 1U)))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelf->PSrUuo))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelf->PSrUuo))
                                                     ? 
                                                    ((0U 
                                                      != (IData)(PSPPWD)) 
                                                     & (~ (IData)(vlSelf->PScdb3)))
                                                     : 
                                                    ((0U 
                                                      != (IData)(PSPPWD)) 
                                                     & (IData)(vlSelf->PScdb3)))
                                                    : 
                                                   ((~ (IData)(vlSelf->PSrUuo)) 
                                                    & (((IData)(PSPPWD) 
                                                        >> 1U) 
                                                       & ((IData)(PSPPWD) 
                                                          | (IData)(PSqATS)))))))));
    PSIm5L = (0x7fffU & ((IData)(PSbwq8) + (1U & ((4U 
                                                   & (IData)(vlSelf->PSrBnv))
                                                   ? 
                                                  (((IData)(vlSelf->PSrBnv) 
                                                    >> 1U) 
                                                   | ((1U 
                                                       & (IData)(vlSelf->PSrBnv))
                                                       ? 
                                                      ((~ (IData)(PSbwq8)) 
                                                       & (0U 
                                                          != (IData)(PSFJd9)))
                                                       : 
                                                      ((IData)(PSFJd9) 
                                                       >> 1U)))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelf->PSrBnv))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelf->PSrBnv))
                                                     ? 
                                                    ((0U 
                                                      != (IData)(PSFJd9)) 
                                                     & (~ (IData)(vlSelf->PS0OhD)))
                                                     : 
                                                    ((0U 
                                                      != (IData)(PSFJd9)) 
                                                     & (IData)(vlSelf->PS0OhD)))
                                                    : 
                                                   ((~ (IData)(vlSelf->PSrBnv)) 
                                                    & (((IData)(PSFJd9) 
                                                        >> 1U) 
                                                       & ((IData)(PSFJd9) 
                                                          | (IData)(PSbwq8)))))))));
    PSCCdF = (0x7fffU & ((IData)(PSmBKQ) + (1U & ((4U 
                                                   & (IData)(vlSelf->PSAhJo))
                                                   ? 
                                                  (((IData)(vlSelf->PSAhJo) 
                                                    >> 1U) 
                                                   | ((1U 
                                                       & (IData)(vlSelf->PSAhJo))
                                                       ? 
                                                      ((~ (IData)(PSmBKQ)) 
                                                       & (0U 
                                                          != (IData)(PSSha4)))
                                                       : 
                                                      ((IData)(PSSha4) 
                                                       >> 1U)))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelf->PSAhJo))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelf->PSAhJo))
                                                     ? 
                                                    ((0U 
                                                      != (IData)(PSSha4)) 
                                                     & (~ (IData)(vlSelf->PSDAqQ)))
                                                     : 
                                                    ((0U 
                                                      != (IData)(PSSha4)) 
                                                     & (IData)(vlSelf->PSDAqQ)))
                                                    : 
                                                   ((~ (IData)(vlSelf->PSAhJo)) 
                                                    & (((IData)(PSSha4) 
                                                        >> 1U) 
                                                       & ((IData)(PSSha4) 
                                                          | (IData)(PSmBKQ)))))))));
    PS2aUm = (0x7fffffffffffffffULL & (PSF3n4 + (QData)((IData)(
                                                                (1U 
                                                                 & ((4U 
                                                                     & (IData)(vlSelf->PSo7Fl))
                                                                     ? 
                                                                    (((IData)(vlSelf->PSo7Fl) 
                                                                      >> 1U) 
                                                                     | ((1U 
                                                                         & (IData)(vlSelf->PSo7Fl))
                                                                         ? 
                                                                        ((~ (IData)(PSF3n4)) 
                                                                         & (0U 
                                                                            != (IData)(PS8HKZ)))
                                                                         : 
                                                                        ((IData)(PS8HKZ) 
                                                                         >> 1U)))
                                                                     : 
                                                                    ((2U 
                                                                      & (IData)(vlSelf->PSo7Fl))
                                                                      ? 
                                                                     ((1U 
                                                                       & (IData)(vlSelf->PSo7Fl))
                                                                       ? 
                                                                      ((0U 
                                                                        != (IData)(PS8HKZ)) 
                                                                       & (~ (IData)(vlSelf->PS0A1B)))
                                                                       : 
                                                                      ((0U 
                                                                        != (IData)(PS8HKZ)) 
                                                                       & (IData)(vlSelf->PS0A1B)))
                                                                      : 
                                                                     ((~ (IData)(vlSelf->PSo7Fl)) 
                                                                      & (((IData)(PS8HKZ) 
                                                                          >> 1U) 
                                                                         & ((IData)(PS8HKZ) 
                                                                            | (IData)(PSF3n4)))))))))));
    PSTwO1 = (0x7fffffffU & (PSvKD0 + (1U & ((4U & (IData)(vlSelf->PSjjtl))
                                              ? (((IData)(vlSelf->PSjjtl) 
                                                  >> 1U) 
                                                 | ((1U 
                                                     & (IData)(vlSelf->PSjjtl))
                                                     ? 
                                                    ((~ PSvKD0) 
                                                     & (0U 
                                                        != (IData)(PSP2Lh)))
                                                     : 
                                                    ((IData)(PSP2Lh) 
                                                     >> 1U)))
                                              : ((2U 
                                                  & (IData)(vlSelf->PSjjtl))
                                                  ? 
                                                 ((1U 
                                                   & (IData)(vlSelf->PSjjtl))
                                                   ? 
                                                  ((0U 
                                                    != (IData)(PSP2Lh)) 
                                                   & (~ (IData)(vlSelf->PS3kBH)))
                                                   : 
                                                  ((0U 
                                                    != (IData)(PSP2Lh)) 
                                                   & (IData)(vlSelf->PS3kBH)))
                                                  : 
                                                 ((~ (IData)(vlSelf->PSjjtl)) 
                                                  & (((IData)(PSP2Lh) 
                                                      >> 1U) 
                                                     & ((IData)(PSP2Lh) 
                                                        | PSvKD0))))))));
    PSAEI2 = (0x7fffffffU & (PSzxvc + (1U & ((4U & (IData)(vlSelf->PSPBWg))
                                              ? (((IData)(vlSelf->PSPBWg) 
                                                  >> 1U) 
                                                 | ((1U 
                                                     & (IData)(vlSelf->PSPBWg))
                                                     ? 
                                                    ((~ PSzxvc) 
                                                     & (0U 
                                                        != (IData)(PSBjQV)))
                                                     : 
                                                    ((IData)(PSBjQV) 
                                                     >> 1U)))
                                              : ((2U 
                                                  & (IData)(vlSelf->PSPBWg))
                                                  ? 
                                                 ((1U 
                                                   & (IData)(vlSelf->PSPBWg))
                                                   ? 
                                                  ((0U 
                                                    != (IData)(PSBjQV)) 
                                                   & (~ (IData)(vlSelf->PSSEOk)))
                                                   : 
                                                  ((0U 
                                                    != (IData)(PSBjQV)) 
                                                   & (IData)(vlSelf->PSSEOk)))
                                                  : 
                                                 ((~ (IData)(vlSelf->PSPBWg)) 
                                                  & (((IData)(PSBjQV) 
                                                      >> 1U) 
                                                     & ((IData)(PSBjQV) 
                                                        | PSzxvc))))))));
    PSRsZE = (0xffffU & ((IData)(PSGlwU) + (1U & ((4U 
                                                   & (IData)(vlSelf->PSjKP4))
                                                   ? 
                                                  (((IData)(vlSelf->PSjKP4) 
                                                    >> 1U) 
                                                   | ((1U 
                                                       & (IData)(vlSelf->PSjKP4))
                                                       ? 
                                                      ((~ (IData)(PSGlwU)) 
                                                       & (0U 
                                                          != (IData)(PSgzne)))
                                                       : 
                                                      ((IData)(PSgzne) 
                                                       >> 1U)))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelf->PSjKP4))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelf->PSjKP4))
                                                     ? 
                                                    ((0U 
                                                      != (IData)(PSgzne)) 
                                                     & (~ (IData)(vlSelf->PSoQn2)))
                                                     : 
                                                    ((0U 
                                                      != (IData)(PSgzne)) 
                                                     & (IData)(vlSelf->PSoQn2)))
                                                    : 
                                                   ((~ (IData)(vlSelf->PSjKP4)) 
                                                    & (((IData)(PSgzne) 
                                                        >> 1U) 
                                                       & ((IData)(PSgzne) 
                                                          | (IData)(PSGlwU)))))))));
    PSymfT = (0xffffU & ((IData)(PS9Y9d) + (1U & ((4U 
                                                   & (IData)(vlSelf->PS2wyc))
                                                   ? 
                                                  (((IData)(vlSelf->PS2wyc) 
                                                    >> 1U) 
                                                   | ((1U 
                                                       & (IData)(vlSelf->PS2wyc))
                                                       ? 
                                                      ((~ (IData)(PS9Y9d)) 
                                                       & (0U 
                                                          != (IData)(PSDM36)))
                                                       : 
                                                      ((IData)(PSDM36) 
                                                       >> 1U)))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelf->PS2wyc))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelf->PS2wyc))
                                                     ? 
                                                    ((0U 
                                                      != (IData)(PSDM36)) 
                                                     & (~ (IData)(vlSelf->PS9DUu)))
                                                     : 
                                                    ((0U 
                                                      != (IData)(PSDM36)) 
                                                     & (IData)(vlSelf->PS9DUu)))
                                                    : 
                                                   ((~ (IData)(vlSelf->PS2wyc)) 
                                                    & (((IData)(PSDM36) 
                                                        >> 1U) 
                                                       & ((IData)(PSDM36) 
                                                          | (IData)(PS9Y9d)))))))));
    PSBPZO = (PSIXLa + (QData)((IData)((1U & ((4U & (IData)(vlSelf->PSzDBL))
                                               ? (((IData)(vlSelf->PSzDBL) 
                                                   >> 1U) 
                                                  | ((1U 
                                                      & (IData)(vlSelf->PSzDBL))
                                                      ? 
                                                     ((~ (IData)(PSIXLa)) 
                                                      & (0U 
                                                         != (IData)(PSBoeu)))
                                                      : 
                                                     ((IData)(PSBoeu) 
                                                      >> 1U)))
                                               : ((2U 
                                                   & (IData)(vlSelf->PSzDBL))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelf->PSzDBL))
                                                    ? 
                                                   ((0U 
                                                     != (IData)(PSBoeu)) 
                                                    & (~ (IData)(vlSelf->PST0BN)))
                                                    : 
                                                   ((0U 
                                                     != (IData)(PSBoeu)) 
                                                    & (IData)(vlSelf->PST0BN)))
                                                   : 
                                                  ((~ (IData)(vlSelf->PSzDBL)) 
                                                   & (((IData)(PSBoeu) 
                                                       >> 1U) 
                                                      & ((IData)(PSBoeu) 
                                                         | (IData)(PSIXLa))))))))));
    PSBJ5U = (PScnmb + (QData)((IData)((1U & ((4U & (IData)(vlSelf->PS1Ajz))
                                               ? (((IData)(vlSelf->PS1Ajz) 
                                                   >> 1U) 
                                                  | ((1U 
                                                      & (IData)(vlSelf->PS1Ajz))
                                                      ? 
                                                     ((~ (IData)(PScnmb)) 
                                                      & (0U 
                                                         != (IData)(PS7xNA)))
                                                      : 
                                                     ((IData)(PS7xNA) 
                                                      >> 1U)))
                                               : ((2U 
                                                   & (IData)(vlSelf->PS1Ajz))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelf->PS1Ajz))
                                                    ? 
                                                   ((0U 
                                                     != (IData)(PS7xNA)) 
                                                    & (~ (IData)(vlSelf->PS2dfE)))
                                                    : 
                                                   ((0U 
                                                     != (IData)(PS7xNA)) 
                                                    & (IData)(vlSelf->PS2dfE)))
                                                   : 
                                                  ((~ (IData)(vlSelf->PS1Ajz)) 
                                                   & (((IData)(PS7xNA) 
                                                       >> 1U) 
                                                      & ((IData)(PS7xNA) 
                                                         | (IData)(PScnmb))))))))));
    vlSelf->PSa68m = (((VL_LTES_III(1,32,32, 0x1fU, 
                                    VL_EXTENDS_II(32,7, (IData)(PSaxr7))) 
                        | (0x1fU == (0x1fU & ((IData)(PSfGC8) 
                                              >> 0xaU)))) 
                       << 2U) | ((((0U == (0x1fU & 
                                           ((IData)(PSfGC8) 
                                            >> 0xaU))) 
                                   & (IData)(vlSelf->PSa68m)) 
                                  << 1U) | (((0U != (IData)(PSUiiH)) 
                                             | VL_LTES_III(1,32,32, 0x1fU, 
                                                           VL_EXTENDS_II(32,7, (IData)(PSaxr7)))) 
                                            | (0x1fU 
                                               == (0x1fU 
                                                   & ((IData)(PSfGC8) 
                                                      >> 0xaU))))));
    vlSelf->PS3yqr = ((0xffffU & vlSelf->PS3yqr) | 
                      (((1U & (IData)(vlSelf->PSH6UL))
                         ? vlSelf->PSuBUf : ((0x8000U 
                                              & (((((0U 
                                                     == (IData)(PSmNYf)) 
                                                    & (0U 
                                                       == (IData)(PSUiiH))) 
                                                   & (IData)(vlSelf->PS5kRx))
                                                   ? 
                                                  (2U 
                                                   == 
                                                   (7U 
                                                    & (IData)(vlSelf->PSGAFK)))
                                                   : (IData)(vlSelf->PS1ws7)) 
                                                 << 0xfU)) 
                                             | (IData)(PSfGC8))) 
                       << 0x10U));
    vlSelf->PSrPWp = (((VL_LTES_III(1,32,32, 0x1fU, 
                                    VL_EXTENDS_II(32,7, (IData)(PSYtgg))) 
                        | (0x1fU == (0x1fU & ((IData)(PSAOej) 
                                              >> 0xaU)))) 
                       << 2U) | ((((0U == (0x1fU & 
                                           ((IData)(PSAOej) 
                                            >> 0xaU))) 
                                   & (IData)(vlSelf->PSrPWp)) 
                                  << 1U) | (((0U != (IData)(PSPPWD)) 
                                             | VL_LTES_III(1,32,32, 0x1fU, 
                                                           VL_EXTENDS_II(32,7, (IData)(PSYtgg)))) 
                                            | (0x1fU 
                                               == (0x1fU 
                                                   & ((IData)(PSAOej) 
                                                      >> 0xaU))))));
    vlSelf->PSpFWY = ((0xffffU & vlSelf->PSpFWY) | 
                      (((1U & (IData)(vlSelf->PSyGgA))
                         ? vlSelf->PSN5Pk : ((0x8000U 
                                              & (((((0U 
                                                     == (IData)(PSqATS)) 
                                                    & (0U 
                                                       == (IData)(PSPPWD))) 
                                                   & (IData)(vlSelf->PSPlHB))
                                                   ? 
                                                  (2U 
                                                   == 
                                                   (7U 
                                                    & (IData)(vlSelf->PSrUuo)))
                                                   : (IData)(vlSelf->PScdb3)) 
                                                 << 0xfU)) 
                                             | (IData)(PSAOej))) 
                       << 0x10U));
    vlSelf->PSGOzF = (((VL_LTES_III(1,32,32, 0x1fU, 
                                    VL_EXTENDS_II(32,7, (IData)(PSeFQ6))) 
                        | (0x1fU == (0x1fU & ((IData)(PSIm5L) 
                                              >> 0xaU)))) 
                       << 2U) | ((((0U == (0x1fU & 
                                           ((IData)(PSIm5L) 
                                            >> 0xaU))) 
                                   & (IData)(vlSelf->PSGOzF)) 
                                  << 1U) | (((0U != (IData)(PSFJd9)) 
                                             | VL_LTES_III(1,32,32, 0x1fU, 
                                                           VL_EXTENDS_II(32,7, (IData)(PSeFQ6)))) 
                                            | (0x1fU 
                                               == (0x1fU 
                                                   & ((IData)(PSIm5L) 
                                                      >> 0xaU))))));
    vlSelf->PS4SYq = ((0xffffU & vlSelf->PS4SYq) | 
                      (((1U & (IData)(vlSelf->PSt9UZ))
                         ? vlSelf->PS3oKh : ((0x8000U 
                                              & (((((0U 
                                                     == (IData)(PSbwq8)) 
                                                    & (0U 
                                                       == (IData)(PSFJd9))) 
                                                   & (IData)(vlSelf->PSeRYH))
                                                   ? 
                                                  (2U 
                                                   == 
                                                   (7U 
                                                    & (IData)(vlSelf->PSrBnv)))
                                                   : (IData)(vlSelf->PS0OhD)) 
                                                 << 0xfU)) 
                                             | (IData)(PSIm5L))) 
                       << 0x10U));
    vlSelf->PSSwqV = (((VL_LTES_III(1,32,32, 0x1fU, 
                                    VL_EXTENDS_II(32,7, (IData)(PSNOHO))) 
                        | (0x1fU == (0x1fU & ((IData)(PSCCdF) 
                                              >> 0xaU)))) 
                       << 2U) | ((((0U == (0x1fU & 
                                           ((IData)(PSCCdF) 
                                            >> 0xaU))) 
                                   & (IData)(vlSelf->PSSwqV)) 
                                  << 1U) | (((0U != (IData)(PSSha4)) 
                                             | VL_LTES_III(1,32,32, 0x1fU, 
                                                           VL_EXTENDS_II(32,7, (IData)(PSNOHO)))) 
                                            | (0x1fU 
                                               == (0x1fU 
                                                   & ((IData)(PSCCdF) 
                                                      >> 0xaU))))));
    vlSelf->PS5J7K = ((0xffffU & vlSelf->PS5J7K) | 
                      (((1U & (IData)(vlSelf->PSlAcN))
                         ? vlSelf->PS7bgX : ((0x8000U 
                                              & (((((0U 
                                                     == (IData)(PSmBKQ)) 
                                                    & (0U 
                                                       == (IData)(PSSha4))) 
                                                   & (IData)(vlSelf->PSGKIJ))
                                                   ? 
                                                  (2U 
                                                   == 
                                                   (7U 
                                                    & (IData)(vlSelf->PSAhJo)))
                                                   : (IData)(vlSelf->PSDAqQ)) 
                                                 << 0xfU)) 
                                             | (IData)(PSCCdF))) 
                       << 0x10U));
    vlSelf->PSCAv9 = (((VL_LTES_III(1,32,32, 0x7ffU, 
                                    VL_EXTENDS_II(32,13, (IData)(PS1AVg))) 
                        | (0x7ffU == (0x7ffU & (IData)(
                                                       (PS2aUm 
                                                        >> 0x34U))))) 
                       << 2U) | ((((0U == (0x7ffU & (IData)(
                                                            (PS2aUm 
                                                             >> 0x34U)))) 
                                   & (IData)(vlSelf->PSCAv9)) 
                                  << 1U) | (((0U != (IData)(PS8HKZ)) 
                                             | VL_LTES_III(1,32,32, 0x7ffU, 
                                                           VL_EXTENDS_II(32,13, (IData)(PS1AVg)))) 
                                            | (0x7ffU 
                                               == (0x7ffU 
                                                   & (IData)(
                                                             (PS2aUm 
                                                              >> 0x34U)))))));
    vlSelf->PSF8gm[2U] = (IData)(((1U & (IData)(vlSelf->PSBXf1))
                                   ? (((QData)((IData)(
                                                       vlSelf->PSUKJE[1U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSUKJE[0U])))
                                   : (((QData)((IData)(
                                                       (1U 
                                                        & ((((0ULL 
                                                              == PSF3n4) 
                                                             & (0U 
                                                                == (IData)(PS8HKZ))) 
                                                            & (IData)(vlSelf->PSpLKn))
                                                            ? 
                                                           (2U 
                                                            == 
                                                            (7U 
                                                             & (IData)(vlSelf->PSo7Fl)))
                                                            : (IData)(vlSelf->PS0A1B))))) 
                                       << 0x3fU) | PS2aUm)));
    vlSelf->PSF8gm[3U] = (IData)((((1U & (IData)(vlSelf->PSBXf1))
                                    ? (((QData)((IData)(
                                                        vlSelf->PSUKJE[1U])) 
                                        << 0x20U) | (QData)((IData)(
                                                                    vlSelf->PSUKJE[0U])))
                                    : (((QData)((IData)(
                                                        (1U 
                                                         & ((((0ULL 
                                                               == PSF3n4) 
                                                              & (0U 
                                                                 == (IData)(PS8HKZ))) 
                                                             & (IData)(vlSelf->PSpLKn))
                                                             ? 
                                                            (2U 
                                                             == 
                                                             (7U 
                                                              & (IData)(vlSelf->PSo7Fl)))
                                                             : (IData)(vlSelf->PS0A1B))))) 
                                        << 0x3fU) | PS2aUm)) 
                                  >> 0x20U));
    vlSelf->PSDVQX = (((VL_LTES_III(1,32,32, 0xffU, 
                                    VL_EXTENDS_II(32,10, (IData)(PS2BQO))) 
                        | (0xffU == (0xffU & (PSTwO1 
                                              >> 0x17U)))) 
                       << 2U) | ((((0U == (0xffU & 
                                           (PSTwO1 
                                            >> 0x17U))) 
                                   & (IData)(vlSelf->PSDVQX)) 
                                  << 1U) | (((0U != (IData)(PSP2Lh)) 
                                             | VL_LTES_III(1,32,32, 0xffU, 
                                                           VL_EXTENDS_II(32,10, (IData)(PS2BQO)))) 
                                            | (0xffU 
                                               == (0xffU 
                                                   & (PSTwO1 
                                                      >> 0x17U))))));
    vlSelf->PSBJEj = ((0xffffffffULL & vlSelf->PSBJEj) 
                      | ((QData)((IData)(((1U & (IData)(vlSelf->PSrvNa))
                                           ? vlSelf->PSn4eS[0U]
                                           : ((((((0U 
                                                   == PSvKD0) 
                                                  & (0U 
                                                     == (IData)(PSP2Lh))) 
                                                 & (IData)(vlSelf->PSbW7P))
                                                 ? 
                                                (2U 
                                                 == 
                                                 (7U 
                                                  & (IData)(vlSelf->PSjjtl)))
                                                 : (IData)(vlSelf->PS3kBH)) 
                                               << 0x1fU) 
                                              | PSTwO1)))) 
                         << 0x20U));
    vlSelf->PSY4Al = (((VL_LTES_III(1,32,32, 0xffU, 
                                    VL_EXTENDS_II(32,10, (IData)(PSt6Q8))) 
                        | (0xffU == (0xffU & (PSAEI2 
                                              >> 0x17U)))) 
                       << 2U) | ((((0U == (0xffU & 
                                           (PSAEI2 
                                            >> 0x17U))) 
                                   & (IData)(vlSelf->PSY4Al)) 
                                  << 1U) | (((0U != (IData)(PSBjQV)) 
                                             | VL_LTES_III(1,32,32, 0xffU, 
                                                           VL_EXTENDS_II(32,10, (IData)(PSt6Q8)))) 
                                            | (0xffU 
                                               == (0xffU 
                                                   & (PSAEI2 
                                                      >> 0x17U))))));
    vlSelf->PSrhwL = ((0xffffffffULL & vlSelf->PSrhwL) 
                      | ((QData)((IData)(((1U & (IData)(vlSelf->PS1VF8))
                                           ? vlSelf->PSDKwc[0U]
                                           : ((((((0U 
                                                   == PSzxvc) 
                                                  & (0U 
                                                     == (IData)(PSBjQV))) 
                                                 & (IData)(vlSelf->PS6IZJ))
                                                 ? 
                                                (2U 
                                                 == 
                                                 (7U 
                                                  & (IData)(vlSelf->PSPBWg)))
                                                 : (IData)(vlSelf->PSSEOk)) 
                                               << 0x1fU) 
                                              | PSAEI2)))) 
                         << 0x20U));
    vlSelf->PSIzwa = ((0x1bU & (IData)(vlSelf->PSIzwa)) 
                      | ((0U == (0x1fU & ((IData)(PSRsZE) 
                                          >> 0xaU))) 
                         << 2U));
    vlSelf->PS6uNY = ((0x1bU & (IData)(vlSelf->PS6uNY)) 
                      | ((0x1fU == (0x1fU & ((IData)(PSRsZE) 
                                             >> 0xaU))) 
                         << 2U));
    vlSelf->PSYzxU[1U] = (0xffffU | vlSelf->PSYzxU[1U]);
    vlSelf->PSYzxU[1U] = ((0xffff0000U & vlSelf->PSYzxU[1U]) 
                          | ((1U & ((IData)(vlSelf->PSkTWC) 
                                    & (IData)(vlSelf->PSAwQk)))
                              ? 0U : ((0x8000U & ((IData)(vlSelf->PSoQn2) 
                                                  << 0xfU)) 
                                      | (0x7fffU & (IData)(PSRsZE)))));
    PSd527 = (0xffffU & ((1U & (IData)(vlSelf->PSoQn2))
                          ? (- (IData)(PSRsZE)) : (IData)(PSRsZE)));
    vlSelf->PSlPDv = ((0x1bU & (IData)(vlSelf->PSlPDv)) 
                      | ((0U == (0x1fU & ((IData)(PSymfT) 
                                          >> 0xaU))) 
                         << 2U));
    vlSelf->PSQcFT = ((0x1bU & (IData)(vlSelf->PSQcFT)) 
                      | ((0x1fU == (0x1fU & ((IData)(PSymfT) 
                                             >> 0xaU))) 
                         << 2U));
    vlSelf->PSAry9[1U] = (0xffffU | vlSelf->PSAry9[1U]);
    vlSelf->PSAry9[1U] = ((0xffff0000U & vlSelf->PSAry9[1U]) 
                          | ((1U & ((IData)(vlSelf->PSBadf) 
                                    & (IData)(vlSelf->PSVwRV)))
                              ? 0U : ((0x8000U & ((IData)(vlSelf->PS9DUu) 
                                                  << 0xfU)) 
                                      | (0x7fffU & (IData)(PSymfT)))));
    PSgyYB = (0xffffU & ((1U & (IData)(vlSelf->PS9DUu))
                          ? (- (IData)(PSymfT)) : (IData)(PSymfT)));
    vlSelf->PSdYHk = ((0x1cU & (IData)(vlSelf->PSdYHk)) 
                      | (((0U == (0x7ffU & (IData)(
                                                   (PSBPZO 
                                                    >> 0x34U)))) 
                          << 1U) | (0U == (0xffU & (IData)(
                                                           (PSBPZO 
                                                            >> 0x17U))))));
    vlSelf->PSdYHk = ((0x1bU & (IData)(vlSelf->PSdYHk)) 
                      | ((0U == (0x1fU & (IData)((PSBPZO 
                                                  >> 0xaU)))) 
                         << 2U));
    vlSelf->PSzK6t = ((0x1cU & (IData)(vlSelf->PSzK6t)) 
                      | (((0x7ffU == (0x7ffU & (IData)(
                                                       (PSBPZO 
                                                        >> 0x34U)))) 
                          << 1U) | (0xffU == (0xffU 
                                              & (IData)(
                                                        (PSBPZO 
                                                         >> 0x17U))))));
    vlSelf->PSzK6t = ((0x1bU & (IData)(vlSelf->PSzK6t)) 
                      | ((0x1fU == (0x1fU & (IData)(
                                                    (PSBPZO 
                                                     >> 0xaU)))) 
                         << 2U));
    vlSelf->PSItqk[0U] = 0xffffffffU;
    vlSelf->PSItqk[1U] = 0xffffffffU;
    vlSelf->PSItqk[0U] = ((1U & ((IData)(vlSelf->PSN9qa) 
                                 & (IData)(vlSelf->PSWg7P)))
                           ? 0U : (((IData)(vlSelf->PST0BN) 
                                    << 0x1fU) | (0x7fffffffU 
                                                 & (IData)(PSBPZO))));
    vlSelf->PSItqk[2U] = 0xffffffffU;
    vlSelf->PSItqk[3U] = 0xffffffffU;
    vlSelf->PSItqk[2U] = (IData)(((1U & ((IData)(vlSelf->PSN9qa) 
                                         & (IData)(vlSelf->PSWg7P)))
                                   ? 0ULL : (((QData)((IData)(
                                                              (1U 
                                                               & (IData)(vlSelf->PST0BN)))) 
                                              << 0x3fU) 
                                             | (0x7fffffffffffffffULL 
                                                & PSBPZO))));
    vlSelf->PSItqk[3U] = (IData)((((1U & ((IData)(vlSelf->PSN9qa) 
                                          & (IData)(vlSelf->PSWg7P)))
                                    ? 0ULL : (((QData)((IData)(
                                                               (1U 
                                                                & (IData)(vlSelf->PST0BN)))) 
                                               << 0x3fU) 
                                              | (0x7fffffffffffffffULL 
                                                 & PSBPZO))) 
                                  >> 0x20U));
    vlSelf->PSItqk[4U] = 0xffffffffU;
    vlSelf->PSItqk[5U] = 0xffffffffU;
    vlSelf->PSItqk[4U] = ((0xffff0000U & vlSelf->PSItqk[4U]) 
                          | ((1U & ((IData)(vlSelf->PSN9qa) 
                                    & (IData)(vlSelf->PSWg7P)))
                              ? 0U : ((0x8000U & ((IData)(vlSelf->PST0BN) 
                                                  << 0xfU)) 
                                      | (0x7fffU & (IData)(PSBPZO)))));
    PSCkOM = ((1U & (IData)(vlSelf->PST0BN)) ? (- PSBPZO)
               : PSBPZO);
    vlSelf->PSjsMt = ((0x1cU & (IData)(vlSelf->PSjsMt)) 
                      | (((0U == (0x7ffU & (IData)(
                                                   (PSBJ5U 
                                                    >> 0x34U)))) 
                          << 1U) | (0U == (0xffU & (IData)(
                                                           (PSBJ5U 
                                                            >> 0x17U))))));
    vlSelf->PSjsMt = ((0x1bU & (IData)(vlSelf->PSjsMt)) 
                      | ((0U == (0x1fU & (IData)((PSBJ5U 
                                                  >> 0xaU)))) 
                         << 2U));
    vlSelf->PSgBMH = ((0x1cU & (IData)(vlSelf->PSgBMH)) 
                      | (((0x7ffU == (0x7ffU & (IData)(
                                                       (PSBJ5U 
                                                        >> 0x34U)))) 
                          << 1U) | (0xffU == (0xffU 
                                              & (IData)(
                                                        (PSBJ5U 
                                                         >> 0x17U))))));
    vlSelf->PSgBMH = ((0x1bU & (IData)(vlSelf->PSgBMH)) 
                      | ((0x1fU == (0x1fU & (IData)(
                                                    (PSBJ5U 
                                                     >> 0xaU)))) 
                         << 2U));
    vlSelf->PSh5vv[0U] = 0xffffffffU;
    vlSelf->PSh5vv[1U] = 0xffffffffU;
    vlSelf->PSh5vv[0U] = ((1U & ((IData)(vlSelf->PSihnm) 
                                 & (IData)(vlSelf->PSBwcq)))
                           ? 0U : (((IData)(vlSelf->PS2dfE) 
                                    << 0x1fU) | (0x7fffffffU 
                                                 & (IData)(PSBJ5U))));
    vlSelf->PSh5vv[2U] = 0xffffffffU;
    vlSelf->PSh5vv[3U] = 0xffffffffU;
    vlSelf->PSh5vv[2U] = (IData)(((1U & ((IData)(vlSelf->PSihnm) 
                                         & (IData)(vlSelf->PSBwcq)))
                                   ? 0ULL : (((QData)((IData)(
                                                              (1U 
                                                               & (IData)(vlSelf->PS2dfE)))) 
                                              << 0x3fU) 
                                             | (0x7fffffffffffffffULL 
                                                & PSBJ5U))));
    vlSelf->PSh5vv[3U] = (IData)((((1U & ((IData)(vlSelf->PSihnm) 
                                          & (IData)(vlSelf->PSBwcq)))
                                    ? 0ULL : (((QData)((IData)(
                                                               (1U 
                                                                & (IData)(vlSelf->PS2dfE)))) 
                                               << 0x3fU) 
                                              | (0x7fffffffffffffffULL 
                                                 & PSBJ5U))) 
                                  >> 0x20U));
    vlSelf->PSh5vv[4U] = 0xffffffffU;
    vlSelf->PSh5vv[5U] = 0xffffffffU;
    vlSelf->PSh5vv[4U] = ((0xffff0000U & vlSelf->PSh5vv[4U]) 
                          | ((1U & ((IData)(vlSelf->PSihnm) 
                                    & (IData)(vlSelf->PSBwcq)))
                              ? 0U : ((0x8000U & ((IData)(vlSelf->PS2dfE) 
                                                  << 0xfU)) 
                                      | (0x7fffU & (IData)(PSBJ5U)))));
    PSzoz6 = ((1U & (IData)(vlSelf->PS2dfE)) ? (- PSBJ5U)
               : PSBJ5U);
    vlSelf->PS03lY = ((0xffffffff00000000ULL & vlSelf->PS03lY) 
                      | (IData)((IData)(((((2U & (IData)(vlSelf->PSQ2ew))
                                            ? (0xffffU 
                                               & vlSelf->PSpFWY)
                                            : 0xffffU) 
                                          << 0x10U) 
                                         | ((1U & (IData)(vlSelf->PSQ2ew))
                                             ? (0xffffU 
                                                & vlSelf->PS3yqr)
                                             : 0xffffU)))));
    vlSelf->PS03lY = ((0xffffffffULL & vlSelf->PS03lY) 
                      | ((QData)((IData)(((((8U & (IData)(vlSelf->PSQ2ew))
                                             ? (0xffffU 
                                                & vlSelf->PS5J7K)
                                             : 0xffffU) 
                                           << 0x10U) 
                                          | ((4U & (IData)(vlSelf->PSQ2ew))
                                              ? (0xffffU 
                                                 & vlSelf->PS4SYq)
                                              : 0xffffU)))) 
                         << 0x20U));
    vlSelf->PSc2Sx[2U] = (0x400000U | ((0x3fffU & vlSelf->PSc2Sx[2U]) 
                                       | (((IData)(
                                                   ((1U 
                                                     & (IData)(vlSelf->PSHCxm))
                                                     ? 
                                                    (((QData)((IData)(
                                                                      vlSelf->PSF8gm[1U])) 
                                                      << 0x20U) 
                                                     | (QData)((IData)(
                                                                       vlSelf->PSF8gm[0U])))
                                                     : 0xffffffffffffffffULL)) 
                                           << 0x1cU) 
                                          | (((IData)(vlSelf->PSJrZa) 
                                              << 0x17U) 
                                             | (0x3fc000U 
                                                & ((IData)(vlSelf->PSQbpB) 
                                                   << 0xeU))))));
    vlSelf->PSc2Sx[3U] = ((0x3fffU & (((IData)(((1U 
                                                 & (IData)(vlSelf->PSHCxm))
                                                 ? 
                                                (((QData)((IData)(
                                                                  vlSelf->PSF8gm[1U])) 
                                                  << 0x20U) 
                                                 | (QData)((IData)(
                                                                   vlSelf->PSF8gm[0U])))
                                                 : 0xffffffffffffffffULL)) 
                                       >> 4U) | ((IData)(vlSelf->PSJrZa) 
                                                 >> 9U))) 
                          | ((0xfffc000U & ((IData)(
                                                    ((1U 
                                                      & (IData)(vlSelf->PSHCxm))
                                                      ? 
                                                     (((QData)((IData)(
                                                                       vlSelf->PSF8gm[1U])) 
                                                       << 0x20U) 
                                                      | (QData)((IData)(
                                                                        vlSelf->PSF8gm[0U])))
                                                      : 0xffffffffffffffffULL)) 
                                            >> 4U)) 
                             | ((IData)((((1U & (IData)(vlSelf->PSHCxm))
                                           ? (((QData)((IData)(
                                                               vlSelf->PSF8gm[1U])) 
                                               << 0x20U) 
                                              | (QData)((IData)(
                                                                vlSelf->PSF8gm[0U])))
                                           : 0xffffffffffffffffULL) 
                                         >> 0x20U)) 
                                << 0x1cU)));
    vlSelf->PSc2Sx[4U] = ((0xf0000000U & vlSelf->PSc2Sx[4U]) 
                          | ((0x3fffU & ((IData)(((
                                                   (1U 
                                                    & (IData)(vlSelf->PSHCxm))
                                                    ? 
                                                   (((QData)((IData)(
                                                                     vlSelf->PSF8gm[1U])) 
                                                     << 0x20U) 
                                                    | (QData)((IData)(
                                                                      vlSelf->PSF8gm[0U])))
                                                    : 0xffffffffffffffffULL) 
                                                  >> 0x20U)) 
                                         >> 4U)) | 
                             (0xfffc000U & ((IData)(
                                                    (((1U 
                                                       & (IData)(vlSelf->PSHCxm))
                                                       ? 
                                                      (((QData)((IData)(
                                                                        vlSelf->PSF8gm[1U])) 
                                                        << 0x20U) 
                                                       | (QData)((IData)(
                                                                         vlSelf->PSF8gm[0U])))
                                                       : 0xffffffffffffffffULL) 
                                                     >> 0x20U)) 
                                            >> 4U))));
    PSBAgr = ((1U & (IData)(vlSelf->PSA9l1)) ? (IData)(vlSelf->PSBJEj)
               : 0xffffffffU);
    PSSURN = ((2U & (IData)(vlSelf->PSA9l1)) ? (IData)(vlSelf->PSrhwL)
               : 0xffffffffU);
    PSACAB = ((4U >= (7U & (IData)(vlSelf->PSx3li))) 
              & ((IData)(vlSelf->PS6uNY) >> (7U & (IData)(vlSelf->PSx3li))));
    PSebYB = (1U & ((((IData)((0U != (0x18U & (IData)(vlSelf->PSA0Ou)))) 
                      | (IData)(vlSelf->PS4E6R)) | 
                     (~ (IData)(vlSelf->PSA0Ou))) | 
                    (((IData)(vlSelf->PSoQn2) & (IData)(vlSelf->PS85hp)) 
                     & (0U != (IData)(PSd527)))));
    PSU5y7 = ((4U >= (7U & (IData)(vlSelf->PSIM4T))) 
              & ((IData)(vlSelf->PSQcFT) >> (7U & (IData)(vlSelf->PSIM4T))));
    PSup3T = (1U & ((((IData)((0U != (0x18U & (IData)(vlSelf->PSn7Xr)))) 
                      | (IData)(vlSelf->PSYBrp)) | 
                     (~ (IData)(vlSelf->PSn7Xr))) | 
                    (((IData)(vlSelf->PS9DUu) & (IData)(vlSelf->PShAMo)) 
                     & (0U != (IData)(PSgyYB)))));
    PSHBOU = ((4U >= (7U & (IData)(vlSelf->PSuhts))) 
              & ((IData)(vlSelf->PSzK6t) >> (7U & (IData)(vlSelf->PSuhts))));
    PSe9gI = (1U & ((((IData)((0U != (0x18U & (IData)(vlSelf->PSoAAB)))) 
                      | (IData)(vlSelf->PSiPBo)) | 
                     (~ (IData)(vlSelf->PSoAAB))) | 
                    (((IData)(vlSelf->PST0BN) & (IData)(vlSelf->PS42Rs)) 
                     & (0ULL != PSCkOM))));
    PSGFHW = ((4U >= (7U & (IData)(vlSelf->PSEehP))) 
              & ((IData)(vlSelf->PSgBMH) >> (7U & (IData)(vlSelf->PSEehP))));
    PShynm = (1U & ((((IData)((0U != (0x18U & (IData)(vlSelf->PSDTcc)))) 
                      | (IData)(vlSelf->PSNVtn)) | 
                     (~ (IData)(vlSelf->PSDTcc))) | 
                    (((IData)(vlSelf->PS2dfE) & (IData)(vlSelf->PSBh2x)) 
                     & (0ULL != PSzoz6))));
    vlSelf->PSc2Sx[4U] = ((0xfffffffU & vlSelf->PSc2Sx[4U]) 
                          | (vlSelf->PSa3B7 << 0x1cU));
    vlSelf->PSc2Sx[5U] = (0x10U | (((0xffffc00U & ((IData)(vlSelf->PS03lY) 
                                                   << 0xaU)) 
                                    | ((0xfffffe0U 
                                        & ((IData)(vlSelf->PSihRm) 
                                           << 5U)) 
                                       | (0xfU & (vlSelf->PSa3B7 
                                                  >> 4U)))) 
                                   | (0xf0000000U & 
                                      ((IData)(vlSelf->PS03lY) 
                                       << 0xaU))));
    vlSelf->PSc2Sx[6U] = ((((IData)(vlSelf->PS03lY) 
                            >> 0x16U) | (0xffffc00U 
                                         & ((IData)(
                                                    (vlSelf->PS03lY 
                                                     >> 0x20U)) 
                                            << 0xaU))) 
                          | (0xf0000000U & ((IData)(
                                                    (vlSelf->PS03lY 
                                                     >> 0x20U)) 
                                            << 0xaU)));
    vlSelf->PSc2Sx[7U] = ((0xfffffc00U & vlSelf->PSc2Sx[7U]) 
                          | ((IData)((vlSelf->PS03lY 
                                      >> 0x20U)) >> 0x16U));
    PS0ijR = (((QData)((IData)(PSSURN)) << 0x20U) | (QData)((IData)(PSBAgr)));
    vlSelf->PSrrm8 = ((((IData)(vlSelf->PSkTWC) & ((IData)(vlSelf->PS4E6R) 
                                                   | (IData)(PSACAB))) 
                       << 4U) | ((((~ (IData)(vlSelf->PSkTWC)) 
                                   & ((~ ((IData)(vlSelf->PSA0Ou) 
                                          >> 4U)) & 
                                      ((IData)(vlSelf->PS4E6R) 
                                       | (IData)(PSACAB)))) 
                                  << 2U) | (((((4U 
                                                >= 
                                                (7U 
                                                 & (IData)(vlSelf->PSx3li))) 
                                               & ((IData)(vlSelf->PSIzwa) 
                                                  >> 
                                                  (7U 
                                                   & (IData)(vlSelf->PSx3li)))) 
                                              & (IData)(vlSelf->PSrrm8)) 
                                             << 1U) 
                                            | ((1U 
                                                & (IData)(vlSelf->PSkTWC))
                                                ? (0U 
                                                   != (IData)(PS8np0))
                                                : (
                                                   (0U 
                                                    != (IData)(PS8np0)) 
                                                   | ((~ 
                                                       ((IData)(vlSelf->PSA0Ou) 
                                                        >> 4U)) 
                                                      & ((IData)(vlSelf->PS4E6R) 
                                                         | (IData)(PSACAB))))))));
    vlSelf->PSVgDE = ((0xf83ffU & vlSelf->PSVgDE) | 
                      (((4U & (IData)(vlSelf->PSoqQV))
                         ? ((1U & (IData)(vlSelf->PSMgii))
                             ? ((IData)(PSebYB) ? 0x10U
                                 : (0U != (IData)(PSLz8Y)))
                             : ((IData)(vlSelf->PS0FOQ)
                                 ? (0x10U & ((IData)(vlSelf->PSA0Ou) 
                                             << 2U))
                                 : (IData)(vlSelf->PSrrm8)))
                         : 0U) << 0xaU));
    PSpTGk = (0xffffU & ((IData)(PSebYB) ? (IData)(
                                                   (vlSelf->PSoyOa 
                                                    >> 
                                                    (0x30U 
                                                     & ((IData)(vlSelf->PSGusA) 
                                                        << 4U))))
                          : (IData)(PSd527)));
    vlSelf->PSlANj = ((((IData)(vlSelf->PSBadf) & ((IData)(vlSelf->PSYBrp) 
                                                   | (IData)(PSU5y7))) 
                       << 4U) | ((((~ (IData)(vlSelf->PSBadf)) 
                                   & ((~ ((IData)(vlSelf->PSn7Xr) 
                                          >> 4U)) & 
                                      ((IData)(vlSelf->PSYBrp) 
                                       | (IData)(PSU5y7)))) 
                                  << 2U) | (((((4U 
                                                >= 
                                                (7U 
                                                 & (IData)(vlSelf->PSIM4T))) 
                                               & ((IData)(vlSelf->PSlPDv) 
                                                  >> 
                                                  (7U 
                                                   & (IData)(vlSelf->PSIM4T)))) 
                                              & (IData)(vlSelf->PSlANj)) 
                                             << 1U) 
                                            | ((1U 
                                                & (IData)(vlSelf->PSBadf))
                                                ? (0U 
                                                   != (IData)(PSnLJl))
                                                : (
                                                   (0U 
                                                    != (IData)(PSnLJl)) 
                                                   | ((~ 
                                                       ((IData)(vlSelf->PSn7Xr) 
                                                        >> 4U)) 
                                                      & ((IData)(vlSelf->PSYBrp) 
                                                         | (IData)(PSU5y7))))))));
    vlSelf->PSVgDE = ((0x7fffU & vlSelf->PSVgDE) | 
                      (((8U & (IData)(vlSelf->PSoqQV))
                         ? ((1U & (IData)(vlSelf->PSfYx5))
                             ? ((IData)(PSup3T) ? 0x10U
                                 : (0U != (IData)(PSNt5F)))
                             : ((IData)(vlSelf->PS2W8h)
                                 ? (0x10U & ((IData)(vlSelf->PSn7Xr) 
                                             << 2U))
                                 : (IData)(vlSelf->PSlANj)))
                         : 0U) << 0xfU));
    PS8Msg = (0xffffU & ((IData)(PSup3T) ? (IData)(
                                                   (vlSelf->PSjWHH 
                                                    >> 
                                                    (0x30U 
                                                     & ((IData)(vlSelf->PS1MNM) 
                                                        << 4U))))
                          : (IData)(PSgyYB)));
    vlSelf->PSvB6d = ((((IData)(vlSelf->PSN9qa) & ((IData)(vlSelf->PSiPBo) 
                                                   | (IData)(PSHBOU))) 
                       << 4U) | ((((~ (IData)(vlSelf->PSN9qa)) 
                                   & ((~ ((IData)(vlSelf->PSoAAB) 
                                          >> 4U)) & 
                                      ((IData)(vlSelf->PSiPBo) 
                                       | (IData)(PSHBOU)))) 
                                  << 2U) | (((((4U 
                                                >= 
                                                (7U 
                                                 & (IData)(vlSelf->PSuhts))) 
                                               & ((IData)(vlSelf->PSdYHk) 
                                                  >> 
                                                  (7U 
                                                   & (IData)(vlSelf->PSuhts)))) 
                                              & (IData)(vlSelf->PSvB6d)) 
                                             << 1U) 
                                            | ((1U 
                                                & (IData)(vlSelf->PSN9qa))
                                                ? (0U 
                                                   != (IData)(PSAzWK))
                                                : (
                                                   (0U 
                                                    != (IData)(PSAzWK)) 
                                                   | ((~ 
                                                       ((IData)(vlSelf->PSoAAB) 
                                                        >> 4U)) 
                                                      & ((IData)(vlSelf->PSiPBo) 
                                                         | (IData)(PSHBOU))))))));
    vlSelf->PSVgDE = ((0xffc1fU & vlSelf->PSVgDE) | 
                      (((2U & (IData)(vlSelf->PSoqQV))
                         ? ((1U & (IData)(vlSelf->PSKWIU))
                             ? ((IData)(PSe9gI) ? 0x10U
                                 : (0U != (IData)(PSBuBY)))
                             : ((IData)(vlSelf->PSMxYC)
                                 ? (0x10U & ((IData)(vlSelf->PSoAAB) 
                                             << 2U))
                                 : (IData)(vlSelf->PSvB6d)))
                         : 0U) << 5U));
    PSxFmV = ((IData)(PSe9gI) ? (((QData)((IData)(vlSelf->PShiEk[
                                                  (((IData)(0x3fU) 
                                                    + 
                                                    (0xc0U 
                                                     & ((IData)(vlSelf->PS4JRR) 
                                                        << 6U))) 
                                                   >> 5U)])) 
                                  << 0x20U) | (QData)((IData)(
                                                              vlSelf->PShiEk[
                                                              (6U 
                                                               & ((IData)(vlSelf->PS4JRR) 
                                                                  << 1U))])))
               : PSCkOM);
    vlSelf->PSEms7 = ((((IData)(vlSelf->PSihnm) & ((IData)(vlSelf->PSNVtn) 
                                                   | (IData)(PSGFHW))) 
                       << 4U) | ((((~ (IData)(vlSelf->PSihnm)) 
                                   & ((~ ((IData)(vlSelf->PSDTcc) 
                                          >> 4U)) & 
                                      ((IData)(vlSelf->PSNVtn) 
                                       | (IData)(PSGFHW)))) 
                                  << 2U) | (((((4U 
                                                >= 
                                                (7U 
                                                 & (IData)(vlSelf->PSEehP))) 
                                               & ((IData)(vlSelf->PSjsMt) 
                                                  >> 
                                                  (7U 
                                                   & (IData)(vlSelf->PSEehP)))) 
                                              & (IData)(vlSelf->PSEms7)) 
                                             << 1U) 
                                            | ((1U 
                                                & (IData)(vlSelf->PSihnm))
                                                ? (0U 
                                                   != (IData)(PSAIgD))
                                                : (
                                                   (0U 
                                                    != (IData)(PSAIgD)) 
                                                   | ((~ 
                                                       ((IData)(vlSelf->PSDTcc) 
                                                        >> 4U)) 
                                                      & ((IData)(vlSelf->PSNVtn) 
                                                         | (IData)(PSGFHW))))))));
    vlSelf->PSVgDE = ((0xfffe0U & vlSelf->PSVgDE) | 
                      ((1U & (IData)(vlSelf->PSoqQV))
                        ? ((1U & (IData)(vlSelf->PSEUW3))
                            ? ((IData)(PShynm) ? 0x10U
                                : (0U != (IData)(PSSoIR)))
                            : ((IData)(vlSelf->PSAJp0)
                                ? (0x10U & ((IData)(vlSelf->PSDTcc) 
                                            << 2U))
                                : (IData)(vlSelf->PSEms7)))
                        : 0U));
    PS7QGE = ((IData)(PShynm) ? (((QData)((IData)(vlSelf->PSkgsT[
                                                  (((IData)(0x3fU) 
                                                    + 
                                                    (0xc0U 
                                                     & ((IData)(vlSelf->PSHl8Z) 
                                                        << 6U))) 
                                                   >> 5U)])) 
                                  << 0x20U) | (QData)((IData)(
                                                              vlSelf->PSkgsT[
                                                              (6U 
                                                               & ((IData)(vlSelf->PSHl8Z) 
                                                                  << 1U))])))
               : PSzoz6);
    vlSelf->PSc2Sx[0U] = (0x100U | (((IData)(PS0ijR) 
                                     << 0xeU) | (((IData)(vlSelf->PSBHiA) 
                                                  << 9U) 
                                                 | (0xffU 
                                                    & (IData)(vlSelf->PSa4BR)))));
    vlSelf->PSc2Sx[1U] = (((IData)(PS0ijR) >> 0x12U) 
                          | ((IData)((PS0ijR >> 0x20U)) 
                             << 0xeU));
    vlSelf->PSc2Sx[2U] = ((0xffffc000U & vlSelf->PSc2Sx[2U]) 
                          | ((IData)((PS0ijR >> 0x20U)) 
                             >> 0x12U));
    vlSelf->PS1kEz = ((0xbU & (IData)(vlSelf->PS1kEz)) 
                      | (4U & (((~ (IData)(vlSelf->PSMgii)) 
                                << 2U) | (0x7fffcU 
                                          & ((IData)(PSpTGk) 
                                             >> 0xdU)))));
    vlSelf->PS1kEz = ((7U & (IData)(vlSelf->PS1kEz)) 
                      | (8U & (((~ (IData)(vlSelf->PSfYx5)) 
                                << 3U) | (0xffff8U 
                                          & ((IData)(PS8Msg) 
                                             >> 0xcU)))));
    vlSelf->PS1kEz = ((0xdU & (IData)(vlSelf->PS1kEz)) 
                      | (2U & (((~ (IData)(vlSelf->PSKWIU)) 
                                | (IData)((PSxFmV >> 0x3fU))) 
                               << 1U)));
    PS3HWw = (0x1fU & (vlSelf->PSVgDE & (- (IData)(
                                                   (1U 
                                                    & (IData)(vlSelf->PSUJmv))))));
    PS3HWw = (0x1fU & ((IData)(PS3HWw) | ((vlSelf->PSVgDE 
                                           >> 5U) & 
                                          (- (IData)(
                                                     (1U 
                                                      & ((IData)(vlSelf->PSUJmv) 
                                                         >> 1U)))))));
    PS3HWw = (0x1fU & ((IData)(PS3HWw) | ((vlSelf->PSVgDE 
                                           >> 0xaU) 
                                          & (- (IData)(
                                                       (1U 
                                                        & ((IData)(vlSelf->PSUJmv) 
                                                           >> 2U)))))));
    PS3HWw = (0x1fU & ((IData)(PS3HWw) | ((vlSelf->PSVgDE 
                                           >> 0xfU) 
                                          & (- (IData)(
                                                       (1U 
                                                        & ((IData)(vlSelf->PSUJmv) 
                                                           >> 3U)))))));
    PSMkYI = PS3HWw;
    vlSelf->PS1kEz = ((0xeU & (IData)(vlSelf->PS1kEz)) 
                      | (1U & ((~ (IData)(vlSelf->PSEUW3)) 
                               | (IData)((PS7QGE >> 0x3fU)))));
    vlSelf->PSYn8l[7U] = (((IData)(vlSelf->PS1kEz) 
                           << 0x1fU) | ((0x40000000U 
                                         & ((IData)(vlSelf->PS1kEz) 
                                            << 0x1eU)) 
                                        | ((0x20000000U 
                                            & ((IData)(vlSelf->PS1kEz) 
                                               << 0x1dU)) 
                                           | ((0x10000000U 
                                               & ((IData)(vlSelf->PS1kEz) 
                                                  << 0x1cU)) 
                                              | ((0x8000000U 
                                                  & ((IData)(vlSelf->PS1kEz) 
                                                     << 0x1bU)) 
                                                 | ((0x4000000U 
                                                     & ((IData)(vlSelf->PS1kEz) 
                                                        << 0x1aU)) 
                                                    | ((0x2000000U 
                                                        & ((IData)(vlSelf->PS1kEz) 
                                                           << 0x19U)) 
                                                       | ((0x1000000U 
                                                           & ((IData)(vlSelf->PS1kEz) 
                                                              << 0x18U)) 
                                                          | ((0x800000U 
                                                              & ((IData)(vlSelf->PS1kEz) 
                                                                 << 0x17U)) 
                                                             | ((0x400000U 
                                                                 & ((IData)(vlSelf->PS1kEz) 
                                                                    << 0x16U)) 
                                                                | ((0x200000U 
                                                                    & ((IData)(vlSelf->PS1kEz) 
                                                                       << 0x15U)) 
                                                                   | ((0x100000U 
                                                                       & ((IData)(vlSelf->PS1kEz) 
                                                                          << 0x14U)) 
                                                                      | ((0x80000U 
                                                                          & ((IData)(vlSelf->PS1kEz) 
                                                                             << 0x13U)) 
                                                                         | ((0x40000U 
                                                                             & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x12U)) 
                                                                            | ((0x20000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x11U)) 
                                                                               | ((0x10000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & (IData)(vlSelf->PS1kEz)))))))))))))))))))))))))))))))));
    PSyfXQ = (0xffffU & ((4U & (IData)(vlSelf->PSoqQV))
                          ? ((1U & (IData)(vlSelf->PSMgii))
                              ? (IData)(PSpTGk) : ((IData)(vlSelf->PS0FOQ)
                                                    ? 
                                                   ((0x4fU 
                                                     >= 
                                                     (0x70U 
                                                      & ((IData)(vlSelf->PSx3li) 
                                                         << 4U)))
                                                     ? 
                                                    (((0U 
                                                       == 
                                                       (0x10U 
                                                        & ((IData)(vlSelf->PSx3li) 
                                                           << 4U)))
                                                       ? 0U
                                                       : 
                                                      (vlSelf->PSg1Rr[
                                                       (((IData)(0xfU) 
                                                         + 
                                                         (0x70U 
                                                          & ((IData)(vlSelf->PSx3li) 
                                                             << 4U))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x10U 
                                                         & ((IData)(vlSelf->PSx3li) 
                                                            << 4U))))) 
                                                     | (vlSelf->PSg1Rr[
                                                        (3U 
                                                         & ((IData)(vlSelf->PSx3li) 
                                                            >> 1U))] 
                                                        >> 
                                                        (0x10U 
                                                         & ((IData)(vlSelf->PSx3li) 
                                                            << 4U))))
                                                     : 0U)
                                                    : 
                                                   ((0x4fU 
                                                     >= 
                                                     (0x70U 
                                                      & ((IData)(vlSelf->PSx3li) 
                                                         << 4U)))
                                                     ? 
                                                    (((0U 
                                                       == 
                                                       (0x10U 
                                                        & ((IData)(vlSelf->PSx3li) 
                                                           << 4U)))
                                                       ? 0U
                                                       : 
                                                      (vlSelf->PSYzxU[
                                                       (((IData)(0xfU) 
                                                         + 
                                                         (0x70U 
                                                          & ((IData)(vlSelf->PSx3li) 
                                                             << 4U))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x10U 
                                                         & ((IData)(vlSelf->PSx3li) 
                                                            << 4U))))) 
                                                     | (vlSelf->PSYzxU[
                                                        (3U 
                                                         & ((IData)(vlSelf->PSx3li) 
                                                            >> 1U))] 
                                                        >> 
                                                        (0x10U 
                                                         & ((IData)(vlSelf->PSx3li) 
                                                            << 4U))))
                                                     : 0U)))
                          : ((0x8000U & ((IData)(vlSelf->PS1kEz) 
                                         << 0xfU)) 
                             | ((0x4000U & ((IData)(vlSelf->PS1kEz) 
                                            << 0xeU)) 
                                | ((0x2000U & ((IData)(vlSelf->PS1kEz) 
                                               << 0xdU)) 
                                   | ((0x1000U & ((IData)(vlSelf->PS1kEz) 
                                                  << 0xcU)) 
                                      | ((0x800U & 
                                          ((IData)(vlSelf->PS1kEz) 
                                           << 0xbU)) 
                                         | ((0x400U 
                                             & ((IData)(vlSelf->PS1kEz) 
                                                << 0xaU)) 
                                            | ((0x200U 
                                                & ((IData)(vlSelf->PS1kEz) 
                                                   << 9U)) 
                                               | ((0x100U 
                                                   & ((IData)(vlSelf->PS1kEz) 
                                                      << 8U)) 
                                                  | ((0x80U 
                                                      & ((IData)(vlSelf->PS1kEz) 
                                                         << 7U)) 
                                                     | ((0x40U 
                                                         & ((IData)(vlSelf->PS1kEz) 
                                                            << 6U)) 
                                                        | ((0x20U 
                                                            & ((IData)(vlSelf->PS1kEz) 
                                                               << 5U)) 
                                                           | ((0x10U 
                                                               & ((IData)(vlSelf->PS1kEz) 
                                                                  << 4U)) 
                                                              | ((8U 
                                                                  & ((IData)(vlSelf->PS1kEz) 
                                                                     << 3U)) 
                                                                 | ((4U 
                                                                     & ((IData)(vlSelf->PS1kEz) 
                                                                        << 2U)) 
                                                                    | ((2U 
                                                                        & ((IData)(vlSelf->PS1kEz) 
                                                                           << 1U)) 
                                                                       | (1U 
                                                                          & (IData)(vlSelf->PS1kEz)))))))))))))))))));
    PSQKjA = (0xffffU & ((8U & (IData)(vlSelf->PSoqQV))
                          ? ((1U & (IData)(vlSelf->PSfYx5))
                              ? (IData)(PS8Msg) : ((IData)(vlSelf->PS2W8h)
                                                    ? 
                                                   ((0x4fU 
                                                     >= 
                                                     (0x70U 
                                                      & ((IData)(vlSelf->PSIM4T) 
                                                         << 4U)))
                                                     ? 
                                                    (((0U 
                                                       == 
                                                       (0x10U 
                                                        & ((IData)(vlSelf->PSIM4T) 
                                                           << 4U)))
                                                       ? 0U
                                                       : 
                                                      (vlSelf->PS04bg[
                                                       (((IData)(0xfU) 
                                                         + 
                                                         (0x70U 
                                                          & ((IData)(vlSelf->PSIM4T) 
                                                             << 4U))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x10U 
                                                         & ((IData)(vlSelf->PSIM4T) 
                                                            << 4U))))) 
                                                     | (vlSelf->PS04bg[
                                                        (3U 
                                                         & ((IData)(vlSelf->PSIM4T) 
                                                            >> 1U))] 
                                                        >> 
                                                        (0x10U 
                                                         & ((IData)(vlSelf->PSIM4T) 
                                                            << 4U))))
                                                     : 0U)
                                                    : 
                                                   ((0x4fU 
                                                     >= 
                                                     (0x70U 
                                                      & ((IData)(vlSelf->PSIM4T) 
                                                         << 4U)))
                                                     ? 
                                                    (((0U 
                                                       == 
                                                       (0x10U 
                                                        & ((IData)(vlSelf->PSIM4T) 
                                                           << 4U)))
                                                       ? 0U
                                                       : 
                                                      (vlSelf->PSAry9[
                                                       (((IData)(0xfU) 
                                                         + 
                                                         (0x70U 
                                                          & ((IData)(vlSelf->PSIM4T) 
                                                             << 4U))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x10U 
                                                         & ((IData)(vlSelf->PSIM4T) 
                                                            << 4U))))) 
                                                     | (vlSelf->PSAry9[
                                                        (3U 
                                                         & ((IData)(vlSelf->PSIM4T) 
                                                            >> 1U))] 
                                                        >> 
                                                        (0x10U 
                                                         & ((IData)(vlSelf->PSIM4T) 
                                                            << 4U))))
                                                     : 0U)))
                          : ((0x8000U & ((IData)(vlSelf->PS1kEz) 
                                         << 0xfU)) 
                             | ((0x4000U & ((IData)(vlSelf->PS1kEz) 
                                            << 0xeU)) 
                                | ((0x2000U & ((IData)(vlSelf->PS1kEz) 
                                               << 0xdU)) 
                                   | ((0x1000U & ((IData)(vlSelf->PS1kEz) 
                                                  << 0xcU)) 
                                      | ((0x800U & 
                                          ((IData)(vlSelf->PS1kEz) 
                                           << 0xbU)) 
                                         | ((0x400U 
                                             & ((IData)(vlSelf->PS1kEz) 
                                                << 0xaU)) 
                                            | ((0x200U 
                                                & ((IData)(vlSelf->PS1kEz) 
                                                   << 9U)) 
                                               | ((0x100U 
                                                   & ((IData)(vlSelf->PS1kEz) 
                                                      << 8U)) 
                                                  | ((0x80U 
                                                      & ((IData)(vlSelf->PS1kEz) 
                                                         << 7U)) 
                                                     | ((0x40U 
                                                         & ((IData)(vlSelf->PS1kEz) 
                                                            << 6U)) 
                                                        | ((0x20U 
                                                            & ((IData)(vlSelf->PS1kEz) 
                                                               << 5U)) 
                                                           | ((0x10U 
                                                               & ((IData)(vlSelf->PS1kEz) 
                                                                  << 4U)) 
                                                              | ((8U 
                                                                  & ((IData)(vlSelf->PS1kEz) 
                                                                     << 3U)) 
                                                                 | ((4U 
                                                                     & ((IData)(vlSelf->PS1kEz) 
                                                                        << 2U)) 
                                                                    | ((2U 
                                                                        & ((IData)(vlSelf->PS1kEz) 
                                                                           << 1U)) 
                                                                       | (1U 
                                                                          & (IData)(vlSelf->PS1kEz)))))))))))))))))));
    PSCKR1 = ((2U & (IData)(vlSelf->PSoqQV)) ? ((1U 
                                                 & (IData)(vlSelf->PSKWIU))
                                                 ? PSxFmV
                                                 : 
                                                ((IData)(vlSelf->PSMxYC)
                                                  ? 
                                                 ((0x13fU 
                                                   >= 
                                                   (0x1c0U 
                                                    & ((IData)(vlSelf->PSuhts) 
                                                       << 6U)))
                                                   ? 
                                                  (((QData)((IData)(
                                                                    vlSelf->PSJ4Ar[
                                                                    (((IData)(0x3fU) 
                                                                      + 
                                                                      (0x1c0U 
                                                                       & ((IData)(vlSelf->PSuhts) 
                                                                          << 6U))) 
                                                                     >> 5U)])) 
                                                    << 0x20U) 
                                                   | (QData)((IData)(
                                                                     vlSelf->PSJ4Ar[
                                                                     (0xeU 
                                                                      & ((IData)(vlSelf->PSuhts) 
                                                                         << 1U))])))
                                                   : 0ULL)
                                                  : 
                                                 ((0x13fU 
                                                   >= 
                                                   (0x1c0U 
                                                    & ((IData)(vlSelf->PSuhts) 
                                                       << 6U)))
                                                   ? 
                                                  (((QData)((IData)(
                                                                    vlSelf->PSItqk[
                                                                    (((IData)(0x3fU) 
                                                                      + 
                                                                      (0x1c0U 
                                                                       & ((IData)(vlSelf->PSuhts) 
                                                                          << 6U))) 
                                                                     >> 5U)])) 
                                                    << 0x20U) 
                                                   | (QData)((IData)(
                                                                     vlSelf->PSItqk[
                                                                     (0xeU 
                                                                      & ((IData)(vlSelf->PSuhts) 
                                                                         << 1U))])))
                                                   : 0ULL)))
               : (((QData)((IData)((((IData)(vlSelf->PS1kEz) 
                                     << 0x1fU) | ((0x40000000U 
                                                   & ((IData)(vlSelf->PS1kEz) 
                                                      << 0x1eU)) 
                                                  | ((0x20000000U 
                                                      & ((IData)(vlSelf->PS1kEz) 
                                                         << 0x1dU)) 
                                                     | ((0x10000000U 
                                                         & ((IData)(vlSelf->PS1kEz) 
                                                            << 0x1cU)) 
                                                        | ((0x8000000U 
                                                            & ((IData)(vlSelf->PS1kEz) 
                                                               << 0x1bU)) 
                                                           | ((0x4000000U 
                                                               & ((IData)(vlSelf->PS1kEz) 
                                                                  << 0x1aU)) 
                                                              | ((0x2000000U 
                                                                  & ((IData)(vlSelf->PS1kEz) 
                                                                     << 0x19U)) 
                                                                 | ((0x1000000U 
                                                                     & ((IData)(vlSelf->PS1kEz) 
                                                                        << 0x18U)) 
                                                                    | ((0x800000U 
                                                                        & ((IData)(vlSelf->PS1kEz) 
                                                                           << 0x17U)) 
                                                                       | ((0x400000U 
                                                                           & ((IData)(vlSelf->PS1kEz) 
                                                                              << 0x16U)) 
                                                                          | ((0x200000U 
                                                                              & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x15U)) 
                                                                             | ((0x100000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & (IData)(vlSelf->PS1kEz))))))))))))))))))))))))))))))))))) 
                   << 0x20U) | (QData)((IData)((((IData)(vlSelf->PS1kEz) 
                                                 << 0x1fU) 
                                                | ((0x40000000U 
                                                    & ((IData)(vlSelf->PS1kEz) 
                                                       << 0x1eU)) 
                                                   | ((0x20000000U 
                                                       & ((IData)(vlSelf->PS1kEz) 
                                                          << 0x1dU)) 
                                                      | ((0x10000000U 
                                                          & ((IData)(vlSelf->PS1kEz) 
                                                             << 0x1cU)) 
                                                         | ((0x8000000U 
                                                             & ((IData)(vlSelf->PS1kEz) 
                                                                << 0x1bU)) 
                                                            | ((0x4000000U 
                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                   << 0x1aU)) 
                                                               | ((0x2000000U 
                                                                   & ((IData)(vlSelf->PS1kEz) 
                                                                      << 0x19U)) 
                                                                  | ((0x1000000U 
                                                                      & ((IData)(vlSelf->PS1kEz) 
                                                                         << 0x18U)) 
                                                                     | ((0x800000U 
                                                                         & ((IData)(vlSelf->PS1kEz) 
                                                                            << 0x17U)) 
                                                                        | ((0x400000U 
                                                                            & ((IData)(vlSelf->PS1kEz) 
                                                                               << 0x16U)) 
                                                                           | ((0x200000U 
                                                                               & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x15U)) 
                                                                              | ((0x100000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & (IData)(vlSelf->PS1kEz)))))))))))))))))))))))))))))))))))));
    PSY3Am = ((1U & (IData)(vlSelf->PSoqQV)) ? ((1U 
                                                 & (IData)(vlSelf->PSEUW3))
                                                 ? PS7QGE
                                                 : 
                                                ((IData)(vlSelf->PSAJp0)
                                                  ? 
                                                 ((0x13fU 
                                                   >= 
                                                   (0x1c0U 
                                                    & ((IData)(vlSelf->PSEehP) 
                                                       << 6U)))
                                                   ? 
                                                  (((QData)((IData)(
                                                                    vlSelf->PSJqrS[
                                                                    (((IData)(0x3fU) 
                                                                      + 
                                                                      (0x1c0U 
                                                                       & ((IData)(vlSelf->PSEehP) 
                                                                          << 6U))) 
                                                                     >> 5U)])) 
                                                    << 0x20U) 
                                                   | (QData)((IData)(
                                                                     vlSelf->PSJqrS[
                                                                     (0xeU 
                                                                      & ((IData)(vlSelf->PSEehP) 
                                                                         << 1U))])))
                                                   : 0ULL)
                                                  : 
                                                 ((0x13fU 
                                                   >= 
                                                   (0x1c0U 
                                                    & ((IData)(vlSelf->PSEehP) 
                                                       << 6U)))
                                                   ? 
                                                  (((QData)((IData)(
                                                                    vlSelf->PSh5vv[
                                                                    (((IData)(0x3fU) 
                                                                      + 
                                                                      (0x1c0U 
                                                                       & ((IData)(vlSelf->PSEehP) 
                                                                          << 6U))) 
                                                                     >> 5U)])) 
                                                    << 0x20U) 
                                                   | (QData)((IData)(
                                                                     vlSelf->PSh5vv[
                                                                     (0xeU 
                                                                      & ((IData)(vlSelf->PSEehP) 
                                                                         << 1U))])))
                                                   : 0ULL)))
               : (((QData)((IData)((((IData)(vlSelf->PS1kEz) 
                                     << 0x1fU) | ((0x40000000U 
                                                   & ((IData)(vlSelf->PS1kEz) 
                                                      << 0x1eU)) 
                                                  | ((0x20000000U 
                                                      & ((IData)(vlSelf->PS1kEz) 
                                                         << 0x1dU)) 
                                                     | ((0x10000000U 
                                                         & ((IData)(vlSelf->PS1kEz) 
                                                            << 0x1cU)) 
                                                        | ((0x8000000U 
                                                            & ((IData)(vlSelf->PS1kEz) 
                                                               << 0x1bU)) 
                                                           | ((0x4000000U 
                                                               & ((IData)(vlSelf->PS1kEz) 
                                                                  << 0x1aU)) 
                                                              | ((0x2000000U 
                                                                  & ((IData)(vlSelf->PS1kEz) 
                                                                     << 0x19U)) 
                                                                 | ((0x1000000U 
                                                                     & ((IData)(vlSelf->PS1kEz) 
                                                                        << 0x18U)) 
                                                                    | ((0x800000U 
                                                                        & ((IData)(vlSelf->PS1kEz) 
                                                                           << 0x17U)) 
                                                                       | ((0x400000U 
                                                                           & ((IData)(vlSelf->PS1kEz) 
                                                                              << 0x16U)) 
                                                                          | ((0x200000U 
                                                                              & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x15U)) 
                                                                             | ((0x100000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & (IData)(vlSelf->PS1kEz))))))))))))))))))))))))))))))))))) 
                   << 0x20U) | (QData)((IData)((((IData)(vlSelf->PS1kEz) 
                                                 << 0x1fU) 
                                                | ((0x40000000U 
                                                    & ((IData)(vlSelf->PS1kEz) 
                                                       << 0x1eU)) 
                                                   | ((0x20000000U 
                                                       & ((IData)(vlSelf->PS1kEz) 
                                                          << 0x1dU)) 
                                                      | ((0x10000000U 
                                                          & ((IData)(vlSelf->PS1kEz) 
                                                             << 0x1cU)) 
                                                         | ((0x8000000U 
                                                             & ((IData)(vlSelf->PS1kEz) 
                                                                << 0x1bU)) 
                                                            | ((0x4000000U 
                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                   << 0x1aU)) 
                                                               | ((0x2000000U 
                                                                   & ((IData)(vlSelf->PS1kEz) 
                                                                      << 0x19U)) 
                                                                  | ((0x1000000U 
                                                                      & ((IData)(vlSelf->PS1kEz) 
                                                                         << 0x18U)) 
                                                                     | ((0x800000U 
                                                                         & ((IData)(vlSelf->PS1kEz) 
                                                                            << 0x17U)) 
                                                                        | ((0x400000U 
                                                                            & ((IData)(vlSelf->PS1kEz) 
                                                                               << 0x16U)) 
                                                                           | ((0x200000U 
                                                                               & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x15U)) 
                                                                              | ((0x100000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x14U)) 
                                                                                | ((0x80000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x13U)) 
                                                                                | ((0x40000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x12U)) 
                                                                                | ((0x20000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x11U)) 
                                                                                | ((0x10000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0x10U)) 
                                                                                | ((0x8000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xfU)) 
                                                                                | ((0x4000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xeU)) 
                                                                                | ((0x2000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xdU)) 
                                                                                | ((0x1000U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xcU)) 
                                                                                | ((0x800U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xbU)) 
                                                                                | ((0x400U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 0xaU)) 
                                                                                | ((0x200U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 9U)) 
                                                                                | ((0x100U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 8U)) 
                                                                                | ((0x80U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 7U)) 
                                                                                | ((0x40U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 6U)) 
                                                                                | ((0x20U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 5U)) 
                                                                                | ((0x10U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 4U)) 
                                                                                | ((8U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 3U)) 
                                                                                | ((4U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 2U)) 
                                                                                | ((2U 
                                                                                & ((IData)(vlSelf->PS1kEz) 
                                                                                << 1U)) 
                                                                                | (1U 
                                                                                & (IData)(vlSelf->PS1kEz)))))))))))))))))))))))))))))))))))));
    vlSelf->PSYn8l[5U] = ((0xffff0000U & vlSelf->PSYn8l[5U]) 
                          | (IData)(PSyfXQ));
    vlSelf->PSqjlV[3U] = ((0xffff0000U & vlSelf->PSqjlV[3U]) 
                          | (IData)(PSyfXQ));
    vlSelf->PSYn8l[5U] = ((0xffffU & vlSelf->PSYn8l[5U]) 
                          | ((IData)(PSQKjA) << 0x10U));
    vlSelf->PSqjlV[3U] = ((0xffffU & vlSelf->PSqjlV[3U]) 
                          | ((IData)(PSQKjA) << 0x10U));
    vlSelf->PSYn8l[4U] = ((0xffffU & vlSelf->PSYn8l[4U]) 
                          | ((IData)(PSCKR1) << 0x10U));
    vlSelf->PSqjlV[2U] = ((0xffffU & vlSelf->PSqjlV[2U]) 
                          | ((IData)(PSCKR1) << 0x10U));
    vlSelf->PSqjlV[5U] = (IData)(PSCKR1);
    vlSelf->PSYn8l[0U] = (IData)(PSY3Am);
    vlSelf->PSYn8l[1U] = (IData)(PSCKR1);
    vlSelf->PSYn8l[2U] = (IData)(PSY3Am);
    vlSelf->PSYn8l[3U] = (IData)((PSY3Am >> 0x20U));
    vlSelf->PSYn8l[4U] = ((0xffff0000U & vlSelf->PSYn8l[4U]) 
                          | (0xffffU & (IData)(PSY3Am)));
    vlSelf->PSqjlV[2U] = ((0xffff0000U & vlSelf->PSqjlV[2U]) 
                          | (0xffffU & (IData)(PSY3Am)));
    vlSelf->PSqjlV[4U] = (IData)(PSY3Am);
    vlSelf->PSqjlV[6U] = (IData)(PSY3Am);
    vlSelf->PSqjlV[7U] = (IData)((PSY3Am >> 0x20U));
    PSK8Pi[0U] = (((IData)(((0x10U & vlSelf->PSCOGu)
                             ? (((QData)((IData)(vlSelf->PSqjlV[
                                                 (((IData)(0x3fU) 
                                                   + 
                                                   (0xc0U 
                                                    & (vlSelf->PSCOGu 
                                                       << 6U))) 
                                                  >> 5U)])) 
                                 << 0x20U) | (QData)((IData)(
                                                             vlSelf->PSqjlV[
                                                             (6U 
                                                              & (vlSelf->PSCOGu 
                                                                 << 1U))])))
                             : ((0x13fU >= (0x1c0U 
                                            & (vlSelf->PSCOGu 
                                               << 6U)))
                                 ? (((QData)((IData)(
                                                     vlSelf->PSYn8l[
                                                     (((IData)(0x3fU) 
                                                       + 
                                                       (0x1c0U 
                                                        & (vlSelf->PSCOGu 
                                                           << 6U))) 
                                                      >> 5U)])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSYn8l[
                                                                 (0xeU 
                                                                  & (vlSelf->PSCOGu 
                                                                     << 1U))])))
                                 : 0ULL))) << 0xeU) 
                  | (((IData)(PSMkYI) << 9U) | ((0x100U 
                                                 & ((IData)(vlSelf->PS1kEz) 
                                                    << 8U)) 
                                                | (0xffU 
                                                   & vlSelf->PSpBEo))));
    PSK8Pi[1U] = (((IData)(((0x10U & vlSelf->PSCOGu)
                             ? (((QData)((IData)(vlSelf->PSqjlV[
                                                 (((IData)(0x3fU) 
                                                   + 
                                                   (0xc0U 
                                                    & (vlSelf->PSCOGu 
                                                       << 6U))) 
                                                  >> 5U)])) 
                                 << 0x20U) | (QData)((IData)(
                                                             vlSelf->PSqjlV[
                                                             (6U 
                                                              & (vlSelf->PSCOGu 
                                                                 << 1U))])))
                             : ((0x13fU >= (0x1c0U 
                                            & (vlSelf->PSCOGu 
                                               << 6U)))
                                 ? (((QData)((IData)(
                                                     vlSelf->PSYn8l[
                                                     (((IData)(0x3fU) 
                                                       + 
                                                       (0x1c0U 
                                                        & (vlSelf->PSCOGu 
                                                           << 6U))) 
                                                      >> 5U)])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSYn8l[
                                                                 (0xeU 
                                                                  & (vlSelf->PSCOGu 
                                                                     << 1U))])))
                                 : 0ULL))) >> 0x12U) 
                  | ((IData)((((0x10U & vlSelf->PSCOGu)
                                ? (((QData)((IData)(
                                                    vlSelf->PSqjlV[
                                                    (((IData)(0x3fU) 
                                                      + 
                                                      (0xc0U 
                                                       & (vlSelf->PSCOGu 
                                                          << 6U))) 
                                                     >> 5U)])) 
                                    << 0x20U) | (QData)((IData)(
                                                                vlSelf->PSqjlV[
                                                                (6U 
                                                                 & (vlSelf->PSCOGu 
                                                                    << 1U))])))
                                : ((0x13fU >= (0x1c0U 
                                               & (vlSelf->PSCOGu 
                                                  << 6U)))
                                    ? (((QData)((IData)(
                                                        vlSelf->PSYn8l[
                                                        (((IData)(0x3fU) 
                                                          + 
                                                          (0x1c0U 
                                                           & (vlSelf->PSCOGu 
                                                              << 6U))) 
                                                         >> 5U)])) 
                                        << 0x20U) | (QData)((IData)(
                                                                    vlSelf->PSYn8l[
                                                                    (0xeU 
                                                                     & (vlSelf->PSCOGu 
                                                                        << 1U))])))
                                    : 0ULL)) >> 0x20U)) 
                     << 0xeU));
    vlSelf->PSwxpT[0U] = PSK8Pi[0U];
    vlSelf->PSwxpT[1U] = PSK8Pi[1U];
    vlSelf->PSwxpT[2U] = ((0xffffc000U & vlSelf->PSwxpT[2U]) 
                          | ((IData)((((0x10U & vlSelf->PSCOGu)
                                        ? (((QData)((IData)(
                                                            vlSelf->PSqjlV[
                                                            (((IData)(0x3fU) 
                                                              + 
                                                              (0xc0U 
                                                               & (vlSelf->PSCOGu 
                                                                  << 6U))) 
                                                             >> 5U)])) 
                                            << 0x20U) 
                                           | (QData)((IData)(
                                                             vlSelf->PSqjlV[
                                                             (6U 
                                                              & (vlSelf->PSCOGu 
                                                                 << 1U))])))
                                        : ((0x13fU 
                                            >= (0x1c0U 
                                                & (vlSelf->PSCOGu 
                                                   << 6U)))
                                            ? (((QData)((IData)(
                                                                vlSelf->PSYn8l[
                                                                (((IData)(0x3fU) 
                                                                  + 
                                                                  (0x1c0U 
                                                                   & (vlSelf->PSCOGu 
                                                                      << 6U))) 
                                                                 >> 5U)])) 
                                                << 0x20U) 
                                               | (QData)((IData)(
                                                                 vlSelf->PSYn8l[
                                                                 (0xeU 
                                                                  & (vlSelf->PSCOGu 
                                                                     << 1U))])))
                                            : 0ULL)) 
                                      >> 0x20U)) >> 0x12U));
}
