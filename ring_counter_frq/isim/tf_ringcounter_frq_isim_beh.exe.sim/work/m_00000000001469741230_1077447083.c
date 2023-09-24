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
static const char *ng0 = "D:/ring_counter_frq/ring_counter_frq.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {128U, 0U};
static int ng4[] = {128, 0};
static unsigned int ng5[] = {1U, 0U};



static void Always_28_0(char *t0)
{
    char t13[8];
    char t29[8];
    char t46[8];
    char t62[8];
    char t70[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
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
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t104;
    char *t105;

LAB0:    t1 = (t0 + 1628U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1824);
    *((int *)t2) = 1;
    t3 = (t0 + 1656);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(28, ng0);

LAB5:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 692U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(31, ng0);

LAB9:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(38, ng0);

LAB39:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t16 = (t9 ^ t10);
    t17 = (t8 | t16);
    t18 = *((unsigned int *)t11);
    t19 = *((unsigned int *)t12);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB43;

LAB40:    if (t20 != 0)
        goto LAB42;

LAB41:    *((unsigned int *)t13) = 1;

LAB43:    memset(t29, 0, 8);
    t15 = (t13 + 4);
    t23 = *((unsigned int *)t15);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t15) != 0)
        goto LAB46;

LAB47:    t30 = (t29 + 4);
    t31 = *((unsigned int *)t29);
    t32 = (!(t31));
    t33 = *((unsigned int *)t30);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB48;

LAB49:    memcpy(t70, t29, 8);

LAB50:    t84 = (t70 + 4);
    t92 = *((unsigned int *)t84);
    t94 = (~(t92));
    t95 = *((unsigned int *)t70);
    t96 = (t95 & t94);
    t97 = (t96 != 0);
    if (t97 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_lshift(t13, 8, t4, 8, t5, 32);
    t11 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 8, 0LL);

LAB64:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(30, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 8, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(32, ng0);

LAB13:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 1104);
    t5 = (t4 + 36U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t14 = (t11 + 4);
    t15 = (t12 + 4);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 ^ t17);
    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = (t18 | t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t15);
    t25 = (t23 | t24);
    t26 = (~(t25));
    t27 = (t22 & t26);
    if (t27 != 0)
        goto LAB17;

LAB14:    if (t25 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t13) = 1;

LAB17:    memset(t29, 0, 8);
    t30 = (t13 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t13);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t30) != 0)
        goto LAB20;

LAB21:    t37 = (t29 + 4);
    t38 = *((unsigned int *)t29);
    t39 = (!(t38));
    t40 = *((unsigned int *)t37);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB22;

LAB23:    memcpy(t70, t29, 8);

LAB24:    t98 = (t70 + 4);
    t99 = *((unsigned int *)t98);
    t100 = (~(t99));
    t101 = *((unsigned int *)t70);
    t102 = (t101 & t100);
    t103 = (t102 != 0);
    if (t103 > 0)
        goto LAB36;

LAB37:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_rshift(t13, 8, t4, 8, t5, 32);
    t11 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 8, 0LL);

LAB38:    goto LAB12;

LAB16:    t28 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB17;

LAB18:    *((unsigned int *)t29) = 1;
    goto LAB21;

LAB20:    t36 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB21;

LAB22:    t42 = (t0 + 1104);
    t43 = (t42 + 36U);
    t44 = *((char **)t43);
    t45 = ((char*)((ng1)));
    memset(t46, 0, 8);
    t47 = (t44 + 4);
    t48 = (t45 + 4);
    t49 = *((unsigned int *)t44);
    t50 = *((unsigned int *)t45);
    t51 = (t49 ^ t50);
    t52 = *((unsigned int *)t47);
    t53 = *((unsigned int *)t48);
    t54 = (t52 ^ t53);
    t55 = (t51 | t54);
    t56 = *((unsigned int *)t47);
    t57 = *((unsigned int *)t48);
    t58 = (t56 | t57);
    t59 = (~(t58));
    t60 = (t55 & t59);
    if (t60 != 0)
        goto LAB28;

LAB25:    if (t58 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t46) = 1;

LAB28:    memset(t62, 0, 8);
    t63 = (t46 + 4);
    t64 = *((unsigned int *)t63);
    t65 = (~(t64));
    t66 = *((unsigned int *)t46);
    t67 = (t66 & t65);
    t68 = (t67 & 1U);
    if (t68 != 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t63) != 0)
        goto LAB31;

LAB32:    t71 = *((unsigned int *)t29);
    t72 = *((unsigned int *)t62);
    t73 = (t71 | t72);
    *((unsigned int *)t70) = t73;
    t74 = (t29 + 4);
    t75 = (t62 + 4);
    t76 = (t70 + 4);
    t77 = *((unsigned int *)t74);
    t78 = *((unsigned int *)t75);
    t79 = (t77 | t78);
    *((unsigned int *)t76) = t79;
    t80 = *((unsigned int *)t76);
    t81 = (t80 != 0);
    if (t81 == 1)
        goto LAB33;

