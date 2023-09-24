
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ringcounter_mode -dir "F:/ringcounter_mode/planAhead_run_2" -part xc3s1000fg676-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ringcounter_mode.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ringcounter_mode.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ringcounter_mode $srcset
add_files [list {ringcounter_mode.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s1000fg676-4
