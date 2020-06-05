

# open your lib file:
open_block ORCA_TOP_lib:ORCA_TOP.design

# To check nondefault width and non default spacing rule
create_routing_rule {widthspace} -default_reference_rule  -multiplier_width 2 -multiplier_spacing 2
set_routing_rule I_BLENDER_0/n617 -rule widthspace
set_routing_rule I_BLENDER_0/n725 -rule widthspace

#to reroute
route_detail -incremental true

#to view in gui
change_selection [get_nets {I_BLENDER_0/n617 I_BLENDER_0/n725}]
start_gui

# to report 
report_routing_rules {widthspace} -verbose > ../reports/reports.ndr/ndrwsrules.rpt
report_timing -nets -cap  >  ../reports/reports.ndr/timingws.rpt
