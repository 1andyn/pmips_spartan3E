/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Dropbox/Codespace/PMIPS/sub1/hazard_ctrl.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {2, 0};



static void Always_39_0(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;

LAB0:    t1 = (t0 + 4288U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 5600);
    *((int *)t2) = 1;
    t3 = (t0 + 4320);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(40, ng0);

LAB5:    xsi_set_current_line(41, ng0);
    t4 = (t0 + 2008U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:
LAB12:
LAB11:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t4 = (t3 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (t11 >> 7);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 7);
    *((unsigned int *)t2) = t14;
    t15 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t15 & 7U);
    t16 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t16 & 7U);
    t8 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 3, 0LL);

LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(42, ng0);
    t8 = (t0 + 1688U);
    t9 = *((char **)t8);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t10 = (t9 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (t11 >> 7);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t10);
    t14 = (t13 >> 7);
    *((unsigned int *)t8) = t14;
    t15 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t15 & 7U);
    t16 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t16 & 7U);
    t17 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t17, t7, 0, 0, 3, 0LL);
    goto LAB13;

LAB9:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 1688U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t3 = (t7 + 4);
    t8 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 4);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t15 & 7U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 7U);
    t9 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t9, t7, 0, 0, 3, 0LL);
    goto LAB13;

}

static void Always_49_1(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;

LAB0:    t1 = (t0 + 4536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 5616);
    *((int *)t2) = 1;
    t3 = (t0 + 4568);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(51, ng0);
    t4 = (t0 + 2328U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:
LAB12:
LAB11:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t7 + 4);
    t4 = (t3 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (t11 >> 7);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 7);
    *((unsigned int *)t2) = t14;
    t15 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t15 & 7U);
    t16 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t16 & 7U);
    t8 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 3, 0LL);

LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(52, ng0);
    t8 = (t0 + 1528U);
    t9 = *((char **)t8);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t10 = (t9 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (t11 >> 7);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t10);
    t14 = (t13 >> 7);
    *((unsigned int *)t8) = t14;
    t15 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t15 & 7U);
    t16 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t16 & 7U);
    t17 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t17, t7, 0, 0, 3, 0LL);
    goto LAB13;

LAB9:    xsi_set_current_line(53, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t3 = (t7 + 4);
    t8 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 4);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t8);
    t14 = (t13 >> 4);
    *((unsigned int *)t3) = t14;
    t15 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t15 & 7U);
    t16 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t16 & 7U);
    t9 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t9, t7, 0, 0, 3, 0LL);
    goto LAB13;

}

