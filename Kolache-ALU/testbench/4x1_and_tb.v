`timescale 1ns/1ns
`include "../32x1_and.v"

module and_4x1_tb;
reg [1:0] a, b;
wire y;

and_4x1 test(.a(a), .b(b), .y(y));
initial begin
$dumpfile("and_4x1.vcd");
$dumpvars(0, and_4x1_tb);
$display("a    | b     |  y");
$display("-----+-------+-----");
$monitor("a = %b b = %b y = %b", a, b, y); 
// <# of bits>'b<binary value>
a = 2'b11; b = 2'b11; #20;  // case: both input's == 1 
a = 2'b00; b = 2'b00; #20;  // case: both input's == 0
a = 2'b10; b = 2'b10; #20;  //case: other
a = 2'b01; b = 2'b01; #20;  //case: other
end

endmodule