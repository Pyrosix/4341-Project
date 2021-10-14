module MUX_16_1_V2( out, a0, a1, a2, a3, a4, a5, a6,  a7, a8, a9, a10, a11, a12, a13, a14, a15, s);

input a0, a1, a2, a3, a4, a5, a6,  a7, a8, a9, a10, a11, a12, a13, a14, a15;
input [3:0] s;
output out;

wire s0n, s1n, s2n, s3n; //s0 not, s1 not, s2 not, s3 not
wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;

not n0(s0n, s[0]);
not n1(s1n, s[1]);
not n2(s2n, s[2]);
not n3(s3n, s[3]);

and and1(w0, a0, s0n, s1n, s2n, s3n);
and and2(w1, a1, s0n, s1n, s2n, s[3]);
and and3(w2, a2, s0n, s1n, s[2], s3n);
and and4(w3, a3, s0n, s1n, s[2], s[3]);
and and5(w4, a4, s0n, s[1], s2n, s3n);
and and6(w5, a5, s0n, s[1], s2n, s[3]);
and and7(w6, a6, s0n, s[1], s[2], s3n);
and and8(w7, a7, s0n, s[1], s[2], s[3]);
and and9(w8, a8, s[0], s1n, s2n, s3n);
and and10(w9, a9, s[0], s1n, s2n, s[3]);
and and11(w10, a10, s[0], s1n, s[2], s3n);
and and12(w11, a11, s[0], s1n, s[2], s[3]);
and and13(w12, a12, s[0], s[1], s2n, s3n);
and and14(w13, a13, s[0], s[1], s2n, s[3]);
and and15(w14, a14, s[0], s[1], s[2], s3n);
and and16(w15, a15, s[0], s[1], s[2], s[3]);

or or1(out, w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15);

endmodule