LAB34:
LAB35:    goto LAB24;

LAB27:    t61 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB28;

LAB29:    *((unsigned int *)t62) = 1;
    goto LAB32;

LAB31:    t69 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t69) = 1;
    goto LAB32;

LAB33:    t82 = *((unsigned int *)t70);
    t83 = *((unsigned int *)t76);
    *((unsigned int *)t70) = (t82 | t83);
    t84 = (t29 + 4);
    t85 = (t62 + 4);
    t86 = *((unsigned int *)t84);
    t87 = (~(t86));
    t88 = *((unsigned int *)t29);
    t89 = (t88 & t87);
    t90 = *((unsigned int *)t85);
    t91 = (~(t90));
    t92 = *((unsigned int *)t62);
    t93 = (t92 & t91);
    t94 = (~(t89));
    t95 = (~(t93));
    t96 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t96 & t94);
    t97 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t97 & t95);
    goto LAB35;

LAB36:    xsi_set_current_line(34, ng0);
    t104 = ((char*)((ng3)));
    t105 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t105, t104, 0, 0, 8, 0LL);
    goto LAB38;

LAB42:    t14 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB43;

LAB44:    *((unsigned int *)t29) = 1;
    goto LAB47;

LAB46:    t28 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB47;

LAB48:    t36 = (t0 + 1104);
    t37 = (t36 + 36U);
    t42 = *((char **)t37);
    t43 = ((char*)((ng4)));
    memset(t46, 0, 8);
    t44 = (t42 + 4);
    t45 = (t43 + 4);
    t35 = *((unsigned int *)t42);
    t38 = *((unsigned int *)t43);
    t39 = (t35 ^ t38);
    t40 = *((unsigned int *)t44);
    t41 = *((unsigned int *)t45);
    t49 = (t40 ^ t41);
    t50 = (t39 | t49);
    t51 = *((unsigned int *)t44);
    t52 = *((unsigned int *)t45);
    t53 = (t51 | t52);
    t54 = (~(t53));
    t55 = (t50 & t54);
    if (t55 != 0)
        goto LAB54;

LAB51:    if (t53 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t46) = 1;

LAB54:    memset(t62, 0, 8);
    t48 = (t46 + 4);
    t56 = *((unsigned int *)t48);
    t57 = (~(t56));
    t58 = *((unsigned int *)t46);
    t59 = (t58 & t57);
    t60 = (t59 & 1U);
    if (t60 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t48) != 0)
        goto LAB57;

LAB58:    t64 = *((unsigned int *)t29);
    t65 = *((unsigned int *)t62);
    t66 = (t64 | t65);
    *((unsigned int *)t70) = t66;
    t63 = (t29 + 4);
    t69 = (t62 + 4);
    t74 = (t70 + 4);
    t67 = *((unsigned int *)t63);
    t68 = *((unsigned int *)t69);
    t71 = (t67 | t68);
    *((unsigned int *)t74) = t71;
    t72 = *((unsigned int *)t74);
    t73 = (t72 != 0);
    if (t73 == 1)
        goto LAB59;

LAB60:
LAB61:    goto LAB50;

LAB53:    t47 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t62) = 1;
    goto LAB58;

LAB57:    t61 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB58;

LAB59:    t77 = *((unsigned int *)t70);
    t78 = *((unsigned int *)t74);
    *((unsigned int *)t70) = (t77 | t78);
    t75 = (t29 + 4);
    t76 = (t62 + 4);
    t79 = *((unsigned int *)t75);
    t80 = (~(t79));
    t81 = *((unsigned int *)t29);
    t89 = (t81 & t80);
    t82 = *((unsigned int *)t76);
    t83 = (~(t82));
    t86 = *((unsigned int *)t62);
    t93 = (t86 & t83);
    t87 = (~(t89));
    t88 = (~(t93));
    t90 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t90 & t87);
    t91 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t91 & t88);
    goto LAB61;

LAB62:    xsi_set_current_line(40, ng0);
    t85 = ((char*)((ng5)));
    t98 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t98, t85, 0, 0, 8, 0LL);
    goto LAB64;

}


extern void work_m_00000000001469741230_1077447083_init()
{
	static char *pe[] = {(void *)Always_28_0};
	xsi_register_didat("work_m_00000000001469741230_1077447083", "isim/tf_ringcounter_frq_isim_beh.exe.sim/work/m_00000000001469741230_1077447083.didat");
	xsi_register_executes(pe);
}
