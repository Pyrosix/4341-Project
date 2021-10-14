`timescale 1ns/1ns
`include "../32_bit_greater_than.v"

module greater_than_testbench;
reg  a, b;
wire Output;
GT_32b pass (.a(a), .b(b), .Output(Output));

initial begin
$monitor("a = %b b = %b  Output = %b " ,a, b, Output); 
// 1 > 0 -> output 1
a = 1'b1; b = 1'b0; #20; 
// 1 > 1 -> output 0  
 a = 1'b1; b = 1'b1; #20;
// 0 > 1 -> output 0
a = 1'b0; b = 1'b1; #20;  
// 0 > 0 -> output 0
a = 1'b0; b = 1'b0; #20;  
end

endmodule