static void Cont_59_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 4784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1368U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 13);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 13);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 7U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 7U);
    t12 = (t0 + 5744);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 7U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 2);
    t25 = (t0 + 5632);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Always_66_3(char *t0)
{
    char t6[8];
    char t30[8];
    char t52[8];
    char t65[8];
    char t81[8];
    char t94[8];
    char t107[8];
    char t123[8];
    char t131[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t64;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    char *t95;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t104;
    char *t105;
    char *t106;
    char *t108;
    char *t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    char *t130;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    char *t135;
    char *t136;
    char *t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    char *t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    char *t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    char *t165;
    char *t166;

LAB0:    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 5648);
    *((int *)t2) = 1;
    t3 = (t0 + 5064);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(67, ng0);

LAB5:    xsi_set_current_line(69, ng0);
    t4 = (t0 + 2488U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(99, ng0);

LAB84:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB88;

LAB85:    if (t18 != 0)
        goto LAB87;

LAB86:    *((unsigned int *)t6) = 1;

LAB88:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB89;

LAB90:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB105;

LAB102:    if (t18 != 0)
        goto LAB104;

LAB103:    *((unsigned int *)t6) = 1;

LAB105:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB106;

LAB107:    xsi_set_current_line(121, ng0);

LAB118:    xsi_set_current_line(122, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB108:
LAB91:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(70, ng0);

LAB13:    xsi_set_current_line(71, ng0);
    t28 = (t0 + 2168U);
    t29 = *((char **)t28);
    t28 = ((char*)((ng2)));
    memset(t30, 0, 8);
    t31 = (t29 + 4);
    t32 = (t28 + 4);
    t33 = *((unsigned int *)t29);
    t34 = *((unsigned int *)t28);
    t35 = (t33 ^ t34);
    t36 = *((unsigned int *)t31);
    t37 = *((unsigned int *)t32);
    t38 = (t36 ^ t37);
    t39 = (t35 | t38);
    t40 = *((unsigned int *)t31);
    t41 = *((unsigned int *)t32);
    t42 = (t40 | t41);
    t43 = (~(t42));
    t44 = (t39 & t43);
    if (t44 != 0)
        goto LAB17;

LAB14:    if (t42 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t30) = 1;

LAB17:    t46 = (t30 + 4);
    t47 = *((unsigned int *)t46);
    t48 = (~(t47));
    t49 = *((unsigned int *)t30);
    t50 = (t49 & t48);
    t51 = (t50 != 0);
    if (t51 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB52;

LAB49:    if (t18 != 0)
        goto LAB51;

LAB50:    *((unsigned int *)t6) = 1;

LAB52:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB53;

LAB54:    xsi_set_current_line(92, ng0);

LAB83:    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB55:
LAB20:    goto LAB12;

LAB16:    t45 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(72, ng0);

LAB21:    xsi_set_current_line(73, ng0);
    t53 = (t0 + 1368U);
    t54 = *((char **)t53);
    memset(t52, 0, 8);
    t53 = (t52 + 4);
    t55 = (t54 + 4);
    t56 = *((unsigned int *)t54);
    t57 = (t56 >> 10);
    *((unsigned int *)t52) = t57;
    t58 = *((unsigned int *)t55);
    t59 = (t58 >> 10);
    *((unsigned int *)t53) = t59;
    t60 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t60 & 7U);
    t61 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t61 & 7U);
    t62 = (t0 + 3368);
    t63 = (t62 + 56U);
    t64 = *((char **)t63);
    memset(t65, 0, 8);
    t66 = (t52 + 4);
    t67 = (t64 + 4);
    t68 = *((unsigned int *)t52);
    t69 = *((unsigned int *)t64);
    t70 = (t68 ^ t69);
    t71 = *((unsigned int *)t66);
    t72 = *((unsigned int *)t67);
    t73 = (t71 ^ t72);
    t74 = (t70 | t73);
    t75 = *((unsigned int *)t66);
    t76 = *((unsigned int *)t67);
    t77 = (t75 | t76);
    t78 = (~(t77));
    t79 = (t74 & t78);
    if (t79 != 0)
        goto LAB25;

LAB22:    if (t77 != 0)
        goto LAB24;

LAB23:    *((unsigned int *)t65) = 1;

LAB25:    memset(t81, 0, 8);
    t82 = (t65 + 4);
    t83 = *((unsigned int *)t82);
    t84 = (~(t83));
    t85 = *((unsigned int *)t65);
    t86 = (t85 & t84);
    t87 = (t86 & 1U);
    if (t87 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t82) != 0)
        goto LAB28;

LAB29:    t89 = (t81 + 4);
    t90 = *((unsigned int *)t81);
    t91 = (!(t90));
    t92 = *((unsigned int *)t89);
    t93 = (t91 || t92);
    if (t93 > 0)
        goto LAB30;

LAB31:    memcpy(t131, t81, 8);

LAB32:    t159 = (t131 + 4);
    t160 = *((unsigned int *)t159);
    t161 = (~(t160));
    t162 = *((unsigned int *)t131);
    t163 = (t162 & t161);
    t164 = (t163 != 0);
    if (t164 > 0)
        goto LAB44;

LAB45:    xsi_set_current_line(78, ng0);

LAB48:    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB46:    goto LAB20;

LAB24:    t80 = (t65 + 4);
    *((unsigned int *)t65) = 1;
    *((unsigned int *)t80) = 1;
    goto LAB25;

LAB26:    *((unsigned int *)t81) = 1;
    goto LAB29;

LAB28:    t88 = (t81 + 4);
    *((unsigned int *)t81) = 1;
    *((unsigned int *)t88) = 1;
    goto LAB29;

LAB30:    t95 = (t0 + 1368U);
    t96 = *((char **)t95);
    memset(t94, 0, 8);
    t95 = (t94 + 4);
    t97 = (t96 + 4);
    t98 = *((unsigned int *)t96);
    t99 = (t98 >> 7);
    *((unsigned int *)t94) = t99;
    t100 = *((unsigned int *)t97);
    t101 = (t100 >> 7);
    *((unsigned int *)t95) = t101;
    t102 = *((unsigned int *)t94);
    *((unsigned int *)t94) = (t102 & 7U);
    t103 = *((unsigned int *)t95);
    *((unsigned int *)t95) = (t103 & 7U);
    t104 = (t0 + 3368);
    t105 = (t104 + 56U);
    t106 = *((char **)t105);
    memset(t107, 0, 8);
    t108 = (t94 + 4);
    t109 = (t106 + 4);
    t110 = *((unsigned int *)t94);
    t111 = *((unsigned int *)t106);
    t112 = (t110 ^ t111);
    t113 = *((unsigned int *)t108);
    t114 = *((unsigned int *)t109);
    t115 = (t113 ^ t114);
    t116 = (t112 | t115);
    t117 = *((unsigned int *)t108);
    t118 = *((unsigned int *)t109);
    t119 = (t117 | t118);
    t120 = (~(t119));
    t121 = (t116 & t120);
    if (t121 != 0)
        goto LAB36;

LAB33:    if (t119 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t107) = 1;

LAB36:    memset(t123, 0, 8);
    t124 = (t107 + 4);
    t125 = *((unsigned int *)t124);
    t126 = (~(t125));
    t127 = *((unsigned int *)t107);
    t128 = (t127 & t126);
    t129 = (t128 & 1U);
    if (t129 != 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t124) != 0)
        goto LAB39;

