# open your lib file:
open_block ORCA_TOP_lib:ORCA_TOP.design

#To check default width and non default spacing rule
create_routing_rule {space} -default_reference_rule  -multiplier_spacing 2
set_routing_rule I_BLENDER_0/n617 -rule space
set_routing_rule I_BLENDER_0/n725 -rule space

#To reroute the design to see the changes
route_detail -incremental true

#To view in gui
change_selection [get_nets {I_BLENDER_0/n617 I_BLENDER_0/n725}]
start_gui

# To report routing rules and timing after non default routing 
report_routing_rules {space} -verbose > ../reports/reports.ndr/ndrspace.rpt
report_timing -nets -cap   >  ../reports/reports.ndr/timingspace.rpt
