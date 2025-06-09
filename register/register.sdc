create_clock -name clk -period 10 [get_ports clk]

set_input_delay -max 3.0 -clock clk [get_ports write_data]
set_input_delay -min 1.0 -clock clk [get_ports write_data]

set_output_delay -max 2.0 -clock clk [get_ports read_data]
set_output_delay -min 0.8 -clock clk [get_ports read_data]

set_max_delay 5.0 -from [get_ports clk] -to [get_ports write_data]
set_min_delay 1.0 -from [get_ports clk] -to [get_ports write_data]

set_clock_uncertainty 0.2 [get_clocks clk]
