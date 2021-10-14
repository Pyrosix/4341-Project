`timescale 1ns/1ns
`include "../32_bit_equal.v"

module eq_2bit_tb;
reg [1:0] a, b;
wire y;

equal test(.a(a), .b(b), .y(y));
initial begin
$dumpfile("eq_4x1.vcd");
$dumpvars(0, eq_2bit_tb);
$display("a    | b     |  y");
$display("-----+-------+-----");
$monitor("a = %b b = %b y = %b", a, b, y); 
// <# of bits>'b<binary value>
a = 2'b11; b = 2'b11; #20;  // case: both input's == 1  -> 1
a = 2'b00; b = 2'b00; #20;  // case: both input's == 0 -> 1
a = 2'b10; b = 2'b10; #20;  // case: other -> 1
a = 2'b11; b = 2'b01; #20;  // case: 11 != 01 -> 0
 end

endmodule