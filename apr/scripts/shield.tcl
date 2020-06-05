# open your lib file:
open_block ORCA_TOP_lib:ORCA_TOP.design

#creating shields to two different nets
create_shields -shielding_mode new -nets [get_nets -design [current_block] {I_BLENDER_0/n766}]
create_shields -shielding_mode new -nets [get_nets -design [current_block] { I_BLENDER_0/n3357 }]

change_selection [get_nets {I_BLENDER_0/n766 I_BLENDER_0/n3357}]
start_gui

#To report the shields
report_shields 
report_shields -per_layer true 

#to save the reports 

report_shields  > ../reports/reports.shield/shield.rpt
 
report_shields -per_layer true   > ../reports/reports.shield/shielddetail.rpt

report_timing -nets -cap -crosstalk_delta  >  ../reports/reports.shield/timing.rpt


#Additional commands to create shields with non minimum widths and spacing:

#A rule must be created like below
#create_routing_rule shield_rule  -shield_widths {M1 0.1 M2 0.1 M3 0.1 M4 0.1 M5 0.1 M6 0.3}  -shield_spacings {M1 0.1 M2 0.1 M3 0.1 M4 0.1 M5 0.1 M6 0.3}

#assign the rule to net
#set_routing_rule -rule shield_rule  I_BLENDER_0/n766

#lastly execute the below command to create the shields
#create_shields

