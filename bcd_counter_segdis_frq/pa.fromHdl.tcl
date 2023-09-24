
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name bcd_counter_segdis1 -dir "F:/bcd_counter_segdis_frq/planAhead_run_2" -part xc3s1000fg676-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "bcd_counter_segdis1.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {frq_div_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {number_10.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {number_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {bcd_counter_segdis1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top bcd_counter_segdis1 $srcset
add_files [list {bcd_counter_segdis1.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s1000fg676-5
