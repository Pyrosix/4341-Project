`timescale 1ns/1ns
`include "../mux_16x1.v"
// *********************************
//  NOT COMPLETE
//*********************************
module MUX_tb;
reg  a, b;
wire Output;
 umux (.a(a), .b(b), .Output(Output));

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