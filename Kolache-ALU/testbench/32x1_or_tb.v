`timescale 1ns/1ns
`include "../32x1_or.v"

module or_32x1_tb;
reg [15:0] a, b;
wire y;

or_32x1 test(.a(a), .b(b), .y(y));
initial begin

$display("    a                    |                 b     |                  y");
$display("------------------------+--------------------------+-----");
$monitor("a = %b b = %b y = %b", a, b, y); 
// <# of bits>'b<binary value>
a = 16'b1111111111111111; b = 16'b1111111111111111; #20;  // case: both input's == 1 
a = 16'b0000000000000000; b = 16'b0000000000000000; #20;  // case: both input's == 0
a = 16'b0000101000001010; b = 16'b0000101000001010; #20;  //case: other
a = 16'b0111001001110010; b = 16'b0101101101011011; #20;  //case: other
a = 16'b1111111111111111; b = 16'b0011101100111011; #20;  //case: other
end
endmodule