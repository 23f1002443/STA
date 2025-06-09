
create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports rst_n]

set_output_delay 2 -clock clk [get_ports q]

set_ideal_network [get_clocks clk]
set_net_delay -root [get_nets q] -delay 1.5
set_max_fanout 4[get_designs *]
set_load 0.05 [get_ports *]