LAB40:    t132 = *((unsigned int *)t81);
    t133 = *((unsigned int *)t123);
    t134 = (t132 | t133);
    *((unsigned int *)t131) = t134;
    t135 = (t81 + 4);
    t136 = (t123 + 4);
    t137 = (t131 + 4);
    t138 = *((unsigned int *)t135);
    t139 = *((unsigned int *)t136);
    t140 = (t138 | t139);
    *((unsigned int *)t137) = t140;
    t141 = *((unsigned int *)t137);
    t142 = (t141 != 0);
    if (t142 == 1)
        goto LAB41;

LAB42:
LAB43:    goto LAB32;

LAB35:    t122 = (t107 + 4);
    *((unsigned int *)t107) = 1;
    *((unsigned int *)t122) = 1;
    goto LAB36;

LAB37:    *((unsigned int *)t123) = 1;
    goto LAB40;

LAB39:    t130 = (t123 + 4);
    *((unsigned int *)t123) = 1;
    *((unsigned int *)t130) = 1;
    goto LAB40;

LAB41:    t143 = *((unsigned int *)t131);
    t144 = *((unsigned int *)t137);
    *((unsigned int *)t131) = (t143 | t144);
    t145 = (t81 + 4);
    t146 = (t123 + 4);
    t147 = *((unsigned int *)t145);
    t148 = (~(t147));
    t149 = *((unsigned int *)t81);
    t150 = (t149 & t148);
    t151 = *((unsigned int *)t146);
    t152 = (~(t151));
    t153 = *((unsigned int *)t123);
    t154 = (t153 & t152);
    t155 = (~(t150));
    t156 = (~(t154));
    t157 = *((unsigned int *)t137);
    *((unsigned int *)t137) = (t157 & t155);
    t158 = *((unsigned int *)t137);
    *((unsigned int *)t137) = (t158 & t156);
    goto LAB43;

