`timescale 1ns/1ns
`include "../32_bit_less_than.v"

module less_than_tb;
reg [31:0] a, b;
wire y;

LT_32B pass(.a(a), .b(b), .Output(y));
initial begin
$dumpfile("less_than_tb.vcd");
$dumpvars(0, less_than_tb);
$display("    a                               |                 b                  |  y");
$display("------------------------------------+------------------------------------+---");
$monitor("a = %b b = %b y = %b", a, b, y); 

// <# of bits>'b<binary value>
a = 32'b11111111111111111111111111111111; b = 32'b11111111111111111111111111111111; #20;  // case: both input's == 1 -> 0
a = 32'b00000000000000000000000000000000; b = 32'b00000000000000000000000000000000; #20;  // case: both input's == 0 -> 0
a = 32'b00000000000000000000100000001000; b = 32'b00000000000000000000100000001000; #20;  // 2056 == 2056 ? -> 0
a = 32'b11111111100110001001011001111111; b = 32'b11111111100110001001011001111111; #20;  // 2147483647 < 2147483647 ? -> 0
a = 32'b11111111100110001001011001111111; b = 32'b11111011100110001001011001111111; #20;  // 2147483647 < 4221081215 ? -> 0
a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000001; #20;  // < 1 ? -> 0
a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000010; #20;  // 1 < 2 ? -> 1
a = 32'b00000000000000000000000000001001; b = 32'b00000000000000000000000000000010; #20;  // 9 > 2 -> 1


end

endmodule