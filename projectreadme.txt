(1)To run drc checks run the file drc.tcl

The drc runset file is placed in work folder
The path  is u/divyaj2/ECE510-2020-SPRING/project/apr/work/saed32nm_1p9m_drc_rules.rs

The same work folder is used by the tool to place the error files.
The drc.tcl includes all the commands to check and fix. However fix commands are hashed of.

(2)To run shielding of nets topics run shield.tcl file

(3)To run non default routing rules topics three different tcl files, one for each combination, are included as ndrwidth.tcl, ndrspace.tcl and ndr.tcl

case (i): ndrwidth.tcl contains the commands to execute only nondefault width rule keeping the spacing rule to default values.


case(ii) ndrspace.tcl contains the commands to execute only nondefault spacing rule  keeping the width rule to default vslues.


case(iii) ndr.tcl contains the commands to execute both the nondefault spacing and non default width rules

Allthe reports are placed in reports folder with appropriate names.

ndrwidth reports are from case(i)

ndrspace reports are from case(ii)

ndrws reports are from case(iii)

(4) The topic routing in nets is done in gui and no tcl file for the topic. Reports are placed in reports section
