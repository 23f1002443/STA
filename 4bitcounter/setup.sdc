
#50
create_clock -name clk -period 20 [get_ports clk]

set_input_delay -max 2.0 -clock clk [get_ports reset]
set_input_delay -min 1.0 -clock clk [get_ports reset]

set_output_delay -max 2.0 -clock clk [get_ports count[*]]
set_output_delay -min 0.0 -clock clk [get_ports count[*]]
#jitter
set_clock_uncertainty -setup 0.2 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]

#200
create_clock -name clk -period 5 [get_ports clk]

set_input_delay -max 2.0 -clock clk [get_ports reset]
set_input_delay -min 1.0 -clock clk [get_ports reset]

set_output_delay -max 2.0 -clock clk [get_ports count[*]]
set_output_delay -min 0.0 -clock clk [get_ports count[*]]

set_clock_uncertainty -setup 0.2 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]

set_clock_latency 0.5 [get_clocks clk]