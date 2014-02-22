
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name sub1 -dir "C:/Users/andy.ng/Desktop/sub1/planAhead_run_2" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/andy.ng/Desktop/sub1/FPGADevice.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/andy.ng/Desktop/sub1} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "FPGADevice.ucf"
add_files "FPGADevice.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
