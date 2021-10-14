`timescale 1ns/1ns
`include "../32_bit_adder_subtractor.v"

module adder_subtractor_testbench;
reg [31:0] a, b;
reg M;
wire [31:0] sum;
wire c_out;
integer i,j;
Adder_subtractor dut (.a(a), .b(b), .M(M), .c_out(c_out), .sum(sum));
initial begin
$monitor("a = %b b = %b M = %b c_out = %b sum = %b", a, b, M, c_out, sum); 
M = 1'b0;  // ADDER
for (i = 5; i < 8 ; i = i + 1) begin // start from a = 5 
    for (j = 6; j < 9 ; j = j + 1) begin // start from b = 6
        a = i; b = j; #20;
    end
end
M = 1'b1; // SUBTRACTOR
for (i = 6; i < 8 ; i = i + 1) begin
    for (j = 0; j < 5 ; j = j + 1) begin
        a = i; b = j; #20;
    end
end
end
endmodule
