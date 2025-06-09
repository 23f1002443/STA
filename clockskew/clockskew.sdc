
create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [get_ports d_in]
set_output_delay 2 -clock clk [get_ports d_out]

#set_clock_uncertainty 0.2 [get_clocks clk] ;
set_clock_uncertainty -setup 0.2 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]


set_clock_latency 3.0 [get_clocks clk] ;

set_clock_latency 0.1 -source -min [get_clocks clk] ;
set_clock_latency 0.3 -source -max [get_clocks clk] ;