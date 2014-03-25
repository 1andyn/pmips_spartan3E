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
static const char *ng0 = "IMEM[%d,%b] DMEM[%d,%d,%d] ALU[%d] Signals[%b,%b,%0d], PCSrc:[%b], PCStall:[%b], Flush: %b, IFID:%b, IDEX: %b, EXMEM:%b, Write:%b, DATA:%b, EXMEMALUOUT:%b, Predict Stage: %d, Code: %d";
static const char *ng1 = "D:/Dropbox/Codespace/PMIPS/Temp/testbenchSubproject3.V";
static int ng2[] = {0, 0};
static const char *ng3 = "\nIO[display,switch0,switch1]\n";
static const char *ng4 = "IMEM[PC,Instr]\n";
static const char *ng5 = "DMEM[address, rdata, wdata]\n";
static const char *ng6 = "ALU[result]\n";
static const char *ng7 = "Signals[clock,reset,time]";
static int ng8[] = {1, 0};

void Monitor_64_4(char *);
void Monitor_64_4(char *);


static void Monitor_64_4_Func(char *t0)
{
    char t13[16];
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
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    t1 = (t0 + 1048U);
    t2 = *((char **)t1);
    t1 = (t0 + 2168U);
    t3 = *((char **)t1);
    t1 = (t0 + 1208U);
    t4 = *((char **)t1);
    t1 = (t0 + 2328U);
    t5 = *((char **)t1);
    t1 = (t0 + 1368U);
    t6 = *((char **)t1);
    t1 = (t0 + 1848U);
    t7 = *((char **)t1);
    t1 = (t0 + 4968);
    t8 = (t1 + 56U);
    t9 = *((char **)t8);
    t10 = (t0 + 5128);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t14 = xsi_vlog_time(t13, 1000.0000000000000, 1000.0000000000000);
    t15 = (t0 + 2488U);
    t16 = *((char **)t15);
    t15 = (t0 + 3608U);
    t17 = *((char **)t15);
    t15 = (t0 + 4088U);
    t18 = *((char **)t15);
    t15 = (t0 + 2648U);
    t19 = *((char **)t15);
    t15 = (t0 + 2808U);
    t20 = *((char **)t15);
    t15 = (t0 + 2968U);
    t21 = *((char **)t15);
    t15 = (t0 + 3288U);
    t22 = *((char **)t15);
    t15 = (t0 + 3448U);
    t23 = *((char **)t15);
    t15 = (t0 + 3128U);
    t24 = *((char **)t15);
    t15 = (t0 + 3768U);
    t25 = *((char **)t15);
    t15 = (t0 + 3928U);
    t26 = *((char **)t15);
    xsi_vlogfile_write(1, 0, 3, ng0, 21, t0, (char)118, t2, 16, (char)118, t3, 16, (char)118, t4, 16, (char)118, t5, 16, (char)118, t6, 16, (char)118, t7, 16, (char)118, t9, 1, (char)118, t12, 1, (char)118, t13, 64, (char)118, t16, 1, (char)118, t17, 1, (char)118, t18, 1, (char)118, t19, 16, (char)118, t20, 16, (char)118, t21, 16, (char)118, t22, 1, (char)118, t23, 16, (char)118, t24, 16, (char)118, t25, 3, (char)118, t26, 4);

LAB1:    return;
}

static void Initial_44_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(44, ng1);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 4968);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Always_45_1(char *t0)
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

LAB0:    t1 = (t0 + 6296U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng1);
    t2 = (t0 + 6104);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(45, ng1);
    t4 = (t0 + 4968);
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
    t24 = (t0 + 4968);
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

static void Initial_48_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 6544U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(49, ng1);

LAB4:    xsi_set_current_line(50, ng1);
    xsi_vlogfile_write(1, 0, 0, ng3, 1, t0);
    xsi_set_current_line(51, ng1);
    xsi_vlogfile_write(1, 0, 0, ng4, 1, t0);
    xsi_set_current_line(52, ng1);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(53, ng1);
    xsi_vlogfile_write(1, 0, 0, ng6, 1, t0);
    xsi_set_current_line(54, ng1);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(55, ng1);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 5128);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(56, ng1);
    t2 = (t0 + 6352);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(57, ng1);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 5128);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(58, ng1);
    t2 = (t0 + 6352);
    xsi_process_wait(t2, 125000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(59, ng1);
    xsi_vlog_finish(1);
    goto LAB1;

}

static void Initial_63_3(char *t0)
{

LAB0:    xsi_set_current_line(64, ng1);
    Monitor_64_4(t0);

LAB1:    return;
}

void Monitor_64_4(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 6848);
    t2 = (t0 + 7360);
    xsi_vlogfile_monitor((void *)Monitor_64_4_Func, t1, t2);

LAB1:    return;
}


extern void work_m_00000000000061928090_3130889506_init()
{
	static char *pe[] = {(void *)Initial_44_0,(void *)Always_45_1,(void *)Initial_48_2,(void *)Initial_63_3,(void *)Monitor_64_4};
	xsi_register_didat("work_m_00000000000061928090_3130889506", "isim/testbench5_isim_beh.exe.sim/work/m_00000000000061928090_3130889506.didat");
	xsi_register_executes(pe);
}
