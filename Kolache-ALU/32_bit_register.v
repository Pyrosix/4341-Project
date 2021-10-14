module acc(input clk,input reset, input [31:0] a, output reg [31:0] Q);

always @(posedge clk)
    if (reset)
        Q = 0;
    else
        Q <= a;

endmodule
