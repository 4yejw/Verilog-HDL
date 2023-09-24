
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ring_counter -dir "F:/ring_counter/planAhead_run_1" -part xc3s1000fg676-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ring_counter.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ring_counter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ring_counter $srcset
add_files [list {ring_counter.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s1000fg676-4
