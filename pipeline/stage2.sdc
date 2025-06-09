
create_clock -name clk_10MHz -period 100.0 [get_ports clk]


set_input_delay -clock clk_10MHz -max 5.0 [get_ports rst_n]
set_input_delay -clock clk_10MHz -min 2.0 [get_ports rst_n]
set_output_delay -max 5.0 -clock clk_10MHz [get_ports sum_reg]
set_output_delay -min 0.0 -clock clk_10MHz [get_ports sum_reg]
set_clock_uncertainty -setup 0.2 [get_clocks clk_10MHz]
set_clock_uncertainty -hold 0.1 [get_clocks clk_10MHz]

#set_clock_latency 3 [get_clocks clk_10MHz]
set_clock_latency 5 [get_clocks clk_10MHz]


set_multicycle_path 2 -from [get_ports A_reg] -to [get_ports sum_reg] -setup
set_multicycle_path 2 -from [get_ports B_reg] -to [get_ports sum_reg] -hold