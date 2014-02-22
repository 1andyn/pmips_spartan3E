
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name sub1 -dir "C:/Users/andy.ng/Desktop/sub1/planAhead_run_1" -part xc3s100ecp132-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top FPGADevice $srcset
set_param project.paUcfFile  "FPGADevice.ucf"
add_files [list {../Temp/MIPS-Parts.V}]
add_files [list {../Temp/Control.V}]
add_files [list {../Temp/PMIPSL0.V}]
add_files [list {../Temp/IM3.V}]
add_files [list {../Temp/SubProject3FPGA.V}]
add_files "FPGADevice.ucf" -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-4
