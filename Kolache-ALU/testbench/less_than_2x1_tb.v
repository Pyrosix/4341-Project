`timescale 1ns/1ns
`include "../32_bit_less_than.v"

module less_than_2x1_tb;
reg  [1:0] a, b;
wire Output;
LT_2b lt_2b (.a(a), .b(b), .Output(Output));

initial begin
$dumpfile("lt_2x1.vcd");
$dumpvars(0, less_than_2x1_tb);
$display("a     | b     | y");
$display("------+-------+--------");
$monitor("a = %b b = %b  Output = %b " ,a, b, Output); 
// 11 > 11 -> output 0
a = 2'b11; b = 2'b11; #20; 
// 11 > 10 -> output 1 
 a = 2'b11; b = 2'b10; #20;
// 11 > 01 -> output 1
a = 2'b11; b = 2'b01; #20;  
// 11 > 00 -> output 1
a = 2'b11; b = 2'b00; #20;
$display("------+-------+--------");
// 10 > 11 -> output 0
a = 2'b10; b = 2'b11; #20; 
// 10 > 10 -> output 0
a = 2'b10; b = 2'b10; #20;
// 10 > 01 -> output 1
a = 2'b10; b = 2'b01; #20;
// 10 > 00 -> output 1
a = 2'b10; b = 2'b00; #20;
$display("------+-------+--------");
// 01 > 11 -> output 0
a = 2'b01; b = 2'b11; #20; 
// 01 > 10 -> output 0
a = 2'b01; b = 2'b10; #20; 
// 01 > 01 -> output 0
a = 2'b01; b = 2'b01; #20; 
// 01 > 00 -> output 1
a = 2'b01; b = 2'b00; #20; 
$display("------+-------+--------");
// 00 > 11 -> output 0
a = 2'b00; b = 2'b11; #20; 
// 00 > 10 -> output 0
a = 2'b00; b = 2'b10; #20; 
// 00 > 01 -> output 0
a = 2'b00; b = 2'b01; #20; 
// 00 > 00 -> output 0
a = 2'b00; b = 2'b00; #20; 
end

endmodule