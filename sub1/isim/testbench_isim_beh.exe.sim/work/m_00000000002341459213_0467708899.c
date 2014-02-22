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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Dropbox/EE496/Temp/IM1.V";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {24835U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {67U, 0U};
static int ng5[] = {2, 0};
static unsigned int ng6[] = {18557U, 0U};
static int ng7[] = {3, 0};
static unsigned int ng8[] = {29189U, 0U};
static int ng9[] = {4, 0};
static unsigned int ng10[] = {27007U, 0U};
static int ng11[] = {5, 0};
static unsigned int ng12[] = {16508U, 0U};



static void Always_12_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(12, ng0);
    t2 = (t0 + 1548);
    *((int *)t2) = 1;
    t3 = (t0 + 1380);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(13, ng0);
    t5 = (t0 + 600U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 1);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 7U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 7U);

LAB5:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t14, 32);
    if (t15 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 32, t2, 32);
    if (t15 == 1)
        goto LAB16;

LAB17:
LAB19:
LAB18:    xsi_set_current_line(20, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 828);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);

LAB20:    goto LAB2;

LAB6:    xsi_set_current_line(14, ng0);
    t16 = ((char*)((ng2)));
    t17 = (t0 + 828);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 16);
    goto LAB20;

LAB8:    xsi_set_current_line(15, ng0);
    t3 = ((char*)((ng4)));
    t5 = (t0 + 828);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 16);
    goto LAB20;

LAB10:    xsi_set_current_line(16, ng0);
    t3 = ((char*)((ng6)));
    t5 = (t0 + 828);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 16);
    goto LAB20;

LAB12:    xsi_set_current_line(17, ng0);
    t3 = ((char*)((ng8)));
    t5 = (t0 + 828);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 16);
    goto LAB20;

LAB14:    xsi_set_current_line(18, ng0);
    t3 = ((char*)((ng10)));
    t5 = (t0 + 828);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 16);
    goto LAB20;

LAB16:    xsi_set_current_line(19, ng0);
    t3 = ((char*)((ng12)));
    t5 = (t0 + 828);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 16);
    goto LAB20;

}


extern void work_m_00000000002341459213_0467708899_init()
{
	static char *pe[] = {(void *)Always_12_0};
	xsi_register_didat("work_m_00000000002341459213_0467708899", "isim/testbench_isim_beh.exe.sim/work/m_00000000002341459213_0467708899.didat");
	xsi_register_executes(pe);
}
