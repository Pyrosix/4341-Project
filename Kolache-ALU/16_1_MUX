module mux32_4x1(output out, input i0, input i1, input i2, input i3, input i4, input i5, input i6, input i7, input i8, input i9, input i10, input i11, input i12, 
					input i13, input i14, input i15, input s0, input s1, input s2, input s3);

wire s0n, s1n, s2n, s3n; //s0 not, s1 not, s2 not, s3 not
wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;

not n0(s0n, s0);
not n1(s1n, s1);
not n2(s2n, s2);
not n3(s3n, s3);

and and1(w0, i0, s0n, s1n, s2n, s3n);
and and2(w1, i1, s0n, s1n, s2n, s3);
and and3(w2, i2, s0n, s1n, s2, s3n);
and and4(w3, i3, s0n, s1n, s2, s3);
and and5(w4, i4, s0n, s1, s2n, s3n);
and and6(w5, i5, s0n, s1, s2n, s3);
and and7(w6, i6, s0n, s1, s2, s3n);
and and8(w7, i7, s0n, s1, s2, s3);
and and9(w8, i8, s0, s1n, s2n, s3n);
and and10(w9, i9, s0, s1n, s2n, s3);
and and11(w10, i10, s0, s1n, s2, s3n);
and and12(w11, i11, s0, s1n, s2, s3);
and and13(w12, i12, s0, s1, s2n, s3n);
and and14(w13, i13, s0, s1, s2n, s3);
and and15(w14, i14, s0, s1, s2, s3n);
and and16(w15, i15, s0, s1, s2, s3);

or or1(out, w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15);

endmodule
