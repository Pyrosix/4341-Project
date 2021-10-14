`timescale 1ns/1ns
`include "../32_bit_equal.v"

module equal_tb;
reg [31:0]a, b;
wire y;

equal test(.a(a), .b(b), .y(y));
initial begin
$dumpfile("and_32x1.vcd");
$dumpvars(0, equal_tb);
$display("    a                               |                 b                  |  y");
$display("------------------------------------+------------------------------------+---");
$monitor("a = %b b = %b y = %b", a, b, y); 

// <# of bits>'b<binary value>
a = 32'b11111111111111111111111111111111; b = 32'b11111111111111111111111111111111; #20;  // case: both input's == 1 -> 1
a = 32'b00000000000000000000000000000000; b = 32'b00000000000000000000000000000000; #20;  // case: both input's == 0 -> 1
a = 32'b00000000000000000000100000001000; b = 32'b00000000000000000000100000001000; #20;  // 2056 == 2056 ? -> 1
a = 32'b11111111100110001001011001111111; b = 32'b11111111100110001001011001111111; #20;  // 2147483647 == 2147483647 ? -> 1
a = 32'b11111111100110001001011001111111; b = 32'b11111011100110001001011001111111; #20;  // 2147483647 == 4221081215 ? -> 0
a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000001; #20;  // 1 == 1 ? -> 1
a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000010; #20;  // 1 == 2 ? -> 0


end

endmodule