LAB44:    xsi_set_current_line(74, ng0);

LAB47:    xsi_set_current_line(75, ng0);
    t165 = ((char*)((ng2)));
    t166 = (t0 + 3048);
    xsi_vlogvar_assign_value(t166, t165, 0, 0, 1);
    goto LAB46;

LAB51:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB52;

LAB53:    xsi_set_current_line(83, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t33 = *((unsigned int *)t22);
    t34 = (t33 >> 10);
    *((unsigned int *)t30) = t34;
    t35 = *((unsigned int *)t28);
    t36 = (t35 >> 10);
    *((unsigned int *)t21) = t36;
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t37 & 7U);
    t38 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t38 & 7U);
    t29 = (t0 + 3208);
    t31 = (t29 + 56U);
    t32 = *((char **)t31);
    memset(t52, 0, 8);
    t45 = (t30 + 4);
    t46 = (t32 + 4);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t32);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t45);
    t43 = *((unsigned int *)t46);
    t44 = (t42 ^ t43);
    t47 = (t41 | t44);
    t48 = *((unsigned int *)t45);
    t49 = *((unsigned int *)t46);
    t50 = (t48 | t49);
    t51 = (~(t50));
    t56 = (t47 & t51);
    if (t56 != 0)
        goto LAB59;

LAB56:    if (t50 != 0)
        goto LAB58;

LAB57:    *((unsigned int *)t52) = 1;

LAB59:    memset(t65, 0, 8);
    t54 = (t52 + 4);
    t57 = *((unsigned int *)t54);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (t59 & t58);
    t61 = (t60 & 1U);
    if (t61 != 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t54) != 0)
        goto LAB62;

LAB63:    t62 = (t65 + 4);
    t68 = *((unsigned int *)t65);
    t69 = (!(t68));
    t70 = *((unsigned int *)t62);
    t71 = (t69 || t70);
    if (t71 > 0)
        goto LAB64;

LAB65:    memcpy(t123, t65, 8);

LAB66:    t122 = (t123 + 4);
    t138 = *((unsigned int *)t122);
    t139 = (~(t138));
    t140 = *((unsigned int *)t123);
    t141 = (t140 & t139);
    t142 = (t141 != 0);
    if (t142 > 0)
        goto LAB78;

LAB79:    xsi_set_current_line(88, ng0);

LAB82:    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB80:    goto LAB55;

LAB58:    t53 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB59;

LAB60:    *((unsigned int *)t65) = 1;
    goto LAB63;

LAB62:    t55 = (t65 + 4);
    *((unsigned int *)t65) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB63;

LAB64:    t63 = (t0 + 1368U);
    t64 = *((char **)t63);
    memset(t81, 0, 8);
    t63 = (t81 + 4);
    t66 = (t64 + 4);
    t72 = *((unsigned int *)t64);
    t73 = (t72 >> 7);
    *((unsigned int *)t81) = t73;
    t74 = *((unsigned int *)t66);
    t75 = (t74 >> 7);
    *((unsigned int *)t63) = t75;
    t76 = *((unsigned int *)t81);
    *((unsigned int *)t81) = (t76 & 7U);
    t77 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t77 & 7U);
    t67 = (t0 + 3208);
    t80 = (t67 + 56U);
    t82 = *((char **)t80);
    memset(t94, 0, 8);
    t88 = (t81 + 4);
    t89 = (t82 + 4);
    t78 = *((unsigned int *)t81);
    t79 = *((unsigned int *)t82);
    t83 = (t78 ^ t79);
    t84 = *((unsigned int *)t88);
    t85 = *((unsigned int *)t89);
    t86 = (t84 ^ t85);
    t87 = (t83 | t86);
    t90 = *((unsigned int *)t88);
    t91 = *((unsigned int *)t89);
    t92 = (t90 | t91);
    t93 = (~(t92));
    t98 = (t87 & t93);
    if (t98 != 0)
        goto LAB70;

