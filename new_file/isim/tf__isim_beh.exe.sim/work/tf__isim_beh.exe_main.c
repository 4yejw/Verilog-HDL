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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002990029295_0372913986_init();
    work_m_00000000002891416908_1855913566_init();
    work_m_00000000002749742069_1614490441_init();
    work_m_00000000001280526297_3467986449_init();
    work_m_00000000000691186302_2580414097_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000691186302_2580414097");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
