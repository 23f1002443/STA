`timescale 1ns / 1ps

module tb_dual_clock_counter;

reg clk1;
reg clk2;
reg rst;
wire [3:0] count1;
wire [3:0] count2;

dual_clock_counter uut (
    .clk1(clk1),
    .clk2(clk2),
    .rst(rst),
    .count1(count1),
    .count2(count2)
);

initial begin
    clk1 = 0;
    forever #5 clk1 = ~clk1;
end

initial begin
    clk2 = 0;
    forever #7 clk2 = ~clk2;
end

initial begin
    rst = 1;
    #10;
    rst = 0;
    #100;
    rst = 1;
    #10;
    rst = 0;
    #100;
    $finish;
end

initial begin
    $monitor("Time: %0t | RST: %b | Count1: %b | Count2: %b", $time, rst, count1, count2);
end

endmodule