LAB67:    if (t92 != 0)
        goto LAB69;

LAB68:    *((unsigned int *)t94) = 1;

LAB70:    memset(t107, 0, 8);
    t96 = (t94 + 4);
    t99 = *((unsigned int *)t96);
    t100 = (~(t99));
    t101 = *((unsigned int *)t94);
    t102 = (t101 & t100);
    t103 = (t102 & 1U);
    if (t103 != 0)
        goto LAB71;

LAB72:    if (*((unsigned int *)t96) != 0)
        goto LAB73;

LAB74:    t110 = *((unsigned int *)t65);
    t111 = *((unsigned int *)t107);
    t112 = (t110 | t111);
    *((unsigned int *)t123) = t112;
    t104 = (t65 + 4);
    t105 = (t107 + 4);
    t106 = (t123 + 4);
    t113 = *((unsigned int *)t104);
    t114 = *((unsigned int *)t105);
    t115 = (t113 | t114);
    *((unsigned int *)t106) = t115;
    t116 = *((unsigned int *)t106);
    t117 = (t116 != 0);
    if (t117 == 1)
        goto LAB75;

LAB76:
LAB77:    goto LAB66;

LAB69:    t95 = (t94 + 4);
    *((unsigned int *)t94) = 1;
    *((unsigned int *)t95) = 1;
    goto LAB70;

LAB71:    *((unsigned int *)t107) = 1;
    goto LAB74;

LAB73:    t97 = (t107 + 4);
    *((unsigned int *)t107) = 1;
    *((unsigned int *)t97) = 1;
    goto LAB74;

LAB75:    t118 = *((unsigned int *)t123);
    t119 = *((unsigned int *)t106);
    *((unsigned int *)t123) = (t118 | t119);
    t108 = (t65 + 4);
    t109 = (t107 + 4);
    t120 = *((unsigned int *)t108);
    t121 = (~(t120));
    t125 = *((unsigned int *)t65);
    t150 = (t125 & t121);
    t126 = *((unsigned int *)t109);
    t127 = (~(t126));
    t128 = *((unsigned int *)t107);
    t154 = (t128 & t127);
    t129 = (~(t150));
    t132 = (~(t154));
    t133 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t133 & t129);
    t134 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t134 & t132);
    goto LAB77;

LAB78:    xsi_set_current_line(84, ng0);

LAB81:    xsi_set_current_line(85, ng0);
    t124 = ((char*)((ng2)));
    t130 = (t0 + 3048);
    xsi_vlogvar_assign_value(t130, t124, 0, 0, 1);
    goto LAB80;

LAB87:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB88;

LAB89:    xsi_set_current_line(101, ng0);

LAB92:    xsi_set_current_line(102, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t33 = *((unsigned int *)t22);
    t34 = (t33 >> 10);
    *((unsigned int *)t30) = t34;
    t35 = *((unsigned int *)t28);
    t36 = (t35 >> 10);
    *((unsigned int *)t21) = t36;
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t37 & 7U);
    t38 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t38 & 7U);
    t29 = (t0 + 3368);
    t31 = (t29 + 56U);
    t32 = *((char **)t31);
    memset(t52, 0, 8);
    t45 = (t30 + 4);
    t46 = (t32 + 4);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t32);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t45);
    t43 = *((unsigned int *)t46);
    t44 = (t42 ^ t43);
    t47 = (t41 | t44);
    t48 = *((unsigned int *)t45);
    t49 = *((unsigned int *)t46);
    t50 = (t48 | t49);
    t51 = (~(t50));
    t56 = (t47 & t51);
    if (t56 != 0)
        goto LAB96;

