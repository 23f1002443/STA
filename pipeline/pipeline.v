module pipelined_adder (
    input clk,
    input rst_n,
    input [7:0] A,
    input [7:0] B,
    output reg [7:0] sum_reg,
    output reg [7:0] A_reg,
    output reg [7:0] B_reg
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        A_reg <= 8'b0;
        B_reg <= 8'b0;
    end else begin
        A_reg <= A;
        B_reg <= B;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        sum_reg <= 8'b0;
    else
        sum_reg <= A_reg + B_reg;
end

endmodule
