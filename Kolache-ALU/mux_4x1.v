module mux_4x1(out, a, s);

input [3:0] a;
input [1:0] s;
output out;

wire [1:0] temp;

mux_2x1 mux1(temp[0], a[1:0], s[0]),
        mux2(temp[1], a[3:2], s[0]),
        mux3(out, temp, s[1]);

endmodule