
module pipelined_rca (
input clk,
input [3:0] a, b,
input cin,
output reg [3:0] sum,
output reg cout
);
integer i;
reg [3:0] p, g; 
reg [4:0] carry;
always @(posedge clk) begin
p <= a ^ b; // propagate
g <= a & b; // generate
end
always @(posedge clk) begin
carry[0] <= cin;
for (i = 0; i < 4; i = i + 1 ) begin
carry[i+1] <= g[i] | (p[i] & carry[i]);
end
end
always @(posedge clk) begin
for (i = 0; i < 4; i = i + 1) begin
sum[i] <= p[i] ^ carry[i];
end
cout <= carry[4];
end
endmodule