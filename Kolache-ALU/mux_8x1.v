module mux_8x1(out, a, s);

input [7:0] a;
input [2:0] s;
output out;

wire [1:0] temp;

mux_4x1 mux4(temp[0], a[3:0], s[1:0]),
        mux5(temp[1], a[7:4], s[1:0]);
        
mux_2x1 mux6(out, temp, s[2]);

endmodule