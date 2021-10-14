//************************************
// General idea: 
// given two 32-bit inputs [31:0] a,b 
// and a 32-bit output y
// for each index i in {31,0}
// a[i] AND b[i] -> y[i]
//************************************

module AND_32b(
	input [31:0] a,b,
	output [31:0] s
);
wire [31:0] s;
// interface : (s, a , b)
and g31 (s[31], a[31], b[31]);
and g30 (s[30], a[30], b[30]);
and g29 (s[29], a[29], b[29]);
and g28 (s[28], a[28], b[28]);

and g27 (s[27], a[27], b[27]);
and g26 (s[26], a[26], b[26]);
and g25 (s[25], a[25], b[25]);
and g24 (s[24], a[24], b[24]);

and g23 (s[23], a[23], b[23]);
and g22 (s[22], a[22], b[22]);
and g21 (s[21], a[21], b[21]);
and g20 (s[20], a[20], b[20]);

and g19 (s[19], a[19], b[19]);
and g18 (s[18], a[18], b[18]);
and g17 (s[17], a[17], b[17]);
and g16 (s[16], a[16], b[16]);

and g15 (s[15], a[15], b[15]);
and g14 (s[14], a[14], b[14]);
and g13 (s[13], a[13], b[13]);
and g12 (s[12], a[12], b[12]);

and g11 (s[11], a[11], b[11]);
and g10 (s[10], a[10], b[10]);
and g9 (s[9], a[9], b[9]);
and g8 (s[8], a[8], b[8]);

and g7 (s[7], a[7], b[7]);
and g6 (s[6], a[6], b[6]);
and g5 (s[5], a[5], b[5]);
and g4 (s[4], a[4], b[4]);

and g3 (s[3], a[3], b[3]);
and g2 (s[2], a[2], b[2]);
and g1 (s[1], a[1], b[1]);
and g0 (s[0], a[0], b[0]);

endmodule