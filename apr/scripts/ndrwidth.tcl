# open your lib file:
open_block ORCA_TOP_lib:ORCA_TOP.design

# To check nondefault width and default spacing rule
create_routing_rule {new} -default_reference_rule  -multiplier_width 2
set_routing_rule I_BLENDER_0/n617 -rule new
set_routing_rule I_BLENDER_0/n725 -rule new
route_detail -incremental true

#to view the nets in gui
change_selection [get_nets {I_BLENDER_0/n617 I_BLENDER_0/n725}]
start_gui

#To report the rules and timing
report_routing_rules {new} -verbose > ../reports/reports.ndr/ndrwidth.rpt
report_timing -nets -cap  >  ../reports/reports.ndr/timingwidth.rpt
