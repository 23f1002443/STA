create_clock -name clk_10MHz -period 100.0 [get_ports clk1]

set_input_delay -max 4.0 -clock clk_10MHz [get_ports rst]
set_input_delay -min 2.0 -clock clk_10MHz [get_ports rst]

set_output_delay -max 1.0 -clock clk_10MHz [get_ports count1]
set_output_delay -min 0.0 -clock clk_10MHz [get_ports count1]

set_multicycle_path 1 -from [get_ports count1] -to [get_ports count2] -setup
set_multicycle_path 1 -from [get_ports count2] -to [get_ports count1] -hold

create_clock -name clk_50MHz -period 20.0 [get_ports clk2]

set_input_delay -max 2.0 -clock clk_50MHz [get_ports rst]
set_input_delay -min 1.0 -clock clk_50MHz [get_ports rst]

set_output_delay -max 1.0 -clock clk_50MHz [get_ports count2]
set_output_delay -min 0.0 -clock clk_50MHz [get_ports count2]

set_multicycle_path 1 -from [get_ports count1] -to [get_ports count2] -setup
set_multicycle_path 1 -from [get_ports count2] -to [get_ports count1] -hold
