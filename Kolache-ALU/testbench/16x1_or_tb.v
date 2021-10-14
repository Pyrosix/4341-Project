`timescale 1ns/1ns
`include "../32x1_or.v"

module or_16x1_tb;
reg [7:0] a, b;
wire y;

or_16x1 test(.a(a), .b(b), .y(y));
initial begin

$display("    a    |     b     |      y");
$display("-----------+-------------+-----------");
$monitor("a = %b b = %b y = %b", a, b, y); 
// <# of bits>'b<binary value>
a = 8'b11111111; b = 8'b11111111; #20;  // case: both input's == 1 
a = 8'b00000000; b = 8'b00000000; #20;  // case: both input's == 0
a = 8'b00001010; b = 8'b00001010; #20;  //case: other
a = 8'b01110010; b = 8'b01011011; #20;  //case: other
a = 8'b11111111; b = 8'b00111011; #20;  //case: other
end
endmodule