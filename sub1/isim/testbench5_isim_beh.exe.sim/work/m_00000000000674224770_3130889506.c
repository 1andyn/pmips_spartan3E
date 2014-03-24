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
static const char *ng0 = "IO[%b,%b,%b] IMEM[%d,%b] DMEM[%d,%d,%d] ALU[%d] Signals[%b,%b,%0d], ALUOUT:[%b], Stall: %b, IFID:%b, IDEX: %b, EXMEM:%b, Write:%b, DATA:%b, EXMEMALUOUT:%b";
static const char *ng1 = "D:/Dropbox/Codespace/PMIPS/Temp/testbenchSubproject3.V";
static int ng2[] = {0, 0};
static const char *ng3 = "\nIO[display,switch0,switch1]\n";
static const char *ng4 = "IMEM[PC,Instr]\n";
static const char *ng5 = "DMEM[address, rdata, wdata]\n";
static const char *ng6 = "ALU[result]\n";
static const char *ng7 = "Signals[clock,reset,time]";
static int ng8[] = {1, 0};

void Monitor_61_4(char *);
void Monitor_61_4(char *);


static void Monitor_61_4_Func(char *t0)
{
    char t20[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    t1 = (t0 + 3768U);
    t2 = *((char **)t1);
    t1 = (t0 + 4168);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4328);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t0 + 1048U);
    t9 = *((char **)t8);
    t8 = (t0 + 2168U);
    t10 = *((char **)t8);
    t8 = (t0 + 1208U);
    t11 = *((char **)t8);
    t8 = (t0 + 2328U);
    t12 = *((char **)t8);
    t8 = (t0 + 1368U);
    t13 = *((char **)t8);
    t8 = (t0 + 1848U);
    t14 = *((char **)t8);
    t8 = (t0 + 4488);
    t15 = (t8 + 56U);
    t16 = *((char **)t15);
    t17 = (t0 + 4648);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t21 = xsi_vlog_time(t20, 1000.0000000000000, 1000.0000000000000);
    t22 = (t0 + 2488U);
    t23 = *((char **)t22);
    t22 = (t0 + 3608U);
    t24 = *((char **)t22);
    t22 = (t0 + 2648U);
    t25 = *((char **)t22);
    t22 = (t0 + 2808U);
    t26 = *((char **)t22);
    t22 = (t0 + 2968U);
    t27 = *((char **)t22);
    t22 = (t0 + 3288U);
    t28 = *((char **)t22);
    t22 = (t0 + 3448U);
    t29 = *((char **)t22);
    t22 = (t0 + 3128U);
    t30 = *((char **)t22);
    xsi_vlogfile_write(1, 0, 3, ng0, 21, t0, (char)118, t2, 7, (char)118, t4, 1, (char)118, t7, 1, (char)118, t9, 16, (char)118, t10, 16, (char)118, t11, 16, (char)118, t12, 16, (char)118, t13, 16, (char)118, t14, 16, (char)118, t16, 1, (char)118, t19, 1, (char)118, t20, 64, (char)118, t23, 16, (char)118, t24, 1, (char)118, t25, 16, (char)118, t26, 16, (char)118, t27, 16, (char)118, t28, 1, (char)118, t29, 16, (char)118, t30, 16);

LAB1:    return;
}

static void Initial_41_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(41, ng1);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 4488);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Always_42_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 5816U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng1);
    t2 = (t0 + 5624);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng1);
    t4 = (t0 + 4488);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 4488);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Initial_45_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 6064U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng1);

LAB4:    xsi_set_current_line(47, ng1);
    xsi_vlogfile_write(1, 0, 0, ng3, 1, t0);
    xsi_set_current_line(48, ng1);
    xsi_vlogfile_write(1, 0, 0, ng4, 1, t0);
    xsi_set_current_line(49, ng1);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(50, ng1);
    xsi_vlogfile_write(1, 0, 0, ng6, 1, t0);
    xsi_set_current_line(51, ng1);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(52, ng1);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 4648);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(53, ng1);
    t2 = (t0 + 5872);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(54, ng1);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 4648);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(55, ng1);
    t2 = (t0 + 5872);
    xsi_process_wait(t2, 50000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(56, ng1);
    xsi_vlog_finish(1);
    goto LAB1;

}

static void Initial_60_3(char *t0)
{

LAB0:    xsi_set_current_line(61, ng1);
    Monitor_61_4(t0);

LAB1:    return;
}

void Monitor_61_4(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 6368);
    t2 = (t0 + 6880);
    xsi_vlogfile_monitor((void *)Monitor_61_4_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00000000000674224770_3130889506_init()
{
	static char *pe[] = {(void *)Initial_41_0,(void *)Always_42_1,(void *)Initial_45_2,(void *)Initial_60_3,(void *)Monitor_61_4};
	xsi_register_didat("work_m_00000000000674224770_3130889506", "isim/testbench5_isim_beh.exe.sim/work/m_00000000000674224770_3130889506.didat");
	xsi_register_executes(pe);
}