
create_clock -period 10 [get_ports clk]

set_input_delay 2.5 -clock clk [all_inputs]

set_output_delay 2.5 -clock clk [all_outputs]

set_drive 1 [all_inputs]

set_load 1 [all_outputs]

set_max_transition 0.5 [current_design]
set_max_fanout 5 [current_design]
