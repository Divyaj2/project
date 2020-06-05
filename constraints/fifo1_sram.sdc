
if { [info exists synopsys_program_name ] && ($synopsys_program_name == "icc2_shell") } {
    puts " Creating ICC2 MCMM "
    create_mode func
    create_corner slow
    create_scenario -mode func -corner slow -name func_slow
    current_scenario func_slow
    set_operating_conditions ss0p75v125c
    read_parasitic_tech -tlup $tlu_dir/saed32nm_1p9m_Cmax.tluplus -layermap $tlu_dir/saed32nm_tf_itf_tluplus.map -name Cmax
    read_parasitic_tech -tlup $tlu_dir/saed32nm_1p9m_Cmin.tluplus -layermap $tlu_dir/saed32nm_tf_itf_tluplus.map -name Cmin
    set_parasitic_parameters -early_spec Cmax -early_temperature 125
    set_parasitic_parameters -late_spec Cmax -late_temperature 125
    #set_parasitic_parameters -early_spec 1p9m_Cmax -early_temperature 125 -corner default
    #set_parasitic_parameters -late_spec 1p9m_Cmax -late_temperature 125 -corner default

    #set_scenario_status  default -active false
    set_scenario_status func_slow -active true -hold true -setup true
}


create_clock -name "wclk" -period 6.0 -waveform {0.0 3.0} wclk
create_clock -name "wclk2x" -period 3.0 -waveform {0.0 1.5} wclk2x
create_clock -name "rclk" -period 3.0 -waveform {0.0 1.5} rclk


#group_path -name INTERNAL -from [all_clocks] -to [all_clocks ]
group_path -name INPUTS -from [ get_ports -filter "direction==in&&full_name!~*clk*" ]
group_path -name OUTPUTS -to [ get_ports -filter "direction==out" ]

#set_operating_condition ss0p75vn40c -library saed32lvt_ss0p75vn40c
set_operating_condition ss0p75v125c -library saed32lvt_ss0p75v125c

set_clock_uncertainty -setup 0.07 wclk
set_clock_uncertainty -hold 0.01 wclk
set_clock_transition 0.1 wclk

set_clock_uncertainty -setup 0.07 rclk
set_clock_uncertainty -hold 0.01 rclk
set_clock_transition 0.1 rclk

set_clock_uncertainty 0.07 -setup wclk2x
set_clock_uncertainty 0.01 -hold wclk2x
set_clock_transition 0.1 wclk2x
set_input_delay 0.011 wdata_in* -clock wclk2x
set_input_delay 0.012 winc -clock wclk
set_input_delay 0.012 rinc -clock rclk
set_output_delay 0.013 rdata* -clock rclk
set_output_delay 0.014 {rempty } -clock rclk
set_output_delay 0.015 { wfull } -clock wclk

set_input_delay 0.16 rrst_n -clock rclk
set_input_delay 0.16 rrst_n -clock wclk -add_delay
set_drive 0.001 [all_inputs ]
set_load 0.5 [all_outputs]

set_clock_latency 0.02 wclk
set_clock_latency 0.01 wclk2x
set_clock_latency 0.01 rclk

#set_false_path -from wclk -to rclk
#set_false_path -from rclk -to wclk
#set_multicycle_path -from wclk -to wclk2x -setup 2
