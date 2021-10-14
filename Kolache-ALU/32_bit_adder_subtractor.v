module HA (
input a, b,
output c_out, sum
);

xor G1 (sum, a, b);
and G2 (c_out, a, b); 

endmodule

module FA (
input a, b, c_in,
output c_out, sum
);

wire w1, w2, w3, w4;

HA M1 (a, b, w1, w2);  // instance 1  (input a, input b, c_out, sum)
HA M2 (w2, c_in, w3, sum); // instance 2 
or O1 (c_out, w1, w3);

endmodule

module Adder_subtractor (
input [31:0] a, b, // A and B input
input M, // mode input
output [31:0] sum,
output c_out
);

wire [31:0] x;
wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15,
 c16,c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31;

xor G0 (x[0], b[0], M); // output , A, B
xor G1 (x[1], b[1], M);
xor G2 (x[2], b[2], M);
xor G3 (x[3], b[3], M);
xor G4 (x[4], b[4], M);
xor G5 (x[5], b[5], M);
xor G6 (x[6], b[6], M);
xor G7 (x[7], b[7], M);
xor G8 (x[8], b[8], M);
xor G9 (x[9], b[9], M);
xor G10 (x[10], b[10], M);
xor G11 (x[11], b[11], M);
xor G12 (x[12], b[12], M);
xor G13 (x[13], b[13], M);
xor G14 (x[14], b[14], M);
xor G15 (x[15], b[15], M);
xor G16 (x[16], b[16], M);

xor G17 (x[17], b[17], M);
xor G18 (x[18], b[18], M);
xor G19 (x[19], b[19], M);
xor G20 (x[20], b[20], M);
xor G21 (x[21], b[21], M);
xor G22 (x[22], b[22], M);
xor G23 (x[23], b[23], M);
xor G24 (x[24], b[24], M);
xor G25 (x[25], b[25], M);
xor G26 (x[26], b[26], M);
xor G27 (x[27], b[27], M);
xor G28 (x[28], b[28], M);
xor G29 (x[29], b[29], M);
xor G30 (x[30], b[30], M);
xor G31 (x[31], b[31], M);

FA m0 (.a(a[0]), .b(x[0]), .c_in(M), .sum(sum[0]), .c_out(c1));
FA m1 (.a(a[1]), .b(x[1]), .c_in(c1), .sum(sum[1]), .c_out(c2));
FA m2 (.a(a[2]), .b(x[2]), .c_in(c2), .sum(sum[2]), .c_out(c3));
FA m3 (.a(a[3]), .b(x[3]), .c_in(c3), .sum(sum[3]), .c_out(c4));
FA m4 (.a(a[4]), .b(x[4]), .c_in(c4), .sum(sum[4]), .c_out(c5));
FA m5 (.a(a[5]), .b(x[5]), .c_in(c5), .sum(sum[5]), .c_out(c6));
FA m6 (.a(a[6]), .b(x[6]), .c_in(c6), .sum(sum[6]), .c_out(c7));
FA m7 (.a(a[7]), .b(x[7]), .c_in(c7), .sum(sum[7]), .c_out(c8));
FA m8 (.a(a[8]), .b(x[8]), .c_in(c8), .sum(sum[8]), .c_out(c9));
FA m9 (.a(a[9]), .b(x[9]), .c_in(c9), .sum(sum[9]), .c_out(c10));
FA m10 (.a(a[10]), .b(x[10]), .c_in(c10), .sum(sum[10]), .c_out(c11));
FA m11 (.a(a[11]), .b(x[11]), .c_in(c11), .sum(sum[11]), .c_out(c12));
FA m12 (.a(a[12]), .b(x[12]), .c_in(c12), .sum(sum[12]), .c_out(c13));
FA m13 (.a(a[13]), .b(x[13]), .c_in(c13), .sum(sum[13]), .c_out(c14));
FA m14 (.a(a[14]), .b(x[14]), .c_in(c14), .sum(sum[14]), .c_out(c15));
FA m15 (.a(a[15]), .b(x[15]), .c_in(c15), .sum(sum[15]), .c_out(c16));

FA m16 (.a(a[16]), .b(x[16]), .c_in(c16), .sum(sum[16]), .c_out(c17));
FA m17 (.a(a[17]), .b(x[17]), .c_in(c17), .sum(sum[17]), .c_out(c18));
FA m18 (.a(a[18]), .b(x[18]), .c_in(c18), .sum(sum[18]), .c_out(c19));
FA m19 (.a(a[19]), .b(x[19]), .c_in(c19), .sum(sum[19]), .c_out(c20));
FA m20 (.a(a[20]), .b(x[20]), .c_in(c20), .sum(sum[20]), .c_out(c21));
FA m21 (.a(a[21]), .b(x[21]), .c_in(c21), .sum(sum[21]), .c_out(c22));
FA m22 (.a(a[22]), .b(x[22]), .c_in(c22), .sum(sum[22]), .c_out(c23));
FA m23 (.a(a[23]), .b(x[23]), .c_in(c23), .sum(sum[23]), .c_out(c24));
FA m24 (.a(a[24]), .b(x[24]), .c_in(c24), .sum(sum[24]), .c_out(c25));
FA m25 (.a(a[25]), .b(x[25]), .c_in(c25), .sum(sum[25]), .c_out(c26));
FA m26 (.a(a[26]), .b(x[26]), .c_in(c26), .sum(sum[26]), .c_out(c27));
FA m27 (.a(a[27]), .b(x[27]), .c_in(c27), .sum(sum[27]), .c_out(c28));
FA m28 (.a(a[28]), .b(x[28]), .c_in(c28), .sum(sum[28]), .c_out(c29));
FA m29 (.a(a[29]), .b(x[29]), .c_in(c29), .sum(sum[29]), .c_out(c30));
FA m30 (.a(a[30]), .b(x[30]), .c_in(c30), .sum(sum[30]), .c_out(c31));
FA m31 (.a(a[31]), .b(x[31]), .c_in(c31), .sum(sum[31]), .c_out(c_out));

endmodule
