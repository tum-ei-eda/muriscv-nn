// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlane_e.h for the primary calling header

#include "Vlane_e_PSBYia.h"
#include "Vlane_e_PSplPG.h"

#include "verilated_dpi.h"

void Vlane_e_PSBYia__PSWMAZ(Vlane_e_PSBYia* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vlane_e_PSplPG* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlane_e_PSBYia__PSWMAZ\n"); );
    // Variables
    CData PSNHX1;
    CData PSYz8z;
    CData PS2p19;
    CData PSlnZM;
    CData PSAkGt;
    CData PSFk3s;
    CData PSQR7J;
    CData PSb5Yn;
    CData PSOtaC;
    SData PSI0aB;
    SData PSnciI;
    SData PSDVuq;
    SData PSMCUL;
    VlWide<3> PS80u1;
    VlWide<3> PSAOjc;
    VlWide<3> PSwTTq;
    VlWide<3> PShEMT;
    VlWide<3> PSCMC9;
    VlWide<3> PSg3jT;
    VlWide<8> PSM8W5;
    QData PSgIS7;
    QData PSkQzS;
    QData PS7bpI;
    QData PSpSJh;
    QData PSYWNl;
    QData PSMhkE;
    QData PShmx5;
    QData PSRr3W;
    QData PSvgus;
    QData PSmqB4;
    QData PSBKAx;
    QData PSqQRn;
    QData PSZ0Aj;
    QData PSTe5O;
    QData PSFGZo;
    QData PS0Z40;
    QData PShZzy;
    QData PSg5B2;
    QData PSRRBq;
    QData PSAu0P;
    QData PSDr55;
    QData PSFzan;
    QData PS1I7A;
    QData PSm1tk;
    QData PSvAR2;
    QData PSHSbj;
    QData PSRM9i;
    QData PSSo94;
    QData PSCXsa;
    QData PSRokC;
    QData PSpaFL;
    QData PSMca3;
    QData PS0cdC;
    QData PSzt5B;
    QData PS7Azm;
    // Body
    if ((0x2aU == (vlSelf->PSAs7m[3U] >> 0x18U))) {
        vlSelf->PS0f8n = ((0xffffffffff000000ULL & vlSelf->PS0f8n) 
                          | (IData)((IData)(((0xff0000U 
                                              & (vlSelf->PS2IeC[1U] 
                                                 << 0x10U)) 
                                             | ((0xff00U 
                                                 & (vlSelf->PS2IeC[0U] 
                                                    >> 8U)) 
                                                | (0xffU 
                                                   & vlSelf->PS2IeC[0U]))))));
        vlSelf->PS0f8n = ((0xffff000000ffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)(((0xff0000U 
                                               & vlSelf->PS2IeC[2U]) 
                                              | ((0xff00U 
                                                  & (vlSelf->PS2IeC[2U] 
                                                     << 8U)) 
                                                 | (0xffU 
                                                    & (vlSelf->PS2IeC[1U] 
                                                       >> 0x10U)))))) 
                             << 0x18U));
        vlSelf->PS0f8n = ((0xffffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)(((0xff00U 
                                               & (vlSelf->PS2IeC[3U] 
                                                  >> 8U)) 
                                              | (0xffU 
                                                 & vlSelf->PS2IeC[3U])))) 
                             << 0x30U));
    } else if ((0x32U == (vlSelf->PSAs7m[3U] >> 0x18U))) {
        if ((2U & (IData)(vlSelf->alu_vxrm_i))) {
            if ((1U & (IData)(vlSelf->alu_vxrm_i))) {
                vlSelf->PSDYTh = ((0xfeU & (IData)(vlSelf->PSDYTh)) 
                                  | ((~ (vlSelf->PS2IeC[0U] 
                                         >> 7U)) & 
                                     (0U != (0x7fU 
                                             & vlSelf->PS2IeC[0U]))));
                vlSelf->PSDYTh = ((0xfdU & (IData)(vlSelf->PSDYTh)) 
                                  | (((~ (vlSelf->PS2IeC[0U] 
                                          >> 0x17U)) 
                                      & (0U != (0x7fU 
                                                & (vlSelf->PS2IeC[0U] 
                                                   >> 0x10U)))) 
                                     << 1U));
                vlSelf->PSDYTh = ((0xfbU & (IData)(vlSelf->PSDYTh)) 
                                  | (((~ (vlSelf->PS2IeC[1U] 
                                          >> 7U)) & 
                                      (0U != (0x7fU 
                                              & vlSelf->PS2IeC[1U]))) 
                                     << 2U));
                vlSelf->PSDYTh = ((0xf7U & (IData)(vlSelf->PSDYTh)) 
                                  | (((~ (vlSelf->PS2IeC[1U] 
                                          >> 0x17U)) 
                                      & (0U != (0x7fU 
                                                & (vlSelf->PS2IeC[1U] 
                                                   >> 0x10U)))) 
                                     << 3U));
                vlSelf->PSDYTh = ((0xefU & (IData)(vlSelf->PSDYTh)) 
                                  | (((~ (vlSelf->PS2IeC[2U] 
                                          >> 7U)) & 
                                      (0U != (0x7fU 
                                              & vlSelf->PS2IeC[2U]))) 
                                     << 4U));
                vlSelf->PSDYTh = ((0xdfU & (IData)(vlSelf->PSDYTh)) 
                                  | (((~ (vlSelf->PS2IeC[2U] 
                                          >> 0x17U)) 
                                      & (0U != (0x7fU 
                                                & (vlSelf->PS2IeC[2U] 
                                                   >> 0x10U)))) 
                                     << 5U));
                vlSelf->PSDYTh = ((0xbfU & (IData)(vlSelf->PSDYTh)) 
                                  | (((~ (vlSelf->PS2IeC[3U] 
                                          >> 7U)) & 
                                      (0U != (0x7fU 
                                              & vlSelf->PS2IeC[3U]))) 
                                     << 6U));
                vlSelf->PSDYTh = ((0x7fU & (IData)(vlSelf->PSDYTh)) 
                                  | (((~ (vlSelf->PS2IeC[3U] 
                                          >> 0x17U)) 
                                      & (0U != (0x7fU 
                                                & (vlSelf->PS2IeC[3U] 
                                                   >> 0x10U)))) 
                                     << 7U));
            } else {
                vlSelf->PSDYTh = 0U;
            }
        } else if ((1U & (IData)(vlSelf->alu_vxrm_i))) {
            vlSelf->PSDYTh = ((0xfeU & (IData)(vlSelf->PSDYTh)) 
                              | (1U & ((vlSelf->PS2IeC[0U] 
                                        >> 6U) & ((0U 
                                                   != 
                                                   (0x3fU 
                                                    & vlSelf->PS2IeC[0U])) 
                                                  | (vlSelf->PS2IeC[0U] 
                                                     >> 7U)))));
            vlSelf->PSDYTh = ((0xfdU & (IData)(vlSelf->PSDYTh)) 
                              | (2U & ((vlSelf->PS2IeC[0U] 
                                        >> 0x15U) & 
                                       (((0U != (0x3fU 
                                                 & (vlSelf->PS2IeC[0U] 
                                                    >> 0x10U))) 
                                         << 1U) | (0x3feU 
                                                   & (vlSelf->PS2IeC[0U] 
                                                      >> 0x16U))))));
            vlSelf->PSDYTh = ((0xfbU & (IData)(vlSelf->PSDYTh)) 
                              | (4U & ((vlSelf->PS2IeC[1U] 
                                        >> 4U) & ((
                                                   (0U 
                                                    != 
                                                    (0x3fU 
                                                     & vlSelf->PS2IeC[1U])) 
                                                   << 2U) 
                                                  | (0x7fffffcU 
                                                     & (vlSelf->PS2IeC[1U] 
                                                        >> 5U))))));
            vlSelf->PSDYTh = ((0xf7U & (IData)(vlSelf->PSDYTh)) 
                              | (8U & ((vlSelf->PS2IeC[1U] 
                                        >> 0x13U) & 
                                       (((0U != (0x3fU 
                                                 & (vlSelf->PS2IeC[1U] 
                                                    >> 0x10U))) 
                                         << 3U) | (0xff8U 
                                                   & (vlSelf->PS2IeC[1U] 
                                                      >> 0x14U))))));
            vlSelf->PSDYTh = ((0xefU & (IData)(vlSelf->PSDYTh)) 
                              | (0x10U & ((vlSelf->PS2IeC[2U] 
                                           >> 2U) & 
                                          (((0U != 
                                             (0x3fU 
                                              & vlSelf->PS2IeC[2U])) 
                                            << 4U) 
                                           | (0x1ffffff0U 
                                              & (vlSelf->PS2IeC[2U] 
                                                 >> 3U))))));
            vlSelf->PSDYTh = ((0xdfU & (IData)(vlSelf->PSDYTh)) 
                              | (0x20U & ((vlSelf->PS2IeC[2U] 
                                           >> 0x11U) 
                                          & (((0U != 
                                               (0x3fU 
                                                & (vlSelf->PS2IeC[2U] 
                                                   >> 0x10U))) 
                                              << 5U) 
                                             | (0x3fe0U 
                                                & (vlSelf->PS2IeC[2U] 
                                                   >> 0x12U))))));
            vlSelf->PSDYTh = ((0xbfU & (IData)(vlSelf->PSDYTh)) 
                              | (0x40U & (vlSelf->PS2IeC[3U] 
                                          & (((0U != 
                                               (0x3fU 
                                                & vlSelf->PS2IeC[3U])) 
                                              << 6U) 
                                             | (0x7fffffc0U 
                                                & (vlSelf->PS2IeC[3U] 
                                                   >> 1U))))));
            vlSelf->PSDYTh = ((0x7fU & (IData)(vlSelf->PSDYTh)) 
                              | (0x80U & ((vlSelf->PS2IeC[3U] 
                                           >> 0xfU) 
                                          & (((0U != 
                                               (0x3fU 
                                                & (vlSelf->PS2IeC[3U] 
                                                   >> 0x10U))) 
                                              << 7U) 
                                             | (0xff80U 
                                                & (vlSelf->PS2IeC[3U] 
                                                   >> 0x10U))))));
        } else {
            vlSelf->PSDYTh = ((0xf8U & (IData)(vlSelf->PSDYTh)) 
                              | ((4U & (vlSelf->PS2IeC[1U] 
                                        >> 4U)) | (
                                                   (2U 
                                                    & (vlSelf->PS2IeC[0U] 
                                                       >> 0x15U)) 
                                                   | (1U 
                                                      & (vlSelf->PS2IeC[0U] 
                                                         >> 6U)))));
            vlSelf->PSDYTh = ((0xc7U & (IData)(vlSelf->PSDYTh)) 
                              | ((0x20U & (vlSelf->PS2IeC[2U] 
                                           >> 0x11U)) 
                                 | ((0x10U & (vlSelf->PS2IeC[2U] 
                                              >> 2U)) 
                                    | (8U & (vlSelf->PS2IeC[1U] 
                                             >> 0x13U)))));
            vlSelf->PSDYTh = ((0x3fU & (IData)(vlSelf->PSDYTh)) 
                              | ((0x80U & (vlSelf->PS2IeC[3U] 
                                           >> 0xfU)) 
                                 | (0x40U & vlSelf->PS2IeC[3U])));
        }
        vlSelf->PS0f8n = ((0xffffffffffffff00ULL & vlSelf->PS0f8n) 
                          | (IData)((IData)((0xffU 
                                             & ((0x32U 
                                                 == 
                                                 (vlSelf->PSAs7m[3U] 
                                                  >> 0x18U))
                                                 ? 
                                                ((0x1ffU 
                                                  & (vlSelf->PS2IeC[0U] 
                                                     >> 7U)) 
                                                 + 
                                                 (1U 
                                                  & (IData)(vlSelf->PSDYTh)))
                                                 : 
                                                (0xffU 
                                                 & vlSelf->PS2IeC[0U]))))));
        vlSelf->PS0f8n = ((0xffffffffffff00ffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((0x32U 
                                                  == 
                                                  (vlSelf->PSAs7m[3U] 
                                                   >> 0x18U))
                                                  ? 
                                                 ((vlSelf->PS2IeC[0U] 
                                                   >> 0x17U) 
                                                  + 
                                                  (1U 
                                                   & ((IData)(vlSelf->PSDYTh) 
                                                      >> 1U)))
                                                  : 
                                                 (0xffU 
                                                  & (vlSelf->PS2IeC[0U] 
                                                     >> 0x10U)))))) 
                             << 8U));
        vlSelf->PS0f8n = ((0xffffffffff00ffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((0x32U 
                                                  == 
                                                  (vlSelf->PSAs7m[3U] 
                                                   >> 0x18U))
                                                  ? 
                                                 ((0x1ffU 
                                                   & (vlSelf->PS2IeC[1U] 
                                                      >> 7U)) 
                                                  + 
                                                  (1U 
                                                   & ((IData)(vlSelf->PSDYTh) 
                                                      >> 2U)))
                                                  : 
                                                 (0xffU 
                                                  & vlSelf->PS2IeC[1U]))))) 
                             << 0x10U));
        vlSelf->PS0f8n = ((0xffffffff00ffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((0x32U 
                                                  == 
                                                  (vlSelf->PSAs7m[3U] 
                                                   >> 0x18U))
                                                  ? 
                                                 ((vlSelf->PS2IeC[1U] 
                                                   >> 0x17U) 
                                                  + 
                                                  (1U 
                                                   & ((IData)(vlSelf->PSDYTh) 
                                                      >> 3U)))
                                                  : 
                                                 (0xffU 
                                                  & (vlSelf->PS2IeC[1U] 
                                                     >> 0x10U)))))) 
                             << 0x18U));
        vlSelf->PS0f8n = ((0xffffff00ffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((0x32U 
                                                  == 
                                                  (vlSelf->PSAs7m[3U] 
                                                   >> 0x18U))
                                                  ? 
                                                 ((0x1ffU 
                                                   & (vlSelf->PS2IeC[2U] 
                                                      >> 7U)) 
                                                  + 
                                                  (1U 
                                                   & ((IData)(vlSelf->PSDYTh) 
                                                      >> 4U)))
                                                  : 
                                                 (0xffU 
                                                  & vlSelf->PS2IeC[2U]))))) 
                             << 0x20U));
        vlSelf->PS0f8n = ((0xffff00ffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((0x32U 
                                                  == 
                                                  (vlSelf->PSAs7m[3U] 
                                                   >> 0x18U))
                                                  ? 
                                                 ((vlSelf->PS2IeC[2U] 
                                                   >> 0x17U) 
                                                  + 
                                                  (1U 
                                                   & ((IData)(vlSelf->PSDYTh) 
                                                      >> 5U)))
                                                  : 
                                                 (0xffU 
                                                  & (vlSelf->PS2IeC[2U] 
                                                     >> 0x10U)))))) 
                             << 0x28U));
        vlSelf->PS0f8n = ((0xff00ffffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((0x32U 
                                                  == 
                                                  (vlSelf->PSAs7m[3U] 
                                                   >> 0x18U))
                                                  ? 
                                                 ((0x1ffU 
                                                   & (vlSelf->PS2IeC[3U] 
                                                      >> 7U)) 
                                                  + 
                                                  (1U 
                                                   & ((IData)(vlSelf->PSDYTh) 
                                                      >> 6U)))
                                                  : 
                                                 (0xffU 
                                                  & vlSelf->PS2IeC[3U]))))) 
                             << 0x30U));
        vlSelf->PS0f8n = ((0xffffffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((0x32U 
                                                  == 
                                                  (vlSelf->PSAs7m[3U] 
                                                   >> 0x18U))
                                                  ? 
                                                 ((vlSelf->PS2IeC[3U] 
                                                   >> 0x17U) 
                                                  + 
                                                  (1U 
                                                   & ((IData)(vlSelf->PSDYTh) 
                                                      >> 7U)))
                                                  : 
                                                 (0xffU 
                                                  & (vlSelf->PS2IeC[3U] 
                                                     >> 0x10U)))))) 
                             << 0x38U));
    } else if ((((0x2bU == (vlSelf->PSAs7m[3U] >> 0x18U)) 
                 | (0x2cU == (vlSelf->PSAs7m[3U] >> 0x18U))) 
                | (0x2dU == (vlSelf->PSAs7m[3U] >> 0x18U)))) {
        vlSelf->PS0f8n = ((0xffffffffff000000ULL & vlSelf->PS0f8n) 
                          | (IData)((IData)(((0xff0000U 
                                              & (vlSelf->PS2IeC[1U] 
                                                 << 8U)) 
                                             | ((0xff00U 
                                                 & (vlSelf->PS2IeC[0U] 
                                                    >> 0x10U)) 
                                                | (0xffU 
                                                   & (vlSelf->PS2IeC[0U] 
                                                      >> 8U)))))));
        vlSelf->PS0f8n = ((0xffff000000ffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)(((0xff0000U 
                                               & (vlSelf->PS2IeC[2U] 
                                                  >> 8U)) 
                                              | ((0xff00U 
                                                  & vlSelf->PS2IeC[2U]) 
                                                 | (vlSelf->PS2IeC[1U] 
                                                    >> 0x18U))))) 
                             << 0x18U));
        vlSelf->PS0f8n = ((0xffffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)(((0xff00U 
                                               & (vlSelf->PS2IeC[3U] 
                                                  >> 0x10U)) 
                                              | (0xffU 
                                                 & (vlSelf->PS2IeC[3U] 
                                                    >> 8U))))) 
                             << 0x30U));
    } else if (((0x2eU == (vlSelf->PSAs7m[3U] >> 0x18U)) 
                | (0x30U == (vlSelf->PSAs7m[3U] >> 0x18U)))) {
        vlSelf->PS0f8n = ((0xffffffffffff0000ULL & vlSelf->PS0f8n) 
                          | (IData)((IData)(((0xff00U 
                                              & ((((vlSelf->PS2IeC[0U] 
                                                    << 0x10U) 
                                                   | (vlSelf->PS2IeC[0U] 
                                                      >> 0x10U)) 
                                                  + 
                                                  ((vlSelf->PSsBHL[4U] 
                                                    << 0x18U) 
                                                   | (vlSelf->PSsBHL[4U] 
                                                      >> 8U))) 
                                                 << 8U)) 
                                             | (0xffU 
                                                & (vlSelf->PS2IeC[0U] 
                                                   + 
                                                   vlSelf->PSsBHL[4U]))))));
        vlSelf->PS0f8n = ((0xffffffff0000ffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)(((0xff00U 
                                               & ((((vlSelf->PS2IeC[1U] 
                                                     << 0x10U) 
                                                    | (vlSelf->PS2IeC[1U] 
                                                       >> 0x10U)) 
                                                   + 
                                                   ((vlSelf->PSsBHL[4U] 
                                                     << 8U) 
                                                    | (vlSelf->PSsBHL[4U] 
                                                       >> 0x18U))) 
                                                  << 8U)) 
                                              | (0xffU 
                                                 & (vlSelf->PS2IeC[1U] 
                                                    + 
                                                    ((vlSelf->PSsBHL[4U] 
                                                      << 0x10U) 
                                                     | (vlSelf->PSsBHL[4U] 
                                                        >> 0x10U))))))) 
                             << 0x10U));
        vlSelf->PS0f8n = ((0xffff0000ffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)(((0xff00U 
                                               & ((((vlSelf->PS2IeC[2U] 
                                                     << 0x10U) 
                                                    | (vlSelf->PS2IeC[2U] 
                                                       >> 0x10U)) 
                                                   + 
                                                   ((vlSelf->PSsBHL[5U] 
                                                     << 0x18U) 
                                                    | (vlSelf->PSsBHL[5U] 
                                                       >> 8U))) 
                                                  << 8U)) 
                                              | (0xffU 
                                                 & (vlSelf->PS2IeC[2U] 
                                                    + 
                                                    vlSelf->PSsBHL[5U]))))) 
                             << 0x20U));
        vlSelf->PS0f8n = ((0xffffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)(((0xff00U 
                                               & ((((vlSelf->PS2IeC[3U] 
                                                     << 0x10U) 
                                                    | (vlSelf->PS2IeC[3U] 
                                                       >> 0x10U)) 
                                                   + 
                                                   ((vlSelf->PSsBHL[5U] 
                                                     << 8U) 
                                                    | (vlSelf->PSsBHL[5U] 
                                                       >> 0x18U))) 
                                                  << 8U)) 
                                              | (0xffU 
                                                 & (vlSelf->PS2IeC[3U] 
                                                    + 
                                                    ((vlSelf->PSsBHL[5U] 
                                                      << 0x10U) 
                                                     | (vlSelf->PSsBHL[5U] 
                                                        >> 0x10U))))))) 
                             << 0x30U));
    } else if (((0x2fU == (vlSelf->PSAs7m[3U] >> 0x18U)) 
                | (0x31U == (vlSelf->PSAs7m[3U] >> 0x18U)))) {
        vlSelf->PS0f8n = ((0xffffffffffffff00ULL & vlSelf->PS0f8n) 
                          | (IData)((IData)((0xffU 
                                             & ((- 
                                                 vlSelf->PS2IeC[0U]) 
                                                + vlSelf->PSsBHL[4U])))));
        vlSelf->PS0f8n = ((0xffffffffffff00ffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((- 
                                                  ((vlSelf->PS2IeC[0U] 
                                                    << 0x10U) 
                                                   | (vlSelf->PS2IeC[0U] 
                                                      >> 0x10U))) 
                                                 + 
                                                 ((vlSelf->PSsBHL[4U] 
                                                   << 0x18U) 
                                                  | (vlSelf->PSsBHL[4U] 
                                                     >> 8U)))))) 
                             << 8U));
        vlSelf->PS0f8n = ((0xffffffffff00ffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((- 
                                                  vlSelf->PS2IeC[1U]) 
                                                 + 
                                                 ((vlSelf->PSsBHL[4U] 
                                                   << 0x10U) 
                                                  | (vlSelf->PSsBHL[4U] 
                                                     >> 0x10U)))))) 
                             << 0x10U));
        vlSelf->PS0f8n = ((0xffffffff00ffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((- 
                                                  ((vlSelf->PS2IeC[1U] 
                                                    << 0x10U) 
                                                   | (vlSelf->PS2IeC[1U] 
                                                      >> 0x10U))) 
                                                 + 
                                                 ((vlSelf->PSsBHL[4U] 
                                                   << 8U) 
                                                  | (vlSelf->PSsBHL[4U] 
                                                     >> 0x18U)))))) 
                             << 0x18U));
        vlSelf->PS0f8n = ((0xffffff00ffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((- 
                                                  vlSelf->PS2IeC[2U]) 
                                                 + 
                                                 vlSelf->PSsBHL[5U])))) 
                             << 0x20U));
        vlSelf->PS0f8n = ((0xffff00ffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((- 
                                                  ((vlSelf->PS2IeC[2U] 
                                                    << 0x10U) 
                                                   | (vlSelf->PS2IeC[2U] 
                                                      >> 0x10U))) 
                                                 + 
                                                 ((vlSelf->PSsBHL[5U] 
                                                   << 0x18U) 
                                                  | (vlSelf->PSsBHL[5U] 
                                                     >> 8U)))))) 
                             << 0x28U));
        vlSelf->PS0f8n = ((0xff00ffffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((- 
                                                  vlSelf->PS2IeC[3U]) 
                                                 + 
                                                 ((vlSelf->PSsBHL[5U] 
                                                   << 0x10U) 
                                                  | (vlSelf->PSsBHL[5U] 
                                                     >> 0x10U)))))) 
                             << 0x30U));
        vlSelf->PS0f8n = ((0xffffffffffffffULL & vlSelf->PS0f8n) 
                          | ((QData)((IData)((0xffU 
                                              & ((- 
                                                  ((vlSelf->PS2IeC[3U] 
                                                    << 0x10U) 
                                                   | (vlSelf->PS2IeC[3U] 
                                                      >> 0x10U))) 
                                                 + 
                                                 ((vlSelf->PSsBHL[5U] 
                                                   << 8U) 
                                                  | (vlSelf->PSsBHL[5U] 
                                                     >> 0x18U)))))) 
                             << 0x38U));
    } else {
        vlSelf->PS0f8n = 0ULL;
    }
    vlSelf->PSMYBR = ((0x3ffU & (IData)(vlSelf->PSMYBR)) 
                      | (((IData)(vlSelf->PSxjXf) ? (IData)(vlSelf->PS4aL0)
                           : (IData)(vlSelf->PSmE7N)) 
                         << 0xaU));
    PSYWNl = (0x3fffffffffffffULL & (vlSelf->PSbZ5Y 
                                     + (((QData)((IData)(
                                                         ((3U 
                                                           == (IData)(vlSelf->PSsAnP)) 
                                                          & (IData)(vlSelf->PSNkAr)))) 
                                         << 0x2dU) 
                                        | (((QData)((IData)(
                                                            ((2U 
                                                              == (IData)(vlSelf->PSsAnP)) 
                                                             & (IData)(vlSelf->PSNkAr)))) 
                                            << 0x2aU) 
                                           | (QData)((IData)(
                                                             ((((0U 
                                                                 == (IData)(vlSelf->PSsAnP)) 
                                                                & (IData)(vlSelf->PSNkAr)) 
                                                               << 0x1dU) 
                                                              | ((1U 
                                                                  == (IData)(vlSelf->PSsAnP)) 
                                                                 & (IData)(vlSelf->PSNkAr)))))))));
    vlSelf->PSzMhC = ((0x3ffU & (IData)(vlSelf->PSzMhC)) 
                      | (((IData)(vlSelf->PSN8LR) ? (IData)(vlSelf->PSEcaj)
                           : (IData)(vlSelf->PSjfvq)) 
                         << 0xaU));
    PShmx5 = (0x3fffffffffffffULL & (vlSelf->PS6ZHb 
                                     + (((QData)((IData)(
                                                         ((3U 
                                                           == (IData)(vlSelf->PSCDcf)) 
                                                          & (IData)(vlSelf->PStQ6f)))) 
                                         << 0x2dU) 
                                        | (((QData)((IData)(
                                                            ((2U 
                                                              == (IData)(vlSelf->PSCDcf)) 
                                                             & (IData)(vlSelf->PStQ6f)))) 
                                            << 0x2aU) 
                                           | (QData)((IData)(
                                                             ((((0U 
                                                                 == (IData)(vlSelf->PSCDcf)) 
                                                                & (IData)(vlSelf->PStQ6f)) 
                                                               << 0x1dU) 
                                                              | ((1U 
                                                                  == (IData)(vlSelf->PSCDcf)) 
                                                                 & (IData)(vlSelf->PStQ6f)))))))));
    vlSelf->PSuuDe = ((0x1eU & (IData)(vlSelf->PSuuDe)) 
                      | (1U & (IData)(vlSelf->PSkwGO)));
    vlSelf->PSuuDe = ((0x1bU & (IData)(vlSelf->PSuuDe)) 
                      | (4U & ((IData)(vlSelf->PSg8vJ) 
                               << 2U)));
    vlSelf->PSYwn4 = (1U & (((IData)(vlSelf->PSvV9F) 
                             & (IData)(vlSelf->PSRGJX)) 
                            >> 1U));
    vlSelf->PSoqQV = ((0xeU & (IData)(vlSelf->PSoqQV)) 
                      | (1U & (IData)(vlSelf->PSRGJX)));
    vlSelf->PSacm3 = (1U & (((IData)(vlSelf->PSwtGY) 
                             & (IData)(vlSelf->PSK3tg)) 
                            >> 1U));
    vlSelf->PSACvp = (1U & (((IData)(vlSelf->PSI0tA) 
                             & (IData)(vlSelf->PSUMLQ)) 
                            >> 1U));
    vlSelf->PSkk1E = (1U & (((IData)(vlSelf->PSCj1b) 
                             & (IData)(vlSelf->PSOC4y)) 
                            >> 1U));
    vlSelf->PSoqQV = ((9U & (IData)(vlSelf->PSoqQV)) 
                      | ((4U & (((IData)(vlSelf->PSUMLQ) 
                                 << 2U) & (vlSelf->PSCOGu 
                                           >> 1U))) 
                         | (2U & (((IData)(vlSelf->PSK3tg) 
                                   << 1U) & (vlSelf->PSCOGu 
                                             >> 2U)))));
    vlSelf->PSoqQV = ((7U & (IData)(vlSelf->PSoqQV)) 
                      | (8U & (((IData)(vlSelf->PSOC4y) 
                                << 3U) & vlSelf->PSCOGu)));
    vlSelf->PSmP78 = (1U & (((IData)(vlSelf->PSwP3j) 
                             & (IData)(vlSelf->PSHCxm)) 
                            >> 1U));
    vlSelf->PS4HAj = ((0x1dU & (IData)(vlSelf->PS4HAj)) 
                      | (2U & ((IData)(vlSelf->PSHCxm) 
                               << 1U)));
    vlSelf->PSCpHg = ((4U & ((0xfffffffcU & ((IData)(vlSelf->PSCpHg) 
                                             << 1U)) 
                             | ((~ ((IData)(vlSelf->PSYtoz) 
                                    >> 1U)) << 2U))) 
                      | ((2U & (((IData)(vlSelf->PSCpHg) 
                                 | (~ (IData)(vlSelf->PSYtoz))) 
                                << 1U)) | (1U & ((IData)(vlSelf->PSBPov) 
                                                 >> 1U))));
    vlSelf->PSN0pb = (1U & (((IData)(vlSelf->PSCpHg) 
                             & (IData)(vlSelf->PSYtoz)) 
                            >> 2U));
    vlSelf->PSRMl6 = (1U & (((IData)(vlSelf->PSCpHg) 
                             & (IData)(vlSelf->PSYtoz)) 
                            >> 1U));
    vlSelf->PSW6QD = ((1U & (IData)(vlSelf->PSW6QD)) 
                      | (2U & ((IData)(vlSelf->PSYtoz) 
                               << 1U)));
    vlSelf->PSjpLL = ((4U & ((0xfffffffcU & ((IData)(vlSelf->PSjpLL) 
                                             << 1U)) 
                             | ((~ ((IData)(vlSelf->PSFwLF) 
                                    >> 1U)) << 2U))) 
                      | ((2U & (((IData)(vlSelf->PSjpLL) 
                                 | (~ (IData)(vlSelf->PSFwLF))) 
                                << 1U)) | (1U & ((IData)(vlSelf->PS4O1I) 
                                                 >> 1U))));
    vlSelf->PSkE5H = (1U & (((IData)(vlSelf->PSjpLL) 
                             & (IData)(vlSelf->PSFwLF)) 
                            >> 2U));
    vlSelf->PSOSOs = (1U & (((IData)(vlSelf->PSjpLL) 
                             & (IData)(vlSelf->PSFwLF)) 
                            >> 1U));
    vlSelf->PS987A = ((1U & (IData)(vlSelf->PS987A)) 
                      | (2U & ((IData)(vlSelf->PSFwLF) 
                               << 1U)));
    vlSelf->PSdazs = ((2U & (((IData)(vlSelf->PSdazs) 
                              | (~ (IData)(vlSelf->PS0EBB))) 
                             << 1U)) | (1U & ((IData)(vlSelf->PSXObu) 
                                              >> 1U)));
    vlSelf->PSjhtH = (1U & (((IData)(vlSelf->PSdazs) 
                             & (IData)(vlSelf->PS0EBB)) 
                            >> 1U));
    vlSelf->PSMeEs = ((1U & (IData)(vlSelf->PSMeEs)) 
                      | (2U & ((IData)(vlSelf->PS0EBB) 
                               << 1U)));
    vlSelf->PS7iFV = ((2U & (((IData)(vlSelf->PS7iFV) 
                              | (~ (IData)(vlSelf->PSlUDS))) 
                             << 1U)) | (1U & ((IData)(vlSelf->PSB2rT) 
                                              >> 1U)));
    vlSelf->PSOgJN = (1U & (((IData)(vlSelf->PS7iFV) 
                             & (IData)(vlSelf->PSlUDS)) 
                            >> 1U));
    vlSelf->PS93Yk = ((1U & (IData)(vlSelf->PS93Yk)) 
                      | (2U & ((IData)(vlSelf->PSlUDS) 
                               << 1U)));
    vlSelf->PS0taR = ((2U & (((IData)(vlSelf->PS0taR) 
                              | (~ (IData)(vlSelf->PSAZVo))) 
                             << 1U)) | (1U & ((IData)(vlSelf->PSOBEO) 
                                              >> 1U)));
    vlSelf->PSwwHA = (1U & (((IData)(vlSelf->PS0taR) 
                             & (IData)(vlSelf->PSAZVo)) 
                            >> 1U));
    vlSelf->PSpIRH = ((1U & (IData)(vlSelf->PSpIRH)) 
                      | (2U & ((IData)(vlSelf->PSAZVo) 
                               << 1U)));
    vlSelf->PSMKRu = ((2U & (((IData)(vlSelf->PSMKRu) 
                              | (~ (IData)(vlSelf->PSc7DY))) 
                             << 1U)) | (1U & ((IData)(vlSelf->PSB8kK) 
                                              >> 1U)));
    vlSelf->PSumZt = (1U & (((IData)(vlSelf->PSMKRu) 
                             & (IData)(vlSelf->PSc7DY)) 
                            >> 1U));
    vlSelf->PSw1eC = ((1U & (IData)(vlSelf->PSw1eC)) 
                      | (2U & ((IData)(vlSelf->PSc7DY) 
                               << 1U)));
    vlSelf->PS18e3 = ((0xeU & (IData)(vlSelf->PS18e3)) 
                      | (IData)(vlSelf->PS07ae));
    vlSelf->PSZSsL = (((IData)(vlSelf->PSJcnn) & (4U 
                                                  != 
                                                  (0xfU 
                                                   & (IData)(vlSelf->PSocV7)))) 
                      & (IData)(vlSelf->PS07ae));
    vlSelf->PSx6g6 = (((IData)(vlSelf->PSJcnn) & (4U 
                                                  == 
                                                  (0xfU 
                                                   & (IData)(vlSelf->PSocV7)))) 
                      & (IData)(vlSelf->PS07ae));
    vlSelf->PSsZxE = ((3U & (IData)(vlSelf->PSsZxE)) 
                      | ((IData)(vlSelf->PSoJ7F) << 2U));
    vlSelf->PS18e3 = ((0xdU & (IData)(vlSelf->PS18e3)) 
                      | ((IData)(vlSelf->PSjup7) << 1U));
    vlSelf->PSgnNm = (((IData)(vlSelf->PSaaDx) & (4U 
                                                  != 
                                                  (0xfU 
                                                   & (IData)(vlSelf->PSUtX5)))) 
                      & (IData)(vlSelf->PSjup7));
    vlSelf->PSpSxA = (((IData)(vlSelf->PSaaDx) & (4U 
                                                  == 
                                                  (0xfU 
                                                   & (IData)(vlSelf->PSUtX5)))) 
                      & (IData)(vlSelf->PSjup7));
    vlSelf->PSkD9M = ((3U & (IData)(vlSelf->PSkD9M)) 
                      | ((IData)(vlSelf->PSA7f8) << 2U));
    vlSelf->PS18e3 = ((0xbU & (IData)(vlSelf->PS18e3)) 
                      | ((IData)(vlSelf->PSs2CN) << 2U));
    vlSelf->PSMg08 = (((IData)(vlSelf->PSWGcr) & (4U 
                                                  != 
                                                  (0xfU 
                                                   & (IData)(vlSelf->PSCVMC)))) 
                      & (IData)(vlSelf->PSs2CN));
    vlSelf->PS61yl = (((IData)(vlSelf->PSWGcr) & (4U 
                                                  == 
                                                  (0xfU 
                                                   & (IData)(vlSelf->PSCVMC)))) 
                      & (IData)(vlSelf->PSs2CN));
    vlSelf->PSm6Ss = ((3U & (IData)(vlSelf->PSm6Ss)) 
                      | ((IData)(vlSelf->PSZakL) << 2U));
    vlSelf->PS18e3 = ((7U & (IData)(vlSelf->PS18e3)) 
                      | ((IData)(vlSelf->PSogKx) << 3U));
    vlSelf->PSwGUw = (((IData)(vlSelf->PSUKUo) & (4U 
                                                  != 
                                                  (0xfU 
                                                   & (IData)(vlSelf->PShPFa)))) 
                      & (IData)(vlSelf->PSogKx));
    vlSelf->PSYAsT = (((IData)(vlSelf->PSUKUo) & (4U 
                                                  == 
                                                  (0xfU 
                                                   & (IData)(vlSelf->PShPFa)))) 
                      & (IData)(vlSelf->PSogKx));
    vlSelf->PSMPvY = ((3U & (IData)(vlSelf->PSMPvY)) 
                      | ((IData)(vlSelf->PSm7eK) << 2U));
    vlSelf->PSF78x = ((0x3ffU & (IData)(vlSelf->PSF78x)) 
                      | (((IData)(vlSelf->PS6FDw) ? (IData)(vlSelf->PSLVTo)
                           : (IData)(vlSelf->PSh1gJ)) 
                         << 0xaU));
    PSgIS7 = (0x3fffffffffffffULL & (vlSelf->PSaMBQ 
                                     + (((QData)((IData)(
                                                         ((3U 
                                                           == (IData)(vlSelf->PSXtSw)) 
                                                          & (IData)(vlSelf->PSiGWd)))) 
                                         << 0x2dU) 
                                        | (((QData)((IData)(
                                                            ((2U 
                                                              == (IData)(vlSelf->PSXtSw)) 
                                                             & (IData)(vlSelf->PSiGWd)))) 
                                            << 0x2aU) 
                                           | (QData)((IData)(
                                                             ((((0U 
                                                                 == (IData)(vlSelf->PSXtSw)) 
                                                                & (IData)(vlSelf->PSiGWd)) 
                                                               << 0x1dU) 
                                                              | ((1U 
                                                                  == (IData)(vlSelf->PSXtSw)) 
                                                                 & (IData)(vlSelf->PSiGWd)))))))));
    vlSelf->PSJous = ((0x3ffU & (IData)(vlSelf->PSJous)) 
                      | (((IData)(vlSelf->PSHuhM) ? (IData)(vlSelf->PSzBYt)
                           : (IData)(vlSelf->PSvRA7)) 
                         << 0xaU));
    PS7bpI = (0x3fffffffffffffULL & (vlSelf->PSM84d 
                                     + (((QData)((IData)(
                                                         ((3U 
                                                           == (IData)(vlSelf->PSTTg0)) 
                                                          & (IData)(vlSelf->PShcGn)))) 
                                         << 0x2dU) 
                                        | (((QData)((IData)(
                                                            ((2U 
                                                              == (IData)(vlSelf->PSTTg0)) 
                                                             & (IData)(vlSelf->PShcGn)))) 
                                            << 0x2aU) 
                                           | (QData)((IData)(
                                                             ((((0U 
                                                                 == (IData)(vlSelf->PSTTg0)) 
                                                                & (IData)(vlSelf->PShcGn)) 
                                                               << 0x1dU) 
                                                              | ((1U 
                                                                  == (IData)(vlSelf->PSTTg0)) 
                                                                 & (IData)(vlSelf->PShcGn)))))))));
    vlSelf->PSAkSs = ((0xe7U & (IData)(vlSelf->PSAkSs)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PS87Kd)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PS87Kd)))) 
                                    << 3U)));
    vlSelf->PSAkSs = ((0x9fU & (IData)(vlSelf->PSAkSs)) 
                      | ((0x40U & (IData)(vlSelf->PS87Kd)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PS87Kd)))) 
                            << 5U)));
    vlSelf->PSYYNq = ((0xff81ffU & vlSelf->PSYYNq) 
                      | ((((4U & (IData)(vlSelf->PS87Kd))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PS87Kd))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSYYNq = ((0xfc7fffU & vlSelf->PSYYNq) 
                      | (((0x10U & (IData)(vlSelf->PS87Kd))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSzlty = ((0xff81ffU & vlSelf->PSzlty) 
                      | ((((4U & (IData)(vlSelf->PSvDdJ))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSvDdJ))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSzlty = ((0xfc7fffU & vlSelf->PSzlty) 
                      | (((0x10U & (IData)(vlSelf->PSvDdJ))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSkT9R = ((0xe7U & (IData)(vlSelf->PSkT9R)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSvDdJ)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSvDdJ)))) 
                                    << 3U)));
    vlSelf->PSkT9R = ((0x9fU & (IData)(vlSelf->PSkT9R)) 
                      | ((0x40U & (IData)(vlSelf->PSvDdJ)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSvDdJ)))) 
                            << 5U)));
    vlSelf->PSUzcW = ((0xe7U & (IData)(vlSelf->PSUzcW)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSA0Zh)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSA0Zh)))) 
                                    << 3U)));
    vlSelf->PSUzcW = ((0x9fU & (IData)(vlSelf->PSUzcW)) 
                      | ((0x40U & (IData)(vlSelf->PSA0Zh)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSA0Zh)))) 
                            << 5U)));
    vlSelf->PSDVYu = ((0xff81ffU & vlSelf->PSDVYu) 
                      | ((((4U & (IData)(vlSelf->PSA0Zh))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSA0Zh))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSDVYu = ((0xfc7fffU & vlSelf->PSDVYu) 
                      | (((0x10U & (IData)(vlSelf->PSA0Zh))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSJlOh = ((0xff81ffU & vlSelf->PSJlOh) 
                      | ((((4U & (IData)(vlSelf->PSauAz))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSauAz))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSJlOh = ((0xfc7fffU & vlSelf->PSJlOh) 
                      | (((0x10U & (IData)(vlSelf->PSauAz))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSBXjD = ((0xe7U & (IData)(vlSelf->PSBXjD)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSauAz)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSauAz)))) 
                                    << 3U)));
    vlSelf->PSBXjD = ((0x9fU & (IData)(vlSelf->PSBXjD)) 
                      | ((0x40U & (IData)(vlSelf->PSauAz)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSauAz)))) 
                            << 5U)));
    vlSelf->PSBdNp = ((0xe7U & (IData)(vlSelf->PSBdNp)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PS5lKd)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PS5lKd)))) 
                                    << 3U)));
    vlSelf->PSBdNp = ((0x9fU & (IData)(vlSelf->PSBdNp)) 
                      | ((0x40U & (IData)(vlSelf->PS5lKd)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PS5lKd)))) 
                            << 5U)));
    vlSelf->PSQuHJ = ((0xff81ffU & vlSelf->PSQuHJ) 
                      | ((((4U & (IData)(vlSelf->PS5lKd))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PS5lKd))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSQuHJ = ((0xfc7fffU & vlSelf->PSQuHJ) 
                      | (((0x10U & (IData)(vlSelf->PS5lKd))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSvBIH = ((0xff81ffU & vlSelf->PSvBIH) 
                      | ((((4U & (IData)(vlSelf->PSh6id))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSh6id))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSvBIH = ((0xfc7fffU & vlSelf->PSvBIH) 
                      | (((0x10U & (IData)(vlSelf->PSh6id))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSm9DJ = ((0xe7U & (IData)(vlSelf->PSm9DJ)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSh6id)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSh6id)))) 
                                    << 3U)));
    vlSelf->PSm9DJ = ((0x9fU & (IData)(vlSelf->PSm9DJ)) 
                      | ((0x40U & (IData)(vlSelf->PSh6id)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSh6id)))) 
                            << 5U)));
    vlSelf->PS3ZBA = ((0xe7U & (IData)(vlSelf->PS3ZBA)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PShOXG)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PShOXG)))) 
                                    << 3U)));
    vlSelf->PS3ZBA = ((0x9fU & (IData)(vlSelf->PS3ZBA)) 
                      | ((0x40U & (IData)(vlSelf->PShOXG)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PShOXG)))) 
                            << 5U)));
    vlSelf->PSeRsP = ((0xff81ffU & vlSelf->PSeRsP) 
                      | ((((4U & (IData)(vlSelf->PShOXG))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PShOXG))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSeRsP = ((0xfc7fffU & vlSelf->PSeRsP) 
                      | (((0x10U & (IData)(vlSelf->PShOXG))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSuApV = ((0xff81ffU & vlSelf->PSuApV) 
                      | ((((4U & (IData)(vlSelf->PSazAY))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSazAY))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSuApV = ((0xfc7fffU & vlSelf->PSuApV) 
                      | (((0x10U & (IData)(vlSelf->PSazAY))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSytzf = ((0xe7U & (IData)(vlSelf->PSytzf)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSazAY)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSazAY)))) 
                                    << 3U)));
    vlSelf->PSytzf = ((0x9fU & (IData)(vlSelf->PSytzf)) 
                      | ((0x40U & (IData)(vlSelf->PSazAY)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSazAY)))) 
                            << 5U)));
    vlSelf->PShbEE = ((0xe7U & (IData)(vlSelf->PShbEE)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSDzwt)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSDzwt)))) 
                                    << 3U)));
    vlSelf->PShbEE = ((0x9fU & (IData)(vlSelf->PShbEE)) 
                      | ((0x40U & (IData)(vlSelf->PSDzwt)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSDzwt)))) 
                            << 5U)));
    vlSelf->PS4dPS = ((0xff81ffU & vlSelf->PS4dPS) 
                      | ((((4U & (IData)(vlSelf->PSDzwt))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSDzwt))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PS4dPS = ((0xfc7fffU & vlSelf->PS4dPS) 
                      | (((0x10U & (IData)(vlSelf->PSDzwt))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSPH4c = ((0xff81ffU & vlSelf->PSPH4c) 
                      | ((((4U & (IData)(vlSelf->PSRkap))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSRkap))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSPH4c = ((0xfc7fffU & vlSelf->PSPH4c) 
                      | (((0x10U & (IData)(vlSelf->PSRkap))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSJhFi = ((0xe7U & (IData)(vlSelf->PSJhFi)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSRkap)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSRkap)))) 
                                    << 3U)));
    vlSelf->PSJhFi = ((0x9fU & (IData)(vlSelf->PSJhFi)) 
                      | ((0x40U & (IData)(vlSelf->PSRkap)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSRkap)))) 
                            << 5U)));
    vlSelf->PSsiIW = ((0xe7U & (IData)(vlSelf->PSsiIW)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PStz86)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PStz86)))) 
                                    << 3U)));
    vlSelf->PSsiIW = ((0x9fU & (IData)(vlSelf->PSsiIW)) 
                      | ((0x40U & (IData)(vlSelf->PStz86)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PStz86)))) 
                            << 5U)));
    vlSelf->PSieu9 = ((0xff81ffU & vlSelf->PSieu9) 
                      | ((((4U & (IData)(vlSelf->PStz86))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PStz86))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSieu9 = ((0xfc7fffU & vlSelf->PSieu9) 
                      | (((0x10U & (IData)(vlSelf->PStz86))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSQ12Q = ((0xff81ffU & vlSelf->PSQ12Q) 
                      | ((((4U & (IData)(vlSelf->PSsZhG))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSsZhG))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSQ12Q = ((0xfc7fffU & vlSelf->PSQ12Q) 
                      | (((0x10U & (IData)(vlSelf->PSsZhG))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PS9JXe = ((0xe7U & (IData)(vlSelf->PS9JXe)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSsZhG)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSsZhG)))) 
                                    << 3U)));
    vlSelf->PS9JXe = ((0x9fU & (IData)(vlSelf->PS9JXe)) 
                      | ((0x40U & (IData)(vlSelf->PSsZhG)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSsZhG)))) 
                            << 5U)));
    vlSelf->PSWfNg = ((0xe7U & (IData)(vlSelf->PSWfNg)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PS1NDk)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PS1NDk)))) 
                                    << 3U)));
    vlSelf->PSWfNg = ((0x9fU & (IData)(vlSelf->PSWfNg)) 
                      | ((0x40U & (IData)(vlSelf->PS1NDk)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PS1NDk)))) 
                            << 5U)));
    vlSelf->PSOGAg = ((0xff81ffU & vlSelf->PSOGAg) 
                      | ((((4U & (IData)(vlSelf->PS1NDk))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PS1NDk))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSOGAg = ((0xfc7fffU & vlSelf->PSOGAg) 
                      | (((0x10U & (IData)(vlSelf->PS1NDk))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSm5iQ = ((0xff81ffU & vlSelf->PSm5iQ) 
                      | ((((4U & (IData)(vlSelf->PSfPmy))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSfPmy))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSm5iQ = ((0xfc7fffU & vlSelf->PSm5iQ) 
                      | (((0x10U & (IData)(vlSelf->PSfPmy))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSkW8N = ((0xe7U & (IData)(vlSelf->PSkW8N)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSfPmy)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSfPmy)))) 
                                    << 3U)));
    vlSelf->PSkW8N = ((0x9fU & (IData)(vlSelf->PSkW8N)) 
                      | ((0x40U & (IData)(vlSelf->PSfPmy)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSfPmy)))) 
                            << 5U)));
    vlSelf->PSl0OU = ((0xe7U & (IData)(vlSelf->PSl0OU)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PShhNM)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PShhNM)))) 
                                    << 3U)));
    vlSelf->PSl0OU = ((0x9fU & (IData)(vlSelf->PSl0OU)) 
                      | ((0x40U & (IData)(vlSelf->PShhNM)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PShhNM)))) 
                            << 5U)));
    vlSelf->PS5oLo = ((0xff81ffU & vlSelf->PS5oLo) 
                      | ((((4U & (IData)(vlSelf->PShhNM))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PShhNM))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PS5oLo = ((0xfc7fffU & vlSelf->PS5oLo) 
                      | (((0x10U & (IData)(vlSelf->PShhNM))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSqtpI = ((0xff81ffU & vlSelf->PSqtpI) 
                      | ((((4U & (IData)(vlSelf->PSOV5V))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSOV5V))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSqtpI = ((0xfc7fffU & vlSelf->PSqtpI) 
                      | (((0x10U & (IData)(vlSelf->PSOV5V))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSC10B = ((0xe7U & (IData)(vlSelf->PSC10B)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSOV5V)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSOV5V)))) 
                                    << 3U)));
    vlSelf->PSC10B = ((0x9fU & (IData)(vlSelf->PSC10B)) 
                      | ((0x40U & (IData)(vlSelf->PSOV5V)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSOV5V)))) 
                            << 5U)));
    vlSelf->PSe7Ho = ((0xe7U & (IData)(vlSelf->PSe7Ho)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSqlZv)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSqlZv)))) 
                                    << 3U)));
    vlSelf->PSe7Ho = ((0x9fU & (IData)(vlSelf->PSe7Ho)) 
                      | ((0x40U & (IData)(vlSelf->PSqlZv)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSqlZv)))) 
                            << 5U)));
    vlSelf->PSIez8 = ((0xff81ffU & vlSelf->PSIez8) 
                      | ((((4U & (IData)(vlSelf->PSqlZv))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSqlZv))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSIez8 = ((0xfc7fffU & vlSelf->PSIez8) 
                      | (((0x10U & (IData)(vlSelf->PSqlZv))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PShN1H = ((0xff81ffU & vlSelf->PShN1H) 
                      | ((((4U & (IData)(vlSelf->PSAgI6))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSAgI6))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PShN1H = ((0xfc7fffU & vlSelf->PShN1H) 
                      | (((0x10U & (IData)(vlSelf->PSAgI6))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSCws4 = ((0xe7U & (IData)(vlSelf->PSCws4)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSAgI6)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSAgI6)))) 
                                    << 3U)));
    vlSelf->PSCws4 = ((0x9fU & (IData)(vlSelf->PSCws4)) 
                      | ((0x40U & (IData)(vlSelf->PSAgI6)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSAgI6)))) 
                            << 5U)));
    vlSelf->PS0BkJ = ((0xfeU & (IData)(vlSelf->PS0BkJ)) 
                      | (IData)((0U != (3U & (IData)(vlSelf->PSpJ9M)))));
    vlSelf->PSbbnw = ((0xe7U & (IData)(vlSelf->PSbbnw)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PScnna)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PScnna)))) 
                                    << 3U)));
    vlSelf->PSbbnw = ((0x9fU & (IData)(vlSelf->PSbbnw)) 
                      | ((0x40U & (IData)(vlSelf->PScnna)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PScnna)))) 
                            << 5U)));
    vlSelf->PS64UE = ((0xff81ffU & vlSelf->PS64UE) 
                      | ((((4U & (IData)(vlSelf->PScnna))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PScnna))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PS64UE = ((0xfc7fffU & vlSelf->PS64UE) 
                      | (((0x10U & (IData)(vlSelf->PScnna))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSKlRa = ((0xff81ffU & vlSelf->PSKlRa) 
                      | ((((4U & (IData)(vlSelf->PSvvuQ))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSvvuQ))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSKlRa = ((0xfc7fffU & vlSelf->PSKlRa) 
                      | (((0x10U & (IData)(vlSelf->PSvvuQ))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSj0On = ((0xe7U & (IData)(vlSelf->PSj0On)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSvvuQ)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSvvuQ)))) 
                                    << 3U)));
    vlSelf->PSj0On = ((0x9fU & (IData)(vlSelf->PSj0On)) 
                      | ((0x40U & (IData)(vlSelf->PSvvuQ)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSvvuQ)))) 
                            << 5U)));
    vlSelf->PS0BkJ = ((0xfdU & (IData)(vlSelf->PS0BkJ)) 
                      | ((IData)((0U != (3U & (IData)(vlSelf->PSQbuR)))) 
                         << 1U));
    vlSelf->PS4dKx = ((0xe7U & (IData)(vlSelf->PS4dKx)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSasUn)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSasUn)))) 
                                    << 3U)));
    vlSelf->PS4dKx = ((0x9fU & (IData)(vlSelf->PS4dKx)) 
                      | ((0x40U & (IData)(vlSelf->PSasUn)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSasUn)))) 
                            << 5U)));
    vlSelf->PSf2C1 = ((0xff81ffU & vlSelf->PSf2C1) 
                      | ((((4U & (IData)(vlSelf->PSasUn))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSasUn))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSf2C1 = ((0xfc7fffU & vlSelf->PSf2C1) 
                      | (((0x10U & (IData)(vlSelf->PSasUn))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSwBDZ = ((0xff81ffU & vlSelf->PSwBDZ) 
                      | ((((4U & (IData)(vlSelf->PSb32c))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSb32c))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSwBDZ = ((0xfc7fffU & vlSelf->PSwBDZ) 
                      | (((0x10U & (IData)(vlSelf->PSb32c))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PS1OlZ = ((0xe7U & (IData)(vlSelf->PS1OlZ)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSb32c)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSb32c)))) 
                                    << 3U)));
    vlSelf->PS1OlZ = ((0x9fU & (IData)(vlSelf->PS1OlZ)) 
                      | ((0x40U & (IData)(vlSelf->PSb32c)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSb32c)))) 
                            << 5U)));
    vlSelf->PS0BkJ = ((0xfbU & (IData)(vlSelf->PS0BkJ)) 
                      | ((IData)((0U != (3U & (IData)(vlSelf->PSKANg)))) 
                         << 2U));
    vlSelf->PSdHJk = ((0xe7U & (IData)(vlSelf->PSdHJk)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSt13l)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSt13l)))) 
                                    << 3U)));
    vlSelf->PSdHJk = ((0x9fU & (IData)(vlSelf->PSdHJk)) 
                      | ((0x40U & (IData)(vlSelf->PSt13l)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSt13l)))) 
                            << 5U)));
    vlSelf->PSXDzr = ((0xff81ffU & vlSelf->PSXDzr) 
                      | ((((4U & (IData)(vlSelf->PSt13l))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSt13l))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSXDzr = ((0xfc7fffU & vlSelf->PSXDzr) 
                      | (((0x10U & (IData)(vlSelf->PSt13l))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSDEhp = ((0xff81ffU & vlSelf->PSDEhp) 
                      | ((((4U & (IData)(vlSelf->PSMMN3))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSMMN3))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSDEhp = ((0xfc7fffU & vlSelf->PSDEhp) 
                      | (((0x10U & (IData)(vlSelf->PSMMN3))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PS9z8O = ((0xe7U & (IData)(vlSelf->PS9z8O)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSMMN3)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSMMN3)))) 
                                    << 3U)));
    vlSelf->PS9z8O = ((0x9fU & (IData)(vlSelf->PS9z8O)) 
                      | ((0x40U & (IData)(vlSelf->PSMMN3)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSMMN3)))) 
                            << 5U)));
    vlSelf->PS0BkJ = ((0xf7U & (IData)(vlSelf->PS0BkJ)) 
                      | ((IData)((0U != (3U & (IData)(vlSelf->PSSYm3)))) 
                         << 3U));
    vlSelf->PSrQVQ = ((0xe7U & (IData)(vlSelf->PSrQVQ)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSTmgs)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSTmgs)))) 
                                    << 3U)));
    vlSelf->PSrQVQ = ((0x9fU & (IData)(vlSelf->PSrQVQ)) 
                      | ((0x40U & (IData)(vlSelf->PSTmgs)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSTmgs)))) 
                            << 5U)));
    vlSelf->PStxie = ((0xff81ffU & vlSelf->PStxie) 
                      | ((((4U & (IData)(vlSelf->PSTmgs))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSTmgs))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PStxie = ((0xfc7fffU & vlSelf->PStxie) 
                      | (((0x10U & (IData)(vlSelf->PSTmgs))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSLCgE = ((0xff81ffU & vlSelf->PSLCgE) 
                      | ((((4U & (IData)(vlSelf->PSErkx))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSErkx))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSLCgE = ((0xfc7fffU & vlSelf->PSLCgE) 
                      | (((0x10U & (IData)(vlSelf->PSErkx))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSIMdQ = ((0xe7U & (IData)(vlSelf->PSIMdQ)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSErkx)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSErkx)))) 
                                    << 3U)));
    vlSelf->PSIMdQ = ((0x9fU & (IData)(vlSelf->PSIMdQ)) 
                      | ((0x40U & (IData)(vlSelf->PSErkx)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSErkx)))) 
                            << 5U)));
    vlSelf->PS0BkJ = ((0xefU & (IData)(vlSelf->PS0BkJ)) 
                      | ((IData)((0U != (3U & (IData)(vlSelf->PSD0ZB)))) 
                         << 4U));
    vlSelf->PSLvAB = ((0xe7U & (IData)(vlSelf->PSLvAB)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PS6h0T)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PS6h0T)))) 
                                    << 3U)));
    vlSelf->PSLvAB = ((0x9fU & (IData)(vlSelf->PSLvAB)) 
                      | ((0x40U & (IData)(vlSelf->PS6h0T)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PS6h0T)))) 
                            << 5U)));
    vlSelf->PSTrvu = ((0xff81ffU & vlSelf->PSTrvu) 
                      | ((((4U & (IData)(vlSelf->PS6h0T))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PS6h0T))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSTrvu = ((0xfc7fffU & vlSelf->PSTrvu) 
                      | (((0x10U & (IData)(vlSelf->PS6h0T))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSXOZY = ((0xff81ffU & vlSelf->PSXOZY) 
                      | ((((4U & (IData)(vlSelf->PSkiAp))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSkiAp))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSXOZY = ((0xfc7fffU & vlSelf->PSXOZY) 
                      | (((0x10U & (IData)(vlSelf->PSkiAp))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSVKpA = ((0xe7U & (IData)(vlSelf->PSVKpA)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSkiAp)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSkiAp)))) 
                                    << 3U)));
    vlSelf->PSVKpA = ((0x9fU & (IData)(vlSelf->PSVKpA)) 
                      | ((0x40U & (IData)(vlSelf->PSkiAp)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSkiAp)))) 
                            << 5U)));
    vlSelf->PS0BkJ = ((0xdfU & (IData)(vlSelf->PS0BkJ)) 
                      | ((IData)((0U != (3U & (IData)(vlSelf->PStQkR)))) 
                         << 5U));
    vlSelf->PS5Hxs = ((0xe7U & (IData)(vlSelf->PS5Hxs)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSXmkg)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSXmkg)))) 
                                    << 3U)));
    vlSelf->PS5Hxs = ((0x9fU & (IData)(vlSelf->PS5Hxs)) 
                      | ((0x40U & (IData)(vlSelf->PSXmkg)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSXmkg)))) 
                            << 5U)));
    vlSelf->PSSbOh = ((0xff81ffU & vlSelf->PSSbOh) 
                      | ((((4U & (IData)(vlSelf->PSXmkg))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSXmkg))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSSbOh = ((0xfc7fffU & vlSelf->PSSbOh) 
                      | (((0x10U & (IData)(vlSelf->PSXmkg))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSQqJh = ((0xff81ffU & vlSelf->PSQqJh) 
                      | ((((4U & (IData)(vlSelf->PSvJJ1))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSvJJ1))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSQqJh = ((0xfc7fffU & vlSelf->PSQqJh) 
                      | (((0x10U & (IData)(vlSelf->PSvJJ1))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSRC6C = ((0xe7U & (IData)(vlSelf->PSRC6C)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSvJJ1)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSvJJ1)))) 
                                    << 3U)));
    vlSelf->PSRC6C = ((0x9fU & (IData)(vlSelf->PSRC6C)) 
                      | ((0x40U & (IData)(vlSelf->PSvJJ1)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSvJJ1)))) 
                            << 5U)));
    vlSelf->PS0BkJ = ((0xbfU & (IData)(vlSelf->PS0BkJ)) 
                      | ((IData)((0U != (3U & (IData)(vlSelf->PStleI)))) 
                         << 6U));
    vlSelf->PS57q6 = ((0xe7U & (IData)(vlSelf->PS57q6)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSSZnx)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSSZnx)))) 
                                    << 3U)));
    vlSelf->PS57q6 = ((0x9fU & (IData)(vlSelf->PS57q6)) 
                      | ((0x40U & (IData)(vlSelf->PSSZnx)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSSZnx)))) 
                            << 5U)));
    vlSelf->PS5MBR = ((0xff81ffU & vlSelf->PS5MBR) 
                      | ((((4U & (IData)(vlSelf->PSSZnx))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSSZnx))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PS5MBR = ((0xfc7fffU & vlSelf->PS5MBR) 
                      | (((0x10U & (IData)(vlSelf->PSSZnx))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSgHBa = ((0xff81ffU & vlSelf->PSgHBa) 
                      | ((((4U & (IData)(vlSelf->PSn60d))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSn60d))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSgHBa = ((0xfc7fffU & vlSelf->PSgHBa) 
                      | (((0x10U & (IData)(vlSelf->PSn60d))
                           ? 4U : 5U) << 0xfU));
    vlSelf->PSot2R = ((0xe7U & (IData)(vlSelf->PSot2R)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSn60d)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSn60d)))) 
                                    << 3U)));
    vlSelf->PSot2R = ((0x9fU & (IData)(vlSelf->PSot2R)) 
                      | ((0x40U & (IData)(vlSelf->PSn60d)) 
                         | ((IData)((0U != (0x30U & (IData)(vlSelf->PSn60d)))) 
                            << 5U)));
    vlSelf->PS0BkJ = ((0x7fU & (IData)(vlSelf->PS0BkJ)) 
                      | ((IData)((0U != (3U & (IData)(vlSelf->PSo0rd)))) 
                         << 7U));
    vlSelf->PSucuQ[0U] = (1U & (IData)((1ULL & (((vlSelf->PS1AkQ
                                                  [0U] 
                                                  + 
                                                  vlSelf->PS9gPJ
                                                  [0U]) 
                                                 + (QData)((IData)(vlSelf->PS9CGd))) 
                                                >> 0x3aU))));
    vlSelf->PSjnXA[0U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PS1AkQ
                                                   [0U] 
                                                   + 
                                                   vlSelf->PS9gPJ
                                                   [0U]) 
                                                  + (QData)((IData)(vlSelf->PS9CGd))));
    vlSelf->PSucuQ[1U] = (1U & (IData)((1ULL & (((vlSelf->PS1AkQ
                                                  [1U] 
                                                  + 
                                                  vlSelf->PS9gPJ
                                                  [1U]) 
                                                 + (QData)((IData)(vlSelf->PSWJE9))) 
                                                >> 0x3aU))));
    vlSelf->PSjnXA[1U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PS1AkQ
                                                   [1U] 
                                                   + 
                                                   vlSelf->PS9gPJ
                                                   [1U]) 
                                                  + (QData)((IData)(vlSelf->PSWJE9))));
    vlSelf->PSucuQ[2U] = (1U & (IData)((1ULL & (((vlSelf->PS1AkQ
                                                  [2U] 
                                                  + 
                                                  vlSelf->PS9gPJ
                                                  [2U]) 
                                                 + (QData)((IData)(vlSelf->PSvPSG))) 
                                                >> 0x3aU))));
    vlSelf->PSjnXA[2U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PS1AkQ
                                                   [2U] 
                                                   + 
                                                   vlSelf->PS9gPJ
                                                   [2U]) 
                                                  + (QData)((IData)(vlSelf->PSvPSG))));
    vlSelf->PSSQMX[0U] = (1U & (IData)((1ULL & (((vlSelf->PS0jEG
                                                  [0U] 
                                                  + 
                                                  vlSelf->PS7KCt
                                                  [0U]) 
                                                 + (QData)((IData)(vlSelf->PSdScf))) 
                                                >> 0x3aU))));
    vlSelf->PS44lg[0U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PS0jEG
                                                   [0U] 
                                                   + 
                                                   vlSelf->PS7KCt
                                                   [0U]) 
                                                  + (QData)((IData)(vlSelf->PSdScf))));
    vlSelf->PSSQMX[1U] = (1U & (IData)((1ULL & (((vlSelf->PS0jEG
                                                  [1U] 
                                                  + 
                                                  vlSelf->PS7KCt
                                                  [1U]) 
                                                 + (QData)((IData)(vlSelf->PSG6ce))) 
                                                >> 0x3aU))));
    vlSelf->PS44lg[1U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PS0jEG
                                                   [1U] 
                                                   + 
                                                   vlSelf->PS7KCt
                                                   [1U]) 
                                                  + (QData)((IData)(vlSelf->PSG6ce))));
    vlSelf->PSSQMX[2U] = (1U & (IData)((1ULL & (((vlSelf->PS0jEG
                                                  [2U] 
                                                  + 
                                                  vlSelf->PS7KCt
                                                  [2U]) 
                                                 + (QData)((IData)(vlSelf->PSHwJQ))) 
                                                >> 0x3aU))));
    vlSelf->PS44lg[2U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PS0jEG
                                                   [2U] 
                                                   + 
                                                   vlSelf->PS7KCt
                                                   [2U]) 
                                                  + (QData)((IData)(vlSelf->PSHwJQ))));
    vlSelf->PSLIT6[0U] = (1U & (IData)((1ULL & (((vlSelf->PSf39d
                                                  [0U] 
                                                  + 
                                                  vlSelf->PSyt4T
                                                  [0U]) 
                                                 + (QData)((IData)(vlSelf->PSZgFZ))) 
                                                >> 0x3aU))));
    vlSelf->PSUxcL[0U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PSf39d
                                                   [0U] 
                                                   + 
                                                   vlSelf->PSyt4T
                                                   [0U]) 
                                                  + (QData)((IData)(vlSelf->PSZgFZ))));
    vlSelf->PSLIT6[1U] = (1U & (IData)((1ULL & (((vlSelf->PSf39d
                                                  [1U] 
                                                  + 
                                                  vlSelf->PSyt4T
                                                  [1U]) 
                                                 + (QData)((IData)(vlSelf->PSMY2N))) 
                                                >> 0x3aU))));
    vlSelf->PSUxcL[1U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PSf39d
                                                   [1U] 
                                                   + 
                                                   vlSelf->PSyt4T
                                                   [1U]) 
                                                  + (QData)((IData)(vlSelf->PSMY2N))));
    vlSelf->PSLIT6[2U] = (1U & (IData)((1ULL & (((vlSelf->PSf39d
                                                  [2U] 
                                                  + 
                                                  vlSelf->PSyt4T
                                                  [2U]) 
                                                 + (QData)((IData)(vlSelf->PSv5yl))) 
                                                >> 0x3aU))));
    vlSelf->PSUxcL[2U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PSf39d
                                                   [2U] 
                                                   + 
                                                   vlSelf->PSyt4T
                                                   [2U]) 
                                                  + (QData)((IData)(vlSelf->PSv5yl))));
    vlSelf->PSLSB5[0U] = (1U & (IData)((1ULL & (((vlSelf->PSOfNn
                                                  [0U] 
                                                  + 
                                                  vlSelf->PSS77V
                                                  [0U]) 
                                                 + (QData)((IData)(vlSelf->PSGENu))) 
                                                >> 0x3aU))));
    vlSelf->PSMLd5[0U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PSOfNn
                                                   [0U] 
                                                   + 
                                                   vlSelf->PSS77V
                                                   [0U]) 
                                                  + (QData)((IData)(vlSelf->PSGENu))));
    vlSelf->PSLSB5[1U] = (1U & (IData)((1ULL & (((vlSelf->PSOfNn
                                                  [1U] 
                                                  + 
                                                  vlSelf->PSS77V
                                                  [1U]) 
                                                 + (QData)((IData)(vlSelf->PS3Dni))) 
                                                >> 0x3aU))));
    vlSelf->PSMLd5[1U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PSOfNn
                                                   [1U] 
                                                   + 
                                                   vlSelf->PSS77V
                                                   [1U]) 
                                                  + (QData)((IData)(vlSelf->PS3Dni))));
    vlSelf->PSLSB5[2U] = (1U & (IData)((1ULL & (((vlSelf->PSOfNn
                                                  [2U] 
                                                  + 
                                                  vlSelf->PSS77V
                                                  [2U]) 
                                                 + (QData)((IData)(vlSelf->PSIU1z))) 
                                                >> 0x3aU))));
    vlSelf->PSMLd5[2U] = (0x3ffffffffffffffULL & ((
                                                   vlSelf->PSOfNn
                                                   [2U] 
                                                   + 
                                                   vlSelf->PSS77V
                                                   [2U]) 
                                                  + (QData)((IData)(vlSelf->PSIU1z))));
    vlSelf->PSUuZn = ((0xfeU & (IData)(vlSelf->PSUuZn)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSUuZn)))));
    vlSelf->PSUuZn = ((0xfdU & (IData)(vlSelf->PSUuZn)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSUuZn)))) 
                         << 1U));
    vlSelf->PSUuZn = ((0xfbU & (IData)(vlSelf->PSUuZn)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSUuZn)))) 
                         << 2U));
    vlSelf->PS7EAd = ((0xfffff8U & vlSelf->PS7EAd) 
                      | (7U & ((2U & (IData)(vlSelf->PSUuZn))
                                ? (vlSelf->PS7EAd >> 3U)
                                : (vlSelf->PS7EAd >> 6U))));
    vlSelf->PS7EAd = ((0xffffc7U & vlSelf->PS7EAd) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSUuZn))
                                    ? (vlSelf->PS7EAd 
                                       >> 9U) : (vlSelf->PS7EAd 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PS7EAd = ((0xfffe3fU & vlSelf->PS7EAd) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSUuZn))
                                     ? (vlSelf->PS7EAd 
                                        >> 0xfU) : 
                                    (vlSelf->PS7EAd 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSxVsS = ((0xfeU & (IData)(vlSelf->PSxVsS)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSxVsS)))));
    vlSelf->PSxVsS = ((0xfdU & (IData)(vlSelf->PSxVsS)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSxVsS)))) 
                         << 1U));
    vlSelf->PSxVsS = ((0xfbU & (IData)(vlSelf->PSxVsS)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSxVsS)))) 
                         << 2U));
    vlSelf->PS70rI = ((0xfffff8U & vlSelf->PS70rI) 
                      | (7U & ((2U & (IData)(vlSelf->PSxVsS))
                                ? (vlSelf->PS70rI >> 3U)
                                : (vlSelf->PS70rI >> 6U))));
    vlSelf->PS70rI = ((0xffffc7U & vlSelf->PS70rI) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSxVsS))
                                    ? (vlSelf->PS70rI 
                                       >> 9U) : (vlSelf->PS70rI 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PS70rI = ((0xfffe3fU & vlSelf->PS70rI) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSxVsS))
                                     ? (vlSelf->PS70rI 
                                        >> 0xfU) : 
                                    (vlSelf->PS70rI 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSimVG = (7U & ((1U & (IData)(vlSelf->PSwAnP))
                             ? ((1U & (IData)(vlSelf->PSxVsS))
                                 ? vlSelf->PS70rI : vlSelf->PS7EAd)
                             : (IData)(vlSelf->PSbhu6)));
    vlSelf->PSVsxr = ((0x1ffff8U & vlSelf->PSVsxr) 
                      | ((IData)(vlSelf->PSybIC) ? 
                         (4U | (3U & (vlSelf->PSVsxr 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSVsxr 
                                                     >> 3U))));
    vlSelf->PSVsxr = ((0x1fffc7U & vlSelf->PSVsxr) 
                      | (((IData)(vlSelf->PSn9L4) ? 
                          (2U | (1U & (vlSelf->PSVsxr 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSVsxr >> 9U))) 
                         << 3U));
    vlSelf->PSVsxr = ((0x1ffe3fU & vlSelf->PSVsxr) 
                      | (((IData)(vlSelf->PS8KCs) ? 
                          (2U | (1U & (vlSelf->PSVsxr 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSVsxr >> 0xfU))) 
                         << 6U));
    PSvgus = ((IData)(vlSelf->PSybIC) ? (((QData)((IData)(
                                                          vlSelf->PS1HSz[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS1HSz[4U])))
               : (((QData)((IData)(vlSelf->PS1HSz[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS1HSz[2U]))));
    vlSelf->PS1HSz[0U] = (IData)(((IData)(vlSelf->PSybIC)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS1HSz[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS1HSz[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS1HSz[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS1HSz[2U])))));
    vlSelf->PS1HSz[1U] = (IData)((PSvgus >> 0x20U));
    PSmqB4 = ((IData)(vlSelf->PSn9L4) ? (((QData)((IData)(
                                                          vlSelf->PS1HSz[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS1HSz[8U])))
               : (((QData)((IData)(vlSelf->PS1HSz[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS1HSz[6U]))));
    vlSelf->PS1HSz[2U] = (IData)(((IData)(vlSelf->PSn9L4)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS1HSz[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS1HSz[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS1HSz[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS1HSz[6U])))));
    vlSelf->PS1HSz[3U] = (IData)((PSmqB4 >> 0x20U));
    PSBKAx = ((IData)(vlSelf->PS8KCs) ? (((QData)((IData)(
                                                          vlSelf->PS1HSz[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS1HSz[0xcU])))
               : (((QData)((IData)(vlSelf->PS1HSz[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS1HSz[0xaU]))));
    vlSelf->PS1HSz[4U] = (IData)(((IData)(vlSelf->PS8KCs)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS1HSz[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS1HSz[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS1HSz[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS1HSz[0xaU])))));
    vlSelf->PS1HSz[5U] = (IData)((PSBKAx >> 0x20U));
    vlSelf->PS4KIE[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PS1HSz[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS1HSz[0U])))) 
                           << 3U) | (7U & vlSelf->PSVsxr));
    vlSelf->PS4KIE[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PS1HSz[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS1HSz[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PS1HSz[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PS1HSz[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PS4KIE[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PS1HSz[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS1HSz[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PSWisY = ((0xfeU & (IData)(vlSelf->PSWisY)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSWisY)))));
    vlSelf->PSWisY = ((0xfdU & (IData)(vlSelf->PSWisY)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSWisY)))) 
                         << 1U));
    vlSelf->PSWisY = ((0xfbU & (IData)(vlSelf->PSWisY)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSWisY)))) 
                         << 2U));
    vlSelf->PSIQXM = ((0xfffff8U & vlSelf->PSIQXM) 
                      | (7U & ((2U & (IData)(vlSelf->PSWisY))
                                ? (vlSelf->PSIQXM >> 3U)
                                : (vlSelf->PSIQXM >> 6U))));
    vlSelf->PSIQXM = ((0xffffc7U & vlSelf->PSIQXM) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSWisY))
                                    ? (vlSelf->PSIQXM 
                                       >> 9U) : (vlSelf->PSIQXM 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSIQXM = ((0xfffe3fU & vlSelf->PSIQXM) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSWisY))
                                     ? (vlSelf->PSIQXM 
                                        >> 0xfU) : 
                                    (vlSelf->PSIQXM 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSRtB2 = ((0xfeU & (IData)(vlSelf->PSRtB2)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSRtB2)))));
    vlSelf->PSRtB2 = ((0xfdU & (IData)(vlSelf->PSRtB2)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSRtB2)))) 
                         << 1U));
    vlSelf->PSRtB2 = ((0xfbU & (IData)(vlSelf->PSRtB2)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSRtB2)))) 
                         << 2U));
    vlSelf->PSXguy = ((0xfffff8U & vlSelf->PSXguy) 
                      | (7U & ((2U & (IData)(vlSelf->PSRtB2))
                                ? (vlSelf->PSXguy >> 3U)
                                : (vlSelf->PSXguy >> 6U))));
    vlSelf->PSXguy = ((0xffffc7U & vlSelf->PSXguy) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSRtB2))
                                    ? (vlSelf->PSXguy 
                                       >> 9U) : (vlSelf->PSXguy 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSXguy = ((0xfffe3fU & vlSelf->PSXguy) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSRtB2))
                                     ? (vlSelf->PSXguy 
                                        >> 0xfU) : 
                                    (vlSelf->PSXguy 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS988W = (7U & ((1U & (IData)(vlSelf->PSoroY))
                             ? ((1U & (IData)(vlSelf->PSRtB2))
                                 ? vlSelf->PSXguy : vlSelf->PSIQXM)
                             : (IData)(vlSelf->PScJ6E)));
    vlSelf->PSeQ37 = ((0x1ffff8U & vlSelf->PSeQ37) 
                      | ((IData)(vlSelf->PSS0xL) ? 
                         (4U | (3U & (vlSelf->PSeQ37 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSeQ37 
                                                     >> 3U))));
    vlSelf->PSeQ37 = ((0x1fffc7U & vlSelf->PSeQ37) 
                      | (((IData)(vlSelf->PSqVTn) ? 
                          (2U | (1U & (vlSelf->PSeQ37 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSeQ37 >> 9U))) 
                         << 3U));
    vlSelf->PSeQ37 = ((0x1ffe3fU & vlSelf->PSeQ37) 
                      | (((IData)(vlSelf->PSPTVI) ? 
                          (2U | (1U & (vlSelf->PSeQ37 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSeQ37 >> 0xfU))) 
                         << 6U));
    PSqQRn = ((IData)(vlSelf->PSS0xL) ? (((QData)((IData)(
                                                          vlSelf->PS8Xa5[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS8Xa5[4U])))
               : (((QData)((IData)(vlSelf->PS8Xa5[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS8Xa5[2U]))));
    vlSelf->PS8Xa5[0U] = (IData)(((IData)(vlSelf->PSS0xL)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS8Xa5[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS8Xa5[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS8Xa5[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS8Xa5[2U])))));
    vlSelf->PS8Xa5[1U] = (IData)((PSqQRn >> 0x20U));
    PSZ0Aj = ((IData)(vlSelf->PSqVTn) ? (((QData)((IData)(
                                                          vlSelf->PS8Xa5[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS8Xa5[8U])))
               : (((QData)((IData)(vlSelf->PS8Xa5[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS8Xa5[6U]))));
    vlSelf->PS8Xa5[2U] = (IData)(((IData)(vlSelf->PSqVTn)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS8Xa5[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS8Xa5[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS8Xa5[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS8Xa5[6U])))));
    vlSelf->PS8Xa5[3U] = (IData)((PSZ0Aj >> 0x20U));
    PSTe5O = ((IData)(vlSelf->PSPTVI) ? (((QData)((IData)(
                                                          vlSelf->PS8Xa5[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS8Xa5[0xcU])))
               : (((QData)((IData)(vlSelf->PS8Xa5[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS8Xa5[0xaU]))));
    vlSelf->PS8Xa5[4U] = (IData)(((IData)(vlSelf->PSPTVI)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS8Xa5[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS8Xa5[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS8Xa5[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS8Xa5[0xaU])))));
    vlSelf->PS8Xa5[5U] = (IData)((PSTe5O >> 0x20U));
    vlSelf->PSqzoh[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PS8Xa5[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS8Xa5[0U])))) 
                           << 3U) | (7U & vlSelf->PSeQ37));
    vlSelf->PSqzoh[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PS8Xa5[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS8Xa5[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PS8Xa5[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PS8Xa5[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PSqzoh[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PS8Xa5[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS8Xa5[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PSb3Ci = ((0xfeU & (IData)(vlSelf->PSb3Ci)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSb3Ci)))));
    vlSelf->PSb3Ci = ((0xfdU & (IData)(vlSelf->PSb3Ci)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSb3Ci)))) 
                         << 1U));
    vlSelf->PSb3Ci = ((0xfbU & (IData)(vlSelf->PSb3Ci)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSb3Ci)))) 
                         << 2U));
    vlSelf->PSdMkH = ((0xfffff8U & vlSelf->PSdMkH) 
                      | (7U & ((2U & (IData)(vlSelf->PSb3Ci))
                                ? (vlSelf->PSdMkH >> 3U)
                                : (vlSelf->PSdMkH >> 6U))));
    vlSelf->PSdMkH = ((0xffffc7U & vlSelf->PSdMkH) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSb3Ci))
                                    ? (vlSelf->PSdMkH 
                                       >> 9U) : (vlSelf->PSdMkH 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSdMkH = ((0xfffe3fU & vlSelf->PSdMkH) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSb3Ci))
                                     ? (vlSelf->PSdMkH 
                                        >> 0xfU) : 
                                    (vlSelf->PSdMkH 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSAHQI = ((0xfeU & (IData)(vlSelf->PSAHQI)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSAHQI)))));
    vlSelf->PSAHQI = ((0xfdU & (IData)(vlSelf->PSAHQI)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSAHQI)))) 
                         << 1U));
    vlSelf->PSAHQI = ((0xfbU & (IData)(vlSelf->PSAHQI)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSAHQI)))) 
                         << 2U));
    vlSelf->PSy1H1 = ((0xfffff8U & vlSelf->PSy1H1) 
                      | (7U & ((2U & (IData)(vlSelf->PSAHQI))
                                ? (vlSelf->PSy1H1 >> 3U)
                                : (vlSelf->PSy1H1 >> 6U))));
    vlSelf->PSy1H1 = ((0xffffc7U & vlSelf->PSy1H1) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSAHQI))
                                    ? (vlSelf->PSy1H1 
                                       >> 9U) : (vlSelf->PSy1H1 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSy1H1 = ((0xfffe3fU & vlSelf->PSy1H1) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSAHQI))
                                     ? (vlSelf->PSy1H1 
                                        >> 0xfU) : 
                                    (vlSelf->PSy1H1 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSdGKT = (7U & ((1U & (IData)(vlSelf->PSBALf))
                             ? ((1U & (IData)(vlSelf->PSAHQI))
                                 ? vlSelf->PSy1H1 : vlSelf->PSdMkH)
                             : (IData)(vlSelf->PS7LeN)));
    vlSelf->PSgwHP = ((0x1ffff8U & vlSelf->PSgwHP) 
                      | ((IData)(vlSelf->PSKtJb) ? 
                         (4U | (3U & (vlSelf->PSgwHP 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSgwHP 
                                                     >> 3U))));
    vlSelf->PSgwHP = ((0x1fffc7U & vlSelf->PSgwHP) 
                      | (((IData)(vlSelf->PSh0o8) ? 
                          (2U | (1U & (vlSelf->PSgwHP 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSgwHP >> 9U))) 
                         << 3U));
    vlSelf->PSgwHP = ((0x1ffe3fU & vlSelf->PSgwHP) 
                      | (((IData)(vlSelf->PSmgPz) ? 
                          (2U | (1U & (vlSelf->PSgwHP 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSgwHP >> 0xfU))) 
                         << 6U));
    PSFGZo = ((IData)(vlSelf->PSKtJb) ? (((QData)((IData)(
                                                          vlSelf->PS9fu5[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS9fu5[4U])))
               : (((QData)((IData)(vlSelf->PS9fu5[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS9fu5[2U]))));
    vlSelf->PS9fu5[0U] = (IData)(((IData)(vlSelf->PSKtJb)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS9fu5[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS9fu5[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS9fu5[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS9fu5[2U])))));
    vlSelf->PS9fu5[1U] = (IData)((PSFGZo >> 0x20U));
    PS0Z40 = ((IData)(vlSelf->PSh0o8) ? (((QData)((IData)(
                                                          vlSelf->PS9fu5[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS9fu5[8U])))
               : (((QData)((IData)(vlSelf->PS9fu5[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS9fu5[6U]))));
    vlSelf->PS9fu5[2U] = (IData)(((IData)(vlSelf->PSh0o8)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS9fu5[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS9fu5[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS9fu5[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS9fu5[6U])))));
    vlSelf->PS9fu5[3U] = (IData)((PS0Z40 >> 0x20U));
    PShZzy = ((IData)(vlSelf->PSmgPz) ? (((QData)((IData)(
                                                          vlSelf->PS9fu5[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PS9fu5[0xcU])))
               : (((QData)((IData)(vlSelf->PS9fu5[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PS9fu5[0xaU]))));
    vlSelf->PS9fu5[4U] = (IData)(((IData)(vlSelf->PSmgPz)
                                   ? (((QData)((IData)(
                                                       vlSelf->PS9fu5[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS9fu5[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PS9fu5[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PS9fu5[0xaU])))));
    vlSelf->PS9fu5[5U] = (IData)((PShZzy >> 0x20U));
    vlSelf->PSgOUn[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PS9fu5[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS9fu5[0U])))) 
                           << 3U) | (7U & vlSelf->PSgwHP));
    vlSelf->PSgOUn[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PS9fu5[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS9fu5[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PS9fu5[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PS9fu5[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PSgOUn[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PS9fu5[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PS9fu5[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PSjGvg = ((0xfeU & (IData)(vlSelf->PSjGvg)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSjGvg)))));
    vlSelf->PSjGvg = ((0xfdU & (IData)(vlSelf->PSjGvg)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSjGvg)))) 
                         << 1U));
    vlSelf->PSjGvg = ((0xfbU & (IData)(vlSelf->PSjGvg)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSjGvg)))) 
                         << 2U));
    vlSelf->PSd0cy = ((0xfffff8U & vlSelf->PSd0cy) 
                      | (7U & ((2U & (IData)(vlSelf->PSjGvg))
                                ? (vlSelf->PSd0cy >> 3U)
                                : (vlSelf->PSd0cy >> 6U))));
    vlSelf->PSd0cy = ((0xffffc7U & vlSelf->PSd0cy) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSjGvg))
                                    ? (vlSelf->PSd0cy 
                                       >> 9U) : (vlSelf->PSd0cy 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSd0cy = ((0xfffe3fU & vlSelf->PSd0cy) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSjGvg))
                                     ? (vlSelf->PSd0cy 
                                        >> 0xfU) : 
                                    (vlSelf->PSd0cy 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS8dpf = ((0xfeU & (IData)(vlSelf->PS8dpf)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS8dpf)))));
    vlSelf->PS8dpf = ((0xfdU & (IData)(vlSelf->PS8dpf)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS8dpf)))) 
                         << 1U));
    vlSelf->PS8dpf = ((0xfbU & (IData)(vlSelf->PS8dpf)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS8dpf)))) 
                         << 2U));
    vlSelf->PSaeg0 = ((0xfffff8U & vlSelf->PSaeg0) 
                      | (7U & ((2U & (IData)(vlSelf->PS8dpf))
                                ? (vlSelf->PSaeg0 >> 3U)
                                : (vlSelf->PSaeg0 >> 6U))));
    vlSelf->PSaeg0 = ((0xffffc7U & vlSelf->PSaeg0) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS8dpf))
                                    ? (vlSelf->PSaeg0 
                                       >> 9U) : (vlSelf->PSaeg0 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSaeg0 = ((0xfffe3fU & vlSelf->PSaeg0) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS8dpf))
                                     ? (vlSelf->PSaeg0 
                                        >> 0xfU) : 
                                    (vlSelf->PSaeg0 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSwEGm = (7U & ((1U & (IData)(vlSelf->PSue3K))
                             ? ((1U & (IData)(vlSelf->PS8dpf))
                                 ? vlSelf->PSaeg0 : vlSelf->PSd0cy)
                             : (IData)(vlSelf->PS1iwQ)));
    vlSelf->PSTPqw = ((0x1ffff8U & vlSelf->PSTPqw) 
                      | ((IData)(vlSelf->PS7kfI) ? 
                         (4U | (3U & (vlSelf->PSTPqw 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSTPqw 
                                                     >> 3U))));
    vlSelf->PSTPqw = ((0x1fffc7U & vlSelf->PSTPqw) 
                      | (((IData)(vlSelf->PS9qLz) ? 
                          (2U | (1U & (vlSelf->PSTPqw 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSTPqw >> 9U))) 
                         << 3U));
    vlSelf->PSTPqw = ((0x1ffe3fU & vlSelf->PSTPqw) 
                      | (((IData)(vlSelf->PSlyIo) ? 
                          (2U | (1U & (vlSelf->PSTPqw 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSTPqw >> 0xfU))) 
                         << 6U));
    PSg5B2 = ((IData)(vlSelf->PS7kfI) ? (((QData)((IData)(
                                                          vlSelf->PSiuIk[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSiuIk[4U])))
               : (((QData)((IData)(vlSelf->PSiuIk[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSiuIk[2U]))));
    vlSelf->PSiuIk[0U] = (IData)(((IData)(vlSelf->PS7kfI)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSiuIk[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSiuIk[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSiuIk[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSiuIk[2U])))));
    vlSelf->PSiuIk[1U] = (IData)((PSg5B2 >> 0x20U));
    PSRRBq = ((IData)(vlSelf->PS9qLz) ? (((QData)((IData)(
                                                          vlSelf->PSiuIk[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSiuIk[8U])))
               : (((QData)((IData)(vlSelf->PSiuIk[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSiuIk[6U]))));
    vlSelf->PSiuIk[2U] = (IData)(((IData)(vlSelf->PS9qLz)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSiuIk[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSiuIk[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSiuIk[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSiuIk[6U])))));
    vlSelf->PSiuIk[3U] = (IData)((PSRRBq >> 0x20U));
    PSAu0P = ((IData)(vlSelf->PSlyIo) ? (((QData)((IData)(
                                                          vlSelf->PSiuIk[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSiuIk[0xcU])))
               : (((QData)((IData)(vlSelf->PSiuIk[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSiuIk[0xaU]))));
    vlSelf->PSiuIk[4U] = (IData)(((IData)(vlSelf->PSlyIo)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSiuIk[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSiuIk[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSiuIk[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSiuIk[0xaU])))));
    vlSelf->PSiuIk[5U] = (IData)((PSAu0P >> 0x20U));
    vlSelf->PSBgWC[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSiuIk[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSiuIk[0U])))) 
                           << 3U) | (7U & vlSelf->PSTPqw));
    vlSelf->PSBgWC[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSiuIk[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSiuIk[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PSiuIk[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PSiuIk[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PSBgWC[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PSiuIk[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSiuIk[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PS4uN6 = ((0xfeU & (IData)(vlSelf->PS4uN6)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS4uN6)))));
    vlSelf->PS4uN6 = ((0xfdU & (IData)(vlSelf->PS4uN6)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS4uN6)))) 
                         << 1U));
    vlSelf->PS4uN6 = ((0xfbU & (IData)(vlSelf->PS4uN6)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS4uN6)))) 
                         << 2U));
    vlSelf->PSfGbY = ((0xfffff8U & vlSelf->PSfGbY) 
                      | (7U & ((2U & (IData)(vlSelf->PS4uN6))
                                ? (vlSelf->PSfGbY >> 3U)
                                : (vlSelf->PSfGbY >> 6U))));
    vlSelf->PSfGbY = ((0xffffc7U & vlSelf->PSfGbY) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS4uN6))
                                    ? (vlSelf->PSfGbY 
                                       >> 9U) : (vlSelf->PSfGbY 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSfGbY = ((0xfffe3fU & vlSelf->PSfGbY) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS4uN6))
                                     ? (vlSelf->PSfGbY 
                                        >> 0xfU) : 
                                    (vlSelf->PSfGbY 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS2oUC = ((0xfeU & (IData)(vlSelf->PS2oUC)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS2oUC)))));
    vlSelf->PS2oUC = ((0xfdU & (IData)(vlSelf->PS2oUC)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS2oUC)))) 
                         << 1U));
    vlSelf->PS2oUC = ((0xfbU & (IData)(vlSelf->PS2oUC)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS2oUC)))) 
                         << 2U));
    vlSelf->PSOQES = ((0xfffff8U & vlSelf->PSOQES) 
                      | (7U & ((2U & (IData)(vlSelf->PS2oUC))
                                ? (vlSelf->PSOQES >> 3U)
                                : (vlSelf->PSOQES >> 6U))));
    vlSelf->PSOQES = ((0xffffc7U & vlSelf->PSOQES) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS2oUC))
                                    ? (vlSelf->PSOQES 
                                       >> 9U) : (vlSelf->PSOQES 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSOQES = ((0xfffe3fU & vlSelf->PSOQES) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS2oUC))
                                     ? (vlSelf->PSOQES 
                                        >> 0xfU) : 
                                    (vlSelf->PSOQES 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSEi5o = (7U & ((1U & (IData)(vlSelf->PSf4lt))
                             ? ((1U & (IData)(vlSelf->PS2oUC))
                                 ? vlSelf->PSOQES : vlSelf->PSfGbY)
                             : (IData)(vlSelf->PSJDL2)));
    vlSelf->PSrgWu = ((0x1ffff8U & vlSelf->PSrgWu) 
                      | ((IData)(vlSelf->PSpWq6) ? 
                         (4U | (3U & (vlSelf->PSrgWu 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSrgWu 
                                                     >> 3U))));
    vlSelf->PSrgWu = ((0x1fffc7U & vlSelf->PSrgWu) 
                      | (((IData)(vlSelf->PS25jn) ? 
                          (2U | (1U & (vlSelf->PSrgWu 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSrgWu >> 9U))) 
                         << 3U));
    vlSelf->PSrgWu = ((0x1ffe3fU & vlSelf->PSrgWu) 
                      | (((IData)(vlSelf->PSzCLU) ? 
                          (2U | (1U & (vlSelf->PSrgWu 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSrgWu >> 0xfU))) 
                         << 6U));
    PSDr55 = ((IData)(vlSelf->PSpWq6) ? (((QData)((IData)(
                                                          vlSelf->PSL6iG[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSL6iG[4U])))
               : (((QData)((IData)(vlSelf->PSL6iG[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSL6iG[2U]))));
    vlSelf->PSL6iG[0U] = (IData)(((IData)(vlSelf->PSpWq6)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSL6iG[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSL6iG[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSL6iG[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSL6iG[2U])))));
    vlSelf->PSL6iG[1U] = (IData)((PSDr55 >> 0x20U));
    PSFzan = ((IData)(vlSelf->PS25jn) ? (((QData)((IData)(
                                                          vlSelf->PSL6iG[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSL6iG[8U])))
               : (((QData)((IData)(vlSelf->PSL6iG[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSL6iG[6U]))));
    vlSelf->PSL6iG[2U] = (IData)(((IData)(vlSelf->PS25jn)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSL6iG[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSL6iG[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSL6iG[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSL6iG[6U])))));
    vlSelf->PSL6iG[3U] = (IData)((PSFzan >> 0x20U));
    PS1I7A = ((IData)(vlSelf->PSzCLU) ? (((QData)((IData)(
                                                          vlSelf->PSL6iG[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSL6iG[0xcU])))
               : (((QData)((IData)(vlSelf->PSL6iG[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSL6iG[0xaU]))));
    vlSelf->PSL6iG[4U] = (IData)(((IData)(vlSelf->PSzCLU)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSL6iG[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSL6iG[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSL6iG[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSL6iG[0xaU])))));
    vlSelf->PSL6iG[5U] = (IData)((PS1I7A >> 0x20U));
    vlSelf->PSdewH[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSL6iG[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSL6iG[0U])))) 
                           << 3U) | (7U & vlSelf->PSrgWu));
    vlSelf->PSdewH[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSL6iG[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSL6iG[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PSL6iG[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PSL6iG[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PSdewH[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PSL6iG[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSL6iG[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PS9bd3 = ((0xfeU & (IData)(vlSelf->PS9bd3)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS9bd3)))));
    vlSelf->PS9bd3 = ((0xfdU & (IData)(vlSelf->PS9bd3)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS9bd3)))) 
                         << 1U));
    vlSelf->PS9bd3 = ((0xfbU & (IData)(vlSelf->PS9bd3)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS9bd3)))) 
                         << 2U));
    vlSelf->PSW10w = ((0xfffff8U & vlSelf->PSW10w) 
                      | (7U & ((2U & (IData)(vlSelf->PS9bd3))
                                ? (vlSelf->PSW10w >> 3U)
                                : (vlSelf->PSW10w >> 6U))));
    vlSelf->PSW10w = ((0xffffc7U & vlSelf->PSW10w) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS9bd3))
                                    ? (vlSelf->PSW10w 
                                       >> 9U) : (vlSelf->PSW10w 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSW10w = ((0xfffe3fU & vlSelf->PSW10w) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS9bd3))
                                     ? (vlSelf->PSW10w 
                                        >> 0xfU) : 
                                    (vlSelf->PSW10w 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSFoYv = ((0xfeU & (IData)(vlSelf->PSFoYv)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSFoYv)))));
    vlSelf->PSFoYv = ((0xfdU & (IData)(vlSelf->PSFoYv)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSFoYv)))) 
                         << 1U));
    vlSelf->PSFoYv = ((0xfbU & (IData)(vlSelf->PSFoYv)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSFoYv)))) 
                         << 2U));
    vlSelf->PSXBvP = ((0xfffff8U & vlSelf->PSXBvP) 
                      | (7U & ((2U & (IData)(vlSelf->PSFoYv))
                                ? (vlSelf->PSXBvP >> 3U)
                                : (vlSelf->PSXBvP >> 6U))));
    vlSelf->PSXBvP = ((0xffffc7U & vlSelf->PSXBvP) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSFoYv))
                                    ? (vlSelf->PSXBvP 
                                       >> 9U) : (vlSelf->PSXBvP 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSXBvP = ((0xfffe3fU & vlSelf->PSXBvP) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSFoYv))
                                     ? (vlSelf->PSXBvP 
                                        >> 0xfU) : 
                                    (vlSelf->PSXBvP 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS6Glh = (7U & ((1U & (IData)(vlSelf->PSBCau))
                             ? ((1U & (IData)(vlSelf->PSFoYv))
                                 ? vlSelf->PSXBvP : vlSelf->PSW10w)
                             : (IData)(vlSelf->PSpBHB)));
    vlSelf->PSICTw = ((0x1ffff8U & vlSelf->PSICTw) 
                      | ((IData)(vlSelf->PS3vGW) ? 
                         (4U | (3U & (vlSelf->PSICTw 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSICTw 
                                                     >> 3U))));
    vlSelf->PSICTw = ((0x1fffc7U & vlSelf->PSICTw) 
                      | (((IData)(vlSelf->PSxYPA) ? 
                          (2U | (1U & (vlSelf->PSICTw 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSICTw >> 9U))) 
                         << 3U));
    vlSelf->PSICTw = ((0x1ffe3fU & vlSelf->PSICTw) 
                      | (((IData)(vlSelf->PSU2nJ) ? 
                          (2U | (1U & (vlSelf->PSICTw 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSICTw >> 0xfU))) 
                         << 6U));
    PSm1tk = ((IData)(vlSelf->PS3vGW) ? (((QData)((IData)(
                                                          vlSelf->PSKffa[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSKffa[4U])))
               : (((QData)((IData)(vlSelf->PSKffa[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSKffa[2U]))));
    vlSelf->PSKffa[0U] = (IData)(((IData)(vlSelf->PS3vGW)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSKffa[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSKffa[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSKffa[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSKffa[2U])))));
    vlSelf->PSKffa[1U] = (IData)((PSm1tk >> 0x20U));
    PSvAR2 = ((IData)(vlSelf->PSxYPA) ? (((QData)((IData)(
                                                          vlSelf->PSKffa[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSKffa[8U])))
               : (((QData)((IData)(vlSelf->PSKffa[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSKffa[6U]))));
    vlSelf->PSKffa[2U] = (IData)(((IData)(vlSelf->PSxYPA)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSKffa[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSKffa[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSKffa[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSKffa[6U])))));
    vlSelf->PSKffa[3U] = (IData)((PSvAR2 >> 0x20U));
    PSHSbj = ((IData)(vlSelf->PSU2nJ) ? (((QData)((IData)(
                                                          vlSelf->PSKffa[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSKffa[0xcU])))
               : (((QData)((IData)(vlSelf->PSKffa[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSKffa[0xaU]))));
    vlSelf->PSKffa[4U] = (IData)(((IData)(vlSelf->PSU2nJ)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSKffa[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSKffa[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSKffa[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSKffa[0xaU])))));
    vlSelf->PSKffa[5U] = (IData)((PSHSbj >> 0x20U));
    vlSelf->PSA6Fz[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSKffa[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSKffa[0U])))) 
                           << 3U) | (7U & vlSelf->PSICTw));
    vlSelf->PSA6Fz[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSKffa[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSKffa[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PSKffa[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PSKffa[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PSA6Fz[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PSKffa[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSKffa[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PSsehg = ((0xfeU & (IData)(vlSelf->PSsehg)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSsehg)))));
    vlSelf->PSsehg = ((0xfdU & (IData)(vlSelf->PSsehg)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSsehg)))) 
                         << 1U));
    vlSelf->PSsehg = ((0xfbU & (IData)(vlSelf->PSsehg)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSsehg)))) 
                         << 2U));
    vlSelf->PSinUa = ((0xfffff8U & vlSelf->PSinUa) 
                      | (7U & ((2U & (IData)(vlSelf->PSsehg))
                                ? (vlSelf->PSinUa >> 3U)
                                : (vlSelf->PSinUa >> 6U))));
    vlSelf->PSinUa = ((0xffffc7U & vlSelf->PSinUa) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSsehg))
                                    ? (vlSelf->PSinUa 
                                       >> 9U) : (vlSelf->PSinUa 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSinUa = ((0xfffe3fU & vlSelf->PSinUa) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSsehg))
                                     ? (vlSelf->PSinUa 
                                        >> 0xfU) : 
                                    (vlSelf->PSinUa 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSH5EO = ((0xfeU & (IData)(vlSelf->PSH5EO)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSH5EO)))));
    vlSelf->PSH5EO = ((0xfdU & (IData)(vlSelf->PSH5EO)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSH5EO)))) 
                         << 1U));
    vlSelf->PSH5EO = ((0xfbU & (IData)(vlSelf->PSH5EO)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSH5EO)))) 
                         << 2U));
    vlSelf->PSpvrM = ((0xfffff8U & vlSelf->PSpvrM) 
                      | (7U & ((2U & (IData)(vlSelf->PSH5EO))
                                ? (vlSelf->PSpvrM >> 3U)
                                : (vlSelf->PSpvrM >> 6U))));
    vlSelf->PSpvrM = ((0xffffc7U & vlSelf->PSpvrM) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSH5EO))
                                    ? (vlSelf->PSpvrM 
                                       >> 9U) : (vlSelf->PSpvrM 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSpvrM = ((0xfffe3fU & vlSelf->PSpvrM) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSH5EO))
                                     ? (vlSelf->PSpvrM 
                                        >> 0xfU) : 
                                    (vlSelf->PSpvrM 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSxkPA = (7U & ((1U & (IData)(vlSelf->PSnNgP))
                             ? ((1U & (IData)(vlSelf->PSH5EO))
                                 ? vlSelf->PSpvrM : vlSelf->PSinUa)
                             : (IData)(vlSelf->PSmPQs)));
    vlSelf->PSUCMZ = ((0x1ffff8U & vlSelf->PSUCMZ) 
                      | ((IData)(vlSelf->PSGk2y) ? 
                         (4U | (3U & (vlSelf->PSUCMZ 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSUCMZ 
                                                     >> 3U))));
    vlSelf->PSUCMZ = ((0x1fffc7U & vlSelf->PSUCMZ) 
                      | (((IData)(vlSelf->PS0gIt) ? 
                          (2U | (1U & (vlSelf->PSUCMZ 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSUCMZ >> 9U))) 
                         << 3U));
    vlSelf->PSUCMZ = ((0x1ffe3fU & vlSelf->PSUCMZ) 
                      | (((IData)(vlSelf->PS7FiX) ? 
                          (2U | (1U & (vlSelf->PSUCMZ 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSUCMZ >> 0xfU))) 
                         << 6U));
    PSRM9i = ((IData)(vlSelf->PSGk2y) ? (((QData)((IData)(
                                                          vlSelf->PSQoeL[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSQoeL[4U])))
               : (((QData)((IData)(vlSelf->PSQoeL[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSQoeL[2U]))));
    vlSelf->PSQoeL[0U] = (IData)(((IData)(vlSelf->PSGk2y)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSQoeL[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSQoeL[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSQoeL[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSQoeL[2U])))));
    vlSelf->PSQoeL[1U] = (IData)((PSRM9i >> 0x20U));
    PSSo94 = ((IData)(vlSelf->PS0gIt) ? (((QData)((IData)(
                                                          vlSelf->PSQoeL[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSQoeL[8U])))
               : (((QData)((IData)(vlSelf->PSQoeL[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSQoeL[6U]))));
    vlSelf->PSQoeL[2U] = (IData)(((IData)(vlSelf->PS0gIt)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSQoeL[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSQoeL[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSQoeL[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSQoeL[6U])))));
    vlSelf->PSQoeL[3U] = (IData)((PSSo94 >> 0x20U));
    PSCXsa = ((IData)(vlSelf->PS7FiX) ? (((QData)((IData)(
                                                          vlSelf->PSQoeL[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSQoeL[0xcU])))
               : (((QData)((IData)(vlSelf->PSQoeL[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSQoeL[0xaU]))));
    vlSelf->PSQoeL[4U] = (IData)(((IData)(vlSelf->PS7FiX)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSQoeL[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSQoeL[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSQoeL[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSQoeL[0xaU])))));
    vlSelf->PSQoeL[5U] = (IData)((PSCXsa >> 0x20U));
    vlSelf->PSliR7[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSQoeL[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSQoeL[0U])))) 
                           << 3U) | (7U & vlSelf->PSUCMZ));
    vlSelf->PSliR7[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSQoeL[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSQoeL[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PSQoeL[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PSQoeL[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PSliR7[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PSQoeL[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSQoeL[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PSkLWB = ((0xfeU & (IData)(vlSelf->PSkLWB)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSkLWB)))));
    vlSelf->PSkLWB = ((0xfdU & (IData)(vlSelf->PSkLWB)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSkLWB)))) 
                         << 1U));
    vlSelf->PSkLWB = ((0xfbU & (IData)(vlSelf->PSkLWB)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSkLWB)))) 
                         << 2U));
    vlSelf->PSwuOp = ((0xfffff8U & vlSelf->PSwuOp) 
                      | (7U & ((2U & (IData)(vlSelf->PSkLWB))
                                ? (vlSelf->PSwuOp >> 3U)
                                : (vlSelf->PSwuOp >> 6U))));
    vlSelf->PSwuOp = ((0xffffc7U & vlSelf->PSwuOp) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSkLWB))
                                    ? (vlSelf->PSwuOp 
                                       >> 9U) : (vlSelf->PSwuOp 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSwuOp = ((0xfffe3fU & vlSelf->PSwuOp) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSkLWB))
                                     ? (vlSelf->PSwuOp 
                                        >> 0xfU) : 
                                    (vlSelf->PSwuOp 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSDYCO = ((0xfeU & (IData)(vlSelf->PSDYCO)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSDYCO)))));
    vlSelf->PSDYCO = ((0xfdU & (IData)(vlSelf->PSDYCO)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSDYCO)))) 
                         << 1U));
    vlSelf->PSDYCO = ((0xfbU & (IData)(vlSelf->PSDYCO)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSDYCO)))) 
                         << 2U));
    vlSelf->PSQOy6 = ((0xfffff8U & vlSelf->PSQOy6) 
                      | (7U & ((2U & (IData)(vlSelf->PSDYCO))
                                ? (vlSelf->PSQOy6 >> 3U)
                                : (vlSelf->PSQOy6 >> 6U))));
    vlSelf->PSQOy6 = ((0xffffc7U & vlSelf->PSQOy6) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSDYCO))
                                    ? (vlSelf->PSQOy6 
                                       >> 9U) : (vlSelf->PSQOy6 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSQOy6 = ((0xfffe3fU & vlSelf->PSQOy6) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSDYCO))
                                     ? (vlSelf->PSQOy6 
                                        >> 0xfU) : 
                                    (vlSelf->PSQOy6 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSTGYe = (7U & ((1U & (IData)(vlSelf->PSk6YB))
                             ? ((1U & (IData)(vlSelf->PSDYCO))
                                 ? vlSelf->PSQOy6 : vlSelf->PSwuOp)
                             : (IData)(vlSelf->PSIWmK)));
    vlSelf->PSw7jq = ((0x1ffff8U & vlSelf->PSw7jq) 
                      | ((IData)(vlSelf->PSHGK2) ? 
                         (4U | (3U & (vlSelf->PSw7jq 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSw7jq 
                                                     >> 3U))));
    vlSelf->PSw7jq = ((0x1fffc7U & vlSelf->PSw7jq) 
                      | (((IData)(vlSelf->PSwVYn) ? 
                          (2U | (1U & (vlSelf->PSw7jq 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSw7jq >> 9U))) 
                         << 3U));
    vlSelf->PSw7jq = ((0x1ffe3fU & vlSelf->PSw7jq) 
                      | (((IData)(vlSelf->PSmwCL) ? 
                          (2U | (1U & (vlSelf->PSw7jq 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSw7jq >> 0xfU))) 
                         << 6U));
    PSRokC = ((IData)(vlSelf->PSHGK2) ? (((QData)((IData)(
                                                          vlSelf->PSURw1[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSURw1[4U])))
               : (((QData)((IData)(vlSelf->PSURw1[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSURw1[2U]))));
    vlSelf->PSURw1[0U] = (IData)(((IData)(vlSelf->PSHGK2)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSURw1[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSURw1[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSURw1[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSURw1[2U])))));
    vlSelf->PSURw1[1U] = (IData)((PSRokC >> 0x20U));
    PSpaFL = ((IData)(vlSelf->PSwVYn) ? (((QData)((IData)(
                                                          vlSelf->PSURw1[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSURw1[8U])))
               : (((QData)((IData)(vlSelf->PSURw1[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSURw1[6U]))));
    vlSelf->PSURw1[2U] = (IData)(((IData)(vlSelf->PSwVYn)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSURw1[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSURw1[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSURw1[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSURw1[6U])))));
    vlSelf->PSURw1[3U] = (IData)((PSpaFL >> 0x20U));
    PSMca3 = ((IData)(vlSelf->PSmwCL) ? (((QData)((IData)(
                                                          vlSelf->PSURw1[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSURw1[0xcU])))
               : (((QData)((IData)(vlSelf->PSURw1[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSURw1[0xaU]))));
    vlSelf->PSURw1[4U] = (IData)(((IData)(vlSelf->PSmwCL)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSURw1[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSURw1[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSURw1[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSURw1[0xaU])))));
    vlSelf->PSURw1[5U] = (IData)((PSMca3 >> 0x20U));
    vlSelf->PSi6UA[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSURw1[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSURw1[0U])))) 
                           << 3U) | (7U & vlSelf->PSw7jq));
    vlSelf->PSi6UA[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSURw1[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSURw1[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PSURw1[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PSURw1[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PSi6UA[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PSURw1[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSURw1[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PSzVlZ = ((0xfeU & (IData)(vlSelf->PSzVlZ)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSzVlZ)))));
    vlSelf->PSzVlZ = ((0xfdU & (IData)(vlSelf->PSzVlZ)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSzVlZ)))) 
                         << 1U));
    vlSelf->PSzVlZ = ((0xfbU & (IData)(vlSelf->PSzVlZ)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSzVlZ)))) 
                         << 2U));
    vlSelf->PSgDIi = ((0xfffff8U & vlSelf->PSgDIi) 
                      | (7U & ((2U & (IData)(vlSelf->PSzVlZ))
                                ? (vlSelf->PSgDIi >> 3U)
                                : (vlSelf->PSgDIi >> 6U))));
    vlSelf->PSgDIi = ((0xffffc7U & vlSelf->PSgDIi) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSzVlZ))
                                    ? (vlSelf->PSgDIi 
                                       >> 9U) : (vlSelf->PSgDIi 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSgDIi = ((0xfffe3fU & vlSelf->PSgDIi) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSzVlZ))
                                     ? (vlSelf->PSgDIi 
                                        >> 0xfU) : 
                                    (vlSelf->PSgDIi 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSJKI5 = ((0xfeU & (IData)(vlSelf->PSJKI5)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSJKI5)))));
    vlSelf->PSJKI5 = ((0xfdU & (IData)(vlSelf->PSJKI5)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSJKI5)))) 
                         << 1U));
    vlSelf->PSJKI5 = ((0xfbU & (IData)(vlSelf->PSJKI5)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSJKI5)))) 
                         << 2U));
    vlSelf->PSaQRG = ((0xfffff8U & vlSelf->PSaQRG) 
                      | (7U & ((2U & (IData)(vlSelf->PSJKI5))
                                ? (vlSelf->PSaQRG >> 3U)
                                : (vlSelf->PSaQRG >> 6U))));
    vlSelf->PSaQRG = ((0xffffc7U & vlSelf->PSaQRG) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSJKI5))
                                    ? (vlSelf->PSaQRG 
                                       >> 9U) : (vlSelf->PSaQRG 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSaQRG = ((0xfffe3fU & vlSelf->PSaQRG) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSJKI5))
                                     ? (vlSelf->PSaQRG 
                                        >> 0xfU) : 
                                    (vlSelf->PSaQRG 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSz3Yz = (7U & ((1U & (IData)(vlSelf->PS6Ral))
                             ? ((1U & (IData)(vlSelf->PSJKI5))
                                 ? vlSelf->PSaQRG : vlSelf->PSgDIi)
                             : (IData)(vlSelf->PS00ks)));
    vlSelf->PSZOOk = 1U;
    if (((IData)(vlSelf->PSpp0X) & (5U != (IData)(vlSelf->PS9kH7)))) {
        vlSelf->PSZOOk = 0U;
    }
    vlSelf->PSLaTW = 1U;
    if ((((IData)(vlSelf->PSpp0X) >> 1U) & (5U != (IData)(vlSelf->PSXvkX)))) {
        vlSelf->PSLaTW = 0U;
    }
    vlSelf->PSF3Ga = 1U;
    if ((((IData)(vlSelf->PSpp0X) >> 2U) & (5U != (IData)(vlSelf->PShWsR)))) {
        vlSelf->PSF3Ga = 0U;
    }
    vlSelf->PSjI0M = 1U;
    if ((((IData)(vlSelf->PSpp0X) >> 3U) & (5U != (IData)(vlSelf->PSL4dI)))) {
        vlSelf->PSjI0M = 0U;
    }
    vlSelf->PSmr85 = 1U;
    if ((((IData)(vlSelf->PSpp0X) >> 4U) & (5U != (IData)(vlSelf->PSIxrl)))) {
        vlSelf->PSmr85 = 0U;
    }
    vlSelf->PSGeHF = 1U;
    if ((((IData)(vlSelf->PSpp0X) >> 7U) & (2U != (IData)(vlSelf->PSEBzJ)))) {
        vlSelf->PSGeHF = 0U;
    }
    vlSelf->PSy9LY = 1U;
    if ((((IData)(vlSelf->PSpp0X) >> 8U) & (2U != (IData)(vlSelf->PSIeLA)))) {
        vlSelf->PSy9LY = 0U;
    }
    vlSelf->PSpPM1 = 1U;
    if ((((IData)(vlSelf->PSpp0X) >> 5U) & (1U != (IData)(vlSelf->PSmmGZ)))) {
        vlSelf->PSpPM1 = 0U;
    }
    vlSelf->PSBqAH = 1U;
    if ((((IData)(vlSelf->PSpp0X) >> 6U) & (1U != (IData)(vlSelf->PS5YWc)))) {
        vlSelf->PSBqAH = 0U;
    }
    vlSelf->PSAF0R = vlSelf->PS9kH7;
    if (((IData)(vlSelf->PSpp0X) & (5U != (IData)(vlSelf->PS9kH7)))) {
        vlSelf->PSAF0R = (0xfU & ((IData)(1U) + (IData)(vlSelf->PS9kH7)));
    }
    if (((IData)(vlSelf->PSBb3N) & (0U != (IData)(vlSelf->PS9kH7)))) {
        vlSelf->PSAF0R = (0xfU & ((IData)(vlSelf->PS9kH7) 
                                  - (IData)(1U)));
    }
    if (((((IData)(vlSelf->PSpp0X) & (IData)(vlSelf->PSBb3N)) 
          & (5U != (IData)(vlSelf->PS9kH7))) & (0U 
                                                != (IData)(vlSelf->PS9kH7)))) {
        vlSelf->PSAF0R = vlSelf->PS9kH7;
    }
    vlSelf->PSbNeG = vlSelf->PSPO7X;
    if (((IData)(vlSelf->PSpp0X) & (5U != (IData)(vlSelf->PS9kH7)))) {
        vlSelf->PSbNeG = ((4U == (IData)(vlSelf->PSPO7X))
                           ? 0U : (7U & ((IData)(1U) 
                                         + (IData)(vlSelf->PSPO7X))));
    }
    vlSelf->PSy2fK = vlSelf->PSXvkX;
    if ((((IData)(vlSelf->PSpp0X) >> 1U) & (5U != (IData)(vlSelf->PSXvkX)))) {
        vlSelf->PSy2fK = (0xfU & ((IData)(1U) + (IData)(vlSelf->PSXvkX)));
    }
    if (((IData)(vlSelf->PSm2DK) & (0U != (IData)(vlSelf->PSXvkX)))) {
        vlSelf->PSy2fK = (0xfU & ((IData)(vlSelf->PSXvkX) 
                                  - (IData)(1U)));
    }
    if ((((((IData)(vlSelf->PSpp0X) >> 1U) & (IData)(vlSelf->PSm2DK)) 
          & (5U != (IData)(vlSelf->PSXvkX))) & (0U 
                                                != (IData)(vlSelf->PSXvkX)))) {
        vlSelf->PSy2fK = vlSelf->PSXvkX;
    }
    vlSelf->PSZ7lL = vlSelf->PSjBdF;
    if ((((IData)(vlSelf->PSpp0X) >> 1U) & (5U != (IData)(vlSelf->PSXvkX)))) {
        vlSelf->PSZ7lL = ((4U == (IData)(vlSelf->PSjBdF))
                           ? 0U : (7U & ((IData)(1U) 
                                         + (IData)(vlSelf->PSjBdF))));
    }
    vlSelf->PSOWu4 = vlSelf->PShWsR;
    if ((((IData)(vlSelf->PSpp0X) >> 2U) & (5U != (IData)(vlSelf->PShWsR)))) {
        vlSelf->PSOWu4 = (0xfU & ((IData)(1U) + (IData)(vlSelf->PShWsR)));
    }
    if (((IData)(vlSelf->PSgBk2) & (0U != (IData)(vlSelf->PShWsR)))) {
        vlSelf->PSOWu4 = (0xfU & ((IData)(vlSelf->PShWsR) 
                                  - (IData)(1U)));
    }
    if ((((((IData)(vlSelf->PSpp0X) >> 2U) & (IData)(vlSelf->PSgBk2)) 
          & (5U != (IData)(vlSelf->PShWsR))) & (0U 
                                                != (IData)(vlSelf->PShWsR)))) {
        vlSelf->PSOWu4 = vlSelf->PShWsR;
    }
    vlSelf->PSDxjB = vlSelf->PSnkNY;
    if ((((IData)(vlSelf->PSpp0X) >> 2U) & (5U != (IData)(vlSelf->PShWsR)))) {
        vlSelf->PSDxjB = ((4U == (IData)(vlSelf->PSnkNY))
                           ? 0U : (7U & ((IData)(1U) 
                                         + (IData)(vlSelf->PSnkNY))));
    }
    vlSelf->PSTv33 = vlSelf->PSL4dI;
    if ((((IData)(vlSelf->PSpp0X) >> 3U) & (5U != (IData)(vlSelf->PSL4dI)))) {
        vlSelf->PSTv33 = (0xfU & ((IData)(1U) + (IData)(vlSelf->PSL4dI)));
    }
    if (((IData)(vlSelf->PSTFqW) & (0U != (IData)(vlSelf->PSL4dI)))) {
        vlSelf->PSTv33 = (0xfU & ((IData)(vlSelf->PSL4dI) 
                                  - (IData)(1U)));
    }
    if ((((((IData)(vlSelf->PSpp0X) >> 3U) & (IData)(vlSelf->PSTFqW)) 
          & (5U != (IData)(vlSelf->PSL4dI))) & (0U 
                                                != (IData)(vlSelf->PSL4dI)))) {
        vlSelf->PSTv33 = vlSelf->PSL4dI;
    }
    vlSelf->PSAPlD = vlSelf->PSW9aC;
    if ((((IData)(vlSelf->PSpp0X) >> 3U) & (5U != (IData)(vlSelf->PSL4dI)))) {
        vlSelf->PSAPlD = ((4U == (IData)(vlSelf->PSW9aC))
                           ? 0U : (7U & ((IData)(1U) 
                                         + (IData)(vlSelf->PSW9aC))));
    }
    vlSelf->PSmyJW = vlSelf->PSIxrl;
    if ((((IData)(vlSelf->PSpp0X) >> 4U) & (5U != (IData)(vlSelf->PSIxrl)))) {
        vlSelf->PSmyJW = (0xfU & ((IData)(1U) + (IData)(vlSelf->PSIxrl)));
    }
    if (((IData)(vlSelf->PSDeZk) & (0U != (IData)(vlSelf->PSIxrl)))) {
        vlSelf->PSmyJW = (0xfU & ((IData)(vlSelf->PSIxrl) 
                                  - (IData)(1U)));
    }
    if ((((((IData)(vlSelf->PSpp0X) >> 4U) & (IData)(vlSelf->PSDeZk)) 
          & (5U != (IData)(vlSelf->PSIxrl))) & (0U 
                                                != (IData)(vlSelf->PSIxrl)))) {
        vlSelf->PSmyJW = vlSelf->PSIxrl;
    }
    vlSelf->PSWKve = vlSelf->PSZvS6;
    if ((((IData)(vlSelf->PSpp0X) >> 4U) & (5U != (IData)(vlSelf->PSIxrl)))) {
        vlSelf->PSWKve = ((4U == (IData)(vlSelf->PSZvS6))
                           ? 0U : (7U & ((IData)(1U) 
                                         + (IData)(vlSelf->PSZvS6))));
    }
    vlSelf->PSOFAl = vlSelf->PSEBzJ;
    if ((((IData)(vlSelf->PSpp0X) >> 7U) & (2U != (IData)(vlSelf->PSEBzJ)))) {
        vlSelf->PSOFAl = (3U & ((IData)(1U) + (IData)(vlSelf->PSEBzJ)));
    }
    if (((IData)(vlSelf->PSdnYB) & (0U != (IData)(vlSelf->PSEBzJ)))) {
        vlSelf->PSOFAl = (3U & ((IData)(vlSelf->PSEBzJ) 
                                - (IData)(1U)));
    }
    if ((((((IData)(vlSelf->PSpp0X) >> 7U) & (IData)(vlSelf->PSdnYB)) 
          & (2U != (IData)(vlSelf->PSEBzJ))) & (0U 
                                                != (IData)(vlSelf->PSEBzJ)))) {
        vlSelf->PSOFAl = vlSelf->PSEBzJ;
    }
    vlSelf->PSrJsT = vlSelf->PSi0zO;
    if ((((IData)(vlSelf->PSpp0X) >> 7U) & (2U != (IData)(vlSelf->PSEBzJ)))) {
        vlSelf->PSrJsT = (1U & ((IData)(1U) + (IData)(vlSelf->PSi0zO)));
    }
    vlSelf->PSNooK = vlSelf->PSIeLA;
    if ((((IData)(vlSelf->PSpp0X) >> 8U) & (2U != (IData)(vlSelf->PSIeLA)))) {
        vlSelf->PSNooK = (3U & ((IData)(1U) + (IData)(vlSelf->PSIeLA)));
    }
    if (((IData)(vlSelf->PS4dXB) & (0U != (IData)(vlSelf->PSIeLA)))) {
        vlSelf->PSNooK = (3U & ((IData)(vlSelf->PSIeLA) 
                                - (IData)(1U)));
    }
    if ((((((IData)(vlSelf->PSpp0X) >> 8U) & (IData)(vlSelf->PS4dXB)) 
          & (2U != (IData)(vlSelf->PSIeLA))) & (0U 
                                                != (IData)(vlSelf->PSIeLA)))) {
        vlSelf->PSNooK = vlSelf->PSIeLA;
    }
    vlSelf->PSlssf = vlSelf->PSbGk2;
    if ((((IData)(vlSelf->PSpp0X) >> 8U) & (2U != (IData)(vlSelf->PSIeLA)))) {
        vlSelf->PSlssf = (1U & ((IData)(1U) + (IData)(vlSelf->PSbGk2)));
    }
    vlSelf->PShFDw = vlSelf->PSmmGZ;
    if ((((IData)(vlSelf->PSpp0X) >> 5U) & (1U != (IData)(vlSelf->PSmmGZ)))) {
        vlSelf->PShFDw = (3U & ((IData)(1U) + (IData)(vlSelf->PSmmGZ)));
    }
    if (((IData)(vlSelf->PSUAAU) & (0U != (IData)(vlSelf->PSmmGZ)))) {
        vlSelf->PShFDw = (3U & ((IData)(vlSelf->PSmmGZ) 
                                - (IData)(1U)));
    }
    if ((((((IData)(vlSelf->PSpp0X) >> 5U) & (IData)(vlSelf->PSUAAU)) 
          & (1U != (IData)(vlSelf->PSmmGZ))) & (0U 
                                                != (IData)(vlSelf->PSmmGZ)))) {
        vlSelf->PShFDw = vlSelf->PSmmGZ;
    }
    vlSelf->PSKnDw = vlSelf->PSQhxx;
    if ((((IData)(vlSelf->PSpp0X) >> 5U) & (1U != (IData)(vlSelf->PSmmGZ)))) {
        vlSelf->PSKnDw = ((IData)(vlSelf->PSQhxx) & 
                          ((IData)(1U) + (IData)(vlSelf->PSQhxx)));
    }
    vlSelf->PStzHu = vlSelf->PS5YWc;
    if ((((IData)(vlSelf->PSpp0X) >> 6U) & (1U != (IData)(vlSelf->PS5YWc)))) {
        vlSelf->PStzHu = (3U & ((IData)(1U) + (IData)(vlSelf->PS5YWc)));
    }
    if (((IData)(vlSelf->PSEPBD) & (0U != (IData)(vlSelf->PS5YWc)))) {
        vlSelf->PStzHu = (3U & ((IData)(vlSelf->PS5YWc) 
                                - (IData)(1U)));
    }
    if ((((((IData)(vlSelf->PSpp0X) >> 6U) & (IData)(vlSelf->PSEPBD)) 
          & (1U != (IData)(vlSelf->PS5YWc))) & (0U 
                                                != (IData)(vlSelf->PS5YWc)))) {
        vlSelf->PStzHu = vlSelf->PS5YWc;
    }
    vlSelf->PSqDcd = vlSelf->PSyJP9;
    if ((((IData)(vlSelf->PSpp0X) >> 6U) & (1U != (IData)(vlSelf->PS5YWc)))) {
        vlSelf->PSqDcd = ((IData)(vlSelf->PSyJP9) & 
                          ((IData)(1U) + (IData)(vlSelf->PSyJP9)));
    }
    vlSelf->PSt49a = ((0x1ffff8U & vlSelf->PSt49a) 
                      | ((IData)(vlSelf->PS52aS) ? 
                         (4U | (3U & (vlSelf->PSt49a 
                                      >> 6U))) : (3U 
                                                  & (vlSelf->PSt49a 
                                                     >> 3U))));
    vlSelf->PSt49a = ((0x1fffc7U & vlSelf->PSt49a) 
                      | (((IData)(vlSelf->PSkO4F) ? 
                          (2U | (1U & (vlSelf->PSt49a 
                                       >> 0xcU))) : 
                          (1U & (vlSelf->PSt49a >> 9U))) 
                         << 3U));
    vlSelf->PSt49a = ((0x1ffe3fU & vlSelf->PSt49a) 
                      | (((IData)(vlSelf->PSW2Sl) ? 
                          (2U | (1U & (vlSelf->PSt49a 
                                       >> 0x12U))) : 
                          (1U & (vlSelf->PSt49a >> 0xfU))) 
                         << 6U));
    PS0cdC = ((IData)(vlSelf->PS52aS) ? (((QData)((IData)(
                                                          vlSelf->PSUZji[5U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSUZji[4U])))
               : (((QData)((IData)(vlSelf->PSUZji[3U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSUZji[2U]))));
    vlSelf->PSUZji[0U] = (IData)(((IData)(vlSelf->PS52aS)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSUZji[5U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSUZji[4U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSUZji[3U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSUZji[2U])))));
    vlSelf->PSUZji[1U] = (IData)((PS0cdC >> 0x20U));
    PSzt5B = ((IData)(vlSelf->PSkO4F) ? (((QData)((IData)(
                                                          vlSelf->PSUZji[9U])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSUZji[8U])))
               : (((QData)((IData)(vlSelf->PSUZji[7U])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSUZji[6U]))));
    vlSelf->PSUZji[2U] = (IData)(((IData)(vlSelf->PSkO4F)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSUZji[9U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSUZji[8U])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSUZji[7U])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSUZji[6U])))));
    vlSelf->PSUZji[3U] = (IData)((PSzt5B >> 0x20U));
    PS7Azm = ((IData)(vlSelf->PSW2Sl) ? (((QData)((IData)(
                                                          vlSelf->PSUZji[0xdU])) 
                                          << 0x20U) 
                                         | (QData)((IData)(
                                                           vlSelf->PSUZji[0xcU])))
               : (((QData)((IData)(vlSelf->PSUZji[0xbU])) 
                   << 0x20U) | (QData)((IData)(vlSelf->PSUZji[0xaU]))));
    vlSelf->PSUZji[4U] = (IData)(((IData)(vlSelf->PSW2Sl)
                                   ? (((QData)((IData)(
                                                       vlSelf->PSUZji[0xdU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSUZji[0xcU])))
                                   : (((QData)((IData)(
                                                       vlSelf->PSUZji[0xbU])) 
                                       << 0x20U) | (QData)((IData)(
                                                                   vlSelf->PSUZji[0xaU])))));
    vlSelf->PSUZji[5U] = (IData)((PS7Azm >> 0x20U));
    vlSelf->PS8QU9[0U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSUZji[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSUZji[0U])))) 
                           << 3U) | (7U & vlSelf->PSt49a));
    vlSelf->PS8QU9[1U] = (((IData)((((QData)((IData)(
                                                     vlSelf->PSUZji[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSUZji[0U])))) 
                           >> 0x1dU) | ((IData)(((((QData)((IData)(
                                                                   vlSelf->PSUZji[1U])) 
                                                   << 0x20U) 
                                                  | (QData)((IData)(
                                                                    vlSelf->PSUZji[0U]))) 
                                                 >> 0x20U)) 
                                        << 3U));
    vlSelf->PS8QU9[2U] = ((IData)(((((QData)((IData)(
                                                     vlSelf->PSUZji[1U])) 
                                     << 0x20U) | (QData)((IData)(
                                                                 vlSelf->PSUZji[0U]))) 
                                   >> 0x20U)) >> 0x1dU);
    vlSelf->PSNpVb = ((0xf0U & (IData)(vlSelf->PSNpVb)) 
                      | ((0x32U == (0xffU & ((IData)(vlSelf->PSA7Nr) 
                                             >> 8U)))
                          ? ((1U & (IData)((vlSelf->PSR0xs 
                                            >> 0x1fU))) 
                             ^ (vlSelf->PSBnU8[1U] 
                                >> 0x1fU)) : 0U));
    vlSelf->PSNpVb = ((0xfU & (IData)(vlSelf->PSNpVb)) 
                      | (((0x32U == (0xffU & ((IData)(vlSelf->PSA7Nr) 
                                              >> 8U)))
                           ? ((1U & (IData)((vlSelf->PSR0xs 
                                             >> 0x3fU))) 
                              ^ (vlSelf->PSBnU8[3U] 
                                 >> 0x1fU)) : 0U) << 4U));
    vlSelf->PSgz1k = ((0xfcU & (IData)(vlSelf->PSgz1k)) 
                      | ((0x32U == (0xffU & ((IData)(vlSelf->PSUuec) 
                                             >> 8U)))
                          ? ((1U & (IData)((vlSelf->PSwlIr 
                                            >> 0xfU))) 
                             ^ (vlSelf->PS459u[0U] 
                                >> 0x1fU)) : 0U));
    vlSelf->PSgz1k = ((0xf3U & (IData)(vlSelf->PSgz1k)) 
                      | (((0x32U == (0xffU & ((IData)(vlSelf->PSUuec) 
                                              >> 8U)))
                           ? ((1U & (IData)((vlSelf->PSwlIr 
                                             >> 0x1fU))) 
                              ^ (vlSelf->PS459u[1U] 
                                 >> 0x1fU)) : 0U) << 2U));
    vlSelf->PSgz1k = ((0xcfU & (IData)(vlSelf->PSgz1k)) 
                      | (((0x32U == (0xffU & ((IData)(vlSelf->PSUuec) 
                                              >> 8U)))
                           ? ((1U & (IData)((vlSelf->PSwlIr 
                                             >> 0x2fU))) 
                              ^ (vlSelf->PS459u[2U] 
                                 >> 0x1fU)) : 0U) << 4U));
    vlSelf->PSgz1k = ((0x3fU & (IData)(vlSelf->PSgz1k)) 
                      | (((0x32U == (0xffU & ((IData)(vlSelf->PSUuec) 
                                              >> 8U)))
                           ? ((1U & (IData)((vlSelf->PSwlIr 
                                             >> 0x3fU))) 
                              ^ (vlSelf->PS459u[3U] 
                                 >> 0x1fU)) : 0U) << 6U));
    vlSelf->PSN87y = ((0xfeU & (IData)(vlSelf->PSN87y)) 
                      | ((0x32U == (vlSelf->PSAs7m[3U] 
                                    >> 0x18U)) & ((IData)(
                                                          (vlSelf->PS0f8n 
                                                           >> 7U)) 
                                                  ^ 
                                                  (vlSelf->PS2IeC[0U] 
                                                   >> 0xfU))));
    vlSelf->PSN87y = ((0xfdU & (IData)(vlSelf->PSN87y)) 
                      | (((0x32U == (vlSelf->PSAs7m[3U] 
                                     >> 0x18U)) << 1U) 
                         & (((IData)((vlSelf->PS0f8n 
                                      >> 0xfU)) << 1U) 
                            ^ (2U & (vlSelf->PS2IeC[0U] 
                                     >> 0x1eU)))));
    vlSelf->PSN87y = ((0xfbU & (IData)(vlSelf->PSN87y)) 
                      | (((0x32U == (vlSelf->PSAs7m[3U] 
                                     >> 0x18U)) << 2U) 
                         & (((IData)((vlSelf->PS0f8n 
                                      >> 0x17U)) << 2U) 
                            ^ (0x7fffcU & (vlSelf->PS2IeC[1U] 
                                           >> 0xdU)))));
    vlSelf->PSN87y = ((0xf7U & (IData)(vlSelf->PSN87y)) 
                      | (((0x32U == (vlSelf->PSAs7m[3U] 
                                     >> 0x18U)) << 3U) 
                         & (((IData)((vlSelf->PS0f8n 
                                      >> 0x1fU)) << 3U) 
                            ^ (8U & (vlSelf->PS2IeC[1U] 
                                     >> 0x1cU)))));
    vlSelf->PSN87y = ((0xefU & (IData)(vlSelf->PSN87y)) 
                      | (((0x32U == (vlSelf->PSAs7m[3U] 
                                     >> 0x18U)) << 4U) 
                         & (((IData)((vlSelf->PS0f8n 
                                      >> 0x27U)) << 4U) 
                            ^ (0x1ffff0U & (vlSelf->PS2IeC[2U] 
                                            >> 0xbU)))));
    vlSelf->PSN87y = ((0xdfU & (IData)(vlSelf->PSN87y)) 
                      | (((0x32U == (vlSelf->PSAs7m[3U] 
                                     >> 0x18U)) << 5U) 
                         & (((IData)((vlSelf->PS0f8n 
                                      >> 0x2fU)) << 5U) 
                            ^ (0x20U & (vlSelf->PS2IeC[2U] 
                                        >> 0x1aU)))));
    vlSelf->PSN87y = ((0xbfU & (IData)(vlSelf->PSN87y)) 
                      | (((0x32U == (vlSelf->PSAs7m[3U] 
                                     >> 0x18U)) << 6U) 
                         & (((IData)((vlSelf->PS0f8n 
                                      >> 0x37U)) << 6U) 
                            ^ (0x7fffc0U & (vlSelf->PS2IeC[3U] 
                                            >> 9U)))));
    vlSelf->PSN87y = ((0x7fU & (IData)(vlSelf->PSN87y)) 
                      | (((0x32U == (vlSelf->PSAs7m[3U] 
                                     >> 0x18U)) << 7U) 
                         & (((IData)((vlSelf->PS0f8n 
                                      >> 0x3fU)) << 7U) 
                            ^ (0x80U & (vlSelf->PS2IeC[3U] 
                                        >> 0x18U)))));
    PSM8W5[0U] = (IData)(vlSelf->PS0f8n);
    PSM8W5[1U] = (IData)((vlSelf->PS0f8n >> 0x20U));
    PSM8W5[2U] = (IData)(vlSelf->PSwlIr);
    PSM8W5[3U] = (IData)((vlSelf->PSwlIr >> 0x20U));
    PSM8W5[4U] = (IData)(vlSelf->PSR0xs);
    PSM8W5[5U] = (IData)((vlSelf->PSR0xs >> 0x20U));
    PSM8W5[6U] = (IData)(vlSelf->PSeaA1);
    PSM8W5[7U] = (IData)((vlSelf->PSeaA1 >> 0x20U));
    if ((0U == (IData)(vlSelf->PSGxx7))) {
        PSMhkE = (0xfffffffffffffULL & (0xfffffffffffffULL 
                                        & ((1U & (IData)(
                                                         (PSYWNl 
                                                          >> 0x35U)))
                                            ? (PSYWNl 
                                               >> 1U)
                                            : PSYWNl)));
        PSDVuq = (0x7ffU & ((IData)(vlSelf->PSgwKR) 
                            + (1U & (IData)((PSYWNl 
                                             >> 0x35U)))));
    } else {
        PSMhkE = (0xfffffffffffffULL & vlSelf->PSpCd6);
        PSDVuq = (0x7ffU & (IData)(vlSelf->PSgwKR));
    }
    if ((0U == (IData)(vlSelf->PSWBZR))) {
        PSRr3W = (0xfffffffffffffULL & (0xfffffffffffffULL 
                                        & ((1U & (IData)(
                                                         (PShmx5 
                                                          >> 0x35U)))
                                            ? (PShmx5 
                                               >> 1U)
                                            : PShmx5)));
        PSMCUL = (0x7ffU & ((IData)(vlSelf->PS95Ze) 
                            + (1U & (IData)((PShmx5 
                                             >> 0x35U)))));
    } else {
        PSRr3W = (0xfffffffffffffULL & vlSelf->PS5E7z);
        PSMCUL = (0x7ffU & (IData)(vlSelf->PS95Ze));
    }
    vlSelf->PSVsL9 = ((0x1cU & (IData)(vlSelf->PSVsL9)) 
                      | ((0xfffffffeU & (((1U <= (IData)(vlSelf->PSHLwh)) 
                                          << 1U) & (IData)(vlSelf->PSuuDe))) 
                         | (1U & (IData)(vlSelf->PSuuDe))));
    vlSelf->PSVsL9 = ((0x13U & (IData)(vlSelf->PSVsL9)) 
                      | ((0xfffffff8U & (((3U <= (IData)(vlSelf->PSHLwh)) 
                                          << 3U) & (IData)(vlSelf->PSuuDe))) 
                         | (0xfffffffcU & (((2U <= (IData)(vlSelf->PSHLwh)) 
                                            << 2U) 
                                           & (IData)(vlSelf->PSuuDe)))));
    vlSelf->PSVsL9 = ((0xfU & (IData)(vlSelf->PSVsL9)) 
                      | (0xfffffff0U & (((4U <= (IData)(vlSelf->PSHLwh)) 
                                         << 4U) & (IData)(vlSelf->PSuuDe))));
    vlSelf->PSfQaG = ((0x19U & (IData)(vlSelf->PSfQaG)) 
                      | ((0xfffffffcU & (((2U > (IData)(vlSelf->PSHLwh)) 
                                          << 2U) & (IData)(vlSelf->PSuuDe))) 
                         | (0xfffffffeU & (((1U > (IData)(vlSelf->PSHLwh)) 
                                            << 1U) 
                                           & (IData)(vlSelf->PSuuDe)))));
    vlSelf->PSfQaG = ((7U & (IData)(vlSelf->PSfQaG)) 
                      | ((0xfffffff0U & (((4U > (IData)(vlSelf->PSHLwh)) 
                                          << 4U) & (IData)(vlSelf->PSuuDe))) 
                         | (0xfffffff8U & (((3U > (IData)(vlSelf->PSHLwh)) 
                                            << 3U) 
                                           & (IData)(vlSelf->PSuuDe)))));
    vlSelf->PSI4gC = (1U & ((~ (IData)(vlSelf->PSuuDe)) 
                            | (((IData)(vlSelf->PSuuDe) 
                                >> 1U) & (IData)(vlSelf->PSHLwh))));
    vlSelf->PSEw5G = (1U & ((~ ((IData)(vlSelf->PSuuDe) 
                                >> 2U)) | (((IData)(vlSelf->PSuuDe) 
                                            >> 3U) 
                                           & (IData)(vlSelf->PSHLwh))));
    vlSelf->PSzWTA = ((0x67U & (IData)(vlSelf->PSzWTA)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSuuDe)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSuuDe)))) 
                                    << 3U)));
    vlSelf->PSzWTA = ((0x5fU & (IData)(vlSelf->PSzWTA)) 
                      | (0x20U & ((IData)(vlSelf->PSuuDe) 
                                  << 1U)));
    vlSelf->PSyCAB = ((0x1eU & (IData)(vlSelf->PSyCAB)) 
                      | (1U & (IData)(vlSelf->PSoqQV)));
    vlSelf->PSQSd4 = (1U & (((IData)(vlSelf->PSBPov) 
                             & (IData)(vlSelf->PSW6QD)) 
                            >> 1U));
    vlSelf->PSA9l1 = ((2U & (IData)(vlSelf->PSA9l1)) 
                      | (1U & (IData)(vlSelf->PSW6QD)));
    vlSelf->PShoi0 = (1U & (((IData)(vlSelf->PS4O1I) 
                             & (IData)(vlSelf->PS987A)) 
                            >> 1U));
    vlSelf->PSA9l1 = ((1U & (IData)(vlSelf->PSA9l1)) 
                      | (2U & (((IData)(vlSelf->PS987A) 
                                & (IData)(vlSelf->PSc7Ky)) 
                               << 1U)));
    vlSelf->PSqWsw = (1U & (((IData)(vlSelf->PSXObu) 
                             & (IData)(vlSelf->PSMeEs)) 
                            >> 1U));
    vlSelf->PSQ2ew = ((0xeU & (IData)(vlSelf->PSQ2ew)) 
                      | (1U & (IData)(vlSelf->PSMeEs)));
    vlSelf->PSS21c = (1U & (((IData)(vlSelf->PSB2rT) 
                             & (IData)(vlSelf->PS93Yk)) 
                            >> 1U));
    vlSelf->PSQ2ew = ((0xdU & (IData)(vlSelf->PSQ2ew)) 
                      | (2U & (((IData)(vlSelf->PS93Yk) 
                                & (IData)(vlSelf->PSqUZZ)) 
                               << 1U)));
    vlSelf->PSrza4 = (1U & (((IData)(vlSelf->PSOBEO) 
                             & (IData)(vlSelf->PSpIRH)) 
                            >> 1U));
    vlSelf->PSQ2ew = ((0xbU & (IData)(vlSelf->PSQ2ew)) 
                      | (4U & (((IData)(vlSelf->PSpIRH) 
                                & (IData)(vlSelf->PSqUZZ)) 
                               << 2U)));
    vlSelf->PS3ZPI = (1U & (((IData)(vlSelf->PSB8kK) 
                             & (IData)(vlSelf->PSw1eC)) 
                            >> 1U));
    vlSelf->PSQ2ew = ((7U & (IData)(vlSelf->PSQ2ew)) 
                      | (8U & (((IData)(vlSelf->PSw1eC) 
                                & (IData)(vlSelf->PSqUZZ)) 
                               << 3U)));
    vlSelf->PSw0u6 = ((IData)(vlSelf->PSx6g6) | (IData)(vlSelf->PSZSsL));
    vlSelf->PS9nyG = ((IData)(vlSelf->PSx6g6) | (IData)(vlSelf->PSZSsL));
    vlSelf->PSyYTL = (1U & (((IData)(vlSelf->PSAKNf) 
                             & (IData)(vlSelf->PSsZxE)) 
                            >> 2U));
    vlSelf->PSZqe1 = (1U & (((IData)(vlSelf->PSAKNf) 
                             & (IData)(vlSelf->PSsZxE)) 
                            >> 1U));
    vlSelf->PSBSBl = ((0xeU & (IData)(vlSelf->PSBSBl)) 
                      | (1U & (IData)(vlSelf->PSsZxE)));
    vlSelf->PSCGOY = ((IData)(vlSelf->PSpSxA) | (IData)(vlSelf->PSgnNm));
    vlSelf->PSLcAp = ((IData)(vlSelf->PSpSxA) | (IData)(vlSelf->PSgnNm));
    vlSelf->PSCOlS = (1U & (((IData)(vlSelf->PSfKVd) 
                             & (IData)(vlSelf->PSkD9M)) 
                            >> 2U));
    vlSelf->PSrBqy = (1U & (((IData)(vlSelf->PSfKVd) 
                             & (IData)(vlSelf->PSkD9M)) 
                            >> 1U));
    vlSelf->PSBSBl = ((0xdU & (IData)(vlSelf->PSBSBl)) 
                      | (2U & (((IData)(vlSelf->PSkD9M) 
                                << 1U) & (vlSelf->PSnEe7 
                                          >> 2U))));
    vlSelf->PS40SB = ((IData)(vlSelf->PS61yl) | (IData)(vlSelf->PSMg08));
    vlSelf->PSJIo7 = ((IData)(vlSelf->PS61yl) | (IData)(vlSelf->PSMg08));
    vlSelf->PSVlPi = (1U & (((IData)(vlSelf->PSP2KD) 
                             & (IData)(vlSelf->PSm6Ss)) 
                            >> 2U));
    vlSelf->PSLhuC = (1U & (((IData)(vlSelf->PSP2KD) 
                             & (IData)(vlSelf->PSm6Ss)) 
                            >> 1U));
    vlSelf->PSBSBl = ((0xbU & (IData)(vlSelf->PSBSBl)) 
                      | (4U & (((IData)(vlSelf->PSm6Ss) 
                                << 2U) & (vlSelf->PSnEe7 
                                          >> 1U))));
    vlSelf->PSwO9o = ((2U & (((IData)(vlSelf->PSwO9o) 
                              | (~ (IData)(vlSelf->PSJcnn))) 
                             << 1U)) | (0xfU == (IData)(vlSelf->PS18e3)));
    vlSelf->PSQsHA = ((2U & (((IData)(vlSelf->PSQsHA) 
                              | (~ (IData)(vlSelf->PSaaDx))) 
                             << 1U)) | (0xfU == (IData)(vlSelf->PS18e3)));
    vlSelf->PSl0ar = ((2U & (((IData)(vlSelf->PSl0ar) 
                              | (~ (IData)(vlSelf->PSWGcr))) 
                             << 1U)) | (0xfU == (IData)(vlSelf->PS18e3)));
    vlSelf->PS1NxK = ((2U & (((IData)(vlSelf->PS1NxK) 
                              | (~ (IData)(vlSelf->PSUKUo))) 
                             << 1U)) | (0xfU == (IData)(vlSelf->PS18e3)));
    vlSelf->PSwFd7 = ((IData)(vlSelf->PSYAsT) | (IData)(vlSelf->PSwGUw));
    vlSelf->PSSiVU = ((IData)(vlSelf->PSYAsT) | (IData)(vlSelf->PSwGUw));
    vlSelf->PSKVXT = (1U & (((IData)(vlSelf->PSpP0o) 
                             & (IData)(vlSelf->PSMPvY)) 
                            >> 2U));
    vlSelf->PST4br = (1U & (((IData)(vlSelf->PSpP0o) 
                             & (IData)(vlSelf->PSMPvY)) 
                            >> 1U));
    vlSelf->PSBSBl = ((7U & (IData)(vlSelf->PSBSBl)) 
                      | (8U & (((IData)(vlSelf->PSMPvY) 
                                << 3U) & vlSelf->PSnEe7)));
    if ((0U == (IData)(vlSelf->PSlW5r))) {
        PSkQzS = (0xfffffffffffffULL & (0xfffffffffffffULL 
                                        & ((1U & (IData)(
                                                         (PSgIS7 
                                                          >> 0x35U)))
                                            ? (PSgIS7 
                                               >> 1U)
                                            : PSgIS7)));
        PSI0aB = (0x7ffU & ((IData)(vlSelf->PSOG5d) 
                            + (1U & (IData)((PSgIS7 
                                             >> 0x35U)))));
    } else {
        PSkQzS = (0xfffffffffffffULL & vlSelf->PSEAgR);
        PSI0aB = (0x7ffU & (IData)(vlSelf->PSOG5d));
    }
    if ((0U == (IData)(vlSelf->PSPoPX))) {
        PSpSJh = (0xfffffffffffffULL & (0xfffffffffffffULL 
                                        & ((1U & (IData)(
                                                         (PS7bpI 
                                                          >> 0x35U)))
                                            ? (PS7bpI 
                                               >> 1U)
                                            : PS7bpI)));
        PSnciI = (0x7ffU & ((IData)(vlSelf->PSQScP) 
                            + (1U & (IData)((PS7bpI 
                                             >> 0x35U)))));
    } else {
        PSpSJh = (0xfffffffffffffULL & vlSelf->PSemIi);
        PSnciI = (0x7ffU & (IData)(vlSelf->PSQScP));
    }
    vlSelf->PSAkSs = ((0xfeU & (IData)(vlSelf->PSAkSs)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSAkSs)))));
    vlSelf->PSAkSs = ((0xfdU & (IData)(vlSelf->PSAkSs)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSAkSs)))) 
                         << 1U));
    vlSelf->PSAkSs = ((0xfbU & (IData)(vlSelf->PSAkSs)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSAkSs)))) 
                         << 2U));
    vlSelf->PSYYNq = ((0xfffff8U & vlSelf->PSYYNq) 
                      | (7U & ((2U & (IData)(vlSelf->PSAkSs))
                                ? (vlSelf->PSYYNq >> 3U)
                                : (vlSelf->PSYYNq >> 6U))));
    vlSelf->PSYYNq = ((0xffffc7U & vlSelf->PSYYNq) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSAkSs))
                                    ? (vlSelf->PSYYNq 
                                       >> 9U) : (vlSelf->PSYYNq 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSYYNq = ((0xfffe3fU & vlSelf->PSYYNq) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSAkSs))
                                     ? (vlSelf->PSYYNq 
                                        >> 0xfU) : 
                                    (vlSelf->PSYYNq 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSkT9R = ((0xfeU & (IData)(vlSelf->PSkT9R)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSkT9R)))));
    vlSelf->PSkT9R = ((0xfdU & (IData)(vlSelf->PSkT9R)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSkT9R)))) 
                         << 1U));
    vlSelf->PSkT9R = ((0xfbU & (IData)(vlSelf->PSkT9R)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSkT9R)))) 
                         << 2U));
    vlSelf->PSzlty = ((0xfffff8U & vlSelf->PSzlty) 
                      | (7U & ((2U & (IData)(vlSelf->PSkT9R))
                                ? (vlSelf->PSzlty >> 3U)
                                : (vlSelf->PSzlty >> 6U))));
    vlSelf->PSzlty = ((0xffffc7U & vlSelf->PSzlty) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSkT9R))
                                    ? (vlSelf->PSzlty 
                                       >> 9U) : (vlSelf->PSzlty 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSzlty = ((0xfffe3fU & vlSelf->PSzlty) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSkT9R))
                                     ? (vlSelf->PSzlty 
                                        >> 0xfU) : 
                                    (vlSelf->PSzlty 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSUzcW = ((0xfeU & (IData)(vlSelf->PSUzcW)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSUzcW)))));
    vlSelf->PSUzcW = ((0xfdU & (IData)(vlSelf->PSUzcW)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSUzcW)))) 
                         << 1U));
    vlSelf->PSUzcW = ((0xfbU & (IData)(vlSelf->PSUzcW)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSUzcW)))) 
                         << 2U));
    vlSelf->PSDVYu = ((0xfffff8U & vlSelf->PSDVYu) 
                      | (7U & ((2U & (IData)(vlSelf->PSUzcW))
                                ? (vlSelf->PSDVYu >> 3U)
                                : (vlSelf->PSDVYu >> 6U))));
    vlSelf->PSDVYu = ((0xffffc7U & vlSelf->PSDVYu) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSUzcW))
                                    ? (vlSelf->PSDVYu 
                                       >> 9U) : (vlSelf->PSDVYu 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSDVYu = ((0xfffe3fU & vlSelf->PSDVYu) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSUzcW))
                                     ? (vlSelf->PSDVYu 
                                        >> 0xfU) : 
                                    (vlSelf->PSDVYu 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSBXjD = ((0xfeU & (IData)(vlSelf->PSBXjD)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSBXjD)))));
    vlSelf->PSBXjD = ((0xfdU & (IData)(vlSelf->PSBXjD)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSBXjD)))) 
                         << 1U));
    vlSelf->PSBXjD = ((0xfbU & (IData)(vlSelf->PSBXjD)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSBXjD)))) 
                         << 2U));
    vlSelf->PSJlOh = ((0xfffff8U & vlSelf->PSJlOh) 
                      | (7U & ((2U & (IData)(vlSelf->PSBXjD))
                                ? (vlSelf->PSJlOh >> 3U)
                                : (vlSelf->PSJlOh >> 6U))));
    vlSelf->PSJlOh = ((0xffffc7U & vlSelf->PSJlOh) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSBXjD))
                                    ? (vlSelf->PSJlOh 
                                       >> 9U) : (vlSelf->PSJlOh 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSJlOh = ((0xfffe3fU & vlSelf->PSJlOh) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSBXjD))
                                     ? (vlSelf->PSJlOh 
                                        >> 0xfU) : 
                                    (vlSelf->PSJlOh 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSBdNp = ((0xfeU & (IData)(vlSelf->PSBdNp)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSBdNp)))));
    vlSelf->PSBdNp = ((0xfdU & (IData)(vlSelf->PSBdNp)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSBdNp)))) 
                         << 1U));
    vlSelf->PSBdNp = ((0xfbU & (IData)(vlSelf->PSBdNp)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSBdNp)))) 
                         << 2U));
    vlSelf->PSQuHJ = ((0xfffff8U & vlSelf->PSQuHJ) 
                      | (7U & ((2U & (IData)(vlSelf->PSBdNp))
                                ? (vlSelf->PSQuHJ >> 3U)
                                : (vlSelf->PSQuHJ >> 6U))));
    vlSelf->PSQuHJ = ((0xffffc7U & vlSelf->PSQuHJ) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSBdNp))
                                    ? (vlSelf->PSQuHJ 
                                       >> 9U) : (vlSelf->PSQuHJ 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSQuHJ = ((0xfffe3fU & vlSelf->PSQuHJ) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSBdNp))
                                     ? (vlSelf->PSQuHJ 
                                        >> 0xfU) : 
                                    (vlSelf->PSQuHJ 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSm9DJ = ((0xfeU & (IData)(vlSelf->PSm9DJ)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSm9DJ)))));
    vlSelf->PSm9DJ = ((0xfdU & (IData)(vlSelf->PSm9DJ)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSm9DJ)))) 
                         << 1U));
    vlSelf->PSm9DJ = ((0xfbU & (IData)(vlSelf->PSm9DJ)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSm9DJ)))) 
                         << 2U));
    vlSelf->PSvBIH = ((0xfffff8U & vlSelf->PSvBIH) 
                      | (7U & ((2U & (IData)(vlSelf->PSm9DJ))
                                ? (vlSelf->PSvBIH >> 3U)
                                : (vlSelf->PSvBIH >> 6U))));
    vlSelf->PSvBIH = ((0xffffc7U & vlSelf->PSvBIH) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSm9DJ))
                                    ? (vlSelf->PSvBIH 
                                       >> 9U) : (vlSelf->PSvBIH 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSvBIH = ((0xfffe3fU & vlSelf->PSvBIH) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSm9DJ))
                                     ? (vlSelf->PSvBIH 
                                        >> 0xfU) : 
                                    (vlSelf->PSvBIH 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS3ZBA = ((0xfeU & (IData)(vlSelf->PS3ZBA)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS3ZBA)))));
    vlSelf->PS3ZBA = ((0xfdU & (IData)(vlSelf->PS3ZBA)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS3ZBA)))) 
                         << 1U));
    vlSelf->PS3ZBA = ((0xfbU & (IData)(vlSelf->PS3ZBA)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS3ZBA)))) 
                         << 2U));
    vlSelf->PSeRsP = ((0xfffff8U & vlSelf->PSeRsP) 
                      | (7U & ((2U & (IData)(vlSelf->PS3ZBA))
                                ? (vlSelf->PSeRsP >> 3U)
                                : (vlSelf->PSeRsP >> 6U))));
    vlSelf->PSeRsP = ((0xffffc7U & vlSelf->PSeRsP) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS3ZBA))
                                    ? (vlSelf->PSeRsP 
                                       >> 9U) : (vlSelf->PSeRsP 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSeRsP = ((0xfffe3fU & vlSelf->PSeRsP) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS3ZBA))
                                     ? (vlSelf->PSeRsP 
                                        >> 0xfU) : 
                                    (vlSelf->PSeRsP 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSytzf = ((0xfeU & (IData)(vlSelf->PSytzf)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSytzf)))));
    vlSelf->PSytzf = ((0xfdU & (IData)(vlSelf->PSytzf)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSytzf)))) 
                         << 1U));
    vlSelf->PSytzf = ((0xfbU & (IData)(vlSelf->PSytzf)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSytzf)))) 
                         << 2U));
    vlSelf->PSuApV = ((0xfffff8U & vlSelf->PSuApV) 
                      | (7U & ((2U & (IData)(vlSelf->PSytzf))
                                ? (vlSelf->PSuApV >> 3U)
                                : (vlSelf->PSuApV >> 6U))));
    vlSelf->PSuApV = ((0xffffc7U & vlSelf->PSuApV) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSytzf))
                                    ? (vlSelf->PSuApV 
                                       >> 9U) : (vlSelf->PSuApV 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSuApV = ((0xfffe3fU & vlSelf->PSuApV) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSytzf))
                                     ? (vlSelf->PSuApV 
                                        >> 0xfU) : 
                                    (vlSelf->PSuApV 
                                     >> 0x12U)) << 6U)));
    vlSelf->PShbEE = ((0xfeU & (IData)(vlSelf->PShbEE)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PShbEE)))));
    vlSelf->PShbEE = ((0xfdU & (IData)(vlSelf->PShbEE)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PShbEE)))) 
                         << 1U));
    vlSelf->PShbEE = ((0xfbU & (IData)(vlSelf->PShbEE)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PShbEE)))) 
                         << 2U));
    vlSelf->PS4dPS = ((0xfffff8U & vlSelf->PS4dPS) 
                      | (7U & ((2U & (IData)(vlSelf->PShbEE))
                                ? (vlSelf->PS4dPS >> 3U)
                                : (vlSelf->PS4dPS >> 6U))));
    vlSelf->PS4dPS = ((0xffffc7U & vlSelf->PS4dPS) 
                      | (0x38U & (((8U & (IData)(vlSelf->PShbEE))
                                    ? (vlSelf->PS4dPS 
                                       >> 9U) : (vlSelf->PS4dPS 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PS4dPS = ((0xfffe3fU & vlSelf->PS4dPS) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PShbEE))
                                     ? (vlSelf->PS4dPS 
                                        >> 0xfU) : 
                                    (vlSelf->PS4dPS 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSJhFi = ((0xfeU & (IData)(vlSelf->PSJhFi)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSJhFi)))));
    vlSelf->PSJhFi = ((0xfdU & (IData)(vlSelf->PSJhFi)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSJhFi)))) 
                         << 1U));
    vlSelf->PSJhFi = ((0xfbU & (IData)(vlSelf->PSJhFi)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSJhFi)))) 
                         << 2U));
    vlSelf->PSPH4c = ((0xfffff8U & vlSelf->PSPH4c) 
                      | (7U & ((2U & (IData)(vlSelf->PSJhFi))
                                ? (vlSelf->PSPH4c >> 3U)
                                : (vlSelf->PSPH4c >> 6U))));
    vlSelf->PSPH4c = ((0xffffc7U & vlSelf->PSPH4c) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSJhFi))
                                    ? (vlSelf->PSPH4c 
                                       >> 9U) : (vlSelf->PSPH4c 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSPH4c = ((0xfffe3fU & vlSelf->PSPH4c) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSJhFi))
                                     ? (vlSelf->PSPH4c 
                                        >> 0xfU) : 
                                    (vlSelf->PSPH4c 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSsiIW = ((0xfeU & (IData)(vlSelf->PSsiIW)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSsiIW)))));
    vlSelf->PSsiIW = ((0xfdU & (IData)(vlSelf->PSsiIW)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSsiIW)))) 
                         << 1U));
    vlSelf->PSsiIW = ((0xfbU & (IData)(vlSelf->PSsiIW)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSsiIW)))) 
                         << 2U));
    vlSelf->PSieu9 = ((0xfffff8U & vlSelf->PSieu9) 
                      | (7U & ((2U & (IData)(vlSelf->PSsiIW))
                                ? (vlSelf->PSieu9 >> 3U)
                                : (vlSelf->PSieu9 >> 6U))));
    vlSelf->PSieu9 = ((0xffffc7U & vlSelf->PSieu9) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSsiIW))
                                    ? (vlSelf->PSieu9 
                                       >> 9U) : (vlSelf->PSieu9 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSieu9 = ((0xfffe3fU & vlSelf->PSieu9) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSsiIW))
                                     ? (vlSelf->PSieu9 
                                        >> 0xfU) : 
                                    (vlSelf->PSieu9 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS9JXe = ((0xfeU & (IData)(vlSelf->PS9JXe)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS9JXe)))));
    vlSelf->PS9JXe = ((0xfdU & (IData)(vlSelf->PS9JXe)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS9JXe)))) 
                         << 1U));
    vlSelf->PS9JXe = ((0xfbU & (IData)(vlSelf->PS9JXe)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS9JXe)))) 
                         << 2U));
    vlSelf->PSQ12Q = ((0xfffff8U & vlSelf->PSQ12Q) 
                      | (7U & ((2U & (IData)(vlSelf->PS9JXe))
                                ? (vlSelf->PSQ12Q >> 3U)
                                : (vlSelf->PSQ12Q >> 6U))));
    vlSelf->PSQ12Q = ((0xffffc7U & vlSelf->PSQ12Q) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS9JXe))
                                    ? (vlSelf->PSQ12Q 
                                       >> 9U) : (vlSelf->PSQ12Q 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSQ12Q = ((0xfffe3fU & vlSelf->PSQ12Q) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS9JXe))
                                     ? (vlSelf->PSQ12Q 
                                        >> 0xfU) : 
                                    (vlSelf->PSQ12Q 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSWfNg = ((0xfeU & (IData)(vlSelf->PSWfNg)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSWfNg)))));
    vlSelf->PSWfNg = ((0xfdU & (IData)(vlSelf->PSWfNg)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSWfNg)))) 
                         << 1U));
    vlSelf->PSWfNg = ((0xfbU & (IData)(vlSelf->PSWfNg)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSWfNg)))) 
                         << 2U));
    vlSelf->PSOGAg = ((0xfffff8U & vlSelf->PSOGAg) 
                      | (7U & ((2U & (IData)(vlSelf->PSWfNg))
                                ? (vlSelf->PSOGAg >> 3U)
                                : (vlSelf->PSOGAg >> 6U))));
    vlSelf->PSOGAg = ((0xffffc7U & vlSelf->PSOGAg) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSWfNg))
                                    ? (vlSelf->PSOGAg 
                                       >> 9U) : (vlSelf->PSOGAg 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSOGAg = ((0xfffe3fU & vlSelf->PSOGAg) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSWfNg))
                                     ? (vlSelf->PSOGAg 
                                        >> 0xfU) : 
                                    (vlSelf->PSOGAg 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSkW8N = ((0xfeU & (IData)(vlSelf->PSkW8N)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSkW8N)))));
    vlSelf->PSkW8N = ((0xfdU & (IData)(vlSelf->PSkW8N)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSkW8N)))) 
                         << 1U));
    vlSelf->PSkW8N = ((0xfbU & (IData)(vlSelf->PSkW8N)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSkW8N)))) 
                         << 2U));
    vlSelf->PSm5iQ = ((0xfffff8U & vlSelf->PSm5iQ) 
                      | (7U & ((2U & (IData)(vlSelf->PSkW8N))
                                ? (vlSelf->PSm5iQ >> 3U)
                                : (vlSelf->PSm5iQ >> 6U))));
    vlSelf->PSm5iQ = ((0xffffc7U & vlSelf->PSm5iQ) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSkW8N))
                                    ? (vlSelf->PSm5iQ 
                                       >> 9U) : (vlSelf->PSm5iQ 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSm5iQ = ((0xfffe3fU & vlSelf->PSm5iQ) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSkW8N))
                                     ? (vlSelf->PSm5iQ 
                                        >> 0xfU) : 
                                    (vlSelf->PSm5iQ 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSl0OU = ((0xfeU & (IData)(vlSelf->PSl0OU)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSl0OU)))));
    vlSelf->PSl0OU = ((0xfdU & (IData)(vlSelf->PSl0OU)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSl0OU)))) 
                         << 1U));
    vlSelf->PSl0OU = ((0xfbU & (IData)(vlSelf->PSl0OU)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSl0OU)))) 
                         << 2U));
    vlSelf->PS5oLo = ((0xfffff8U & vlSelf->PS5oLo) 
                      | (7U & ((2U & (IData)(vlSelf->PSl0OU))
                                ? (vlSelf->PS5oLo >> 3U)
                                : (vlSelf->PS5oLo >> 6U))));
    vlSelf->PS5oLo = ((0xffffc7U & vlSelf->PS5oLo) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSl0OU))
                                    ? (vlSelf->PS5oLo 
                                       >> 9U) : (vlSelf->PS5oLo 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PS5oLo = ((0xfffe3fU & vlSelf->PS5oLo) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSl0OU))
                                     ? (vlSelf->PS5oLo 
                                        >> 0xfU) : 
                                    (vlSelf->PS5oLo 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSC10B = ((0xfeU & (IData)(vlSelf->PSC10B)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSC10B)))));
    vlSelf->PSC10B = ((0xfdU & (IData)(vlSelf->PSC10B)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSC10B)))) 
                         << 1U));
    vlSelf->PSC10B = ((0xfbU & (IData)(vlSelf->PSC10B)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSC10B)))) 
                         << 2U));
    vlSelf->PSqtpI = ((0xfffff8U & vlSelf->PSqtpI) 
                      | (7U & ((2U & (IData)(vlSelf->PSC10B))
                                ? (vlSelf->PSqtpI >> 3U)
                                : (vlSelf->PSqtpI >> 6U))));
    vlSelf->PSqtpI = ((0xffffc7U & vlSelf->PSqtpI) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSC10B))
                                    ? (vlSelf->PSqtpI 
                                       >> 9U) : (vlSelf->PSqtpI 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSqtpI = ((0xfffe3fU & vlSelf->PSqtpI) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSC10B))
                                     ? (vlSelf->PSqtpI 
                                        >> 0xfU) : 
                                    (vlSelf->PSqtpI 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSe7Ho = ((0xfeU & (IData)(vlSelf->PSe7Ho)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSe7Ho)))));
    vlSelf->PSe7Ho = ((0xfdU & (IData)(vlSelf->PSe7Ho)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSe7Ho)))) 
                         << 1U));
    vlSelf->PSe7Ho = ((0xfbU & (IData)(vlSelf->PSe7Ho)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSe7Ho)))) 
                         << 2U));
    vlSelf->PSIez8 = ((0xfffff8U & vlSelf->PSIez8) 
                      | (7U & ((2U & (IData)(vlSelf->PSe7Ho))
                                ? (vlSelf->PSIez8 >> 3U)
                                : (vlSelf->PSIez8 >> 6U))));
    vlSelf->PSIez8 = ((0xffffc7U & vlSelf->PSIez8) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSe7Ho))
                                    ? (vlSelf->PSIez8 
                                       >> 9U) : (vlSelf->PSIez8 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSIez8 = ((0xfffe3fU & vlSelf->PSIez8) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSe7Ho))
                                     ? (vlSelf->PSIez8 
                                        >> 0xfU) : 
                                    (vlSelf->PSIez8 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSCws4 = ((0xfeU & (IData)(vlSelf->PSCws4)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSCws4)))));
    vlSelf->PSCws4 = ((0xfdU & (IData)(vlSelf->PSCws4)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSCws4)))) 
                         << 1U));
    vlSelf->PSCws4 = ((0xfbU & (IData)(vlSelf->PSCws4)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSCws4)))) 
                         << 2U));
    vlSelf->PShN1H = ((0xfffff8U & vlSelf->PShN1H) 
                      | (7U & ((2U & (IData)(vlSelf->PSCws4))
                                ? (vlSelf->PShN1H >> 3U)
                                : (vlSelf->PShN1H >> 6U))));
    vlSelf->PShN1H = ((0xffffc7U & vlSelf->PShN1H) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSCws4))
                                    ? (vlSelf->PShN1H 
                                       >> 9U) : (vlSelf->PShN1H 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PShN1H = ((0xfffe3fU & vlSelf->PShN1H) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSCws4))
                                     ? (vlSelf->PShN1H 
                                        >> 0xfU) : 
                                    (vlSelf->PShN1H 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSbbnw = ((0xfeU & (IData)(vlSelf->PSbbnw)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSbbnw)))));
    vlSelf->PSbbnw = ((0xfdU & (IData)(vlSelf->PSbbnw)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSbbnw)))) 
                         << 1U));
    vlSelf->PSbbnw = ((0xfbU & (IData)(vlSelf->PSbbnw)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSbbnw)))) 
                         << 2U));
    vlSelf->PS64UE = ((0xfffff8U & vlSelf->PS64UE) 
                      | (7U & ((2U & (IData)(vlSelf->PSbbnw))
                                ? (vlSelf->PS64UE >> 3U)
                                : (vlSelf->PS64UE >> 6U))));
    vlSelf->PS64UE = ((0xffffc7U & vlSelf->PS64UE) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSbbnw))
                                    ? (vlSelf->PS64UE 
                                       >> 9U) : (vlSelf->PS64UE 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PS64UE = ((0xfffe3fU & vlSelf->PS64UE) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSbbnw))
                                     ? (vlSelf->PS64UE 
                                        >> 0xfU) : 
                                    (vlSelf->PS64UE 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSj0On = ((0xfeU & (IData)(vlSelf->PSj0On)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSj0On)))));
    vlSelf->PSj0On = ((0xfdU & (IData)(vlSelf->PSj0On)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSj0On)))) 
                         << 1U));
    vlSelf->PSj0On = ((0xfbU & (IData)(vlSelf->PSj0On)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSj0On)))) 
                         << 2U));
    vlSelf->PSKlRa = ((0xfffff8U & vlSelf->PSKlRa) 
                      | (7U & ((2U & (IData)(vlSelf->PSj0On))
                                ? (vlSelf->PSKlRa >> 3U)
                                : (vlSelf->PSKlRa >> 6U))));
    vlSelf->PSKlRa = ((0xffffc7U & vlSelf->PSKlRa) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSj0On))
                                    ? (vlSelf->PSKlRa 
                                       >> 9U) : (vlSelf->PSKlRa 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSKlRa = ((0xfffe3fU & vlSelf->PSKlRa) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSj0On))
                                     ? (vlSelf->PSKlRa 
                                        >> 0xfU) : 
                                    (vlSelf->PSKlRa 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS4dKx = ((0xfeU & (IData)(vlSelf->PS4dKx)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS4dKx)))));
    vlSelf->PS4dKx = ((0xfdU & (IData)(vlSelf->PS4dKx)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS4dKx)))) 
                         << 1U));
    vlSelf->PS4dKx = ((0xfbU & (IData)(vlSelf->PS4dKx)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS4dKx)))) 
                         << 2U));
    vlSelf->PSf2C1 = ((0xfffff8U & vlSelf->PSf2C1) 
                      | (7U & ((2U & (IData)(vlSelf->PS4dKx))
                                ? (vlSelf->PSf2C1 >> 3U)
                                : (vlSelf->PSf2C1 >> 6U))));
    vlSelf->PSf2C1 = ((0xffffc7U & vlSelf->PSf2C1) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS4dKx))
                                    ? (vlSelf->PSf2C1 
                                       >> 9U) : (vlSelf->PSf2C1 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSf2C1 = ((0xfffe3fU & vlSelf->PSf2C1) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS4dKx))
                                     ? (vlSelf->PSf2C1 
                                        >> 0xfU) : 
                                    (vlSelf->PSf2C1 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS1OlZ = ((0xfeU & (IData)(vlSelf->PS1OlZ)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS1OlZ)))));
    vlSelf->PS1OlZ = ((0xfdU & (IData)(vlSelf->PS1OlZ)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS1OlZ)))) 
                         << 1U));
    vlSelf->PS1OlZ = ((0xfbU & (IData)(vlSelf->PS1OlZ)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS1OlZ)))) 
                         << 2U));
    vlSelf->PSwBDZ = ((0xfffff8U & vlSelf->PSwBDZ) 
                      | (7U & ((2U & (IData)(vlSelf->PS1OlZ))
                                ? (vlSelf->PSwBDZ >> 3U)
                                : (vlSelf->PSwBDZ >> 6U))));
    vlSelf->PSwBDZ = ((0xffffc7U & vlSelf->PSwBDZ) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS1OlZ))
                                    ? (vlSelf->PSwBDZ 
                                       >> 9U) : (vlSelf->PSwBDZ 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSwBDZ = ((0xfffe3fU & vlSelf->PSwBDZ) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS1OlZ))
                                     ? (vlSelf->PSwBDZ 
                                        >> 0xfU) : 
                                    (vlSelf->PSwBDZ 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSdHJk = ((0xfeU & (IData)(vlSelf->PSdHJk)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSdHJk)))));
    vlSelf->PSdHJk = ((0xfdU & (IData)(vlSelf->PSdHJk)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSdHJk)))) 
                         << 1U));
    vlSelf->PSdHJk = ((0xfbU & (IData)(vlSelf->PSdHJk)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSdHJk)))) 
                         << 2U));
    vlSelf->PSXDzr = ((0xfffff8U & vlSelf->PSXDzr) 
                      | (7U & ((2U & (IData)(vlSelf->PSdHJk))
                                ? (vlSelf->PSXDzr >> 3U)
                                : (vlSelf->PSXDzr >> 6U))));
    vlSelf->PSXDzr = ((0xffffc7U & vlSelf->PSXDzr) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSdHJk))
                                    ? (vlSelf->PSXDzr 
                                       >> 9U) : (vlSelf->PSXDzr 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSXDzr = ((0xfffe3fU & vlSelf->PSXDzr) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSdHJk))
                                     ? (vlSelf->PSXDzr 
                                        >> 0xfU) : 
                                    (vlSelf->PSXDzr 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS9z8O = ((0xfeU & (IData)(vlSelf->PS9z8O)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS9z8O)))));
    vlSelf->PS9z8O = ((0xfdU & (IData)(vlSelf->PS9z8O)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS9z8O)))) 
                         << 1U));
    vlSelf->PS9z8O = ((0xfbU & (IData)(vlSelf->PS9z8O)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS9z8O)))) 
                         << 2U));
    vlSelf->PSDEhp = ((0xfffff8U & vlSelf->PSDEhp) 
                      | (7U & ((2U & (IData)(vlSelf->PS9z8O))
                                ? (vlSelf->PSDEhp >> 3U)
                                : (vlSelf->PSDEhp >> 6U))));
    vlSelf->PSDEhp = ((0xffffc7U & vlSelf->PSDEhp) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS9z8O))
                                    ? (vlSelf->PSDEhp 
                                       >> 9U) : (vlSelf->PSDEhp 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSDEhp = ((0xfffe3fU & vlSelf->PSDEhp) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS9z8O))
                                     ? (vlSelf->PSDEhp 
                                        >> 0xfU) : 
                                    (vlSelf->PSDEhp 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSrQVQ = ((0xfeU & (IData)(vlSelf->PSrQVQ)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSrQVQ)))));
    vlSelf->PSrQVQ = ((0xfdU & (IData)(vlSelf->PSrQVQ)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSrQVQ)))) 
                         << 1U));
    vlSelf->PSrQVQ = ((0xfbU & (IData)(vlSelf->PSrQVQ)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSrQVQ)))) 
                         << 2U));
    vlSelf->PStxie = ((0xfffff8U & vlSelf->PStxie) 
                      | (7U & ((2U & (IData)(vlSelf->PSrQVQ))
                                ? (vlSelf->PStxie >> 3U)
                                : (vlSelf->PStxie >> 6U))));
    vlSelf->PStxie = ((0xffffc7U & vlSelf->PStxie) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSrQVQ))
                                    ? (vlSelf->PStxie 
                                       >> 9U) : (vlSelf->PStxie 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PStxie = ((0xfffe3fU & vlSelf->PStxie) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSrQVQ))
                                     ? (vlSelf->PStxie 
                                        >> 0xfU) : 
                                    (vlSelf->PStxie 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSIMdQ = ((0xfeU & (IData)(vlSelf->PSIMdQ)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSIMdQ)))));
    vlSelf->PSIMdQ = ((0xfdU & (IData)(vlSelf->PSIMdQ)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSIMdQ)))) 
                         << 1U));
    vlSelf->PSIMdQ = ((0xfbU & (IData)(vlSelf->PSIMdQ)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSIMdQ)))) 
                         << 2U));
    vlSelf->PSLCgE = ((0xfffff8U & vlSelf->PSLCgE) 
                      | (7U & ((2U & (IData)(vlSelf->PSIMdQ))
                                ? (vlSelf->PSLCgE >> 3U)
                                : (vlSelf->PSLCgE >> 6U))));
    vlSelf->PSLCgE = ((0xffffc7U & vlSelf->PSLCgE) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSIMdQ))
                                    ? (vlSelf->PSLCgE 
                                       >> 9U) : (vlSelf->PSLCgE 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSLCgE = ((0xfffe3fU & vlSelf->PSLCgE) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSIMdQ))
                                     ? (vlSelf->PSLCgE 
                                        >> 0xfU) : 
                                    (vlSelf->PSLCgE 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSLvAB = ((0xfeU & (IData)(vlSelf->PSLvAB)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSLvAB)))));
    vlSelf->PSLvAB = ((0xfdU & (IData)(vlSelf->PSLvAB)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSLvAB)))) 
                         << 1U));
    vlSelf->PSLvAB = ((0xfbU & (IData)(vlSelf->PSLvAB)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSLvAB)))) 
                         << 2U));
    vlSelf->PSTrvu = ((0xfffff8U & vlSelf->PSTrvu) 
                      | (7U & ((2U & (IData)(vlSelf->PSLvAB))
                                ? (vlSelf->PSTrvu >> 3U)
                                : (vlSelf->PSTrvu >> 6U))));
    vlSelf->PSTrvu = ((0xffffc7U & vlSelf->PSTrvu) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSLvAB))
                                    ? (vlSelf->PSTrvu 
                                       >> 9U) : (vlSelf->PSTrvu 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSTrvu = ((0xfffe3fU & vlSelf->PSTrvu) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSLvAB))
                                     ? (vlSelf->PSTrvu 
                                        >> 0xfU) : 
                                    (vlSelf->PSTrvu 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSVKpA = ((0xfeU & (IData)(vlSelf->PSVKpA)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSVKpA)))));
    vlSelf->PSVKpA = ((0xfdU & (IData)(vlSelf->PSVKpA)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSVKpA)))) 
                         << 1U));
    vlSelf->PSVKpA = ((0xfbU & (IData)(vlSelf->PSVKpA)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSVKpA)))) 
                         << 2U));
    vlSelf->PSXOZY = ((0xfffff8U & vlSelf->PSXOZY) 
                      | (7U & ((2U & (IData)(vlSelf->PSVKpA))
                                ? (vlSelf->PSXOZY >> 3U)
                                : (vlSelf->PSXOZY >> 6U))));
    vlSelf->PSXOZY = ((0xffffc7U & vlSelf->PSXOZY) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSVKpA))
                                    ? (vlSelf->PSXOZY 
                                       >> 9U) : (vlSelf->PSXOZY 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSXOZY = ((0xfffe3fU & vlSelf->PSXOZY) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSVKpA))
                                     ? (vlSelf->PSXOZY 
                                        >> 0xfU) : 
                                    (vlSelf->PSXOZY 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS5Hxs = ((0xfeU & (IData)(vlSelf->PS5Hxs)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS5Hxs)))));
    vlSelf->PS5Hxs = ((0xfdU & (IData)(vlSelf->PS5Hxs)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS5Hxs)))) 
                         << 1U));
    vlSelf->PS5Hxs = ((0xfbU & (IData)(vlSelf->PS5Hxs)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS5Hxs)))) 
                         << 2U));
    vlSelf->PSSbOh = ((0xfffff8U & vlSelf->PSSbOh) 
                      | (7U & ((2U & (IData)(vlSelf->PS5Hxs))
                                ? (vlSelf->PSSbOh >> 3U)
                                : (vlSelf->PSSbOh >> 6U))));
    vlSelf->PSSbOh = ((0xffffc7U & vlSelf->PSSbOh) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS5Hxs))
                                    ? (vlSelf->PSSbOh 
                                       >> 9U) : (vlSelf->PSSbOh 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSSbOh = ((0xfffe3fU & vlSelf->PSSbOh) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS5Hxs))
                                     ? (vlSelf->PSSbOh 
                                        >> 0xfU) : 
                                    (vlSelf->PSSbOh 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSRC6C = ((0xfeU & (IData)(vlSelf->PSRC6C)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSRC6C)))));
    vlSelf->PSRC6C = ((0xfdU & (IData)(vlSelf->PSRC6C)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSRC6C)))) 
                         << 1U));
    vlSelf->PSRC6C = ((0xfbU & (IData)(vlSelf->PSRC6C)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSRC6C)))) 
                         << 2U));
    vlSelf->PSQqJh = ((0xfffff8U & vlSelf->PSQqJh) 
                      | (7U & ((2U & (IData)(vlSelf->PSRC6C))
                                ? (vlSelf->PSQqJh >> 3U)
                                : (vlSelf->PSQqJh >> 6U))));
    vlSelf->PSQqJh = ((0xffffc7U & vlSelf->PSQqJh) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSRC6C))
                                    ? (vlSelf->PSQqJh 
                                       >> 9U) : (vlSelf->PSQqJh 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSQqJh = ((0xfffe3fU & vlSelf->PSQqJh) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSRC6C))
                                     ? (vlSelf->PSQqJh 
                                        >> 0xfU) : 
                                    (vlSelf->PSQqJh 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS57q6 = ((0xfeU & (IData)(vlSelf->PS57q6)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS57q6)))));
    vlSelf->PS57q6 = ((0xfdU & (IData)(vlSelf->PS57q6)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS57q6)))) 
                         << 1U));
    vlSelf->PS57q6 = ((0xfbU & (IData)(vlSelf->PS57q6)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS57q6)))) 
                         << 2U));
    vlSelf->PS5MBR = ((0xfffff8U & vlSelf->PS5MBR) 
                      | (7U & ((2U & (IData)(vlSelf->PS57q6))
                                ? (vlSelf->PS5MBR >> 3U)
                                : (vlSelf->PS5MBR >> 6U))));
    vlSelf->PS5MBR = ((0xffffc7U & vlSelf->PS5MBR) 
                      | (0x38U & (((8U & (IData)(vlSelf->PS57q6))
                                    ? (vlSelf->PS5MBR 
                                       >> 9U) : (vlSelf->PS5MBR 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PS5MBR = ((0xfffe3fU & vlSelf->PS5MBR) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PS57q6))
                                     ? (vlSelf->PS5MBR 
                                        >> 0xfU) : 
                                    (vlSelf->PS5MBR 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSot2R = ((0xfeU & (IData)(vlSelf->PSot2R)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSot2R)))));
    vlSelf->PSot2R = ((0xfdU & (IData)(vlSelf->PSot2R)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSot2R)))) 
                         << 1U));
    vlSelf->PSot2R = ((0xfbU & (IData)(vlSelf->PSot2R)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSot2R)))) 
                         << 2U));
    vlSelf->PSgHBa = ((0xfffff8U & vlSelf->PSgHBa) 
                      | (7U & ((2U & (IData)(vlSelf->PSot2R))
                                ? (vlSelf->PSgHBa >> 3U)
                                : (vlSelf->PSgHBa >> 6U))));
    vlSelf->PSgHBa = ((0xffffc7U & vlSelf->PSgHBa) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSot2R))
                                    ? (vlSelf->PSgHBa 
                                       >> 9U) : (vlSelf->PSgHBa 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSgHBa = ((0xfffe3fU & vlSelf->PSgHBa) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSot2R))
                                     ? (vlSelf->PSgHBa 
                                        >> 0xfU) : 
                                    (vlSelf->PSgHBa 
                                     >> 0x12U)) << 6U)));
    vlSelf->PS6O6l = ((2U & (IData)(vlSelf->PS6O6l)) 
                      | (1U & (((IData)(vlSelf->PS0BkJ) 
                                & (IData)(vlSelf->PSpJ9M)) 
                               & (IData)(vlSelf->PSpJ9M))));
    vlSelf->PS6O6l = ((1U & (IData)(vlSelf->PS6O6l)) 
                      | (2U & ((((IData)(vlSelf->PS0BkJ) 
                                 << 1U) & (IData)(vlSelf->PSpJ9M)) 
                               & ((~ (IData)(vlSelf->PSpJ9M)) 
                                  << 1U))));
    vlSelf->PSPnKa = ((2U & (IData)(vlSelf->PSPnKa)) 
                      | (1U & ((((IData)(vlSelf->PS0BkJ) 
                                 >> 1U) & (IData)(vlSelf->PSQbuR)) 
                               & (IData)(vlSelf->PSQbuR))));
    vlSelf->PSPnKa = ((1U & (IData)(vlSelf->PSPnKa)) 
                      | ((IData)(((2U == (2U & (IData)(vlSelf->PS0BkJ))) 
                                  & (2U == (3U & (IData)(vlSelf->PSQbuR))))) 
                         << 1U));
    vlSelf->PSx1in = ((2U & (IData)(vlSelf->PSx1in)) 
                      | (1U & ((((IData)(vlSelf->PS0BkJ) 
                                 >> 2U) & (IData)(vlSelf->PSKANg)) 
                               & (IData)(vlSelf->PSKANg))));
    vlSelf->PSx1in = ((1U & (IData)(vlSelf->PSx1in)) 
                      | ((IData)(((4U == (4U & (IData)(vlSelf->PS0BkJ))) 
                                  & (2U == (3U & (IData)(vlSelf->PSKANg))))) 
                         << 1U));
    vlSelf->PSWM5g = ((2U & (IData)(vlSelf->PSWM5g)) 
                      | (1U & ((((IData)(vlSelf->PS0BkJ) 
                                 >> 3U) & (IData)(vlSelf->PSSYm3)) 
                               & (IData)(vlSelf->PSSYm3))));
    vlSelf->PSWM5g = ((1U & (IData)(vlSelf->PSWM5g)) 
                      | ((IData)(((8U == (8U & (IData)(vlSelf->PS0BkJ))) 
                                  & (2U == (3U & (IData)(vlSelf->PSSYm3))))) 
                         << 1U));
    vlSelf->PSsRZA = ((2U & (IData)(vlSelf->PSsRZA)) 
                      | (1U & ((((IData)(vlSelf->PS0BkJ) 
                                 >> 4U) & (IData)(vlSelf->PSD0ZB)) 
                               & (IData)(vlSelf->PSD0ZB))));
    vlSelf->PSsRZA = ((1U & (IData)(vlSelf->PSsRZA)) 
                      | ((IData)(((0x10U == (0x10U 
                                             & (IData)(vlSelf->PS0BkJ))) 
                                  & (2U == (3U & (IData)(vlSelf->PSD0ZB))))) 
                         << 1U));
    vlSelf->PS0m0L = ((2U & (IData)(vlSelf->PS0m0L)) 
                      | (1U & ((((IData)(vlSelf->PS0BkJ) 
                                 >> 5U) & (IData)(vlSelf->PStQkR)) 
                               & (IData)(vlSelf->PStQkR))));
    vlSelf->PS0m0L = ((1U & (IData)(vlSelf->PS0m0L)) 
                      | ((IData)(((0x20U == (0x20U 
                                             & (IData)(vlSelf->PS0BkJ))) 
                                  & (2U == (3U & (IData)(vlSelf->PStQkR))))) 
                         << 1U));
    vlSelf->PSg9EB = ((2U & (IData)(vlSelf->PSg9EB)) 
                      | (1U & ((((IData)(vlSelf->PS0BkJ) 
                                 >> 6U) & (IData)(vlSelf->PStleI)) 
                               & (IData)(vlSelf->PStleI))));
    vlSelf->PSg9EB = ((1U & (IData)(vlSelf->PSg9EB)) 
                      | ((IData)(((0x40U == (0x40U 
                                             & (IData)(vlSelf->PS0BkJ))) 
                                  & (2U == (3U & (IData)(vlSelf->PStleI))))) 
                         << 1U));
    vlSelf->PSB6OQ = ((2U & (IData)(vlSelf->PSB6OQ)) 
                      | (1U & ((((IData)(vlSelf->PS0BkJ) 
                                 >> 7U) & (IData)(vlSelf->PSo0rd)) 
                               & (IData)(vlSelf->PSo0rd))));
    vlSelf->PSB6OQ = ((1U & (IData)(vlSelf->PSB6OQ)) 
                      | ((IData)(((0x80U == (0x80U 
                                             & (IData)(vlSelf->PS0BkJ))) 
                                  & (2U == (3U & (IData)(vlSelf->PSo0rd))))) 
                         << 1U));
    vlSelf->PSUBNZ[0U] = (IData)((((QData)((IData)(
                                                   vlSelf->PS4KIE[2U])) 
                                   << 0x3dU) | (((QData)((IData)(
                                                                 vlSelf->PS4KIE[1U])) 
                                                 << 0x1dU) 
                                                | ((QData)((IData)(
                                                                   vlSelf->PS4KIE[0U])) 
                                                   >> 3U))));
    vlSelf->PSUBNZ[1U] = (IData)(((((QData)((IData)(
                                                    vlSelf->PS4KIE[2U])) 
                                    << 0x3dU) | (((QData)((IData)(
                                                                  vlSelf->PS4KIE[1U])) 
                                                  << 0x1dU) 
                                                 | ((QData)((IData)(
                                                                    vlSelf->PS4KIE[0U])) 
                                                    >> 3U))) 
                                  >> 0x20U));
    vlSelf->PSUBNZ[2U] = (IData)((((QData)((IData)(
                                                   vlSelf->PSqzoh[2U])) 
                                   << 0x3dU) | (((QData)((IData)(
                                                                 vlSelf->PSqzoh[1U])) 
                                                 << 0x1dU) 
                                                | ((QData)((IData)(
                                                                   vlSelf->PSqzoh[0U])) 
                                                   >> 3U))));
    vlSelf->PSUBNZ[3U] = (IData)(((((QData)((IData)(
                                                    vlSelf->PSqzoh[2U])) 
                                    << 0x3dU) | (((QData)((IData)(
                                                                  vlSelf->PSqzoh[1U])) 
                                                  << 0x1dU) 
                                                 | ((QData)((IData)(
                                                                    vlSelf->PSqzoh[0U])) 
                                                    >> 3U))) 
                                  >> 0x20U));
    vlSelf->PSUBNZ[4U] = (IData)((((QData)((IData)(
                                                   vlSelf->PSgOUn[2U])) 
                                   << 0x3dU) | (((QData)((IData)(
                                                                 vlSelf->PSgOUn[1U])) 
                                                 << 0x1dU) 
                                                | ((QData)((IData)(
                                                                   vlSelf->PSgOUn[0U])) 
                                                   >> 3U))));
    vlSelf->PSUBNZ[5U] = (IData)(((((QData)((IData)(
                                                    vlSelf->PSgOUn[2U])) 
                                    << 0x3dU) | (((QData)((IData)(
                                                                  vlSelf->PSgOUn[1U])) 
                                                  << 0x1dU) 
                                                 | ((QData)((IData)(
                                                                    vlSelf->PSgOUn[0U])) 
                                                    >> 3U))) 
                                  >> 0x20U));
    vlSelf->PSUBNZ[6U] = (IData)((((QData)((IData)(
                                                   vlSelf->PSBgWC[2U])) 
                                   << 0x3dU) | (((QData)((IData)(
                                                                 vlSelf->PSBgWC[1U])) 
                                                 << 0x1dU) 
                                                | ((QData)((IData)(
                                                                   vlSelf->PSBgWC[0U])) 
                                                   >> 3U))));
    vlSelf->PSUBNZ[7U] = (IData)(((((QData)((IData)(
                                                    vlSelf->PSBgWC[2U])) 
                                    << 0x3dU) | (((QData)((IData)(
                                                                  vlSelf->PSBgWC[1U])) 
                                                  << 0x1dU) 
                                                 | ((QData)((IData)(
                                                                    vlSelf->PSBgWC[0U])) 
                                                    >> 3U))) 
                                  >> 0x20U));
    vlSelf->PSUBNZ[8U] = (IData)((((QData)((IData)(
                                                   vlSelf->PSdewH[2U])) 
                                   << 0x3dU) | (((QData)((IData)(
                                                                 vlSelf->PSdewH[1U])) 
                                                 << 0x1dU) 
                                                | ((QData)((IData)(
                                                                   vlSelf->PSdewH[0U])) 
                                                   >> 3U))));
    vlSelf->PSUBNZ[9U] = (IData)(((((QData)((IData)(
                                                    vlSelf->PSdewH[2U])) 
                                    << 0x3dU) | (((QData)((IData)(
                                                                  vlSelf->PSdewH[1U])) 
                                                  << 0x1dU) 
                                                 | ((QData)((IData)(
                                                                    vlSelf->PSdewH[0U])) 
                                                    >> 3U))) 
                                  >> 0x20U));
    vlSelf->PSUBNZ[0xaU] = (IData)((((QData)((IData)(
                                                     vlSelf->PSA6Fz[2U])) 
                                     << 0x3dU) | (((QData)((IData)(
                                                                   vlSelf->PSA6Fz[1U])) 
                                                   << 0x1dU) 
                                                  | ((QData)((IData)(
                                                                     vlSelf->PSA6Fz[0U])) 
                                                     >> 3U))));
    vlSelf->PSUBNZ[0xbU] = (IData)(((((QData)((IData)(
                                                      vlSelf->PSA6Fz[2U])) 
                                      << 0x3dU) | (
                                                   ((QData)((IData)(
                                                                    vlSelf->PSA6Fz[1U])) 
                                                    << 0x1dU) 
                                                   | ((QData)((IData)(
                                                                      vlSelf->PSA6Fz[0U])) 
                                                      >> 3U))) 
                                    >> 0x20U));
    vlSelf->PSUBNZ[0xcU] = (IData)((((QData)((IData)(
                                                     vlSelf->PSliR7[2U])) 
                                     << 0x3dU) | (((QData)((IData)(
                                                                   vlSelf->PSliR7[1U])) 
                                                   << 0x1dU) 
                                                  | ((QData)((IData)(
                                                                     vlSelf->PSliR7[0U])) 
                                                     >> 3U))));
    vlSelf->PSUBNZ[0xdU] = (IData)(((((QData)((IData)(
                                                      vlSelf->PSliR7[2U])) 
                                      << 0x3dU) | (
                                                   ((QData)((IData)(
                                                                    vlSelf->PSliR7[1U])) 
                                                    << 0x1dU) 
                                                   | ((QData)((IData)(
                                                                      vlSelf->PSliR7[0U])) 
                                                      >> 3U))) 
                                    >> 0x20U));
    vlSelf->PSUBNZ[0xeU] = (IData)((((QData)((IData)(
                                                     vlSelf->PSi6UA[2U])) 
                                     << 0x3dU) | (((QData)((IData)(
                                                                   vlSelf->PSi6UA[1U])) 
                                                   << 0x1dU) 
                                                  | ((QData)((IData)(
                                                                     vlSelf->PSi6UA[0U])) 
                                                     >> 3U))));
    vlSelf->PSUBNZ[0xfU] = (IData)(((((QData)((IData)(
                                                      vlSelf->PSi6UA[2U])) 
                                      << 0x3dU) | (
                                                   ((QData)((IData)(
                                                                    vlSelf->PSi6UA[1U])) 
                                                    << 0x1dU) 
                                                   | ((QData)((IData)(
                                                                      vlSelf->PSi6UA[0U])) 
                                                      >> 3U))) 
                                    >> 0x20U));
    vlSelf->PSUBNZ[0x10U] = (IData)((((QData)((IData)(
                                                      vlSelf->PS8QU9[2U])) 
                                      << 0x3dU) | (
                                                   ((QData)((IData)(
                                                                    vlSelf->PS8QU9[1U])) 
                                                    << 0x1dU) 
                                                   | ((QData)((IData)(
                                                                      vlSelf->PS8QU9[0U])) 
                                                      >> 3U))));
    vlSelf->PSUBNZ[0x11U] = (IData)(((((QData)((IData)(
                                                       vlSelf->PS8QU9[2U])) 
                                       << 0x3dU) | 
                                      (((QData)((IData)(
                                                        vlSelf->PS8QU9[1U])) 
                                        << 0x1dU) | 
                                       ((QData)((IData)(
                                                        vlSelf->PS8QU9[0U])) 
                                        >> 3U))) >> 0x20U));
    vlSelf->PS0Drm = ((((0x32U == (0xffU & ((IData)(vlSelf->PSySzu) 
                                            >> 8U)))
                         ? ((1U & (IData)((vlSelf->PSeaA1 
                                           >> 0x3fU))) 
                            ^ (vlSelf->PSQ2ue[3U] >> 0x1fU))
                         : 0U) << 0x18U) | (((IData)(vlSelf->PSNpVb) 
                                             << 0x10U) 
                                            | (((IData)(vlSelf->PSgz1k) 
                                                << 8U) 
                                               | (IData)(vlSelf->PSN87y))));
    vlSelf->PSen7o = (((QData)((IData)(PSM8W5[(((IData)(0x3fU) 
                                                + (0xc0U 
                                                   & (vlSelf->PS92kA[0U] 
                                                      << 3U))) 
                                               >> 5U)])) 
                       << 0x20U) | (QData)((IData)(
                                                   PSM8W5[
                                                   (6U 
                                                    & (vlSelf->PS92kA[0U] 
                                                       >> 2U))])));
    vlSelf->PSoVnC = ((0U == (IData)(vlSelf->PSsAnP))
                       ? (0xffffffff00000000ULL | (QData)((IData)(
                                                                  (((IData)(vlSelf->PSMQYE) 
                                                                    << 0x1fU) 
                                                                   | ((0x7f800000U 
                                                                       & ((IData)(PSDVuq) 
                                                                          << 0x17U)) 
                                                                      | (0x7fffffU 
                                                                         & (IData)(
                                                                                (PSMhkE 
                                                                                >> 0x1dU))))))))
                       : ((1U == (IData)(vlSelf->PSsAnP))
                           ? (((QData)((IData)(vlSelf->PSMQYE)) 
                               << 0x3fU) | (((QData)((IData)(PSDVuq)) 
                                             << 0x34U) 
                                            | PSMhkE))
                           : ((2U == (IData)(vlSelf->PSsAnP))
                               ? (0xffffffffffff0000ULL 
                                  | (QData)((IData)(
                                                    (((IData)(vlSelf->PSMQYE) 
                                                      << 0xfU) 
                                                     | ((0x7c00U 
                                                         & ((IData)(PSDVuq) 
                                                            << 0xaU)) 
                                                        | (0x3ffU 
                                                           & (IData)(
                                                                     (PSMhkE 
                                                                      >> 0x2aU))))))))
                               : (0xffffffffffff0000ULL 
                                  | (QData)((IData)(
                                                    (((IData)(vlSelf->PSMQYE) 
                                                      << 0xfU) 
                                                     | ((0x7f80U 
                                                         & ((IData)(PSDVuq) 
                                                            << 7U)) 
                                                        | (0x7fU 
                                                           & (IData)(
                                                                     (PSMhkE 
                                                                      >> 0x2dU)))))))))));
    vlSelf->PSVhtn = ((0U == (IData)(vlSelf->PSCDcf))
                       ? (0xffffffff00000000ULL | (QData)((IData)(
                                                                  (((IData)(vlSelf->PSB9J6) 
                                                                    << 0x1fU) 
                                                                   | ((0x7f800000U 
                                                                       & ((IData)(PSMCUL) 
                                                                          << 0x17U)) 
                                                                      | (0x7fffffU 
                                                                         & (IData)(
                                                                                (PSRr3W 
                                                                                >> 0x1dU))))))))
                       : ((1U == (IData)(vlSelf->PSCDcf))
                           ? (((QData)((IData)(vlSelf->PSB9J6)) 
                               << 0x3fU) | (((QData)((IData)(PSMCUL)) 
                                             << 0x34U) 
                                            | PSRr3W))
                           : ((2U == (IData)(vlSelf->PSCDcf))
                               ? (0xffffffffffff0000ULL 
                                  | (QData)((IData)(
                                                    (((IData)(vlSelf->PSB9J6) 
                                                      << 0xfU) 
                                                     | ((0x7c00U 
                                                         & ((IData)(PSMCUL) 
                                                            << 0xaU)) 
                                                        | (0x3ffU 
                                                           & (IData)(
                                                                     (PSRr3W 
                                                                      >> 0x2aU))))))))
                               : (0xffffffffffff0000ULL 
                                  | (QData)((IData)(
                                                    (((IData)(vlSelf->PSB9J6) 
                                                      << 0xfU) 
                                                     | ((0x7f80U 
                                                         & ((IData)(PSMCUL) 
                                                            << 7U)) 
                                                        | (0x7fU 
                                                           & (IData)(
                                                                     (PSRr3W 
                                                                      >> 0x2dU)))))))))));
    PSQR7J = (1U & (IData)(vlSelf->PSVsL9));
    vlSelf->PSTRcI = ((0x1eU & (IData)(vlSelf->PSTRcI)) 
                      | (IData)(PSQR7J));
    PSQR7J = (1U & ((IData)(vlSelf->PSVsL9) >> 1U));
    vlSelf->PSTRcI = ((0x1dU & (IData)(vlSelf->PSTRcI)) 
                      | ((IData)(PSQR7J) << 1U));
    PSQR7J = (1U & ((IData)(vlSelf->PSVsL9) >> 2U));
    vlSelf->PSTRcI = ((0x1bU & (IData)(vlSelf->PSTRcI)) 
                      | ((IData)(PSQR7J) << 2U));
    PSQR7J = (1U & ((IData)(vlSelf->PSVsL9) >> 3U));
    vlSelf->PSTRcI = ((0x17U & (IData)(vlSelf->PSTRcI)) 
                      | ((IData)(PSQR7J) << 3U));
    PSQR7J = (1U & ((IData)(vlSelf->PSVsL9) >> 4U));
    vlSelf->PSTRcI = ((0xfU & (IData)(vlSelf->PSTRcI)) 
                      | ((IData)(PSQR7J) << 4U));
    PSFk3s = (1U & (IData)(vlSelf->PSfQaG));
    vlSelf->PSW7LG = ((0x1eU & (IData)(vlSelf->PSW7LG)) 
                      | (IData)(PSFk3s));
    PSFk3s = (1U & ((IData)(vlSelf->PSfQaG) >> 1U));
    vlSelf->PSW7LG = ((0x1dU & (IData)(vlSelf->PSW7LG)) 
                      | ((IData)(PSFk3s) << 1U));
    PSFk3s = (1U & ((IData)(vlSelf->PSfQaG) >> 2U));
    vlSelf->PSW7LG = ((0x1bU & (IData)(vlSelf->PSW7LG)) 
                      | ((IData)(PSFk3s) << 2U));
    PSFk3s = (1U & ((IData)(vlSelf->PSfQaG) >> 3U));
    vlSelf->PSW7LG = ((0x17U & (IData)(vlSelf->PSW7LG)) 
                      | ((IData)(PSFk3s) << 3U));
    PSFk3s = (1U & ((IData)(vlSelf->PSfQaG) >> 4U));
    vlSelf->PSW7LG = ((0xfU & (IData)(vlSelf->PSW7LG)) 
                      | ((IData)(PSFk3s) << 4U));
    vlSelf->PSm31i[7U] = ((0x3ffU & vlSelf->PSm31i[7U]) 
                          | (((IData)(vlSelf->PSI4gC)
                               ? ((vlSelf->PS7Vxv[3U] 
                                   << 0x12U) | (vlSelf->PS7Vxv[2U] 
                                                >> 0xeU))
                               : vlSelf->PS7Vxv[0U]) 
                             << 0xaU));
    vlSelf->PSm31i[8U] = ((((IData)(vlSelf->PSI4gC)
                             ? ((vlSelf->PS7Vxv[3U] 
                                 << 0x12U) | (vlSelf->PS7Vxv[2U] 
                                              >> 0xeU))
                             : vlSelf->PS7Vxv[0U]) 
                           >> 0x16U) | (((IData)(vlSelf->PSI4gC)
                                          ? ((vlSelf->PS7Vxv[4U] 
                                              << 0x12U) 
                                             | (vlSelf->PS7Vxv[3U] 
                                                >> 0xeU))
                                          : vlSelf->PS7Vxv[1U]) 
                                        << 0xaU));
    vlSelf->PSm31i[9U] = ((((IData)(vlSelf->PSI4gC)
                             ? ((vlSelf->PS7Vxv[4U] 
                                 << 0x12U) | (vlSelf->PS7Vxv[3U] 
                                              >> 0xeU))
                             : vlSelf->PS7Vxv[1U]) 
                           >> 0x16U) | ((((IData)(vlSelf->PSEw5G)
                                           ? ((vlSelf->PS7Vxv[8U] 
                                               << 0x16U) 
                                              | (vlSelf->PS7Vxv[7U] 
                                                 >> 0xaU))
                                           : ((vlSelf->PS7Vxv[5U] 
                                               << 4U) 
                                              | (vlSelf->PS7Vxv[4U] 
                                                 >> 0x1cU))) 
                                         << 0x18U) 
                                        | (0xfffc00U 
                                           & (((IData)(vlSelf->PSI4gC)
                                                ? (
                                                   (vlSelf->PS7Vxv[5U] 
                                                    << 0x12U) 
                                                   | (vlSelf->PS7Vxv[4U] 
                                                      >> 0xeU))
                                                : vlSelf->PS7Vxv[2U]) 
                                              << 0xaU))));
    vlSelf->PSm31i[0xaU] = ((0x3ffU & (((IData)(vlSelf->PSEw5G)
                                         ? ((vlSelf->PS7Vxv[8U] 
                                             << 0x16U) 
                                            | (vlSelf->PS7Vxv[7U] 
                                               >> 0xaU))
                                         : ((vlSelf->PS7Vxv[5U] 
                                             << 4U) 
                                            | (vlSelf->PS7Vxv[4U] 
                                               >> 0x1cU))) 
                                       >> 8U)) | ((0xfffc00U 
                                                   & (((IData)(vlSelf->PSEw5G)
                                                        ? 
                                                       ((vlSelf->PS7Vxv[8U] 
                                                         << 0x16U) 
                                                        | (vlSelf->PS7Vxv[7U] 
                                                           >> 0xaU))
                                                        : 
                                                       ((vlSelf->PS7Vxv[5U] 
                                                         << 4U) 
                                                        | (vlSelf->PS7Vxv[4U] 
                                                           >> 0x1cU))) 
                                                      >> 8U)) 
                                                  | (((IData)(vlSelf->PSEw5G)
                                                       ? 
                                                      ((vlSelf->PS7Vxv[9U] 
                                                        << 0x16U) 
                                                       | (vlSelf->PS7Vxv[8U] 
                                                          >> 0xaU))
                                                       : 
                                                      ((vlSelf->PS7Vxv[6U] 
                                                        << 4U) 
                                                       | (vlSelf->PS7Vxv[5U] 
                                                          >> 0x1cU))) 
                                                     << 0x18U)));
    vlSelf->PSm31i[0xbU] = ((0x3ffU & (((IData)(vlSelf->PSEw5G)
                                         ? ((vlSelf->PS7Vxv[9U] 
                                             << 0x16U) 
                                            | (vlSelf->PS7Vxv[8U] 
                                               >> 0xaU))
                                         : ((vlSelf->PS7Vxv[6U] 
                                             << 4U) 
                                            | (vlSelf->PS7Vxv[5U] 
                                               >> 0x1cU))) 
                                       >> 8U)) | ((0xfffc00U 
                                                   & (((IData)(vlSelf->PSEw5G)
                                                        ? 
                                                       ((vlSelf->PS7Vxv[9U] 
                                                         << 0x16U) 
                                                        | (vlSelf->PS7Vxv[8U] 
                                                           >> 0xaU))
                                                        : 
                                                       ((vlSelf->PS7Vxv[6U] 
                                                         << 4U) 
                                                        | (vlSelf->PS7Vxv[5U] 
                                                           >> 0x1cU))) 
                                                      >> 8U)) 
                                                  | (((IData)(vlSelf->PSEw5G)
                                                       ? 
                                                      ((vlSelf->PS7Vxv[0xaU] 
                                                        << 0x16U) 
                                                       | (vlSelf->PS7Vxv[9U] 
                                                          >> 0xaU))
                                                       : 
                                                      ((vlSelf->PS7Vxv[7U] 
                                                        << 4U) 
                                                       | (vlSelf->PS7Vxv[6U] 
                                                          >> 0x1cU))) 
                                                     << 0x18U)));
    vlSelf->PSm31i[0xcU] = ((0xffffffc0U & vlSelf->PSm31i[0xcU]) 
                            | (0x3fU & (((IData)(vlSelf->PSEw5G)
                                          ? ((vlSelf->PS7Vxv[0xaU] 
                                              << 0x16U) 
                                             | (vlSelf->PS7Vxv[9U] 
                                                >> 0xaU))
                                          : ((vlSelf->PS7Vxv[7U] 
                                              << 4U) 
                                             | (vlSelf->PS7Vxv[6U] 
                                                >> 0x1cU))) 
                                        >> 8U)));
    vlSelf->PSzWTA = ((0x7eU & (IData)(vlSelf->PSzWTA)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSzWTA)))));
    vlSelf->PSzWTA = ((0x7dU & (IData)(vlSelf->PSzWTA)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSzWTA)))) 
                         << 1U));
    vlSelf->PSzWTA = ((0x7bU & (IData)(vlSelf->PSzWTA)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSzWTA)))) 
                         << 2U));
    vlSelf->PSXvg7 = (1U & ((~ ((IData)(vlSelf->PSzWTA) 
                                >> 1U)) | (((IData)(vlSelf->PSzWTA) 
                                            >> 2U) 
                                           & ((IData)(vlSelf->PSHLwh) 
                                              >> 2U))));
    vlSelf->PSa62I = (1U & ((~ ((IData)(vlSelf->PSzWTA) 
                                >> 3U)) | (((IData)(vlSelf->PSzWTA) 
                                            >> 4U) 
                                           & ((IData)(vlSelf->PSHLwh) 
                                              >> 1U))));
    vlSelf->PSITjc = (1U & ((~ ((IData)(vlSelf->PSzWTA) 
                                >> 5U)) | (((IData)(vlSelf->PSzWTA) 
                                            >> 6U) 
                                           & ((IData)(vlSelf->PSHLwh) 
                                              >> 1U))));
    vlSelf->PSV4W5 = ((0xbU & (IData)(vlSelf->PSV4W5)) 
                      | (4U & ((IData)(vlSelf->PSzWTA) 
                               << 2U)));
    vlSelf->PSTXbQ = ((0x1cU & (IData)(vlSelf->PSTXbQ)) 
                      | ((0xfffffffeU & (((1U <= (IData)(vlSelf->PSs7NB)) 
                                          << 1U) & (IData)(vlSelf->PSyCAB))) 
                         | (1U & (IData)(vlSelf->PSyCAB))));
    vlSelf->PSTXbQ = ((0x13U & (IData)(vlSelf->PSTXbQ)) 
                      | ((0xfffffff8U & (((3U <= (IData)(vlSelf->PSs7NB)) 
                                          << 3U) & (IData)(vlSelf->PSyCAB))) 
                         | (0xfffffffcU & (((2U <= (IData)(vlSelf->PSs7NB)) 
                                            << 2U) 
                                           & (IData)(vlSelf->PSyCAB)))));
    vlSelf->PSTXbQ = ((0xfU & (IData)(vlSelf->PSTXbQ)) 
                      | (0xfffffff0U & (((4U <= (IData)(vlSelf->PSs7NB)) 
                                         << 4U) & (IData)(vlSelf->PSyCAB))));
    vlSelf->PS7b80 = ((0x19U & (IData)(vlSelf->PS7b80)) 
                      | ((0xfffffffcU & (((2U > (IData)(vlSelf->PSs7NB)) 
                                          << 2U) & (IData)(vlSelf->PSyCAB))) 
                         | (0xfffffffeU & (((1U > (IData)(vlSelf->PSs7NB)) 
                                            << 1U) 
                                           & (IData)(vlSelf->PSyCAB)))));
    vlSelf->PS7b80 = ((7U & (IData)(vlSelf->PS7b80)) 
                      | ((0xfffffff0U & (((4U > (IData)(vlSelf->PSs7NB)) 
                                          << 4U) & (IData)(vlSelf->PSyCAB))) 
                         | (0xfffffff8U & (((3U > (IData)(vlSelf->PSs7NB)) 
                                            << 3U) 
                                           & (IData)(vlSelf->PSyCAB)))));
    vlSelf->PSjup8 = (1U & ((~ (IData)(vlSelf->PSyCAB)) 
                            | (((IData)(vlSelf->PSyCAB) 
                                >> 1U) & (IData)(vlSelf->PSs7NB))));
    vlSelf->PSFmWf = (1U & ((~ ((IData)(vlSelf->PSyCAB) 
                                >> 2U)) | (((IData)(vlSelf->PSyCAB) 
                                            >> 3U) 
                                           & (IData)(vlSelf->PSs7NB))));
    vlSelf->PSAyya = ((0x67U & (IData)(vlSelf->PSAyya)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSyCAB)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSyCAB)))) 
                                    << 3U)));
    vlSelf->PSAyya = ((0x5fU & (IData)(vlSelf->PSAyya)) 
                      | (0x20U & ((IData)(vlSelf->PSyCAB) 
                                  << 1U)));
    vlSelf->PS4HAj = ((0x1eU & (IData)(vlSelf->PS4HAj)) 
                      | (1U & (IData)(vlSelf->PSA9l1)));
    vlSelf->PS4HAj = ((0x1bU & (IData)(vlSelf->PS4HAj)) 
                      | (4U & ((IData)(vlSelf->PSQ2ew) 
                               << 2U)));
    vlSelf->PS7SVB = (7U & (((IData)(vlSelf->PS9nyG) 
                             & (IData)(vlSelf->PSptz1))
                             ? (IData)(vlSelf->PSBz6K)
                             : (IData)(vlSelf->PSDkKJ)));
    vlSelf->PSuPKl = (7U & (((IData)(vlSelf->PSLcAp) 
                             & (IData)(vlSelf->PSzkWQ))
                             ? (IData)(vlSelf->PSO9Sl)
                             : (IData)(vlSelf->PSEjnH)));
    vlSelf->PShMUV = (7U & (((IData)(vlSelf->PSJIo7) 
                             & (IData)(vlSelf->PSECYd))
                             ? (IData)(vlSelf->PShSRM)
                             : (IData)(vlSelf->PSBIpW)));
    vlSelf->PSbqf7 = (7U & (((IData)(vlSelf->PSSiVU) 
                             & (IData)(vlSelf->PSe1F5))
                             ? (IData)(vlSelf->PS6IN5)
                             : (IData)(vlSelf->PSIzei)));
    vlSelf->PSufjf = ((0x1eU & (IData)(vlSelf->PSufjf)) 
                      | (1U & (IData)(vlSelf->PSBSBl)));
    vlSelf->PSR9tr = ((0xffc00U & vlSelf->PSR9tr) | 
                      ((((2U & (IData)(vlSelf->PSBSBl))
                          ? (0x1fU & (IData)(vlSelf->PSJous))
                          : 0U) << 5U) | ((1U & (IData)(vlSelf->PSBSBl))
                                           ? (0x1fU 
                                              & (IData)(vlSelf->PSF78x))
                                           : 0U)));
    vlSelf->PSR9tr = ((0x3ffU & vlSelf->PSR9tr) | (
                                                   (((8U 
                                                      & (IData)(vlSelf->PSBSBl))
                                                      ? 
                                                     (0x1fU 
                                                      & (IData)(vlSelf->PSzMhC))
                                                      : 0U) 
                                                    << 0xfU) 
                                                   | (((4U 
                                                        & (IData)(vlSelf->PSBSBl))
                                                        ? 
                                                       (0x1fU 
                                                        & (IData)(vlSelf->PSMYBR))
                                                        : 0U) 
                                                      << 0xaU)));
    vlSelf->PSvQlT = ((0U == (IData)(vlSelf->PSXtSw))
                       ? (0xffffffff00000000ULL | (QData)((IData)(
                                                                  (((IData)(vlSelf->PSNzrU) 
                                                                    << 0x1fU) 
                                                                   | ((0x7f800000U 
                                                                       & ((IData)(PSI0aB) 
                                                                          << 0x17U)) 
                                                                      | (0x7fffffU 
                                                                         & (IData)(
                                                                                (PSkQzS 
                                                                                >> 0x1dU))))))))
                       : ((1U == (IData)(vlSelf->PSXtSw))
                           ? (((QData)((IData)(vlSelf->PSNzrU)) 
                               << 0x3fU) | (((QData)((IData)(PSI0aB)) 
                                             << 0x34U) 
                                            | PSkQzS))
                           : ((2U == (IData)(vlSelf->PSXtSw))
                               ? (0xffffffffffff0000ULL 
                                  | (QData)((IData)(
                                                    (((IData)(vlSelf->PSNzrU) 
                                                      << 0xfU) 
                                                     | ((0x7c00U 
                                                         & ((IData)(PSI0aB) 
                                                            << 0xaU)) 
                                                        | (0x3ffU 
                                                           & (IData)(
                                                                     (PSkQzS 
                                                                      >> 0x2aU))))))))
                               : (0xffffffffffff0000ULL 
                                  | (QData)((IData)(
                                                    (((IData)(vlSelf->PSNzrU) 
                                                      << 0xfU) 
                                                     | ((0x7f80U 
                                                         & ((IData)(PSI0aB) 
                                                            << 7U)) 
                                                        | (0x7fU 
                                                           & (IData)(
                                                                     (PSkQzS 
                                                                      >> 0x2dU)))))))))));
    vlSelf->PSFmdP = ((0U == (IData)(vlSelf->PSTTg0))
                       ? (0xffffffff00000000ULL | (QData)((IData)(
                                                                  (((IData)(vlSelf->PSTJsI) 
                                                                    << 0x1fU) 
                                                                   | ((0x7f800000U 
                                                                       & ((IData)(PSnciI) 
                                                                          << 0x17U)) 
                                                                      | (0x7fffffU 
                                                                         & (IData)(
                                                                                (PSpSJh 
                                                                                >> 0x1dU))))))))
                       : ((1U == (IData)(vlSelf->PSTTg0))
                           ? (((QData)((IData)(vlSelf->PSTJsI)) 
                               << 0x3fU) | (((QData)((IData)(PSnciI)) 
                                             << 0x34U) 
                                            | PSpSJh))
                           : ((2U == (IData)(vlSelf->PSTTg0))
                               ? (0xffffffffffff0000ULL 
                                  | (QData)((IData)(
                                                    (((IData)(vlSelf->PSTJsI) 
                                                      << 0xfU) 
                                                     | ((0x7c00U 
                                                         & ((IData)(PSnciI) 
                                                            << 0xaU)) 
                                                        | (0x3ffU 
                                                           & (IData)(
                                                                     (PSpSJh 
                                                                      >> 0x2aU))))))))
                               : (0xffffffffffff0000ULL 
                                  | (QData)((IData)(
                                                    (((IData)(vlSelf->PSTJsI) 
                                                      << 0xfU) 
                                                     | ((0x7f80U 
                                                         & ((IData)(PSnciI) 
                                                            << 7U)) 
                                                        | (0x7fU 
                                                           & (IData)(
                                                                     (PSpSJh 
                                                                      >> 0x2dU)))))))))));
    vlSelf->PSJXNQ = (7U & ((1U & ((IData)(vlSelf->PS6O6l) 
                                   & (IData)(vlSelf->PStiKQ)))
                             ? ((1U & (IData)(vlSelf->PSkT9R))
                                 ? vlSelf->PSzlty : vlSelf->PSYYNq)
                             : (IData)(vlSelf->PSKafS)));
    vlSelf->PS98uH = (7U & ((1U & (((IData)(vlSelf->PS6O6l) 
                                    >> 1U) & (IData)(vlSelf->PSpicI)))
                             ? ((1U & (IData)(vlSelf->PSCws4))
                                 ? vlSelf->PShN1H : vlSelf->PSIez8)
                             : (IData)(vlSelf->PSBsiV)));
    vlSelf->PS1CdG = ((0x7eU & (IData)(vlSelf->PS1CdG)) 
                      | (1U & (IData)(vlSelf->PS6O6l)));
    vlSelf->PSHHxd = ((0x7eU & (IData)(vlSelf->PSHHxd)) 
                      | (1U & ((IData)(vlSelf->PS6O6l) 
                               >> 1U)));
    vlSelf->PSXIxn = (7U & ((1U & ((IData)(vlSelf->PSPnKa) 
                                   & (IData)(vlSelf->PS1kTP)))
                             ? ((1U & (IData)(vlSelf->PSBXjD))
                                 ? vlSelf->PSJlOh : vlSelf->PSDVYu)
                             : (IData)(vlSelf->PSL16K)));
    vlSelf->PSDvT3 = (7U & ((1U & (((IData)(vlSelf->PSPnKa) 
                                    >> 1U) & (IData)(vlSelf->PSahYO)))
                             ? ((1U & (IData)(vlSelf->PSj0On))
                                 ? vlSelf->PSKlRa : vlSelf->PS64UE)
                             : (IData)(vlSelf->PS93gg)));
    vlSelf->PSCamS = ((0x7eU & (IData)(vlSelf->PSCamS)) 
                      | (1U & (IData)(vlSelf->PSPnKa)));
    vlSelf->PScAMZ = ((0x7eU & (IData)(vlSelf->PScAMZ)) 
                      | (1U & ((IData)(vlSelf->PSPnKa) 
                               >> 1U)));
    vlSelf->PSoPxl = (7U & ((1U & ((IData)(vlSelf->PSx1in) 
                                   & (IData)(vlSelf->PSs7ZB)))
                             ? ((1U & (IData)(vlSelf->PSm9DJ))
                                 ? vlSelf->PSvBIH : vlSelf->PSQuHJ)
                             : (IData)(vlSelf->PSBGw2)));
    vlSelf->PSs0gB = (7U & ((1U & (((IData)(vlSelf->PSx1in) 
                                    >> 1U) & (IData)(vlSelf->PSZfGm)))
                             ? ((1U & (IData)(vlSelf->PS1OlZ))
                                 ? vlSelf->PSwBDZ : vlSelf->PSf2C1)
                             : (IData)(vlSelf->PSUwhf)));
    vlSelf->PS77t0 = ((0x7eU & (IData)(vlSelf->PS77t0)) 
                      | (1U & (IData)(vlSelf->PSx1in)));
    vlSelf->PSenHc = ((0x7eU & (IData)(vlSelf->PSenHc)) 
                      | (1U & ((IData)(vlSelf->PSx1in) 
                               >> 1U)));
    vlSelf->PSLPZB = (7U & ((1U & ((IData)(vlSelf->PSWM5g) 
                                   & (IData)(vlSelf->PSfI0d)))
                             ? ((1U & (IData)(vlSelf->PSytzf))
                                 ? vlSelf->PSuApV : vlSelf->PSeRsP)
                             : (IData)(vlSelf->PS9pTx)));
    vlSelf->PSgIxR = (7U & ((1U & (((IData)(vlSelf->PSWM5g) 
                                    >> 1U) & (IData)(vlSelf->PSvhwa)))
                             ? ((1U & (IData)(vlSelf->PS9z8O))
                                 ? vlSelf->PSDEhp : vlSelf->PSXDzr)
                             : (IData)(vlSelf->PSodKe)));
    vlSelf->PSBTD8 = ((0x7eU & (IData)(vlSelf->PSBTD8)) 
                      | (1U & (IData)(vlSelf->PSWM5g)));
    vlSelf->PS80TZ = ((0x7eU & (IData)(vlSelf->PS80TZ)) 
                      | (1U & ((IData)(vlSelf->PSWM5g) 
                               >> 1U)));
    vlSelf->PSWSfP = (7U & ((1U & ((IData)(vlSelf->PSsRZA) 
                                   & (IData)(vlSelf->PS2CX8)))
                             ? ((1U & (IData)(vlSelf->PSJhFi))
                                 ? vlSelf->PSPH4c : vlSelf->PS4dPS)
                             : (IData)(vlSelf->PSoJ2M)));
    vlSelf->PStcpK = (7U & ((1U & (((IData)(vlSelf->PSsRZA) 
                                    >> 1U) & (IData)(vlSelf->PSGvTJ)))
                             ? ((1U & (IData)(vlSelf->PSIMdQ))
                                 ? vlSelf->PSLCgE : vlSelf->PStxie)
                             : (IData)(vlSelf->PS298A)));
    vlSelf->PS7kEm = ((0x7eU & (IData)(vlSelf->PS7kEm)) 
                      | (1U & (IData)(vlSelf->PSsRZA)));
    vlSelf->PSKVq4 = ((0x7eU & (IData)(vlSelf->PSKVq4)) 
                      | (1U & ((IData)(vlSelf->PSsRZA) 
                               >> 1U)));
    vlSelf->PSLuyB = (7U & ((1U & ((IData)(vlSelf->PS0m0L) 
                                   & (IData)(vlSelf->PS9y8A)))
                             ? ((1U & (IData)(vlSelf->PS9JXe))
                                 ? vlSelf->PSQ12Q : vlSelf->PSieu9)
                             : (IData)(vlSelf->PSxAzZ)));
    vlSelf->PSRnSp = (7U & ((1U & (((IData)(vlSelf->PS0m0L) 
                                    >> 1U) & (IData)(vlSelf->PSXY7H)))
                             ? ((1U & (IData)(vlSelf->PSVKpA))
                                 ? vlSelf->PSXOZY : vlSelf->PSTrvu)
                             : (IData)(vlSelf->PS5hkQ)));
    vlSelf->PSAm4L = ((0x7eU & (IData)(vlSelf->PSAm4L)) 
                      | (1U & (IData)(vlSelf->PS0m0L)));
    vlSelf->PSHGRv = ((0x7eU & (IData)(vlSelf->PSHGRv)) 
                      | (1U & ((IData)(vlSelf->PS0m0L) 
                               >> 1U)));
    vlSelf->PSIhlu = (7U & ((1U & ((IData)(vlSelf->PSg9EB) 
                                   & (IData)(vlSelf->PSLvqx)))
                             ? ((1U & (IData)(vlSelf->PSkW8N))
                                 ? vlSelf->PSm5iQ : vlSelf->PSOGAg)
                             : (IData)(vlSelf->PS0qWj)));
    vlSelf->PS8Esj = (7U & ((1U & (((IData)(vlSelf->PSg9EB) 
                                    >> 1U) & (IData)(vlSelf->PSS3rE)))
                             ? ((1U & (IData)(vlSelf->PSRC6C))
                                 ? vlSelf->PSQqJh : vlSelf->PSSbOh)
                             : (IData)(vlSelf->PSdtWX)));
    vlSelf->PS3Nfp = ((0x7eU & (IData)(vlSelf->PS3Nfp)) 
                      | (1U & (IData)(vlSelf->PSg9EB)));
    vlSelf->PSzZSR = ((0x7eU & (IData)(vlSelf->PSzZSR)) 
                      | (1U & ((IData)(vlSelf->PSg9EB) 
                               >> 1U)));
    vlSelf->PSKfr5 = (7U & ((1U & ((IData)(vlSelf->PSB6OQ) 
                                   & (IData)(vlSelf->PSPd6L)))
                             ? ((1U & (IData)(vlSelf->PSC10B))
                                 ? vlSelf->PSqtpI : vlSelf->PS5oLo)
                             : (IData)(vlSelf->PSoaw2)));
    vlSelf->PSXNUg = (7U & ((1U & (((IData)(vlSelf->PSB6OQ) 
                                    >> 1U) & (IData)(vlSelf->PSBjzP)))
                             ? ((1U & (IData)(vlSelf->PSot2R))
                                 ? vlSelf->PSgHBa : vlSelf->PS5MBR)
                             : (IData)(vlSelf->PSJkZz)));
    vlSelf->PSoABX = ((0x7eU & (IData)(vlSelf->PSoABX)) 
                      | (1U & (IData)(vlSelf->PSB6OQ)));
    vlSelf->PSKbGq = ((0x7eU & (IData)(vlSelf->PSKbGq)) 
                      | (1U & ((IData)(vlSelf->PSB6OQ) 
                               >> 1U)));
    vlSelf->PSIb5O[0U] = vlSelf->PSlZ89[0U];
    vlSelf->PSIb5O[1U] = vlSelf->PSlZ89[1U];
    vlSelf->PSIb5O[2U] = vlSelf->PSlZ89[2U];
    vlSelf->PSIb5O[3U] = vlSelf->PSlZ89[3U];
    if ((((IData)(vlSelf->PSpp0X) >> 7U) & (2U != (IData)(vlSelf->PSEBzJ)))) {
        VL_ASSIGNSEL_WIIQ(128,64,(0x7fU & ((IData)(vlSelf->PSi0zO) 
                                           << 6U)), vlSelf->PSIb5O, 
                          (((QData)((IData)(vlSelf->PSUBNZ[0xfU])) 
                            << 0x20U) | (QData)((IData)(
                                                        vlSelf->PSUBNZ[0xeU]))));
    }
    vlSelf->PSTQHR[0U] = vlSelf->PSt0Hh[0U];
    vlSelf->PSTQHR[1U] = vlSelf->PSt0Hh[1U];
    vlSelf->PSTQHR[2U] = vlSelf->PSt0Hh[2U];
    vlSelf->PSTQHR[3U] = vlSelf->PSt0Hh[3U];
    if ((((IData)(vlSelf->PSpp0X) >> 8U) & (2U != (IData)(vlSelf->PSIeLA)))) {
        VL_ASSIGNSEL_WIIQ(128,64,(0x7fU & ((IData)(vlSelf->PSbGk2) 
                                           << 6U)), vlSelf->PSTQHR, 
                          (((QData)((IData)(vlSelf->PSUBNZ[0x11U])) 
                            << 0x20U) | (QData)((IData)(
                                                        vlSelf->PSUBNZ[0x10U]))));
    }
    vlSelf->PSIc4o = vlSelf->PSZJfG;
    if ((((IData)(vlSelf->PSpp0X) >> 5U) & (1U != (IData)(vlSelf->PSmmGZ)))) {
        vlSelf->PSIc4o = (((~ (0xffffffffffffffffULL 
                               << (0x3fU & ((IData)(vlSelf->PSQhxx) 
                                            << 6U)))) 
                           & vlSelf->PSIc4o) | ((((QData)((IData)(
                                                                  vlSelf->PSUBNZ[0xbU])) 
                                                  << 0x20U) 
                                                 | (QData)((IData)(
                                                                   vlSelf->PSUBNZ[0xaU]))) 
                                                << 
                                                (0x3fU 
                                                 & ((IData)(vlSelf->PSQhxx) 
                                                    << 6U))));
    }
    vlSelf->PSZPMl = vlSelf->PS9BBB;
    if ((((IData)(vlSelf->PSpp0X) >> 6U) & (1U != (IData)(vlSelf->PS5YWc)))) {
        vlSelf->PSZPMl = (((~ (0xffffffffffffffffULL 
                               << (0x3fU & ((IData)(vlSelf->PSyJP9) 
                                            << 6U)))) 
                           & vlSelf->PSZPMl) | ((((QData)((IData)(
                                                                  vlSelf->PSUBNZ[0xdU])) 
                                                  << 0x20U) 
                                                 | (QData)((IData)(
                                                                   vlSelf->PSUBNZ[0xcU]))) 
                                                << 
                                                (0x3fU 
                                                 & ((IData)(vlSelf->PSyJP9) 
                                                    << 6U))));
    }
    vlSelf->PSMBJ7[0U] = vlSelf->PSAvTp[0U];
    vlSelf->PSMBJ7[1U] = vlSelf->PSAvTp[1U];
    vlSelf->PSMBJ7[2U] = vlSelf->PSAvTp[2U];
    vlSelf->PSMBJ7[3U] = vlSelf->PSAvTp[3U];
    vlSelf->PSMBJ7[4U] = vlSelf->PSAvTp[4U];
    vlSelf->PSMBJ7[5U] = vlSelf->PSAvTp[5U];
    vlSelf->PSMBJ7[6U] = vlSelf->PSAvTp[6U];
    vlSelf->PSMBJ7[7U] = vlSelf->PSAvTp[7U];
    vlSelf->PSMBJ7[8U] = vlSelf->PSAvTp[8U];
    vlSelf->PSMBJ7[9U] = vlSelf->PSAvTp[9U];
    if (((IData)(vlSelf->PSpp0X) & (5U != (IData)(vlSelf->PS9kH7)))) {
        vlSelf->PSGOvY = (((QData)((IData)(vlSelf->PSUBNZ[1U])) 
                           << 0x20U) | (QData)((IData)(
                                                       vlSelf->PSUBNZ[0U])));
        if ((0x13fU >= (0x1ffU & ((IData)(vlSelf->PSPO7X) 
                                  << 6U)))) {
            VL_ASSIGNSEL_WIIQ(320,64,(0x1ffU & ((IData)(vlSelf->PSPO7X) 
                                                << 6U)), vlSelf->PSMBJ7, vlSelf->PSGOvY);
        }
    }
    vlSelf->PSogRc[0U] = vlSelf->PSfAsy[0U];
    vlSelf->PSogRc[1U] = vlSelf->PSfAsy[1U];
    vlSelf->PSogRc[2U] = vlSelf->PSfAsy[2U];
    vlSelf->PSogRc[3U] = vlSelf->PSfAsy[3U];
    vlSelf->PSogRc[4U] = vlSelf->PSfAsy[4U];
    vlSelf->PSogRc[5U] = vlSelf->PSfAsy[5U];
    vlSelf->PSogRc[6U] = vlSelf->PSfAsy[6U];
    vlSelf->PSogRc[7U] = vlSelf->PSfAsy[7U];
    vlSelf->PSogRc[8U] = vlSelf->PSfAsy[8U];
    vlSelf->PSogRc[9U] = vlSelf->PSfAsy[9U];
    if ((((IData)(vlSelf->PSpp0X) >> 1U) & (5U != (IData)(vlSelf->PSXvkX)))) {
        vlSelf->PS2lAF = (((QData)((IData)(vlSelf->PSUBNZ[3U])) 
                           << 0x20U) | (QData)((IData)(
                                                       vlSelf->PSUBNZ[2U])));
        if ((0x13fU >= (0x1ffU & ((IData)(vlSelf->PSjBdF) 
                                  << 6U)))) {
            VL_ASSIGNSEL_WIIQ(320,64,(0x1ffU & ((IData)(vlSelf->PSjBdF) 
                                                << 6U)), vlSelf->PSogRc, vlSelf->PS2lAF);
        }
    }
    vlSelf->PSIXiW[0U] = vlSelf->PSTIJU[0U];
    vlSelf->PSIXiW[1U] = vlSelf->PSTIJU[1U];
    vlSelf->PSIXiW[2U] = vlSelf->PSTIJU[2U];
    vlSelf->PSIXiW[3U] = vlSelf->PSTIJU[3U];
    vlSelf->PSIXiW[4U] = vlSelf->PSTIJU[4U];
    vlSelf->PSIXiW[5U] = vlSelf->PSTIJU[5U];
    vlSelf->PSIXiW[6U] = vlSelf->PSTIJU[6U];
    vlSelf->PSIXiW[7U] = vlSelf->PSTIJU[7U];
    vlSelf->PSIXiW[8U] = vlSelf->PSTIJU[8U];
    vlSelf->PSIXiW[9U] = vlSelf->PSTIJU[9U];
    if ((((IData)(vlSelf->PSpp0X) >> 2U) & (5U != (IData)(vlSelf->PShWsR)))) {
        vlSelf->PSWylO = (((QData)((IData)(vlSelf->PSUBNZ[5U])) 
                           << 0x20U) | (QData)((IData)(
                                                       vlSelf->PSUBNZ[4U])));
        if ((0x13fU >= (0x1ffU & ((IData)(vlSelf->PSnkNY) 
                                  << 6U)))) {
            VL_ASSIGNSEL_WIIQ(320,64,(0x1ffU & ((IData)(vlSelf->PSnkNY) 
                                                << 6U)), vlSelf->PSIXiW, vlSelf->PSWylO);
        }
    }
    vlSelf->PSCvmy[0U] = vlSelf->PSvVxb[0U];
    vlSelf->PSCvmy[1U] = vlSelf->PSvVxb[1U];
    vlSelf->PSCvmy[2U] = vlSelf->PSvVxb[2U];
    vlSelf->PSCvmy[3U] = vlSelf->PSvVxb[3U];
    vlSelf->PSCvmy[4U] = vlSelf->PSvVxb[4U];
    vlSelf->PSCvmy[5U] = vlSelf->PSvVxb[5U];
    vlSelf->PSCvmy[6U] = vlSelf->PSvVxb[6U];
    vlSelf->PSCvmy[7U] = vlSelf->PSvVxb[7U];
    vlSelf->PSCvmy[8U] = vlSelf->PSvVxb[8U];
    vlSelf->PSCvmy[9U] = vlSelf->PSvVxb[9U];
    if ((((IData)(vlSelf->PSpp0X) >> 3U) & (5U != (IData)(vlSelf->PSL4dI)))) {
        vlSelf->PSWrsz = (((QData)((IData)(vlSelf->PSUBNZ[7U])) 
                           << 0x20U) | (QData)((IData)(
                                                       vlSelf->PSUBNZ[6U])));
        if ((0x13fU >= (0x1ffU & ((IData)(vlSelf->PSW9aC) 
                                  << 6U)))) {
            VL_ASSIGNSEL_WIIQ(320,64,(0x1ffU & ((IData)(vlSelf->PSW9aC) 
                                                << 6U)), vlSelf->PSCvmy, vlSelf->PSWrsz);
        }
    }
    vlSelf->PSf1pr[0U] = vlSelf->PSu4ev[0U];
    vlSelf->PSf1pr[1U] = vlSelf->PSu4ev[1U];
    vlSelf->PSf1pr[2U] = vlSelf->PSu4ev[2U];
    vlSelf->PSf1pr[3U] = vlSelf->PSu4ev[3U];
    vlSelf->PSf1pr[4U] = vlSelf->PSu4ev[4U];
    vlSelf->PSf1pr[5U] = vlSelf->PSu4ev[5U];
    vlSelf->PSf1pr[6U] = vlSelf->PSu4ev[6U];
    vlSelf->PSf1pr[7U] = vlSelf->PSu4ev[7U];
    vlSelf->PSf1pr[8U] = vlSelf->PSu4ev[8U];
    vlSelf->PSf1pr[9U] = vlSelf->PSu4ev[9U];
    if ((((IData)(vlSelf->PSpp0X) >> 4U) & (5U != (IData)(vlSelf->PSIxrl)))) {
        vlSelf->PSAOAL = (((QData)((IData)(vlSelf->PSUBNZ[9U])) 
                           << 0x20U) | (QData)((IData)(
                                                       vlSelf->PSUBNZ[8U])));
        if ((0x13fU >= (0x1ffU & ((IData)(vlSelf->PSZvS6) 
                                  << 6U)))) {
            VL_ASSIGNSEL_WIIQ(320,64,(0x1ffU & ((IData)(vlSelf->PSZvS6) 
                                                << 6U)), vlSelf->PSf1pr, vlSelf->PSAOAL);
        }
    }
    vlSelf->PSJgKR = (0xffffU & (IData)(((IData)(vlSelf->PSJNtc)
                                          ? (vlSelf->PSoVnC 
                                             >> 8U)
                                          : vlSelf->PSoVnC)));
    vlSelf->PSRjKi = (0xffffU & (IData)(((IData)(vlSelf->PSAUWr)
                                          ? (vlSelf->PSVhtn 
                                             >> 8U)
                                          : vlSelf->PSVhtn)));
    vlSelf->PSFOI2 = ((0xe7U & (IData)(vlSelf->PSFOI2)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSTRcI)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSTRcI)))) 
                                    << 3U)));
    vlSelf->PSFOI2 = ((0xdfU & (IData)(vlSelf->PSFOI2)) 
                      | (0x20U & ((IData)(vlSelf->PSTRcI) 
                                  << 1U)));
    vlSelf->PSZh7T = ((0xff81ffU & vlSelf->PSZh7T) 
                      | ((((4U & (IData)(vlSelf->PSTRcI))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSTRcI))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PStJ9t = ((0xff81ffU & vlSelf->PStJ9t) 
                      | ((((4U & (IData)(vlSelf->PSW7LG))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSW7LG))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSzhXj = ((0xe7U & (IData)(vlSelf->PSzhXj)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSW7LG)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSW7LG)))) 
                                    << 3U)));
    vlSelf->PSzhXj = ((0xdfU & (IData)(vlSelf->PSzhXj)) 
                      | (0x20U & ((IData)(vlSelf->PSW7LG) 
                                  << 1U)));
    vlSelf->PS169j[4U] = ((0x3ffffffU & vlSelf->PS169j[4U]) 
                          | (vlSelf->PSm31i[0U] << 0x1aU));
    vlSelf->PS169j[5U] = ((((0x2000000U & (vlSelf->PSm31i[1U] 
                                           << 0x19U)) 
                            | (0x1fffffcU & (vlSelf->PSm31i[0U] 
                                             >> 7U))) 
                           | (3U & (vlSelf->PSm31i[0U] 
                                    >> 6U))) | (0xfc000000U 
                                                & (vlSelf->PSm31i[1U] 
                                                   << 0x19U)));
    vlSelf->PS169j[6U] = (((3U & (vlSelf->PSm31i[1U] 
                                  >> 7U)) | ((0x2000000U 
                                              & (vlSelf->PSm31i[2U] 
                                                 << 0x19U)) 
                                             | (0x1fffffcU 
                                                & (vlSelf->PSm31i[1U] 
                                                   >> 7U)))) 
                          | (0xfc000000U & (vlSelf->PSm31i[2U] 
                                            << 0x19U)));
    vlSelf->PS169j[7U] = ((0xffffff80U & vlSelf->PS169j[7U]) 
                          | ((3U & (vlSelf->PSm31i[2U] 
                                    >> 7U)) | (0x7cU 
                                               & (vlSelf->PSm31i[2U] 
                                                  >> 7U))));
    if (vlSelf->PSXvg7) {
        PS80u1[1U] = ((vlSelf->PSm31i[6U] << 4U) | 
                      (vlSelf->PSm31i[5U] >> 0x1cU));
        PS80u1[2U] = (0x3fffU & ((vlSelf->PSm31i[7U] 
                                  << 4U) | (vlSelf->PSm31i[6U] 
                                            >> 0x1cU)));
        vlSelf->PSm31i[0U] = ((vlSelf->PSm31i[5U] << 4U) 
                              | (vlSelf->PSm31i[4U] 
                                 >> 0x1cU));
    } else {
        PS80u1[1U] = ((vlSelf->PSm31i[4U] << 0x12U) 
                      | (vlSelf->PSm31i[3U] >> 0xeU));
        PS80u1[2U] = (0x3fffU & ((vlSelf->PSm31i[5U] 
                                  << 0x12U) | (vlSelf->PSm31i[4U] 
                                               >> 0xeU)));
        vlSelf->PSm31i[0U] = ((vlSelf->PSm31i[3U] << 0x12U) 
                              | (vlSelf->PSm31i[2U] 
                                 >> 0xeU));
    }
    vlSelf->PSm31i[1U] = PS80u1[1U];
    vlSelf->PSm31i[2U] = ((0xffffc000U & vlSelf->PSm31i[2U]) 
                          | PS80u1[2U]);
    if (vlSelf->PSa62I) {
        PSAOjc[0U] = ((vlSelf->PSm31i[0xaU] << 8U) 
                      | (vlSelf->PSm31i[9U] >> 0x18U));
        PSAOjc[1U] = ((vlSelf->PSm31i[0xbU] << 8U) 
                      | (vlSelf->PSm31i[0xaU] >> 0x18U));
        PSAOjc[2U] = (0x3fffU & ((vlSelf->PSm31i[0xcU] 
                                  << 8U) | (vlSelf->PSm31i[0xbU] 
                                            >> 0x18U)));
    } else {
        PSAOjc[0U] = ((vlSelf->PSm31i[8U] << 0x16U) 
                      | (vlSelf->PSm31i[7U] >> 0xaU));
        PSAOjc[1U] = ((vlSelf->PSm31i[9U] << 0x16U) 
                      | (vlSelf->PSm31i[8U] >> 0xaU));
        PSAOjc[2U] = (0x3fffU & ((vlSelf->PSm31i[0xaU] 
                                  << 0x16U) | (vlSelf->PSm31i[9U] 
                                               >> 0xaU)));
    }
    vlSelf->PSm31i[2U] = ((0x3fffU & vlSelf->PSm31i[2U]) 
                          | (((IData)(vlSelf->PSa62I)
                               ? ((vlSelf->PSm31i[0xaU] 
                                   << 8U) | (vlSelf->PSm31i[9U] 
                                             >> 0x18U))
                               : ((vlSelf->PSm31i[8U] 
                                   << 0x16U) | (vlSelf->PSm31i[7U] 
                                                >> 0xaU))) 
                             << 0xeU));
    vlSelf->PSm31i[3U] = ((PSAOjc[0U] >> 0x12U) | (
                                                   PSAOjc[1U] 
                                                   << 0xeU));
    vlSelf->PSm31i[4U] = ((0xf0000000U & vlSelf->PSm31i[4U]) 
                          | ((PSAOjc[1U] >> 0x12U) 
                             | (PSAOjc[2U] << 0xeU)));
    if (vlSelf->PSITjc) {
        PSwTTq[0U] = ((vlSelf->PSm31i[0xfU] << 0xcU) 
                      | (vlSelf->PSm31i[0xeU] >> 0x14U));
        PSwTTq[1U] = ((vlSelf->PSm31i[0x10U] << 0xcU) 
                      | (vlSelf->PSm31i[0xfU] >> 0x14U));
        PSwTTq[2U] = (0x3fffU & ((vlSelf->PSm31i[0x11U] 
                                  << 0xcU) | (vlSelf->PSm31i[0x10U] 
                                              >> 0x14U)));
    } else {
        PSwTTq[0U] = ((vlSelf->PSm31i[0xdU] << 0x1aU) 
                      | (vlSelf->PSm31i[0xcU] >> 6U));
        PSwTTq[1U] = ((vlSelf->PSm31i[0xeU] << 0x1aU) 
                      | (vlSelf->PSm31i[0xdU] >> 6U));
        PSwTTq[2U] = (0x3fffU & ((vlSelf->PSm31i[0xfU] 
                                  << 0x1aU) | (vlSelf->PSm31i[0xeU] 
                                               >> 6U)));
    }
    vlSelf->PSm31i[4U] = ((0xfffffffU & vlSelf->PSm31i[4U]) 
                          | (((IData)(vlSelf->PSITjc)
                               ? ((vlSelf->PSm31i[0xfU] 
                                   << 0xcU) | (vlSelf->PSm31i[0xeU] 
                                               >> 0x14U))
                               : ((vlSelf->PSm31i[0xdU] 
                                   << 0x1aU) | (vlSelf->PSm31i[0xcU] 
                                                >> 6U))) 
                             << 0x1cU));
    vlSelf->PSm31i[5U] = ((PSwTTq[0U] >> 4U) | (PSwTTq[1U] 
                                                << 0x1cU));
    vlSelf->PSm31i[6U] = ((PSwTTq[1U] >> 4U) | (PSwTTq[2U] 
                                                << 0x1cU));
    vlSelf->PSm31i[7U] = ((0xfffffc00U & vlSelf->PSm31i[7U]) 
                          | (PSwTTq[2U] >> 4U));
    PSOtaC = (1U & (IData)(vlSelf->PSTXbQ));
    vlSelf->PSblYh = ((0x1eU & (IData)(vlSelf->PSblYh)) 
                      | (IData)(PSOtaC));
    PSOtaC = (1U & ((IData)(vlSelf->PSTXbQ) >> 1U));
    vlSelf->PSblYh = ((0x1dU & (IData)(vlSelf->PSblYh)) 
                      | ((IData)(PSOtaC) << 1U));
    PSOtaC = (1U & ((IData)(vlSelf->PSTXbQ) >> 2U));
    vlSelf->PSblYh = ((0x1bU & (IData)(vlSelf->PSblYh)) 
                      | ((IData)(PSOtaC) << 2U));
    PSOtaC = (1U & ((IData)(vlSelf->PSTXbQ) >> 3U));
    vlSelf->PSblYh = ((0x17U & (IData)(vlSelf->PSblYh)) 
                      | ((IData)(PSOtaC) << 3U));
    PSOtaC = (1U & ((IData)(vlSelf->PSTXbQ) >> 4U));
    vlSelf->PSblYh = ((0xfU & (IData)(vlSelf->PSblYh)) 
                      | ((IData)(PSOtaC) << 4U));
    PSb5Yn = (1U & (IData)(vlSelf->PS7b80));
    vlSelf->PSuzf7 = ((0x1eU & (IData)(vlSelf->PSuzf7)) 
                      | (IData)(PSb5Yn));
    PSb5Yn = (1U & ((IData)(vlSelf->PS7b80) >> 1U));
    vlSelf->PSuzf7 = ((0x1dU & (IData)(vlSelf->PSuzf7)) 
                      | ((IData)(PSb5Yn) << 1U));
    PSb5Yn = (1U & ((IData)(vlSelf->PS7b80) >> 2U));
    vlSelf->PSuzf7 = ((0x1bU & (IData)(vlSelf->PSuzf7)) 
                      | ((IData)(PSb5Yn) << 2U));
    PSb5Yn = (1U & ((IData)(vlSelf->PS7b80) >> 3U));
    vlSelf->PSuzf7 = ((0x17U & (IData)(vlSelf->PSuzf7)) 
                      | ((IData)(PSb5Yn) << 3U));
    PSb5Yn = (1U & ((IData)(vlSelf->PS7b80) >> 4U));
    vlSelf->PSuzf7 = ((0xfU & (IData)(vlSelf->PSuzf7)) 
                      | ((IData)(PSb5Yn) << 4U));
    vlSelf->PSBdU1[7U] = ((0x3ffU & vlSelf->PSBdU1[7U]) 
                          | (((IData)(vlSelf->PSjup8)
                               ? ((vlSelf->PSwxpT[3U] 
                                   << 0x12U) | (vlSelf->PSwxpT[2U] 
                                                >> 0xeU))
                               : vlSelf->PSwxpT[0U]) 
                             << 0xaU));
    vlSelf->PSBdU1[8U] = ((((IData)(vlSelf->PSjup8)
                             ? ((vlSelf->PSwxpT[3U] 
                                 << 0x12U) | (vlSelf->PSwxpT[2U] 
                                              >> 0xeU))
                             : vlSelf->PSwxpT[0U]) 
                           >> 0x16U) | (((IData)(vlSelf->PSjup8)
                                          ? ((vlSelf->PSwxpT[4U] 
                                              << 0x12U) 
                                             | (vlSelf->PSwxpT[3U] 
                                                >> 0xeU))
                                          : vlSelf->PSwxpT[1U]) 
                                        << 0xaU));
    vlSelf->PSBdU1[9U] = ((((IData)(vlSelf->PSjup8)
                             ? ((vlSelf->PSwxpT[4U] 
                                 << 0x12U) | (vlSelf->PSwxpT[3U] 
                                              >> 0xeU))
                             : vlSelf->PSwxpT[1U]) 
                           >> 0x16U) | ((((IData)(vlSelf->PSFmWf)
                                           ? ((vlSelf->PSwxpT[8U] 
                                               << 0x16U) 
                                              | (vlSelf->PSwxpT[7U] 
                                                 >> 0xaU))
                                           : ((vlSelf->PSwxpT[5U] 
                                               << 4U) 
                                              | (vlSelf->PSwxpT[4U] 
                                                 >> 0x1cU))) 
                                         << 0x18U) 
                                        | (0xfffc00U 
                                           & (((IData)(vlSelf->PSjup8)
                                                ? (
                                                   (vlSelf->PSwxpT[5U] 
                                                    << 0x12U) 
                                                   | (vlSelf->PSwxpT[4U] 
                                                      >> 0xeU))
                                                : vlSelf->PSwxpT[2U]) 
                                              << 0xaU))));
    vlSelf->PSBdU1[0xaU] = ((0x3ffU & (((IData)(vlSelf->PSFmWf)
                                         ? ((vlSelf->PSwxpT[8U] 
                                             << 0x16U) 
                                            | (vlSelf->PSwxpT[7U] 
                                               >> 0xaU))
                                         : ((vlSelf->PSwxpT[5U] 
                                             << 4U) 
                                            | (vlSelf->PSwxpT[4U] 
                                               >> 0x1cU))) 
                                       >> 8U)) | ((0xfffc00U 
                                                   & (((IData)(vlSelf->PSFmWf)
                                                        ? 
                                                       ((vlSelf->PSwxpT[8U] 
                                                         << 0x16U) 
                                                        | (vlSelf->PSwxpT[7U] 
                                                           >> 0xaU))
                                                        : 
                                                       ((vlSelf->PSwxpT[5U] 
                                                         << 4U) 
                                                        | (vlSelf->PSwxpT[4U] 
                                                           >> 0x1cU))) 
                                                      >> 8U)) 
                                                  | (((IData)(vlSelf->PSFmWf)
                                                       ? 
                                                      ((vlSelf->PSwxpT[9U] 
                                                        << 0x16U) 
                                                       | (vlSelf->PSwxpT[8U] 
                                                          >> 0xaU))
                                                       : 
                                                      ((vlSelf->PSwxpT[6U] 
                                                        << 4U) 
                                                       | (vlSelf->PSwxpT[5U] 
                                                          >> 0x1cU))) 
                                                     << 0x18U)));
    vlSelf->PSBdU1[0xbU] = ((0x3ffU & (((IData)(vlSelf->PSFmWf)
                                         ? ((vlSelf->PSwxpT[9U] 
                                             << 0x16U) 
                                            | (vlSelf->PSwxpT[8U] 
                                               >> 0xaU))
                                         : ((vlSelf->PSwxpT[6U] 
                                             << 4U) 
                                            | (vlSelf->PSwxpT[5U] 
                                               >> 0x1cU))) 
                                       >> 8U)) | ((0xfffc00U 
                                                   & (((IData)(vlSelf->PSFmWf)
                                                        ? 
                                                       ((vlSelf->PSwxpT[9U] 
                                                         << 0x16U) 
                                                        | (vlSelf->PSwxpT[8U] 
                                                           >> 0xaU))
                                                        : 
                                                       ((vlSelf->PSwxpT[6U] 
                                                         << 4U) 
                                                        | (vlSelf->PSwxpT[5U] 
                                                           >> 0x1cU))) 
                                                      >> 8U)) 
                                                  | (((IData)(vlSelf->PSFmWf)
                                                       ? 
                                                      ((vlSelf->PSwxpT[0xaU] 
                                                        << 0x16U) 
                                                       | (vlSelf->PSwxpT[9U] 
                                                          >> 0xaU))
                                                       : 
                                                      ((vlSelf->PSwxpT[7U] 
                                                        << 4U) 
                                                       | (vlSelf->PSwxpT[6U] 
                                                          >> 0x1cU))) 
                                                     << 0x18U)));
    vlSelf->PSBdU1[0xcU] = ((0xffffffc0U & vlSelf->PSBdU1[0xcU]) 
                            | (0x3fU & (((IData)(vlSelf->PSFmWf)
                                          ? ((vlSelf->PSwxpT[0xaU] 
                                              << 0x16U) 
                                             | (vlSelf->PSwxpT[9U] 
                                                >> 0xaU))
                                          : ((vlSelf->PSwxpT[7U] 
                                              << 4U) 
                                             | (vlSelf->PSwxpT[6U] 
                                                >> 0x1cU))) 
                                        >> 8U)));
    vlSelf->PSAyya = ((0x7eU & (IData)(vlSelf->PSAyya)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSAyya)))));
    vlSelf->PSAyya = ((0x7dU & (IData)(vlSelf->PSAyya)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSAyya)))) 
                         << 1U));
    vlSelf->PSAyya = ((0x7bU & (IData)(vlSelf->PSAyya)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSAyya)))) 
                         << 2U));
    vlSelf->PS3Cf6 = (1U & ((~ ((IData)(vlSelf->PSAyya) 
                                >> 1U)) | (((IData)(vlSelf->PSAyya) 
                                            >> 2U) 
                                           & ((IData)(vlSelf->PSs7NB) 
                                              >> 2U))));
    vlSelf->PSJ087 = (1U & ((~ ((IData)(vlSelf->PSAyya) 
                                >> 3U)) | (((IData)(vlSelf->PSAyya) 
                                            >> 4U) 
                                           & ((IData)(vlSelf->PSs7NB) 
                                              >> 1U))));
    vlSelf->PSn11w = (1U & ((~ ((IData)(vlSelf->PSAyya) 
                                >> 5U)) | (((IData)(vlSelf->PSAyya) 
                                            >> 6U) 
                                           & ((IData)(vlSelf->PSs7NB) 
                                              >> 1U))));
    vlSelf->PSV4W5 = ((7U & (IData)(vlSelf->PSV4W5)) 
                      | (8U & ((IData)(vlSelf->PSAyya) 
                               << 3U)));
    vlSelf->PSHjN2 = ((0x1cU & (IData)(vlSelf->PSHjN2)) 
                      | ((0xfffffffeU & (((1U <= (IData)(vlSelf->PS4LVi)) 
                                          << 1U) & (IData)(vlSelf->PS4HAj))) 
                         | (1U & (IData)(vlSelf->PS4HAj))));
    vlSelf->PSHjN2 = ((0x13U & (IData)(vlSelf->PSHjN2)) 
                      | ((0xfffffff8U & (((3U <= (IData)(vlSelf->PS4LVi)) 
                                          << 3U) & (IData)(vlSelf->PS4HAj))) 
                         | (0xfffffffcU & (((2U <= (IData)(vlSelf->PS4LVi)) 
                                            << 2U) 
                                           & (IData)(vlSelf->PS4HAj)))));
    vlSelf->PSHjN2 = ((0xfU & (IData)(vlSelf->PSHjN2)) 
                      | (0xfffffff0U & (((4U <= (IData)(vlSelf->PS4LVi)) 
                                         << 4U) & (IData)(vlSelf->PS4HAj))));
    vlSelf->PS2lB2 = ((0x19U & (IData)(vlSelf->PS2lB2)) 
                      | ((0xfffffffcU & (((2U > (IData)(vlSelf->PS4LVi)) 
                                          << 2U) & (IData)(vlSelf->PS4HAj))) 
                         | (0xfffffffeU & (((1U > (IData)(vlSelf->PS4LVi)) 
                                            << 1U) 
                                           & (IData)(vlSelf->PS4HAj)))));
    vlSelf->PS2lB2 = ((7U & (IData)(vlSelf->PS2lB2)) 
                      | ((0xfffffff0U & (((4U > (IData)(vlSelf->PS4LVi)) 
                                          << 4U) & (IData)(vlSelf->PS4HAj))) 
                         | (0xfffffff8U & (((3U > (IData)(vlSelf->PS4LVi)) 
                                            << 3U) 
                                           & (IData)(vlSelf->PS4HAj)))));
    vlSelf->PSM5Wv = (1U & ((~ (IData)(vlSelf->PS4HAj)) 
                            | (((IData)(vlSelf->PS4HAj) 
                                >> 1U) & (IData)(vlSelf->PS4LVi))));
    vlSelf->PS8W6m = (1U & ((~ ((IData)(vlSelf->PS4HAj) 
                                >> 2U)) | (((IData)(vlSelf->PS4HAj) 
                                            >> 3U) 
                                           & (IData)(vlSelf->PS4LVi))));
    vlSelf->PSa1IE = ((0x67U & (IData)(vlSelf->PSa1IE)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PS4HAj)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PS4HAj)))) 
                                    << 3U)));
    vlSelf->PSa1IE = ((0x5fU & (IData)(vlSelf->PSa1IE)) 
                      | (0x20U & ((IData)(vlSelf->PS4HAj) 
                                  << 1U)));
    vlSelf->PSCrJ9 = ((0x1cU & (IData)(vlSelf->PSCrJ9)) 
                      | ((0xfffffffeU & (((1U <= (IData)(vlSelf->PSGIbj)) 
                                          << 1U) & (IData)(vlSelf->PSufjf))) 
                         | (1U & (IData)(vlSelf->PSufjf))));
    vlSelf->PSCrJ9 = ((0x13U & (IData)(vlSelf->PSCrJ9)) 
                      | ((0xfffffff8U & (((3U <= (IData)(vlSelf->PSGIbj)) 
                                          << 3U) & (IData)(vlSelf->PSufjf))) 
                         | (0xfffffffcU & (((2U <= (IData)(vlSelf->PSGIbj)) 
                                            << 2U) 
                                           & (IData)(vlSelf->PSufjf)))));
    vlSelf->PSCrJ9 = ((0xfU & (IData)(vlSelf->PSCrJ9)) 
                      | (0xfffffff0U & (((4U <= (IData)(vlSelf->PSGIbj)) 
                                         << 4U) & (IData)(vlSelf->PSufjf))));
    vlSelf->PSwAdc = ((0x19U & (IData)(vlSelf->PSwAdc)) 
                      | ((0xfffffffcU & (((2U > (IData)(vlSelf->PSGIbj)) 
                                          << 2U) & (IData)(vlSelf->PSufjf))) 
                         | (0xfffffffeU & (((1U > (IData)(vlSelf->PSGIbj)) 
                                            << 1U) 
                                           & (IData)(vlSelf->PSufjf)))));
    vlSelf->PSwAdc = ((7U & (IData)(vlSelf->PSwAdc)) 
                      | ((0xfffffff0U & (((4U > (IData)(vlSelf->PSGIbj)) 
                                          << 4U) & (IData)(vlSelf->PSufjf))) 
                         | (0xfffffff8U & (((3U > (IData)(vlSelf->PSGIbj)) 
                                            << 3U) 
                                           & (IData)(vlSelf->PSufjf)))));
    vlSelf->PSWkXx = (1U & ((~ (IData)(vlSelf->PSufjf)) 
                            | (((IData)(vlSelf->PSufjf) 
                                >> 1U) & (IData)(vlSelf->PSGIbj))));
    vlSelf->PStvqG = (1U & ((~ ((IData)(vlSelf->PSufjf) 
                                >> 2U)) | (((IData)(vlSelf->PSufjf) 
                                            >> 3U) 
                                           & (IData)(vlSelf->PSGIbj))));
    vlSelf->PS0Yok = ((0x67U & (IData)(vlSelf->PS0Yok)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSufjf)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSufjf)))) 
                                    << 3U)));
    vlSelf->PS0Yok = ((0x5fU & (IData)(vlSelf->PS0Yok)) 
                      | (0x20U & ((IData)(vlSelf->PSufjf) 
                                  << 1U)));
    PSAkGt = (0x1fU & (vlSelf->PSR9tr & (- (IData)(
                                                   (1U 
                                                    & (IData)(vlSelf->PSR5GT))))));
    PSAkGt = (0x1fU & ((IData)(PSAkGt) | ((vlSelf->PSR9tr 
                                           >> 5U) & 
                                          (- (IData)(
                                                     (1U 
                                                      & ((IData)(vlSelf->PSR5GT) 
                                                         >> 1U)))))));
    PSAkGt = (0x1fU & ((IData)(PSAkGt) | ((vlSelf->PSR9tr 
                                           >> 0xaU) 
                                          & (- (IData)(
                                                       (1U 
                                                        & ((IData)(vlSelf->PSR5GT) 
                                                           >> 2U)))))));
    PSAkGt = (0x1fU & ((IData)(PSAkGt) | ((vlSelf->PSR9tr 
                                           >> 0xfU) 
                                          & (- (IData)(
                                                       (1U 
                                                        & ((IData)(vlSelf->PSR5GT) 
                                                           >> 3U)))))));
    vlSelf->PSSNLi = PSAkGt;
    vlSelf->PSoxbj = ((IData)(vlSelf->PSKN94) ? (vlSelf->PSvQlT 
                                                 >> 8U)
                       : vlSelf->PSvQlT);
    vlSelf->PSE5iY = (IData)(((IData)(vlSelf->PSErPK)
                               ? (vlSelf->PSFmdP >> 8U)
                               : vlSelf->PSFmdP));
    vlSelf->PS1CdG = ((0x7dU & (IData)(vlSelf->PS1CdG)) 
                      | (2U & (((IData)(vlSelf->PS1CdG) 
                                & (~ (IData)(vlSelf->PShSri))) 
                               << 1U)));
    vlSelf->PS1CdG = ((0x7bU & (IData)(vlSelf->PS1CdG)) 
                      | (((IData)(vlSelf->PS1CdG) & (IData)(vlSelf->PShSri)) 
                         << 2U));
    vlSelf->PS1CdG = ((0x77U & (IData)(vlSelf->PS1CdG)) 
                      | (8U & (((IData)(vlSelf->PS1CdG) 
                                << 2U) & ((~ (IData)(vlSelf->PSo3fH)) 
                                          << 3U))));
    vlSelf->PS1CdG = ((0x6fU & (IData)(vlSelf->PS1CdG)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PS1CdG) 
                                         << 3U) & ((IData)(vlSelf->PSo3fH) 
                                                   << 4U))));
    vlSelf->PS1CdG = ((0x5fU & (IData)(vlSelf->PS1CdG)) 
                      | (0x20U & (((IData)(vlSelf->PS1CdG) 
                                   << 3U) & ((~ (IData)(vlSelf->PSRI5C)) 
                                             << 5U))));
    vlSelf->PS1CdG = ((0x3fU & (IData)(vlSelf->PS1CdG)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PS1CdG) 
                                         << 4U) & ((IData)(vlSelf->PSRI5C) 
                                                   << 6U))));
    vlSelf->PSSWXE = ((0x3fU & (IData)(vlSelf->PSSWXE)) 
                      | (0x40U & ((IData)(vlSelf->PS1CdG) 
                                  & (IData)(vlSelf->PSIslx))));
    vlSelf->PSSWXE = ((0x7eU & (IData)(vlSelf->PSSWXE)) 
                      | (1U & ((((IData)(vlSelf->PS1CdG) 
                                 >> 3U) & (IData)(vlSelf->PSIslx)) 
                               & (~ (IData)(vlSelf->PSfl6s)))));
    vlSelf->PSSWXE = ((0x7dU & (IData)(vlSelf->PSSWXE)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PS1CdG) 
                                          >> 2U) & (IData)(vlSelf->PSIslx)) 
                                        & ((IData)(vlSelf->PSfl6s) 
                                           << 1U))));
    vlSelf->PSSWXE = ((0x7bU & (IData)(vlSelf->PSSWXE)) 
                      | (4U & ((((IData)(vlSelf->PS1CdG) 
                                 >> 2U) & (IData)(vlSelf->PSIslx)) 
                               & ((~ (IData)(vlSelf->PSO8iR)) 
                                  << 2U))));
    vlSelf->PSSWXE = ((0x77U & (IData)(vlSelf->PSSWXE)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PS1CdG) 
                                          >> 1U) & (IData)(vlSelf->PSIslx)) 
                                        & ((IData)(vlSelf->PSO8iR) 
                                           << 3U))));
    vlSelf->PSSWXE = ((0x6fU & (IData)(vlSelf->PSSWXE)) 
                      | (0x10U & ((((IData)(vlSelf->PS1CdG) 
                                    >> 1U) & (IData)(vlSelf->PSIslx)) 
                                  & ((~ (IData)(vlSelf->PSPwSg)) 
                                     << 4U))));
    vlSelf->PSSWXE = ((0x5fU & (IData)(vlSelf->PSSWXE)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PS1CdG) 
                                         & (IData)(vlSelf->PSIslx)) 
                                        & ((IData)(vlSelf->PSPwSg) 
                                           << 5U))));
    vlSelf->PSHHxd = ((0x7dU & (IData)(vlSelf->PSHHxd)) 
                      | (2U & (((IData)(vlSelf->PSHHxd) 
                                & (~ (IData)(vlSelf->PSmMVi))) 
                               << 1U)));
    vlSelf->PSHHxd = ((0x7bU & (IData)(vlSelf->PSHHxd)) 
                      | (((IData)(vlSelf->PSHHxd) & (IData)(vlSelf->PSmMVi)) 
                         << 2U));
    vlSelf->PSHHxd = ((0x77U & (IData)(vlSelf->PSHHxd)) 
                      | (8U & (((IData)(vlSelf->PSHHxd) 
                                << 2U) & ((~ (IData)(vlSelf->PShoug)) 
                                          << 3U))));
    vlSelf->PSHHxd = ((0x6fU & (IData)(vlSelf->PSHHxd)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSHHxd) 
                                         << 3U) & ((IData)(vlSelf->PShoug) 
                                                   << 4U))));
    vlSelf->PSHHxd = ((0x5fU & (IData)(vlSelf->PSHHxd)) 
                      | (0x20U & (((IData)(vlSelf->PSHHxd) 
                                   << 3U) & ((~ (IData)(vlSelf->PSoIaM)) 
                                             << 5U))));
    vlSelf->PSHHxd = ((0x3fU & (IData)(vlSelf->PSHHxd)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSHHxd) 
                                         << 4U) & ((IData)(vlSelf->PSoIaM) 
                                                   << 6U))));
    vlSelf->PSej36 = ((0x7eU & (IData)(vlSelf->PSej36)) 
                      | (1U & ((((IData)(vlSelf->PSHHxd) 
                                 >> 3U) & (IData)(vlSelf->PSlcfR)) 
                               & (~ (IData)(vlSelf->PS2gEl)))));
    vlSelf->PSej36 = ((0x7dU & (IData)(vlSelf->PSej36)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSHHxd) 
                                          >> 2U) & (IData)(vlSelf->PSlcfR)) 
                                        & ((IData)(vlSelf->PS2gEl) 
                                           << 1U))));
    vlSelf->PSej36 = ((0x7bU & (IData)(vlSelf->PSej36)) 
                      | (4U & ((((IData)(vlSelf->PSHHxd) 
                                 >> 2U) & (IData)(vlSelf->PSlcfR)) 
                               & ((~ (IData)(vlSelf->PSOsCR)) 
                                  << 2U))));
    vlSelf->PSej36 = ((0x77U & (IData)(vlSelf->PSej36)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSHHxd) 
                                          >> 1U) & (IData)(vlSelf->PSlcfR)) 
                                        & ((IData)(vlSelf->PSOsCR) 
                                           << 3U))));
    vlSelf->PSej36 = ((0x6fU & (IData)(vlSelf->PSej36)) 
                      | (0x10U & ((((IData)(vlSelf->PSHHxd) 
                                    >> 1U) & (IData)(vlSelf->PSlcfR)) 
                                  & ((~ (IData)(vlSelf->PS9vtE)) 
                                     << 4U))));
    vlSelf->PSej36 = ((0x5fU & (IData)(vlSelf->PSej36)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSHHxd) 
                                         & (IData)(vlSelf->PSlcfR)) 
                                        & ((IData)(vlSelf->PS9vtE) 
                                           << 5U))));
    vlSelf->PSej36 = ((0x3fU & (IData)(vlSelf->PSej36)) 
                      | (0x40U & ((IData)(vlSelf->PSHHxd) 
                                  & (IData)(vlSelf->PSlcfR))));
    vlSelf->PSCamS = ((0x7dU & (IData)(vlSelf->PSCamS)) 
                      | (2U & (((IData)(vlSelf->PSCamS) 
                                & (~ (IData)(vlSelf->PSNUPs))) 
                               << 1U)));
    vlSelf->PSCamS = ((0x7bU & (IData)(vlSelf->PSCamS)) 
                      | (((IData)(vlSelf->PSCamS) & (IData)(vlSelf->PSNUPs)) 
                         << 2U));
    vlSelf->PSCamS = ((0x77U & (IData)(vlSelf->PSCamS)) 
                      | (8U & (((IData)(vlSelf->PSCamS) 
                                << 2U) & ((~ (IData)(vlSelf->PSySsP)) 
                                          << 3U))));
    vlSelf->PSCamS = ((0x6fU & (IData)(vlSelf->PSCamS)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSCamS) 
                                         << 3U) & ((IData)(vlSelf->PSySsP) 
                                                   << 4U))));
    vlSelf->PSCamS = ((0x5fU & (IData)(vlSelf->PSCamS)) 
                      | (0x20U & (((IData)(vlSelf->PSCamS) 
                                   << 3U) & ((~ (IData)(vlSelf->PSm5dq)) 
                                             << 5U))));
    vlSelf->PSCamS = ((0x3fU & (IData)(vlSelf->PSCamS)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSCamS) 
                                         << 4U) & ((IData)(vlSelf->PSm5dq) 
                                                   << 6U))));
    vlSelf->PSgpdu = ((0x3fU & (IData)(vlSelf->PSgpdu)) 
                      | (0x40U & ((IData)(vlSelf->PSCamS) 
                                  & (IData)(vlSelf->PSt9hs))));
    vlSelf->PSgpdu = ((0x7eU & (IData)(vlSelf->PSgpdu)) 
                      | (1U & ((((IData)(vlSelf->PSCamS) 
                                 >> 3U) & (IData)(vlSelf->PSt9hs)) 
                               & (~ (IData)(vlSelf->PSP5wn)))));
    vlSelf->PSgpdu = ((0x7dU & (IData)(vlSelf->PSgpdu)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSCamS) 
                                          >> 2U) & (IData)(vlSelf->PSt9hs)) 
                                        & ((IData)(vlSelf->PSP5wn) 
                                           << 1U))));
    vlSelf->PSgpdu = ((0x7bU & (IData)(vlSelf->PSgpdu)) 
                      | (4U & ((((IData)(vlSelf->PSCamS) 
                                 >> 2U) & (IData)(vlSelf->PSt9hs)) 
                               & ((~ (IData)(vlSelf->PSkxgI)) 
                                  << 2U))));
    vlSelf->PSgpdu = ((0x77U & (IData)(vlSelf->PSgpdu)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSCamS) 
                                          >> 1U) & (IData)(vlSelf->PSt9hs)) 
                                        & ((IData)(vlSelf->PSkxgI) 
                                           << 3U))));
    vlSelf->PSgpdu = ((0x6fU & (IData)(vlSelf->PSgpdu)) 
                      | (0x10U & ((((IData)(vlSelf->PSCamS) 
                                    >> 1U) & (IData)(vlSelf->PSt9hs)) 
                                  & ((~ (IData)(vlSelf->PSKjAt)) 
                                     << 4U))));
    vlSelf->PSgpdu = ((0x5fU & (IData)(vlSelf->PSgpdu)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSCamS) 
                                         & (IData)(vlSelf->PSt9hs)) 
                                        & ((IData)(vlSelf->PSKjAt) 
                                           << 5U))));
    vlSelf->PScAMZ = ((0x7dU & (IData)(vlSelf->PScAMZ)) 
                      | (2U & (((IData)(vlSelf->PScAMZ) 
                                & (~ (IData)(vlSelf->PS8aiJ))) 
                               << 1U)));
    vlSelf->PScAMZ = ((0x7bU & (IData)(vlSelf->PScAMZ)) 
                      | (((IData)(vlSelf->PScAMZ) & (IData)(vlSelf->PS8aiJ)) 
                         << 2U));
    vlSelf->PScAMZ = ((0x77U & (IData)(vlSelf->PScAMZ)) 
                      | (8U & (((IData)(vlSelf->PScAMZ) 
                                << 2U) & ((~ (IData)(vlSelf->PS4gVu)) 
                                          << 3U))));
    vlSelf->PScAMZ = ((0x6fU & (IData)(vlSelf->PScAMZ)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PScAMZ) 
                                         << 3U) & ((IData)(vlSelf->PS4gVu) 
                                                   << 4U))));
    vlSelf->PScAMZ = ((0x5fU & (IData)(vlSelf->PScAMZ)) 
                      | (0x20U & (((IData)(vlSelf->PScAMZ) 
                                   << 3U) & ((~ (IData)(vlSelf->PS42s3)) 
                                             << 5U))));
    vlSelf->PScAMZ = ((0x3fU & (IData)(vlSelf->PScAMZ)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PScAMZ) 
                                         << 4U) & ((IData)(vlSelf->PS42s3) 
                                                   << 6U))));
    vlSelf->PSA4jX = ((0x7eU & (IData)(vlSelf->PSA4jX)) 
                      | (1U & ((((IData)(vlSelf->PScAMZ) 
                                 >> 3U) & (IData)(vlSelf->PSoU4M)) 
                               & (~ (IData)(vlSelf->PSipuI)))));
    vlSelf->PSA4jX = ((0x7dU & (IData)(vlSelf->PSA4jX)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PScAMZ) 
                                          >> 2U) & (IData)(vlSelf->PSoU4M)) 
                                        & ((IData)(vlSelf->PSipuI) 
                                           << 1U))));
    vlSelf->PSA4jX = ((0x7bU & (IData)(vlSelf->PSA4jX)) 
                      | (4U & ((((IData)(vlSelf->PScAMZ) 
                                 >> 2U) & (IData)(vlSelf->PSoU4M)) 
                               & ((~ (IData)(vlSelf->PSolHi)) 
                                  << 2U))));
    vlSelf->PSA4jX = ((0x77U & (IData)(vlSelf->PSA4jX)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PScAMZ) 
                                          >> 1U) & (IData)(vlSelf->PSoU4M)) 
                                        & ((IData)(vlSelf->PSolHi) 
                                           << 3U))));
    vlSelf->PSA4jX = ((0x6fU & (IData)(vlSelf->PSA4jX)) 
                      | (0x10U & ((((IData)(vlSelf->PScAMZ) 
                                    >> 1U) & (IData)(vlSelf->PSoU4M)) 
                                  & ((~ (IData)(vlSelf->PSaMJ3)) 
                                     << 4U))));
    vlSelf->PSA4jX = ((0x5fU & (IData)(vlSelf->PSA4jX)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PScAMZ) 
                                         & (IData)(vlSelf->PSoU4M)) 
                                        & ((IData)(vlSelf->PSaMJ3) 
                                           << 5U))));
    vlSelf->PSA4jX = ((0x3fU & (IData)(vlSelf->PSA4jX)) 
                      | (0x40U & ((IData)(vlSelf->PScAMZ) 
                                  & (IData)(vlSelf->PSoU4M))));
    vlSelf->PS77t0 = ((0x7dU & (IData)(vlSelf->PS77t0)) 
                      | (2U & (((IData)(vlSelf->PS77t0) 
                                & (~ (IData)(vlSelf->PSeTnz))) 
                               << 1U)));
    vlSelf->PS77t0 = ((0x7bU & (IData)(vlSelf->PS77t0)) 
                      | (((IData)(vlSelf->PS77t0) & (IData)(vlSelf->PSeTnz)) 
                         << 2U));
    vlSelf->PS77t0 = ((0x77U & (IData)(vlSelf->PS77t0)) 
                      | (8U & (((IData)(vlSelf->PS77t0) 
                                << 2U) & ((~ (IData)(vlSelf->PSM2Rx)) 
                                          << 3U))));
    vlSelf->PS77t0 = ((0x6fU & (IData)(vlSelf->PS77t0)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PS77t0) 
                                         << 3U) & ((IData)(vlSelf->PSM2Rx) 
                                                   << 4U))));
    vlSelf->PS77t0 = ((0x5fU & (IData)(vlSelf->PS77t0)) 
                      | (0x20U & (((IData)(vlSelf->PS77t0) 
                                   << 3U) & ((~ (IData)(vlSelf->PSIGRg)) 
                                             << 5U))));
    vlSelf->PS77t0 = ((0x3fU & (IData)(vlSelf->PS77t0)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PS77t0) 
                                         << 4U) & ((IData)(vlSelf->PSIGRg) 
                                                   << 6U))));
    vlSelf->PSYWWh = ((0x3fU & (IData)(vlSelf->PSYWWh)) 
                      | (0x40U & ((IData)(vlSelf->PS77t0) 
                                  & (IData)(vlSelf->PSWF7a))));
    vlSelf->PSYWWh = ((0x7eU & (IData)(vlSelf->PSYWWh)) 
                      | (1U & ((((IData)(vlSelf->PS77t0) 
                                 >> 3U) & (IData)(vlSelf->PSWF7a)) 
                               & (~ (IData)(vlSelf->PS42MK)))));
    vlSelf->PSYWWh = ((0x7dU & (IData)(vlSelf->PSYWWh)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PS77t0) 
                                          >> 2U) & (IData)(vlSelf->PSWF7a)) 
                                        & ((IData)(vlSelf->PS42MK) 
                                           << 1U))));
    vlSelf->PSYWWh = ((0x7bU & (IData)(vlSelf->PSYWWh)) 
                      | (4U & ((((IData)(vlSelf->PS77t0) 
                                 >> 2U) & (IData)(vlSelf->PSWF7a)) 
                               & ((~ (IData)(vlSelf->PSHaYw)) 
                                  << 2U))));
    vlSelf->PSYWWh = ((0x77U & (IData)(vlSelf->PSYWWh)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PS77t0) 
                                          >> 1U) & (IData)(vlSelf->PSWF7a)) 
                                        & ((IData)(vlSelf->PSHaYw) 
                                           << 3U))));
    vlSelf->PSYWWh = ((0x6fU & (IData)(vlSelf->PSYWWh)) 
                      | (0x10U & ((((IData)(vlSelf->PS77t0) 
                                    >> 1U) & (IData)(vlSelf->PSWF7a)) 
                                  & ((~ (IData)(vlSelf->PSXB4I)) 
                                     << 4U))));
    vlSelf->PSYWWh = ((0x5fU & (IData)(vlSelf->PSYWWh)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PS77t0) 
                                         & (IData)(vlSelf->PSWF7a)) 
                                        & ((IData)(vlSelf->PSXB4I) 
                                           << 5U))));
    vlSelf->PSenHc = ((0x7dU & (IData)(vlSelf->PSenHc)) 
                      | (2U & (((IData)(vlSelf->PSenHc) 
                                & (~ (IData)(vlSelf->PS3n6O))) 
                               << 1U)));
    vlSelf->PSenHc = ((0x7bU & (IData)(vlSelf->PSenHc)) 
                      | (((IData)(vlSelf->PSenHc) & (IData)(vlSelf->PS3n6O)) 
                         << 2U));
    vlSelf->PSenHc = ((0x77U & (IData)(vlSelf->PSenHc)) 
                      | (8U & (((IData)(vlSelf->PSenHc) 
                                << 2U) & ((~ (IData)(vlSelf->PSVlDQ)) 
                                          << 3U))));
    vlSelf->PSenHc = ((0x6fU & (IData)(vlSelf->PSenHc)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSenHc) 
                                         << 3U) & ((IData)(vlSelf->PSVlDQ) 
                                                   << 4U))));
    vlSelf->PSenHc = ((0x5fU & (IData)(vlSelf->PSenHc)) 
                      | (0x20U & (((IData)(vlSelf->PSenHc) 
                                   << 3U) & ((~ (IData)(vlSelf->PS9Bbj)) 
                                             << 5U))));
    vlSelf->PSenHc = ((0x3fU & (IData)(vlSelf->PSenHc)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSenHc) 
                                         << 4U) & ((IData)(vlSelf->PS9Bbj) 
                                                   << 6U))));
    vlSelf->PS0VPr = ((0x7eU & (IData)(vlSelf->PS0VPr)) 
                      | (1U & ((((IData)(vlSelf->PSenHc) 
                                 >> 3U) & (IData)(vlSelf->PSKoO7)) 
                               & (~ (IData)(vlSelf->PSenHH)))));
    vlSelf->PS0VPr = ((0x7dU & (IData)(vlSelf->PS0VPr)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSenHc) 
                                          >> 2U) & (IData)(vlSelf->PSKoO7)) 
                                        & ((IData)(vlSelf->PSenHH) 
                                           << 1U))));
    vlSelf->PS0VPr = ((0x7bU & (IData)(vlSelf->PS0VPr)) 
                      | (4U & ((((IData)(vlSelf->PSenHc) 
                                 >> 2U) & (IData)(vlSelf->PSKoO7)) 
                               & ((~ (IData)(vlSelf->PSDIVc)) 
                                  << 2U))));
    vlSelf->PS0VPr = ((0x77U & (IData)(vlSelf->PS0VPr)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSenHc) 
                                          >> 1U) & (IData)(vlSelf->PSKoO7)) 
                                        & ((IData)(vlSelf->PSDIVc) 
                                           << 3U))));
    vlSelf->PS0VPr = ((0x6fU & (IData)(vlSelf->PS0VPr)) 
                      | (0x10U & ((((IData)(vlSelf->PSenHc) 
                                    >> 1U) & (IData)(vlSelf->PSKoO7)) 
                                  & ((~ (IData)(vlSelf->PSbFLS)) 
                                     << 4U))));
    vlSelf->PS0VPr = ((0x5fU & (IData)(vlSelf->PS0VPr)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSenHc) 
                                         & (IData)(vlSelf->PSKoO7)) 
                                        & ((IData)(vlSelf->PSbFLS) 
                                           << 5U))));
    vlSelf->PS0VPr = ((0x3fU & (IData)(vlSelf->PS0VPr)) 
                      | (0x40U & ((IData)(vlSelf->PSenHc) 
                                  & (IData)(vlSelf->PSKoO7))));
    vlSelf->PSBTD8 = ((0x7dU & (IData)(vlSelf->PSBTD8)) 
                      | (2U & (((IData)(vlSelf->PSBTD8) 
                                & (~ (IData)(vlSelf->PShCo0))) 
                               << 1U)));
    vlSelf->PSBTD8 = ((0x7bU & (IData)(vlSelf->PSBTD8)) 
                      | (((IData)(vlSelf->PSBTD8) & (IData)(vlSelf->PShCo0)) 
                         << 2U));
    vlSelf->PSBTD8 = ((0x77U & (IData)(vlSelf->PSBTD8)) 
                      | (8U & (((IData)(vlSelf->PSBTD8) 
                                << 2U) & ((~ (IData)(vlSelf->PSJNlE)) 
                                          << 3U))));
    vlSelf->PSBTD8 = ((0x6fU & (IData)(vlSelf->PSBTD8)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSBTD8) 
                                         << 3U) & ((IData)(vlSelf->PSJNlE) 
                                                   << 4U))));
    vlSelf->PSBTD8 = ((0x5fU & (IData)(vlSelf->PSBTD8)) 
                      | (0x20U & (((IData)(vlSelf->PSBTD8) 
                                   << 3U) & ((~ (IData)(vlSelf->PSAzKg)) 
                                             << 5U))));
    vlSelf->PSBTD8 = ((0x3fU & (IData)(vlSelf->PSBTD8)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSBTD8) 
                                         << 4U) & ((IData)(vlSelf->PSAzKg) 
                                                   << 6U))));
    vlSelf->PSovB6 = ((0x3fU & (IData)(vlSelf->PSovB6)) 
                      | (0x40U & ((IData)(vlSelf->PSBTD8) 
                                  & (IData)(vlSelf->PSWsXX))));
    vlSelf->PSovB6 = ((0x7eU & (IData)(vlSelf->PSovB6)) 
                      | (1U & ((((IData)(vlSelf->PSBTD8) 
                                 >> 3U) & (IData)(vlSelf->PSWsXX)) 
                               & (~ (IData)(vlSelf->PSFdK4)))));
    vlSelf->PSovB6 = ((0x7dU & (IData)(vlSelf->PSovB6)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSBTD8) 
                                          >> 2U) & (IData)(vlSelf->PSWsXX)) 
                                        & ((IData)(vlSelf->PSFdK4) 
                                           << 1U))));
    vlSelf->PSovB6 = ((0x7bU & (IData)(vlSelf->PSovB6)) 
                      | (4U & ((((IData)(vlSelf->PSBTD8) 
                                 >> 2U) & (IData)(vlSelf->PSWsXX)) 
                               & ((~ (IData)(vlSelf->PS0pdu)) 
                                  << 2U))));
    vlSelf->PSovB6 = ((0x77U & (IData)(vlSelf->PSovB6)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSBTD8) 
                                          >> 1U) & (IData)(vlSelf->PSWsXX)) 
                                        & ((IData)(vlSelf->PS0pdu) 
                                           << 3U))));
    vlSelf->PSovB6 = ((0x6fU & (IData)(vlSelf->PSovB6)) 
                      | (0x10U & ((((IData)(vlSelf->PSBTD8) 
                                    >> 1U) & (IData)(vlSelf->PSWsXX)) 
                                  & ((~ (IData)(vlSelf->PSlAWg)) 
                                     << 4U))));
    vlSelf->PSovB6 = ((0x5fU & (IData)(vlSelf->PSovB6)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSBTD8) 
                                         & (IData)(vlSelf->PSWsXX)) 
                                        & ((IData)(vlSelf->PSlAWg) 
                                           << 5U))));
    vlSelf->PS80TZ = ((0x7dU & (IData)(vlSelf->PS80TZ)) 
                      | (2U & (((IData)(vlSelf->PS80TZ) 
                                & (~ (IData)(vlSelf->PSXLGK))) 
                               << 1U)));
    vlSelf->PS80TZ = ((0x7bU & (IData)(vlSelf->PS80TZ)) 
                      | (((IData)(vlSelf->PS80TZ) & (IData)(vlSelf->PSXLGK)) 
                         << 2U));
    vlSelf->PS80TZ = ((0x77U & (IData)(vlSelf->PS80TZ)) 
                      | (8U & (((IData)(vlSelf->PS80TZ) 
                                << 2U) & ((~ (IData)(vlSelf->PSz9ls)) 
                                          << 3U))));
    vlSelf->PS80TZ = ((0x6fU & (IData)(vlSelf->PS80TZ)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PS80TZ) 
                                         << 3U) & ((IData)(vlSelf->PSz9ls) 
                                                   << 4U))));
    vlSelf->PS80TZ = ((0x5fU & (IData)(vlSelf->PS80TZ)) 
                      | (0x20U & (((IData)(vlSelf->PS80TZ) 
                                   << 3U) & ((~ (IData)(vlSelf->PSadYh)) 
                                             << 5U))));
    vlSelf->PS80TZ = ((0x3fU & (IData)(vlSelf->PS80TZ)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PS80TZ) 
                                         << 4U) & ((IData)(vlSelf->PSadYh) 
                                                   << 6U))));
    vlSelf->PS4jBs = ((0x7eU & (IData)(vlSelf->PS4jBs)) 
                      | (1U & ((((IData)(vlSelf->PS80TZ) 
                                 >> 3U) & (IData)(vlSelf->PSAMPo)) 
                               & (~ (IData)(vlSelf->PSjpqe)))));
    vlSelf->PS4jBs = ((0x7dU & (IData)(vlSelf->PS4jBs)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PS80TZ) 
                                          >> 2U) & (IData)(vlSelf->PSAMPo)) 
                                        & ((IData)(vlSelf->PSjpqe) 
                                           << 1U))));
    vlSelf->PS4jBs = ((0x7bU & (IData)(vlSelf->PS4jBs)) 
                      | (4U & ((((IData)(vlSelf->PS80TZ) 
                                 >> 2U) & (IData)(vlSelf->PSAMPo)) 
                               & ((~ (IData)(vlSelf->PS6SUx)) 
                                  << 2U))));
    vlSelf->PS4jBs = ((0x77U & (IData)(vlSelf->PS4jBs)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PS80TZ) 
                                          >> 1U) & (IData)(vlSelf->PSAMPo)) 
                                        & ((IData)(vlSelf->PS6SUx) 
                                           << 3U))));
    vlSelf->PS4jBs = ((0x6fU & (IData)(vlSelf->PS4jBs)) 
                      | (0x10U & ((((IData)(vlSelf->PS80TZ) 
                                    >> 1U) & (IData)(vlSelf->PSAMPo)) 
                                  & ((~ (IData)(vlSelf->PSIKtQ)) 
                                     << 4U))));
    vlSelf->PS4jBs = ((0x5fU & (IData)(vlSelf->PS4jBs)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PS80TZ) 
                                         & (IData)(vlSelf->PSAMPo)) 
                                        & ((IData)(vlSelf->PSIKtQ) 
                                           << 5U))));
    vlSelf->PS4jBs = ((0x3fU & (IData)(vlSelf->PS4jBs)) 
                      | (0x40U & ((IData)(vlSelf->PS80TZ) 
                                  & (IData)(vlSelf->PSAMPo))));
    vlSelf->PS7kEm = ((0x7dU & (IData)(vlSelf->PS7kEm)) 
                      | (2U & (((IData)(vlSelf->PS7kEm) 
                                & (~ (IData)(vlSelf->PSOU2d))) 
                               << 1U)));
    vlSelf->PS7kEm = ((0x7bU & (IData)(vlSelf->PS7kEm)) 
                      | (((IData)(vlSelf->PS7kEm) & (IData)(vlSelf->PSOU2d)) 
                         << 2U));
    vlSelf->PS7kEm = ((0x77U & (IData)(vlSelf->PS7kEm)) 
                      | (8U & (((IData)(vlSelf->PS7kEm) 
                                << 2U) & ((~ (IData)(vlSelf->PScnnS)) 
                                          << 3U))));
    vlSelf->PS7kEm = ((0x6fU & (IData)(vlSelf->PS7kEm)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PS7kEm) 
                                         << 3U) & ((IData)(vlSelf->PScnnS) 
                                                   << 4U))));
    vlSelf->PS7kEm = ((0x5fU & (IData)(vlSelf->PS7kEm)) 
                      | (0x20U & (((IData)(vlSelf->PS7kEm) 
                                   << 3U) & ((~ (IData)(vlSelf->PSQ4XT)) 
                                             << 5U))));
    vlSelf->PS7kEm = ((0x3fU & (IData)(vlSelf->PS7kEm)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PS7kEm) 
                                         << 4U) & ((IData)(vlSelf->PSQ4XT) 
                                                   << 6U))));
    vlSelf->PSALmS = ((0x3fU & (IData)(vlSelf->PSALmS)) 
                      | (0x40U & ((IData)(vlSelf->PS7kEm) 
                                  & (IData)(vlSelf->PSpxY6))));
    vlSelf->PSALmS = ((0x7eU & (IData)(vlSelf->PSALmS)) 
                      | (1U & ((((IData)(vlSelf->PS7kEm) 
                                 >> 3U) & (IData)(vlSelf->PSpxY6)) 
                               & (~ (IData)(vlSelf->PStfrh)))));
    vlSelf->PSALmS = ((0x7dU & (IData)(vlSelf->PSALmS)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PS7kEm) 
                                          >> 2U) & (IData)(vlSelf->PSpxY6)) 
                                        & ((IData)(vlSelf->PStfrh) 
                                           << 1U))));
    vlSelf->PSALmS = ((0x7bU & (IData)(vlSelf->PSALmS)) 
                      | (4U & ((((IData)(vlSelf->PS7kEm) 
                                 >> 2U) & (IData)(vlSelf->PSpxY6)) 
                               & ((~ (IData)(vlSelf->PSBAub)) 
                                  << 2U))));
    vlSelf->PSALmS = ((0x77U & (IData)(vlSelf->PSALmS)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PS7kEm) 
                                          >> 1U) & (IData)(vlSelf->PSpxY6)) 
                                        & ((IData)(vlSelf->PSBAub) 
                                           << 3U))));
    vlSelf->PSALmS = ((0x6fU & (IData)(vlSelf->PSALmS)) 
                      | (0x10U & ((((IData)(vlSelf->PS7kEm) 
                                    >> 1U) & (IData)(vlSelf->PSpxY6)) 
                                  & ((~ (IData)(vlSelf->PSMHy9)) 
                                     << 4U))));
    vlSelf->PSALmS = ((0x5fU & (IData)(vlSelf->PSALmS)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PS7kEm) 
                                         & (IData)(vlSelf->PSpxY6)) 
                                        & ((IData)(vlSelf->PSMHy9) 
                                           << 5U))));
    vlSelf->PSKVq4 = ((0x7dU & (IData)(vlSelf->PSKVq4)) 
                      | (2U & (((IData)(vlSelf->PSKVq4) 
                                & (~ (IData)(vlSelf->PSJZXz))) 
                               << 1U)));
    vlSelf->PSKVq4 = ((0x7bU & (IData)(vlSelf->PSKVq4)) 
                      | (((IData)(vlSelf->PSKVq4) & (IData)(vlSelf->PSJZXz)) 
                         << 2U));
    vlSelf->PSKVq4 = ((0x77U & (IData)(vlSelf->PSKVq4)) 
                      | (8U & (((IData)(vlSelf->PSKVq4) 
                                << 2U) & ((~ (IData)(vlSelf->PSYaFB)) 
                                          << 3U))));
    vlSelf->PSKVq4 = ((0x6fU & (IData)(vlSelf->PSKVq4)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSKVq4) 
                                         << 3U) & ((IData)(vlSelf->PSYaFB) 
                                                   << 4U))));
    vlSelf->PSKVq4 = ((0x5fU & (IData)(vlSelf->PSKVq4)) 
                      | (0x20U & (((IData)(vlSelf->PSKVq4) 
                                   << 3U) & ((~ (IData)(vlSelf->PSlcV7)) 
                                             << 5U))));
    vlSelf->PSKVq4 = ((0x3fU & (IData)(vlSelf->PSKVq4)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSKVq4) 
                                         << 4U) & ((IData)(vlSelf->PSlcV7) 
                                                   << 6U))));
    vlSelf->PSiVKy = ((0x7eU & (IData)(vlSelf->PSiVKy)) 
                      | (1U & ((((IData)(vlSelf->PSKVq4) 
                                 >> 3U) & (IData)(vlSelf->PSIy7M)) 
                               & (~ (IData)(vlSelf->PSXlfB)))));
    vlSelf->PSiVKy = ((0x7dU & (IData)(vlSelf->PSiVKy)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSKVq4) 
                                          >> 2U) & (IData)(vlSelf->PSIy7M)) 
                                        & ((IData)(vlSelf->PSXlfB) 
                                           << 1U))));
    vlSelf->PSiVKy = ((0x7bU & (IData)(vlSelf->PSiVKy)) 
                      | (4U & ((((IData)(vlSelf->PSKVq4) 
                                 >> 2U) & (IData)(vlSelf->PSIy7M)) 
                               & ((~ (IData)(vlSelf->PSz4gf)) 
                                  << 2U))));
    vlSelf->PSiVKy = ((0x77U & (IData)(vlSelf->PSiVKy)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSKVq4) 
                                          >> 1U) & (IData)(vlSelf->PSIy7M)) 
                                        & ((IData)(vlSelf->PSz4gf) 
                                           << 3U))));
    vlSelf->PSiVKy = ((0x6fU & (IData)(vlSelf->PSiVKy)) 
                      | (0x10U & ((((IData)(vlSelf->PSKVq4) 
                                    >> 1U) & (IData)(vlSelf->PSIy7M)) 
                                  & ((~ (IData)(vlSelf->PSi5FI)) 
                                     << 4U))));
    vlSelf->PSiVKy = ((0x5fU & (IData)(vlSelf->PSiVKy)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSKVq4) 
                                         & (IData)(vlSelf->PSIy7M)) 
                                        & ((IData)(vlSelf->PSi5FI) 
                                           << 5U))));
    vlSelf->PSiVKy = ((0x3fU & (IData)(vlSelf->PSiVKy)) 
                      | (0x40U & ((IData)(vlSelf->PSKVq4) 
                                  & (IData)(vlSelf->PSIy7M))));
    vlSelf->PSAm4L = ((0x7dU & (IData)(vlSelf->PSAm4L)) 
                      | (2U & (((IData)(vlSelf->PSAm4L) 
                                & (~ (IData)(vlSelf->PSpwVf))) 
                               << 1U)));
    vlSelf->PSAm4L = ((0x7bU & (IData)(vlSelf->PSAm4L)) 
                      | (((IData)(vlSelf->PSAm4L) & (IData)(vlSelf->PSpwVf)) 
                         << 2U));
    vlSelf->PSAm4L = ((0x77U & (IData)(vlSelf->PSAm4L)) 
                      | (8U & (((IData)(vlSelf->PSAm4L) 
                                << 2U) & ((~ (IData)(vlSelf->PSO0OO)) 
                                          << 3U))));
    vlSelf->PSAm4L = ((0x6fU & (IData)(vlSelf->PSAm4L)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSAm4L) 
                                         << 3U) & ((IData)(vlSelf->PSO0OO) 
                                                   << 4U))));
    vlSelf->PSAm4L = ((0x5fU & (IData)(vlSelf->PSAm4L)) 
                      | (0x20U & (((IData)(vlSelf->PSAm4L) 
                                   << 3U) & ((~ (IData)(vlSelf->PSLaqq)) 
                                             << 5U))));
    vlSelf->PSAm4L = ((0x3fU & (IData)(vlSelf->PSAm4L)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSAm4L) 
                                         << 4U) & ((IData)(vlSelf->PSLaqq) 
                                                   << 6U))));
    vlSelf->PSOoP1 = ((0x3fU & (IData)(vlSelf->PSOoP1)) 
                      | (0x40U & ((IData)(vlSelf->PSAm4L) 
                                  & (IData)(vlSelf->PSFk0F))));
    vlSelf->PSOoP1 = ((0x7eU & (IData)(vlSelf->PSOoP1)) 
                      | (1U & ((((IData)(vlSelf->PSAm4L) 
                                 >> 3U) & (IData)(vlSelf->PSFk0F)) 
                               & (~ (IData)(vlSelf->PSq0L3)))));
    vlSelf->PSOoP1 = ((0x7dU & (IData)(vlSelf->PSOoP1)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSAm4L) 
                                          >> 2U) & (IData)(vlSelf->PSFk0F)) 
                                        & ((IData)(vlSelf->PSq0L3) 
                                           << 1U))));
    vlSelf->PSOoP1 = ((0x7bU & (IData)(vlSelf->PSOoP1)) 
                      | (4U & ((((IData)(vlSelf->PSAm4L) 
                                 >> 2U) & (IData)(vlSelf->PSFk0F)) 
                               & ((~ (IData)(vlSelf->PSDkMw)) 
                                  << 2U))));
    vlSelf->PSOoP1 = ((0x77U & (IData)(vlSelf->PSOoP1)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSAm4L) 
                                          >> 1U) & (IData)(vlSelf->PSFk0F)) 
                                        & ((IData)(vlSelf->PSDkMw) 
                                           << 3U))));
    vlSelf->PSOoP1 = ((0x6fU & (IData)(vlSelf->PSOoP1)) 
                      | (0x10U & ((((IData)(vlSelf->PSAm4L) 
                                    >> 1U) & (IData)(vlSelf->PSFk0F)) 
                                  & ((~ (IData)(vlSelf->PSeWCN)) 
                                     << 4U))));
    vlSelf->PSOoP1 = ((0x5fU & (IData)(vlSelf->PSOoP1)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSAm4L) 
                                         & (IData)(vlSelf->PSFk0F)) 
                                        & ((IData)(vlSelf->PSeWCN) 
                                           << 5U))));
    vlSelf->PSHGRv = ((0x7dU & (IData)(vlSelf->PSHGRv)) 
                      | (2U & (((IData)(vlSelf->PSHGRv) 
                                & (~ (IData)(vlSelf->PSwGAA))) 
                               << 1U)));
    vlSelf->PSHGRv = ((0x7bU & (IData)(vlSelf->PSHGRv)) 
                      | (((IData)(vlSelf->PSHGRv) & (IData)(vlSelf->PSwGAA)) 
                         << 2U));
    vlSelf->PSHGRv = ((0x77U & (IData)(vlSelf->PSHGRv)) 
                      | (8U & (((IData)(vlSelf->PSHGRv) 
                                << 2U) & ((~ (IData)(vlSelf->PSzB8Z)) 
                                          << 3U))));
    vlSelf->PSHGRv = ((0x6fU & (IData)(vlSelf->PSHGRv)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSHGRv) 
                                         << 3U) & ((IData)(vlSelf->PSzB8Z) 
                                                   << 4U))));
    vlSelf->PSHGRv = ((0x5fU & (IData)(vlSelf->PSHGRv)) 
                      | (0x20U & (((IData)(vlSelf->PSHGRv) 
                                   << 3U) & ((~ (IData)(vlSelf->PSkUBA)) 
                                             << 5U))));
    vlSelf->PSHGRv = ((0x3fU & (IData)(vlSelf->PSHGRv)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSHGRv) 
                                         << 4U) & ((IData)(vlSelf->PSkUBA) 
                                                   << 6U))));
    vlSelf->PSUccn = ((0x7eU & (IData)(vlSelf->PSUccn)) 
                      | (1U & ((((IData)(vlSelf->PSHGRv) 
                                 >> 3U) & (IData)(vlSelf->PSpdPy)) 
                               & (~ (IData)(vlSelf->PSEeQZ)))));
    vlSelf->PSUccn = ((0x7dU & (IData)(vlSelf->PSUccn)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSHGRv) 
                                          >> 2U) & (IData)(vlSelf->PSpdPy)) 
                                        & ((IData)(vlSelf->PSEeQZ) 
                                           << 1U))));
    vlSelf->PSUccn = ((0x7bU & (IData)(vlSelf->PSUccn)) 
                      | (4U & ((((IData)(vlSelf->PSHGRv) 
                                 >> 2U) & (IData)(vlSelf->PSpdPy)) 
                               & ((~ (IData)(vlSelf->PSSHss)) 
                                  << 2U))));
    vlSelf->PSUccn = ((0x77U & (IData)(vlSelf->PSUccn)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSHGRv) 
                                          >> 1U) & (IData)(vlSelf->PSpdPy)) 
                                        & ((IData)(vlSelf->PSSHss) 
                                           << 3U))));
    vlSelf->PSUccn = ((0x6fU & (IData)(vlSelf->PSUccn)) 
                      | (0x10U & ((((IData)(vlSelf->PSHGRv) 
                                    >> 1U) & (IData)(vlSelf->PSpdPy)) 
                                  & ((~ (IData)(vlSelf->PSFAsA)) 
                                     << 4U))));
    vlSelf->PSUccn = ((0x5fU & (IData)(vlSelf->PSUccn)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSHGRv) 
                                         & (IData)(vlSelf->PSpdPy)) 
                                        & ((IData)(vlSelf->PSFAsA) 
                                           << 5U))));
    vlSelf->PSUccn = ((0x3fU & (IData)(vlSelf->PSUccn)) 
                      | (0x40U & ((IData)(vlSelf->PSHGRv) 
                                  & (IData)(vlSelf->PSpdPy))));
    vlSelf->PS3Nfp = ((0x7dU & (IData)(vlSelf->PS3Nfp)) 
                      | (2U & (((IData)(vlSelf->PS3Nfp) 
                                & (~ (IData)(vlSelf->PSWdFX))) 
                               << 1U)));
    vlSelf->PS3Nfp = ((0x7bU & (IData)(vlSelf->PS3Nfp)) 
                      | (((IData)(vlSelf->PS3Nfp) & (IData)(vlSelf->PSWdFX)) 
                         << 2U));
    vlSelf->PS3Nfp = ((0x77U & (IData)(vlSelf->PS3Nfp)) 
                      | (8U & (((IData)(vlSelf->PS3Nfp) 
                                << 2U) & ((~ (IData)(vlSelf->PSoXe3)) 
                                          << 3U))));
    vlSelf->PS3Nfp = ((0x6fU & (IData)(vlSelf->PS3Nfp)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PS3Nfp) 
                                         << 3U) & ((IData)(vlSelf->PSoXe3) 
                                                   << 4U))));
    vlSelf->PS3Nfp = ((0x5fU & (IData)(vlSelf->PS3Nfp)) 
                      | (0x20U & (((IData)(vlSelf->PS3Nfp) 
                                   << 3U) & ((~ (IData)(vlSelf->PSU4U2)) 
                                             << 5U))));
    vlSelf->PS3Nfp = ((0x3fU & (IData)(vlSelf->PS3Nfp)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PS3Nfp) 
                                         << 4U) & ((IData)(vlSelf->PSU4U2) 
                                                   << 6U))));
    vlSelf->PSBoCm = ((0x3fU & (IData)(vlSelf->PSBoCm)) 
                      | (0x40U & ((IData)(vlSelf->PS3Nfp) 
                                  & (IData)(vlSelf->PSt1nv))));
    vlSelf->PSBoCm = ((0x7eU & (IData)(vlSelf->PSBoCm)) 
                      | (1U & ((((IData)(vlSelf->PS3Nfp) 
                                 >> 3U) & (IData)(vlSelf->PSt1nv)) 
                               & (~ (IData)(vlSelf->PSAiXs)))));
    vlSelf->PSBoCm = ((0x7dU & (IData)(vlSelf->PSBoCm)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PS3Nfp) 
                                          >> 2U) & (IData)(vlSelf->PSt1nv)) 
                                        & ((IData)(vlSelf->PSAiXs) 
                                           << 1U))));
    vlSelf->PSBoCm = ((0x7bU & (IData)(vlSelf->PSBoCm)) 
                      | (4U & ((((IData)(vlSelf->PS3Nfp) 
                                 >> 2U) & (IData)(vlSelf->PSt1nv)) 
                               & ((~ (IData)(vlSelf->PSAF50)) 
                                  << 2U))));
    vlSelf->PSBoCm = ((0x77U & (IData)(vlSelf->PSBoCm)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PS3Nfp) 
                                          >> 1U) & (IData)(vlSelf->PSt1nv)) 
                                        & ((IData)(vlSelf->PSAF50) 
                                           << 3U))));
    vlSelf->PSBoCm = ((0x6fU & (IData)(vlSelf->PSBoCm)) 
                      | (0x10U & ((((IData)(vlSelf->PS3Nfp) 
                                    >> 1U) & (IData)(vlSelf->PSt1nv)) 
                                  & ((~ (IData)(vlSelf->PSpXi6)) 
                                     << 4U))));
    vlSelf->PSBoCm = ((0x5fU & (IData)(vlSelf->PSBoCm)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PS3Nfp) 
                                         & (IData)(vlSelf->PSt1nv)) 
                                        & ((IData)(vlSelf->PSpXi6) 
                                           << 5U))));
    vlSelf->PSzZSR = ((0x7dU & (IData)(vlSelf->PSzZSR)) 
                      | (2U & (((IData)(vlSelf->PSzZSR) 
                                & (~ (IData)(vlSelf->PS4tmi))) 
                               << 1U)));
    vlSelf->PSzZSR = ((0x7bU & (IData)(vlSelf->PSzZSR)) 
                      | (((IData)(vlSelf->PSzZSR) & (IData)(vlSelf->PS4tmi)) 
                         << 2U));
    vlSelf->PSzZSR = ((0x77U & (IData)(vlSelf->PSzZSR)) 
                      | (8U & (((IData)(vlSelf->PSzZSR) 
                                << 2U) & ((~ (IData)(vlSelf->PSFDSQ)) 
                                          << 3U))));
    vlSelf->PSzZSR = ((0x6fU & (IData)(vlSelf->PSzZSR)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSzZSR) 
                                         << 3U) & ((IData)(vlSelf->PSFDSQ) 
                                                   << 4U))));
    vlSelf->PSzZSR = ((0x5fU & (IData)(vlSelf->PSzZSR)) 
                      | (0x20U & (((IData)(vlSelf->PSzZSR) 
                                   << 3U) & ((~ (IData)(vlSelf->PSQ1dT)) 
                                             << 5U))));
    vlSelf->PSzZSR = ((0x3fU & (IData)(vlSelf->PSzZSR)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSzZSR) 
                                         << 4U) & ((IData)(vlSelf->PSQ1dT) 
                                                   << 6U))));
    vlSelf->PSNVg5 = ((0x7eU & (IData)(vlSelf->PSNVg5)) 
                      | (1U & ((((IData)(vlSelf->PSzZSR) 
                                 >> 3U) & (IData)(vlSelf->PSGjLH)) 
                               & (~ (IData)(vlSelf->PSFmwv)))));
    vlSelf->PSNVg5 = ((0x7dU & (IData)(vlSelf->PSNVg5)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSzZSR) 
                                          >> 2U) & (IData)(vlSelf->PSGjLH)) 
                                        & ((IData)(vlSelf->PSFmwv) 
                                           << 1U))));
    vlSelf->PSNVg5 = ((0x7bU & (IData)(vlSelf->PSNVg5)) 
                      | (4U & ((((IData)(vlSelf->PSzZSR) 
                                 >> 2U) & (IData)(vlSelf->PSGjLH)) 
                               & ((~ (IData)(vlSelf->PS76bW)) 
                                  << 2U))));
    vlSelf->PSNVg5 = ((0x77U & (IData)(vlSelf->PSNVg5)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSzZSR) 
                                          >> 1U) & (IData)(vlSelf->PSGjLH)) 
                                        & ((IData)(vlSelf->PS76bW) 
                                           << 3U))));
    vlSelf->PSNVg5 = ((0x6fU & (IData)(vlSelf->PSNVg5)) 
                      | (0x10U & ((((IData)(vlSelf->PSzZSR) 
                                    >> 1U) & (IData)(vlSelf->PSGjLH)) 
                                  & ((~ (IData)(vlSelf->PSMRcz)) 
                                     << 4U))));
    vlSelf->PSNVg5 = ((0x5fU & (IData)(vlSelf->PSNVg5)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSzZSR) 
                                         & (IData)(vlSelf->PSGjLH)) 
                                        & ((IData)(vlSelf->PSMRcz) 
                                           << 5U))));
    vlSelf->PSNVg5 = ((0x3fU & (IData)(vlSelf->PSNVg5)) 
                      | (0x40U & ((IData)(vlSelf->PSzZSR) 
                                  & (IData)(vlSelf->PSGjLH))));
    vlSelf->PSoABX = ((0x7dU & (IData)(vlSelf->PSoABX)) 
                      | (2U & (((IData)(vlSelf->PSoABX) 
                                & (~ (IData)(vlSelf->PShAQS))) 
                               << 1U)));
    vlSelf->PSoABX = ((0x7bU & (IData)(vlSelf->PSoABX)) 
                      | (((IData)(vlSelf->PSoABX) & (IData)(vlSelf->PShAQS)) 
                         << 2U));
    vlSelf->PSoABX = ((0x77U & (IData)(vlSelf->PSoABX)) 
                      | (8U & (((IData)(vlSelf->PSoABX) 
                                << 2U) & ((~ (IData)(vlSelf->PSlIcn)) 
                                          << 3U))));
    vlSelf->PSoABX = ((0x6fU & (IData)(vlSelf->PSoABX)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSoABX) 
                                         << 3U) & ((IData)(vlSelf->PSlIcn) 
                                                   << 4U))));
    vlSelf->PSoABX = ((0x5fU & (IData)(vlSelf->PSoABX)) 
                      | (0x20U & (((IData)(vlSelf->PSoABX) 
                                   << 3U) & ((~ (IData)(vlSelf->PSsjWi)) 
                                             << 5U))));
    vlSelf->PSoABX = ((0x3fU & (IData)(vlSelf->PSoABX)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSoABX) 
                                         << 4U) & ((IData)(vlSelf->PSsjWi) 
                                                   << 6U))));
    vlSelf->PSeYcJ = ((0x3fU & (IData)(vlSelf->PSeYcJ)) 
                      | (0x40U & ((IData)(vlSelf->PSoABX) 
                                  & (IData)(vlSelf->PS1AxR))));
    vlSelf->PSeYcJ = ((0x7eU & (IData)(vlSelf->PSeYcJ)) 
                      | (1U & ((((IData)(vlSelf->PSoABX) 
                                 >> 3U) & (IData)(vlSelf->PS1AxR)) 
                               & (~ (IData)(vlSelf->PSxt4B)))));
    vlSelf->PSeYcJ = ((0x7dU & (IData)(vlSelf->PSeYcJ)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSoABX) 
                                          >> 2U) & (IData)(vlSelf->PS1AxR)) 
                                        & ((IData)(vlSelf->PSxt4B) 
                                           << 1U))));
    vlSelf->PSeYcJ = ((0x7bU & (IData)(vlSelf->PSeYcJ)) 
                      | (4U & ((((IData)(vlSelf->PSoABX) 
                                 >> 2U) & (IData)(vlSelf->PS1AxR)) 
                               & ((~ (IData)(vlSelf->PSbvi6)) 
                                  << 2U))));
    vlSelf->PSeYcJ = ((0x77U & (IData)(vlSelf->PSeYcJ)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSoABX) 
                                          >> 1U) & (IData)(vlSelf->PS1AxR)) 
                                        & ((IData)(vlSelf->PSbvi6) 
                                           << 3U))));
    vlSelf->PSeYcJ = ((0x6fU & (IData)(vlSelf->PSeYcJ)) 
                      | (0x10U & ((((IData)(vlSelf->PSoABX) 
                                    >> 1U) & (IData)(vlSelf->PS1AxR)) 
                                  & ((~ (IData)(vlSelf->PSpYMs)) 
                                     << 4U))));
    vlSelf->PSeYcJ = ((0x5fU & (IData)(vlSelf->PSeYcJ)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSoABX) 
                                         & (IData)(vlSelf->PS1AxR)) 
                                        & ((IData)(vlSelf->PSpYMs) 
                                           << 5U))));
    vlSelf->PSKbGq = ((0x7dU & (IData)(vlSelf->PSKbGq)) 
                      | (2U & (((IData)(vlSelf->PSKbGq) 
                                & (~ (IData)(vlSelf->PSJcxo))) 
                               << 1U)));
    vlSelf->PSKbGq = ((0x7bU & (IData)(vlSelf->PSKbGq)) 
                      | (((IData)(vlSelf->PSKbGq) & (IData)(vlSelf->PSJcxo)) 
                         << 2U));
    vlSelf->PSKbGq = ((0x77U & (IData)(vlSelf->PSKbGq)) 
                      | (8U & (((IData)(vlSelf->PSKbGq) 
                                << 2U) & ((~ (IData)(vlSelf->PS3Uy1)) 
                                          << 3U))));
    vlSelf->PSKbGq = ((0x6fU & (IData)(vlSelf->PSKbGq)) 
                      | (0xfffffff0U & (((IData)(vlSelf->PSKbGq) 
                                         << 3U) & ((IData)(vlSelf->PS3Uy1) 
                                                   << 4U))));
    vlSelf->PSKbGq = ((0x5fU & (IData)(vlSelf->PSKbGq)) 
                      | (0x20U & (((IData)(vlSelf->PSKbGq) 
                                   << 3U) & ((~ (IData)(vlSelf->PS0BJW)) 
                                             << 5U))));
    vlSelf->PSKbGq = ((0x3fU & (IData)(vlSelf->PSKbGq)) 
                      | (0xffffffc0U & (((IData)(vlSelf->PSKbGq) 
                                         << 4U) & ((IData)(vlSelf->PS0BJW) 
                                                   << 6U))));
    vlSelf->PSubBt = ((0x7eU & (IData)(vlSelf->PSubBt)) 
                      | (1U & ((((IData)(vlSelf->PSKbGq) 
                                 >> 3U) & (IData)(vlSelf->PSvnSY)) 
                               & (~ (IData)(vlSelf->PS9EmN)))));
    vlSelf->PSubBt = ((0x7dU & (IData)(vlSelf->PSubBt)) 
                      | (0x3ffffffeU & ((((IData)(vlSelf->PSKbGq) 
                                          >> 2U) & (IData)(vlSelf->PSvnSY)) 
                                        & ((IData)(vlSelf->PS9EmN) 
                                           << 1U))));
    vlSelf->PSubBt = ((0x7bU & (IData)(vlSelf->PSubBt)) 
                      | (4U & ((((IData)(vlSelf->PSKbGq) 
                                 >> 2U) & (IData)(vlSelf->PSvnSY)) 
                               & ((~ (IData)(vlSelf->PSBAsQ)) 
                                  << 2U))));
    vlSelf->PSubBt = ((0x77U & (IData)(vlSelf->PSubBt)) 
                      | (0x7ffffff8U & ((((IData)(vlSelf->PSKbGq) 
                                          >> 1U) & (IData)(vlSelf->PSvnSY)) 
                                        & ((IData)(vlSelf->PSBAsQ) 
                                           << 3U))));
    vlSelf->PSubBt = ((0x6fU & (IData)(vlSelf->PSubBt)) 
                      | (0x10U & ((((IData)(vlSelf->PSKbGq) 
                                    >> 1U) & (IData)(vlSelf->PSvnSY)) 
                                  & ((~ (IData)(vlSelf->PSGJv8)) 
                                     << 4U))));
    vlSelf->PSubBt = ((0x5fU & (IData)(vlSelf->PSubBt)) 
                      | (0xffffffe0U & (((IData)(vlSelf->PSKbGq) 
                                         & (IData)(vlSelf->PSvnSY)) 
                                        & ((IData)(vlSelf->PSGJv8) 
                                           << 5U))));
    vlSelf->PSubBt = ((0x3fU & (IData)(vlSelf->PSubBt)) 
                      | (0x40U & ((IData)(vlSelf->PSKbGq) 
                                  & (IData)(vlSelf->PSvnSY))));
    vlSelf->PSS00F = ((0xffffffffULL & vlSelf->PSS00F) 
                      | ((QData)((IData)(((IData)(vlSelf->PSxjXf)
                                           ? (IData)(vlSelf->PS7b1U)
                                           : (IData)(vlSelf->PSJgKR)))) 
                         << 0x20U));
    vlSelf->PSRgQ7 = ((0xffffffffULL & vlSelf->PSRgQ7) 
                      | ((QData)((IData)(((IData)(vlSelf->PSN8LR)
                                           ? (IData)(vlSelf->PSzcRT)
                                           : (IData)(vlSelf->PSRjKi)))) 
                         << 0x20U));
    vlSelf->PSFOI2 = ((0xfeU & (IData)(vlSelf->PSFOI2)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSFOI2)))));
    vlSelf->PSFOI2 = ((0xfdU & (IData)(vlSelf->PSFOI2)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSFOI2)))) 
                         << 1U));
    vlSelf->PSFOI2 = ((0xfbU & (IData)(vlSelf->PSFOI2)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSFOI2)))) 
                         << 2U));
    vlSelf->PSZh7T = ((0xfffff8U & vlSelf->PSZh7T) 
                      | (7U & ((2U & (IData)(vlSelf->PSFOI2))
                                ? (vlSelf->PSZh7T >> 3U)
                                : (vlSelf->PSZh7T >> 6U))));
    vlSelf->PSZh7T = ((0xffffc7U & vlSelf->PSZh7T) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSFOI2))
                                    ? (vlSelf->PSZh7T 
                                       >> 9U) : (vlSelf->PSZh7T 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PSZh7T = ((0xfffe3fU & vlSelf->PSZh7T) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSFOI2))
                                     ? (vlSelf->PSZh7T 
                                        >> 0xfU) : 
                                    (vlSelf->PSZh7T 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSzhXj = ((0xfeU & (IData)(vlSelf->PSzhXj)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSzhXj)))));
    vlSelf->PSzhXj = ((0xfdU & (IData)(vlSelf->PSzhXj)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSzhXj)))) 
                         << 1U));
    vlSelf->PSzhXj = ((0xfbU & (IData)(vlSelf->PSzhXj)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSzhXj)))) 
                         << 2U));
    vlSelf->PStJ9t = ((0xfffff8U & vlSelf->PStJ9t) 
                      | (7U & ((2U & (IData)(vlSelf->PSzhXj))
                                ? (vlSelf->PStJ9t >> 3U)
                                : (vlSelf->PStJ9t >> 6U))));
    vlSelf->PStJ9t = ((0xffffc7U & vlSelf->PStJ9t) 
                      | (0x38U & (((8U & (IData)(vlSelf->PSzhXj))
                                    ? (vlSelf->PStJ9t 
                                       >> 9U) : (vlSelf->PStJ9t 
                                                 >> 0xcU)) 
                                  << 3U)));
    vlSelf->PStJ9t = ((0xfffe3fU & vlSelf->PStJ9t) 
                      | (0x1c0U & (((0x20U & (IData)(vlSelf->PSzhXj))
                                     ? (vlSelf->PStJ9t 
                                        >> 0xfU) : 
                                    (vlSelf->PStJ9t 
                                     >> 0x12U)) << 6U)));
    vlSelf->PSAwaz = ((0xe7U & (IData)(vlSelf->PSAwaz)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSblYh)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSblYh)))) 
                                    << 3U)));
    vlSelf->PSAwaz = ((0xdfU & (IData)(vlSelf->PSAwaz)) 
                      | (0x20U & ((IData)(vlSelf->PSblYh) 
                                  << 1U)));
    vlSelf->PSoWbC = ((0xff81ffU & vlSelf->PSoWbC) 
                      | ((((4U & (IData)(vlSelf->PSblYh))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSblYh))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PSMBgn = ((0xff81ffU & vlSelf->PSMBgn) 
                      | ((((4U & (IData)(vlSelf->PSuzf7))
                            ? 2U : 3U) << 0xcU) | (
                                                   ((1U 
                                                     & (IData)(vlSelf->PSuzf7))
                                                     ? 0U
                                                     : 1U) 
                                                   << 9U)));
    vlSelf->PS18D7 = ((0xe7U & (IData)(vlSelf->PS18D7)) 
                      | (((IData)((0U != (0xcU & (IData)(vlSelf->PSuzf7)))) 
                          << 4U) | ((IData)((0U != 
                                             (3U & (IData)(vlSelf->PSuzf7)))) 
                                    << 3U)));
    vlSelf->PS18D7 = ((0xdfU & (IData)(vlSelf->PS18D7)) 
                      | (0x20U & ((IData)(vlSelf->PSuzf7) 
                                  << 1U)));
    vlSelf->PS169j[7U] = ((0x7fU & vlSelf->PS169j[7U]) 
                          | ((0xffff8000U & (vlSelf->PSBdU1[0U] 
                                             << 6U)) 
                             | (0x7f80U & (vlSelf->PSBdU1[0U] 
                                           << 7U))));
    vlSelf->PS169j[8U] = (((0x40U & (vlSelf->PSBdU1[1U] 
                                     << 6U)) | (vlSelf->PSBdU1[0U] 
                                                >> 0x1aU)) 
                          | ((0x7f80U & (vlSelf->PSBdU1[1U] 
                                         << 6U)) | 
                             (0xffff8000U & (vlSelf->PSBdU1[1U] 
                                             << 6U))));
    vlSelf->PS169j[9U] = (0xfffffU & (((0x40U & (vlSelf->PSBdU1[2U] 
                                                 << 6U)) 
                                       | (vlSelf->PSBdU1[1U] 
                                          >> 0x1aU)) 
                                      | ((0x7f80U & 
                                          (vlSelf->PSBdU1[2U] 
                                           << 6U)) 
                                         | (0xf8000U 
                                            & (vlSelf->PSBdU1[2U] 
                                               << 6U)))));
    if (vlSelf->PS3Cf6) {
        PShEMT[1U] = ((vlSelf->PSBdU1[6U] << 4U) | 
                      (vlSelf->PSBdU1[5U] >> 0x1cU));
        PShEMT[2U] = (0x3fffU & ((vlSelf->PSBdU1[7U] 
                                  << 4U) | (vlSelf->PSBdU1[6U] 
                                            >> 0x1cU)));
        vlSelf->PSBdU1[0U] = ((vlSelf->PSBdU1[5U] << 4U) 
                              | (vlSelf->PSBdU1[4U] 
                                 >> 0x1cU));
    } else {
        PShEMT[1U] = ((vlSelf->PSBdU1[4U] << 0x12U) 
                      | (vlSelf->PSBdU1[3U] >> 0xeU));
        PShEMT[2U] = (0x3fffU & ((vlSelf->PSBdU1[5U] 
                                  << 0x12U) | (vlSelf->PSBdU1[4U] 
                                               >> 0xeU)));
        vlSelf->PSBdU1[0U] = ((vlSelf->PSBdU1[3U] << 0x12U) 
                              | (vlSelf->PSBdU1[2U] 
                                 >> 0xeU));
    }
    vlSelf->PSBdU1[1U] = PShEMT[1U];
    vlSelf->PSBdU1[2U] = ((0xffffc000U & vlSelf->PSBdU1[2U]) 
                          | PShEMT[2U]);
    if (vlSelf->PSJ087) {
        PSCMC9[0U] = ((vlSelf->PSBdU1[0xaU] << 8U) 
                      | (vlSelf->PSBdU1[9U] >> 0x18U));
        PSCMC9[1U] = ((vlSelf->PSBdU1[0xbU] << 8U) 
                      | (vlSelf->PSBdU1[0xaU] >> 0x18U));
        PSCMC9[2U] = (0x3fffU & ((vlSelf->PSBdU1[0xcU] 
                                  << 8U) | (vlSelf->PSBdU1[0xbU] 
                                            >> 0x18U)));
    } else {
        PSCMC9[0U] = ((vlSelf->PSBdU1[8U] << 0x16U) 
                      | (vlSelf->PSBdU1[7U] >> 0xaU));
        PSCMC9[1U] = ((vlSelf->PSBdU1[9U] << 0x16U) 
                      | (vlSelf->PSBdU1[8U] >> 0xaU));
        PSCMC9[2U] = (0x3fffU & ((vlSelf->PSBdU1[0xaU] 
                                  << 0x16U) | (vlSelf->PSBdU1[9U] 
                                               >> 0xaU)));
    }
    vlSelf->PSBdU1[2U] = ((0x3fffU & vlSelf->PSBdU1[2U]) 
                          | (((IData)(vlSelf->PSJ087)
                               ? ((vlSelf->PSBdU1[0xaU] 
                                   << 8U) | (vlSelf->PSBdU1[9U] 
                                             >> 0x18U))
                               : ((vlSelf->PSBdU1[8U] 
                                   << 0x16U) | (vlSelf->PSBdU1[7U] 
                                                >> 0xaU))) 
                             << 0xeU));
    vlSelf->PSBdU1[3U] = ((PSCMC9[0U] >> 0x12U) | (
                                                   PSCMC9[1U] 
                                                   << 0xeU));
    vlSelf->PSBdU1[4U] = ((0xf0000000U & vlSelf->PSBdU1[4U]) 
                          | ((PSCMC9[1U] >> 0x12U) 
                             | (PSCMC9[2U] << 0xeU)));
    if (vlSelf->PSn11w) {
        PSg3jT[0U] = ((vlSelf->PSBdU1[0xfU] << 0xcU) 
                      | (vlSelf->PSBdU1[0xeU] >> 0x14U));
        PSg3jT[1U] = ((vlSelf->PSBdU1[0x10U] << 0xcU) 
                      | (vlSelf->PSBdU1[0xfU] >> 0x14U));
        PSg3jT[2U] = (0x3fffU & ((vlSelf->PSBdU1[0x11U] 
                                  << 0xcU) | (vlSelf->PSBdU1[0x10U] 
                                              >> 0x14U)));
    } else {
        PSg3jT[0U] = ((vlSelf->PSBdU1[0xdU] << 0x1aU) 
                      | (vlSelf->PSBdU1[0xcU] >> 6U));
        PSg3jT[1U] = ((vlSelf->PSBdU1[0xeU] << 0x1aU) 
                      | (vlSelf->PSBdU1[0xdU] >> 6U));
        PSg3jT[2U] = (0x3fffU & ((vlSelf->PSBdU1[0xfU] 
                                  << 0x1aU) | (vlSelf->PSBdU1[0xeU] 
                                               >> 6U)));
    }
    vlSelf->PSBdU1[4U] = ((0xfffffffU & vlSelf->PSBdU1[4U]) 
                          | (((IData)(vlSelf->PSn11w)
                               ? ((vlSelf->PSBdU1[0xfU] 
                                   << 0xcU) | (vlSelf->PSBdU1[0xeU] 
                                               >> 0x14U))
                               : ((vlSelf->PSBdU1[0xdU] 
                                   << 0x1aU) | (vlSelf->PSBdU1[0xcU] 
                                                >> 6U))) 
                             << 0x1cU));
    vlSelf->PSBdU1[5U] = ((PSg3jT[0U] >> 4U) | (PSg3jT[1U] 
                                                << 0x1cU));
    vlSelf->PSBdU1[6U] = ((PSg3jT[1U] >> 4U) | (PSg3jT[2U] 
                                                << 0x1cU));
    vlSelf->PSBdU1[7U] = ((0xfffffc00U & vlSelf->PSBdU1[7U]) 
                          | (PSg3jT[2U] >> 4U));
    PSYz8z = (1U & (IData)(vlSelf->PSHjN2));
    vlSelf->PS4oSO = ((0x1eU & (IData)(vlSelf->PS4oSO)) 
                      | (IData)(PSYz8z));
    PSYz8z = (1U & ((IData)(vlSelf->PSHjN2) >> 1U));
    vlSelf->PS4oSO = ((0x1dU & (IData)(vlSelf->PS4oSO)) 
                      | ((IData)(PSYz8z) << 1U));
    PSYz8z = (1U & ((IData)(vlSelf->PSHjN2) >> 2U));
    vlSelf->PS4oSO = ((0x1bU & (IData)(vlSelf->PS4oSO)) 
                      | ((IData)(PSYz8z) << 2U));
    PSYz8z = (1U & ((IData)(vlSelf->PSHjN2) >> 3U));
    vlSelf->PS4oSO = ((0x17U & (IData)(vlSelf->PS4oSO)) 
                      | ((IData)(PSYz8z) << 3U));
    PSYz8z = (1U & ((IData)(vlSelf->PSHjN2) >> 4U));
    vlSelf->PS4oSO = ((0xfU & (IData)(vlSelf->PS4oSO)) 
                      | ((IData)(PSYz8z) << 4U));
    PSNHX1 = (1U & (IData)(vlSelf->PS2lB2));
    vlSelf->PSTcCg = ((0x1eU & (IData)(vlSelf->PSTcCg)) 
                      | (IData)(PSNHX1));
    PSNHX1 = (1U & ((IData)(vlSelf->PS2lB2) >> 1U));
    vlSelf->PSTcCg = ((0x1dU & (IData)(vlSelf->PSTcCg)) 
                      | ((IData)(PSNHX1) << 1U));
    PSNHX1 = (1U & ((IData)(vlSelf->PS2lB2) >> 2U));
    vlSelf->PSTcCg = ((0x1bU & (IData)(vlSelf->PSTcCg)) 
                      | ((IData)(PSNHX1) << 2U));
    PSNHX1 = (1U & ((IData)(vlSelf->PS2lB2) >> 3U));
    vlSelf->PSTcCg = ((0x17U & (IData)(vlSelf->PSTcCg)) 
                      | ((IData)(PSNHX1) << 3U));
    PSNHX1 = (1U & ((IData)(vlSelf->PS2lB2) >> 4U));
    vlSelf->PSTcCg = ((0xfU & (IData)(vlSelf->PSTcCg)) 
                      | ((IData)(PSNHX1) << 4U));
    vlSelf->PSWqMl[7U] = ((0x3ffU & vlSelf->PSWqMl[7U]) 
                          | (((IData)(vlSelf->PSM5Wv)
                               ? ((vlSelf->PSc2Sx[3U] 
                                   << 0x12U) | (vlSelf->PSc2Sx[2U] 
                                                >> 0xeU))
                               : vlSelf->PSc2Sx[0U]) 
                             << 0xaU));
    vlSelf->PSWqMl[8U] = ((((IData)(vlSelf->PSM5Wv)
                             ? ((vlSelf->PSc2Sx[3U] 
                                 << 0x12U) | (vlSelf->PSc2Sx[2U] 
                                              >> 0xeU))
                             : vlSelf->PSc2Sx[0U]) 
                           >> 0x16U) | (((IData)(vlSelf->PSM5Wv)
                                          ? ((vlSelf->PSc2Sx[4U] 
                                              << 0x12U) 
                                             | (vlSelf->PSc2Sx[3U] 
                                                >> 0xeU))
                                          : vlSelf->PSc2Sx[1U]) 
                                        << 0xaU));
    vlSelf->PSWqMl[9U] = ((((IData)(vlSelf->PSM5Wv)
                             ? ((vlSelf->PSc2Sx[4U] 
                                 << 0x12U) | (vlSelf->PSc2Sx[3U] 
                                              >> 0xeU))
                             : vlSelf->PSc2Sx[1U]) 
                           >> 0x16U) | ((((IData)(vlSelf->PS8W6m)
                                           ? ((vlSelf->PSc2Sx[8U] 
                                               << 0x16U) 
                                              | (vlSelf->PSc2Sx[7U] 
                                                 >> 0xaU))
                                           : ((vlSelf->PSc2Sx[5U] 
                                               << 4U) 
                                              | (vlSelf->PSc2Sx[4U] 
                                                 >> 0x1cU))) 
                                         << 0x18U) 
                                        | (0xfffc00U 
                                           & (((IData)(vlSelf->PSM5Wv)
                                                ? (
                                                   (vlSelf->PSc2Sx[5U] 
                                                    << 0x12U) 
                                                   | (vlSelf->PSc2Sx[4U] 
                                                      >> 0xeU))
                                                : vlSelf->PSc2Sx[2U]) 
                                              << 0xaU))));
    vlSelf->PSWqMl[0xaU] = ((0x3ffU & (((IData)(vlSelf->PS8W6m)
                                         ? ((vlSelf->PSc2Sx[8U] 
                                             << 0x16U) 
                                            | (vlSelf->PSc2Sx[7U] 
                                               >> 0xaU))
                                         : ((vlSelf->PSc2Sx[5U] 
                                             << 4U) 
                                            | (vlSelf->PSc2Sx[4U] 
                                               >> 0x1cU))) 
                                       >> 8U)) | ((0xfffc00U 
                                                   & (((IData)(vlSelf->PS8W6m)
                                                        ? 
                                                       ((vlSelf->PSc2Sx[8U] 
                                                         << 0x16U) 
                                                        | (vlSelf->PSc2Sx[7U] 
                                                           >> 0xaU))
                                                        : 
                                                       ((vlSelf->PSc2Sx[5U] 
                                                         << 4U) 
                                                        | (vlSelf->PSc2Sx[4U] 
                                                           >> 0x1cU))) 
                                                      >> 8U)) 
                                                  | (((IData)(vlSelf->PS8W6m)
                                                       ? 
                                                      ((vlSelf->PSc2Sx[9U] 
                                                        << 0x16U) 
                                                       | (vlSelf->PSc2Sx[8U] 
                                                          >> 0xaU))
                                                       : 
                                                      ((vlSelf->PSc2Sx[6U] 
                                                        << 4U) 
                                                       | (vlSelf->PSc2Sx[5U] 
                                                          >> 0x1cU))) 
                                                     << 0x18U)));
    vlSelf->PSWqMl[0xbU] = ((0x3ffU & (((IData)(vlSelf->PS8W6m)
                                         ? ((vlSelf->PSc2Sx[9U] 
                                             << 0x16U) 
                                            | (vlSelf->PSc2Sx[8U] 
                                               >> 0xaU))
                                         : ((vlSelf->PSc2Sx[6U] 
                                             << 4U) 
                                            | (vlSelf->PSc2Sx[5U] 
                                               >> 0x1cU))) 
                                       >> 8U)) | ((0xfffc00U 
                                                   & (((IData)(vlSelf->PS8W6m)
                                                        ? 
                                                       ((vlSelf->PSc2Sx[9U] 
                                                         << 0x16U) 
                                                        | (vlSelf->PSc2Sx[8U] 
                                                           >> 0xaU))
                                                        : 
                                                       ((vlSelf->PSc2Sx[6U] 
                                                         << 4U) 
                                                        | (vlSelf->PSc2Sx[5U] 
                                                           >> 0x1cU))) 
                                                      >> 8U)) 
                                                  | (((IData)(vlSelf->PS8W6m)
                                                       ? 
                                                      ((vlSelf->PSc2Sx[0xaU] 
                                                        << 0x16U) 
                                                       | (vlSelf->PSc2Sx[9U] 
                                                          >> 0xaU))
                                                       : 
                                                      ((vlSelf->PSc2Sx[7U] 
                                                        << 4U) 
                                                       | (vlSelf->PSc2Sx[6U] 
                                                          >> 0x1cU))) 
                                                     << 0x18U)));
    vlSelf->PSWqMl[0xcU] = ((0xffffffc0U & vlSelf->PSWqMl[0xcU]) 
                            | (0x3fU & (((IData)(vlSelf->PS8W6m)
                                          ? ((vlSelf->PSc2Sx[0xaU] 
                                              << 0x16U) 
                                             | (vlSelf->PSc2Sx[9U] 
                                                >> 0xaU))
                                          : ((vlSelf->PSc2Sx[7U] 
                                              << 4U) 
                                             | (vlSelf->PSc2Sx[6U] 
                                                >> 0x1cU))) 
                                        >> 8U)));
    vlSelf->PSa1IE = ((0x7eU & (IData)(vlSelf->PSa1IE)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PSa1IE)))));
    vlSelf->PSa1IE = ((0x7dU & (IData)(vlSelf->PSa1IE)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PSa1IE)))) 
                         << 1U));
    vlSelf->PSa1IE = ((0x7bU & (IData)(vlSelf->PSa1IE)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PSa1IE)))) 
                         << 2U));
    vlSelf->PSw37G = (1U & ((~ ((IData)(vlSelf->PSa1IE) 
                                >> 1U)) | (((IData)(vlSelf->PSa1IE) 
                                            >> 2U) 
                                           & ((IData)(vlSelf->PS4LVi) 
                                              >> 2U))));
    vlSelf->PSGZ8h = (1U & ((~ ((IData)(vlSelf->PSa1IE) 
                                >> 3U)) | (((IData)(vlSelf->PSa1IE) 
                                            >> 4U) 
                                           & ((IData)(vlSelf->PS4LVi) 
                                              >> 1U))));
    vlSelf->PSXlfC = (1U & ((~ ((IData)(vlSelf->PSa1IE) 
                                >> 5U)) | (((IData)(vlSelf->PSa1IE) 
                                            >> 6U) 
                                           & ((IData)(vlSelf->PS4LVi) 
                                              >> 1U))));
    vlSelf->PSV4W5 = ((0xeU & (IData)(vlSelf->PSV4W5)) 
                      | (1U & (IData)(vlSelf->PSa1IE)));
    PSlnZM = (1U & (IData)(vlSelf->PSCrJ9));
    vlSelf->PSwoen = ((0x1eU & (IData)(vlSelf->PSwoen)) 
                      | (IData)(PSlnZM));
    PSlnZM = (1U & ((IData)(vlSelf->PSCrJ9) >> 1U));
    vlSelf->PSwoen = ((0x1dU & (IData)(vlSelf->PSwoen)) 
                      | ((IData)(PSlnZM) << 1U));
    PSlnZM = (1U & ((IData)(vlSelf->PSCrJ9) >> 2U));
    vlSelf->PSwoen = ((0x1bU & (IData)(vlSelf->PSwoen)) 
                      | ((IData)(PSlnZM) << 2U));
    PSlnZM = (1U & ((IData)(vlSelf->PSCrJ9) >> 3U));
    vlSelf->PSwoen = ((0x17U & (IData)(vlSelf->PSwoen)) 
                      | ((IData)(PSlnZM) << 3U));
    PSlnZM = (1U & ((IData)(vlSelf->PSCrJ9) >> 4U));
    vlSelf->PSwoen = ((0xfU & (IData)(vlSelf->PSwoen)) 
                      | ((IData)(PSlnZM) << 4U));
    PS2p19 = (1U & (IData)(vlSelf->PSwAdc));
    vlSelf->PStiPl = ((0x1eU & (IData)(vlSelf->PStiPl)) 
                      | (IData)(PS2p19));
    PS2p19 = (1U & ((IData)(vlSelf->PSwAdc) >> 1U));
    vlSelf->PStiPl = ((0x1dU & (IData)(vlSelf->PStiPl)) 
                      | ((IData)(PS2p19) << 1U));
    PS2p19 = (1U & ((IData)(vlSelf->PSwAdc) >> 2U));
    vlSelf->PStiPl = ((0x1bU & (IData)(vlSelf->PStiPl)) 
                      | ((IData)(PS2p19) << 2U));
    PS2p19 = (1U & ((IData)(vlSelf->PSwAdc) >> 3U));
    vlSelf->PStiPl = ((0x17U & (IData)(vlSelf->PStiPl)) 
                      | ((IData)(PS2p19) << 3U));
    PS2p19 = (1U & ((IData)(vlSelf->PSwAdc) >> 4U));
    vlSelf->PStiPl = ((0xfU & (IData)(vlSelf->PStiPl)) 
                      | ((IData)(PS2p19) << 4U));
    vlSelf->PS0Yok = ((0x7eU & (IData)(vlSelf->PS0Yok)) 
                      | (IData)((0U != (6U & (IData)(vlSelf->PS0Yok)))));
    vlSelf->PS0Yok = ((0x7dU & (IData)(vlSelf->PS0Yok)) 
                      | ((IData)((0U != (0x18U & (IData)(vlSelf->PS0Yok)))) 
                         << 1U));
    vlSelf->PS0Yok = ((0x7bU & (IData)(vlSelf->PS0Yok)) 
                      | ((IData)((0U != (0x60U & (IData)(vlSelf->PS0Yok)))) 
                         << 2U));
    vlSelf->PSPynY = (1U & ((~ ((IData)(vlSelf->PS0Yok) 
                                >> 1U)) | (((IData)(vlSelf->PS0Yok) 
                                            >> 2U) 
                                           & ((IData)(vlSelf->PSGIbj) 
                                              >> 2U))));
    vlSelf->PS2lxg = (1U & ((~ ((IData)(vlSelf->PS0Yok) 
                                >> 3U)) | (((IData)(vlSelf->PS0Yok) 
                                            >> 4U) 
                                           & ((IData)(vlSelf->PSGIbj) 
                                              >> 1U))));
    vlSelf->PSPdf6 = (1U & ((~ ((IData)(vlSelf->PS0Yok) 
                                >> 5U)) | (((IData)(vlSelf->PS0Yok) 
                                            >> 6U) 
                                           & ((IData)(vlSelf->PSGIbj) 
                                              >> 1U))));
    vlSelf->PSV4W5 = ((0xdU & (IData)(vlSelf->PSV4W5)) 
                      | (2U & ((IData)(vlSelf->PS0Yok) 
                               << 1U)));
    vlSelf->PSTq85[4U] = (IData)(((IData)(vlSelf->PS6FDw)
                                   ? vlSelf->PSCZHi
                                   : vlSelf->PSoxbj));
    vlSelf->PSTq85[5U] = (IData)((((IData)(vlSelf->PS6FDw)
                                    ? vlSelf->PSCZHi
                                    : vlSelf->PSoxbj) 
                                  >> 0x20U));
    vlSelf->PS5Uxx[2U] = ((IData)(vlSelf->PSHuhM) ? vlSelf->PSX74I
                           : vlSelf->PSE5iY);
    vlSelf->PSelWS[0U] = ((0xffffc7ffU & vlSelf->PSelWS[0U]) 
                          | (0x3800U & ((IData)(vlSelf->PSej36) 
                                        << 0xbU)));
    vlSelf->PSelWS[0U] = ((0xfffff800U & vlSelf->PSelWS[0U]) 
                          | ((0x600U & ((IData)(vlSelf->PSSWXE) 
                                        << 9U)) | (
                                                   (0x1e0U 
                                                    & ((IData)(vlSelf->PSej36) 
                                                       << 2U)) 
                                                   | (0x1fU 
                                                      & ((IData)(vlSelf->PSSWXE) 
                                                         >> 2U)))));
    vlSelf->PSelWS[0U] = ((0xf1ffffffU & vlSelf->PSelWS[0U]) 
                          | (0xe000000U & ((IData)(vlSelf->PSA4jX) 
                                           << 0x19U)));
    vlSelf->PSelWS[0U] = ((0xfe003fffU & vlSelf->PSelWS[0U]) 
                          | (0xffffc000U & ((0x1800000U 
                                             & ((IData)(vlSelf->PSgpdu) 
                                                << 0x17U)) 
                                            | ((0x780000U 
                                                & ((IData)(vlSelf->PSA4jX) 
                                                   << 0x10U)) 
                                               | (0x7c000U 
                                                  & ((IData)(vlSelf->PSgpdu) 
                                                     << 0xcU))))));
    vlSelf->PSelWS[1U] = ((0xfffffc7fU & vlSelf->PSelWS[1U]) 
                          | (0x380U & ((IData)(vlSelf->PS0VPr) 
                                       << 7U)));
    vlSelf->PSelWS[0U] = ((0xfffffffU & vlSelf->PSelWS[0U]) 
                          | (0xf0000000U & ((IData)(vlSelf->PSYWWh) 
                                            << 0x1aU)));
    vlSelf->PSelWS[1U] = ((0xffffff80U & vlSelf->PSelWS[1U]) 
                          | (0xfffffffU & ((0x60U & 
                                            ((IData)(vlSelf->PSYWWh) 
                                             << 5U)) 
                                           | ((0x1eU 
                                               & ((IData)(vlSelf->PS0VPr) 
                                                  >> 2U)) 
                                              | (1U 
                                                 & ((IData)(vlSelf->PSYWWh) 
                                                    >> 6U))))));
    vlSelf->PSelWS[1U] = ((0xff1fffffU & vlSelf->PSelWS[1U]) 
                          | (0xe00000U & ((IData)(vlSelf->PS4jBs) 
                                          << 0x15U)));
    vlSelf->PSelWS[1U] = ((0xffe003ffU & vlSelf->PSelWS[1U]) 
                          | (0xfffffc00U & ((0x180000U 
                                             & ((IData)(vlSelf->PSovB6) 
                                                << 0x13U)) 
                                            | ((0x78000U 
                                                & ((IData)(vlSelf->PS4jBs) 
                                                   << 0xcU)) 
                                               | (0x7c00U 
                                                  & ((IData)(vlSelf->PSovB6) 
                                                     << 8U))))));
    vlSelf->PSelWS[2U] = ((0xffffffc7U & vlSelf->PSelWS[2U]) 
                          | (0x38U & ((IData)(vlSelf->PSiVKy) 
                                      << 3U)));
    vlSelf->PSelWS[1U] = ((0xffffffU & vlSelf->PSelWS[1U]) 
                          | (0xff000000U & ((0xe0000000U 
                                             & ((IData)(vlSelf->PSiVKy) 
                                                << 0x1aU)) 
                                            | (0x1f000000U 
                                               & ((IData)(vlSelf->PSALmS) 
                                                  << 0x16U)))));
    vlSelf->PSelWS[2U] = ((0xfffffff8U & vlSelf->PSelWS[2U]) 
                          | (0xffffffU & ((6U & ((IData)(vlSelf->PSALmS) 
                                                 << 1U)) 
                                          | (1U & ((IData)(vlSelf->PSiVKy) 
                                                   >> 6U)))));
    vlSelf->PSelWS[2U] = ((0xfff1ffffU & vlSelf->PSelWS[2U]) 
                          | (0xe0000U & ((IData)(vlSelf->PSUccn) 
                                         << 0x11U)));
    vlSelf->PSelWS[2U] = ((0xfffe003fU & vlSelf->PSelWS[2U]) 
                          | (0xffffffc0U & ((0x18000U 
                                             & ((IData)(vlSelf->PSOoP1) 
                                                << 0xfU)) 
                                            | ((0x7800U 
                                                & ((IData)(vlSelf->PSUccn) 
                                                   << 8U)) 
                                               | (0x7c0U 
                                                  & ((IData)(vlSelf->PSOoP1) 
                                                     << 4U))))));
    vlSelf->PSelWS[2U] = ((0x7fffffffU & vlSelf->PSelWS[2U]) 
                          | ((IData)(vlSelf->PSNVg5) 
                             << 0x1fU));
    vlSelf->PSelWS[3U] = ((0xfffcU & vlSelf->PSelWS[3U]) 
                          | (3U & ((IData)(vlSelf->PSNVg5) 
                                   >> 1U)));
    vlSelf->PSelWS[2U] = ((0x800fffffU & vlSelf->PSelWS[2U]) 
                          | (0xfff00000U & ((0x60000000U 
                                             & ((IData)(vlSelf->PSBoCm) 
                                                << 0x1dU)) 
                                            | ((0x1e000000U 
                                                & ((IData)(vlSelf->PSNVg5) 
                                                   << 0x16U)) 
                                               | (0x1f00000U 
                                                  & ((IData)(vlSelf->PSBoCm) 
                                                     << 0x12U))))));
    vlSelf->PSelWS[3U] = ((0x1fffU & vlSelf->PSelWS[3U]) 
                          | (0xe000U & ((IData)(vlSelf->PSubBt) 
                                        << 0xdU)));
    vlSelf->PSelWS[3U] = ((0xe003U & vlSelf->PSelWS[3U]) 
                          | (0xfffcU & ((0x1800U & 
                                         ((IData)(vlSelf->PSeYcJ) 
                                          << 0xbU)) 
                                        | ((0x780U 
                                            & ((IData)(vlSelf->PSubBt) 
                                               << 4U)) 
                                           | (0x7cU 
                                              & (IData)(vlSelf->PSeYcJ))))));
    vlSelf->PSj2H8[5U] = ((((8U & (IData)(vlSelf->PSBSBl))
                             ? (0xffffU & (IData)(vlSelf->PSRgQ7))
                             : 0xffffU) << 0x10U) | 
                          ((4U & (IData)(vlSelf->PSBSBl))
                            ? (0xffffU & (IData)(vlSelf->PSS00F))
                            : 0xffffU));
}
