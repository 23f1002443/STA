module register_file (
    input wire clk,
    input wire rst,
    input wire we,
    input wire [2:0] read_addr,
    input wire [2:0] write_addr,
    input wire [7:0] write_data,
    output reg [7:0] read_data
);

reg [7:0] reg_file [7:0];

always @(*) begin
    read_data = reg_file[read_addr];
end

always @(posedge clk or posedge rst) begin
    if (rst)
        reg_file[0] <= 8'b00000000;
    else if (we)
        reg_file[write_addr] <= write_data;
end

endmodule
