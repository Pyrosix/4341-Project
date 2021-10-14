`timescale 1ns/1ns
`include "../32_bit_equal.v"

module equal_tb;
reg a, b;
wire y;

EQ test(.a(a), .b(b), .y(y));
initial begin
$monitor("a = %b b = %b y = %b", a, b, y); 
// <# of bits>'b<binary value>
a = 1'b0; b = 1'b0; #20;  // case: both input's == 1 
a = 1'b1; b = 1'b1; #20;  // case: both input's == 0
a = 1'b0; b = 1'b1; #20;  // case: else not equal 
end

endmodule