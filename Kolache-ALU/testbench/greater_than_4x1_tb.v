`timescale 1ns/1ns
`include "../32_bit_greater_than.v"

//************************************
// Test 4-bit greater than module
//************************************
module greater_than_4x1_tb;
reg  [3:0] a, b;
wire Output;
GT_4x1 gt_4b (.a(a), .b(b), .Output(Output));

initial begin
$dumpfile("gt_4x1.vcd");
$dumpvars(0, greater_than_4x1_tb);
$display("a     | b     | y");
$display("--------+--------+--------");
$monitor("a = %b b = %b  Output = %b " ,a, b, Output); 
// 11 > 11 -> output 0
a = 4'b1111; b = 4'b1111; #20; 
// 11 > 10 -> output 1 
 a = 4'b1111; b = 4'b1110; #20;
// 11 > 01 -> output 1
a = 4'b1111; b = 4'b1100; #20;  
// 11 > 00 -> output 1
a = 4'b1111; b = 4'b1000; #20;
$display("--------+--------+--------");
// 10 > 11 -> output 0
a = 4'b1110; b = 4'b1111; #20; 
// 10 > 10 -> output 0
a = 4'b1110; b = 4'b1110; #20;
// 10 > 01 -> output 1
a = 4'b1110; b = 4'b1100; #20;
// 10 > 00 -> output 1
a = 4'b1110; b = 4'b1000; #20;
$display("--------+--------+--------");
// 10 > 11 -> output 0
a = 4'b1110; b = 4'b0111; #20; 
// 10 > 10 -> output 0
a = 4'b1110; b = 4'b0110; #20;
// 10 > 01 -> output 1
a = 4'b1110; b = 4'b0100; #20;
// 10 > 00 -> output 1
a = 4'b1110; b = 4'b0001; #20;
$display("--------+--------+--------");
// 01 > 11 -> output 0
a = 4'b1000; b = 4'b1111; #20; 
// 01 > 10 -> output 0
a = 4'b1000; b = 4'b1110; #20; 
// 01 > 01 -> output 0
a = 4'b1000; b = 4'b1100; #20; 
// 01 > 00 -> output 1
a = 4'b1000; b = 4'b1000; #20; 
$display("--------+--------+--------");
// 0000 > 11 -> output 0
a = 4'b0000; b = 4'b1111; #20; 
// 0000 > 10 -> output 0
a = 4'b0000; b = 4'b1101; #20; 
// 0000 > 01 -> output 0
a = 4'b0000; b = 4'b1011; #20; 
// 0000 > 00 -> output 0
a = 4'b0000; b = 4'b0000; #20; 
end

endmodule