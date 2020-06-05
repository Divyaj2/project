# open your lib file:
open_block ORCA_TOP_lib:ORCA_TOP.design

# tell where is the runset or drc rules are:
set_app_options  -name signoff.check_drc.runset -value  /u/divyaj2/ECE510-2020-SPRING/project/apr/work/saed32nm_1p9m_drc_rules.rs

# set the host options:
set_host_options -target ICV -num_processes 1 mo.ece.pdx.edu -submit_command rsh

# tell which to pick up for command:
setenv ICV_RSH_COMMAND /usr/bin/ssh

# run drc checker:
signoff_check_drc

# To fix the drc violations
#signoff_fix_drc
# To check violations in specified area
#signoff_check_drc -coordinates {{500 500} {800 800}}
#To fix violations in that specified area
#signoff_fix_drc -coordinates {{500 500} {800 800}}
# to check the routes
#check_routes  -coordinates {{500 500} {800 800}}

#To check the lvs violations  
#check_lvs 

# To increase the number of violations showing from (default) 20 to 200
#check_lvs  -max_errors 200