LAB93:    if (t50 != 0)
        goto LAB95;

LAB94:    *((unsigned int *)t52) = 1;

LAB96:    t54 = (t52 + 4);
    t57 = *((unsigned int *)t54);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (t59 & t58);
    t61 = (t60 != 0);
    if (t61 > 0)
        goto LAB97;

LAB98:    xsi_set_current_line(107, ng0);

LAB101:    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB99:    goto LAB91;

LAB95:    t53 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB96;

LAB97:    xsi_set_current_line(103, ng0);

LAB100:    xsi_set_current_line(104, ng0);
    t55 = ((char*)((ng2)));
    t62 = (t0 + 3048);
    xsi_vlogvar_assign_value(t62, t55, 0, 0, 1);
    goto LAB99;

LAB104:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB105;

LAB106:    xsi_set_current_line(112, ng0);
    t21 = (t0 + 1368U);
    t22 = *((char **)t21);
    memset(t30, 0, 8);
    t21 = (t30 + 4);
    t28 = (t22 + 4);
    t33 = *((unsigned int *)t22);
    t34 = (t33 >> 10);
    *((unsigned int *)t30) = t34;
    t35 = *((unsigned int *)t28);
    t36 = (t35 >> 10);
    *((unsigned int *)t21) = t36;
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t37 & 7U);
    t38 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t38 & 7U);
    t29 = (t0 + 3208);
    t31 = (t29 + 56U);
    t32 = *((char **)t31);
    memset(t52, 0, 8);
    t45 = (t30 + 4);
    t46 = (t32 + 4);
    t39 = *((unsigned int *)t30);
    t40 = *((unsigned int *)t32);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t45);
    t43 = *((unsigned int *)t46);
    t44 = (t42 ^ t43);
    t47 = (t41 | t44);
    t48 = *((unsigned int *)t45);
    t49 = *((unsigned int *)t46);
    t50 = (t48 | t49);
    t51 = (~(t50));
    t56 = (t47 & t51);
    if (t56 != 0)
        goto LAB112;

LAB109:    if (t50 != 0)
        goto LAB111;

LAB110:    *((unsigned int *)t52) = 1;

LAB112:    t54 = (t52 + 4);
    t57 = *((unsigned int *)t54);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (t59 & t58);
    t61 = (t60 != 0);
    if (t61 > 0)
        goto LAB113;

LAB114:    xsi_set_current_line(117, ng0);

LAB117:    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB115:    goto LAB108;

LAB111:    t53 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB112;

LAB113:    xsi_set_current_line(113, ng0);

LAB116:    xsi_set_current_line(114, ng0);
    t55 = ((char*)((ng2)));
    t62 = (t0 + 3048);
    xsi_vlogvar_assign_value(t62, t55, 0, 0, 1);
    goto LAB115;

}

static void Always_127_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 5280U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 5664);
    *((int *)t2) = 1;
    t3 = (t0 + 5312);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(128, ng0);

LAB5:    xsi_set_current_line(135, ng0);
    t4 = (t0 + 3048);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 1, t7, 32);
    if (t8 == 1)
        goto LAB7;

LAB8:
LAB10:
LAB9:    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB11:    goto LAB2;

LAB7:    xsi_set_current_line(136, ng0);
    t9 = ((char*)((ng2)));
    t10 = (t0 + 2888);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 1);
    goto LAB11;

}


extern void work_m_00000000001242468656_4285008939_init()
{
	static char *pe[] = {(void *)Always_39_0,(void *)Always_49_1,(void *)Cont_59_2,(void *)Always_66_3,(void *)Always_127_4};
	xsi_register_didat("work_m_00000000001242468656_4285008939", "isim/testbench5_isim_beh.exe.sim/work/m_00000000001242468656_4285008939.didat");
	xsi_register_executes(pe);
}
