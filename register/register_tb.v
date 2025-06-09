`timescale 1ns / 1ps

module register_file_tb;

reg clk, rst, we;
reg [2:0] read_addr, write_addr;
reg [7:0] write_data;
wire [7:0] read_data;

register_file uut (
    .clk(clk),
    .rst(rst),
    .we(we),
    .read_addr(read_addr),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_data(read_data)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("register_file.vcd");
    $dumpvars(0, register_file_tb);
    clk = 0;
    rst = 1;
    we = 0;
    write_addr = 0;
    write_data = 8'b0;
    read_addr = 0;

    #10 rst = 0;

    #10 we = 1; write_addr = 3'b001; write_data = 8'hA5;
    #10 we = 1; write_addr = 3'b010; write_data = 8'h5A;
    #10 we = 0;

    #10 read_addr = 3'b001;
    #10 read_addr = 3'b010;

    #50 $finish;
end

endmodule
