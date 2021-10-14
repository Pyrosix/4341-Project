`include "32x1_or.v"
//*******************************
// 32 bit Less Than Module
//******************************
module LT_32B (
input [31:0] a, b,
output Output 
);
wire [33:0] w; // 2 additional wires needed to check for LSB
wire s; // additional wire needed for interface
// instantiation of LT module : (a,b, Output)
// for n-bit  greater than -> n+1 LT components are needed
LT m1 (.a(a[31]), .b(b[31]),.Output(w[33])); // a[31] < b[31] -> w[33] : MSB
LT m2 (.a(a[30]), .b(b[30]), .Output(w[32])); // a[30] < b[30] -> w[32]
LT m3 (.a(a[29]), .b(b[29]), .Output(w[31])); // a[29] < b[29] -> w[31]
LT m4 (.a(a[28]), .b(b[28]), .Output(w[30])); // a[28] < b[28] -> w[30]

LT m5 (.a(a[27]), .b(b[27]), .Output(w[29])); // a[27] < b[27] -> w[29]
LT m6 (.a(a[26]), .b(b[26]), .Output(w[28])); // a[26] < b[26] -> w[28]
LT m7 (.a(a[25]), .b(b[25]), .Output(w[27])); // a[25] < b[25] -> w[27]
LT m8 (.a(a[24]), .b(b[24]), .Output(w[26])); // a[24] < b[24] -> w[26]

LT m9 (.a(a[23]), .b(b[23]), .Output(w[25])); // a[23] < b[23] -> w[25]
LT m10 (.a(a[22]), .b(b[22]), .Output(w[24])); // a[22] < b[22] -> w[24]
LT m11 (.a(a[21]), .b(b[21]), .Output(w[23])); // a[21] < b[21] -> w[23]
LT m12 (.a(a[20]), .b(b[20]), .Output(w[22])); // a[20] < b[20] -> w[22]

LT m13 (.a(a[19]), .b(b[19]), .Output(w[21])); // a[19] < b[19] -> w[21]
LT m14 (.a(a[18]), .b(b[18]), .Output(w[20])); // a[18] < b[18] -> w[20]
LT m15 (.a(a[17]), .b(b[17]), .Output(w[19])); // a[17] < b[17] -> w[19]
LT m16 (.a(a[16]), .b(b[16]), .Output(w[18])); // a[16] < b[16] -> w[18]

LT m17 (.a(a[15]), .b(b[15]), .Output(w[17])); // a[15] < b[15] -> w[17]
LT m18 (.a(a[14]), .b(b[14]), .Output(w[16])); // a[14] < b[14] -> w[16]
LT m19 (.a(a[13]), .b(b[13]), .Output(w[15])); // a[13] < b[13] -> w[15]
LT m20 (.a(a[12]), .b(b[12]), .Output(w[14])); // a[12] < b[12] -> w[14]

LT m21 (.a(a[11]), .b(b[11]), .Output(w[13])); // a[11] < b[11] -> w[13]
LT m22 (.a(a[10]), .b(b[10]), .Output(w[12])); // a[10] < b[10] -> w[12]
LT m23 (.a(a[9]), .b(b[9]), .Output(w[11])); // a[9] < b[9] -> w[11]
LT m24 (.a(a[8]), .b(b[8]), .Output(w[10])); // a[8] < b[8] -> w[10]

LT m25 (.a(a[7]), .b(b[7]), .Output(w[9])); // a[7] < b[7] -> w[9]
LT m26 (.a(a[6]), .b(b[6]), .Output(w[8])); // a[6] < b[6] -> w[8]
LT m27 (.a(a[5]), .b(b[5]), .Output(w[7])); // a[5] < b[5] -> w[7]
LT m28 (.a(a[4]), .b(b[4]), .Output(w[6])); // a[4] < b[4] -> w[6]

LT m29 (.a(a[3]), .b(b[3]), .Output(w[5])); // a[3] < b[3] -> w[5]
LT m30 (.a(a[2]), .b(b[2]), .Output(w[4])); // a[2] < b[2] -> w[4]
LT m31 (.a(a[1]), .b(b[1]), .Output(w[3])); // a[1] < b[1]
LT m32 (.a(a[0]), .b(b[0]), .Output(w[2])); // a[0] < b[0]

LT m33 (.a(a[1]), .b(w[2]), .Output(w[1])); // (w[0] < ~b[1]) -> w[1] : consider LSB
and m34 (w[0], w[2],b[1]);
// interface
or m35 (s ,w[3], w[1]); 
or m36 (Output ,s, w[0]);

endmodule


//*******************************
// 1 bit Less Than Module
//******************************
module LT (
input a, b,
output Output 
);
// interface
and G0 (Output, ~a, b); 

endmodule

//*******************************
// 2 bit Less Than Module
//******************************
module LT_2b (
input [1:0] a, b,
output Output 
);
// instance 
wire [3:0] w; // 2 additional wires needed to check for LSB
wire s;
LT m1 (.a(a[1]), .b(b[1]), .Output(w[3])); // a[1] < b[1]
LT m2 (.a(a[0]), .b(b[0]), .Output(w[2])); // a[0] < b[0]
LT m3 (.a(a[1]), .b(w[2]), .Output(w[1])); // a[1] < w[2]
and m4 (w[0], w[2],b[1]);
// interface
or m5 (s ,w[3], w[1]); 
or m6 (Output ,s, w[0]); 

endmodule