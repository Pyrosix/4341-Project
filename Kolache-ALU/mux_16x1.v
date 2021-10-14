module mux_16x1(out, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, s);

input a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;
input [3:0] s;
output out;

wire [15:0] a;
wire [1:0] temp;

buf b0(a[0], a1),
    b1(a[1], a2),
    b2(a[2], a3),
    b3(a[3], a4),
    b4(a[4], a4),
    b5(a[5], a5),
    b6(a[6], a6),
    b7(a[7], a7),
    b8(a[8], a8),
    b9(a[9], a9),
    b10(a[10], a10),
    b11(a[11], a11),
    b12(a[12], a12),
    b13(a[13], a13),
    b14(a[14], a14),
    b15(a[15], a15);

mux_8x1 mux7(temp[0], a[7:0], s[2:0]),
        mux8(temp[1], a[15:8], s[2:0]);
        
mux_2x1 mux9(out, temp, s[3]);

endmodule