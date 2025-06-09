`timescale 1ns / 1ps

module tb_counter_4bit;

reg clk;
reg reset;
wire [3:0] count;

counter_4bit uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb_counter_4bit);
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #100 $finish;
end

endmodule
