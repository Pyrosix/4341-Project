`include "32x1_or.v"
//************************************
// General idea: 
// - given two 32-bit inputs: [31:0] a,b 
// - for each index i within {31,0}
//       a[i] > b[i] -> return 1  
//       otherwise  return 0
// - Consider LSB : a[0] > b[0] 
//   compare (a[0]> b[0]) > b[1]
//   compare (a[0] > b[0]) & a[1]
// - The reason behind this is to check the preceeding bits a[1] and b[1]
//   with the result of the LSB (a[0] > b[0]) 
//   since there exist an ambigous case with 2-bits 
//  (a[1] > b[1])| (a[0] > b[0]) | result
//  -------------+------------------------
//    1          |    1          |   1
// --------------+---------------+--------
//    1          |    0          |   1
// --------------+---------------+--------
//    0          |    1          |   Ambigous  consider  01 > 10, where a[0] > b[0]
// --------------+---------------+--------
//    0          |    0          |
//************************************

//*******************************
// 1 bit Greater Than Module
//******************************
module GT (
input a, b,
output Output 
);
// interface
and G0 (Output, a, ~b); 

endmodule


//************************************
// 32_bit greater_than component
//************************************
module Greater_than (
input [31:0] a, b,
output Output 
);
wire [33:0] w; // 2 additional wires needed to check for LSB
wire s; // additional wire needed for interface
// instantiation of GT module : (a,b, Output)
// for n-bit  greater than -> n+1 GT components are needed
GT m1 (.a(a[31]), .b(b[31]),.Output(w[33])); // a[31] > b[31] -> w[33] : MSB
GT m2 (.a(a[30]), .b(b[30]), .Output(w[32])); // a[30] > b[30] -> w[32]
GT m3 (.a(a[29]), .b(b[29]), .Output(w[31])); // a[29] > b[29] -> w[31]
GT m4 (.a(a[28]), .b(b[28]), .Output(w[30])); // a[28] > b[28] -> w[30]

GT m5 (.a(a[27]), .b(b[27]), .Output(w[29])); // a[27] > b[27] -> w[29]
GT m6 (.a(a[26]), .b(b[26]), .Output(w[28])); // a[26] > b[26] -> w[28]
GT m7 (.a(a[25]), .b(b[25]), .Output(w[27])); // a[25] > b[25] -> w[27]
GT m8 (.a(a[24]), .b(b[24]), .Output(w[26])); // a[24] > b[24] -> w[26]

GT m9 (.a(a[23]), .b(b[23]), .Output(w[25])); // a[23] > b[23] -> w[25]
GT m10 (.a(a[22]), .b(b[22]), .Output(w[24])); // a[22] > b[22] -> w[24]
GT m11 (.a(a[21]), .b(b[21]), .Output(w[23])); // a[21] > b[21] -> w[23]
GT m12 (.a(a[20]), .b(b[20]), .Output(w[22])); // a[20] > b[20] -> w[22]

GT m13 (.a(a[19]), .b(b[19]), .Output(w[21])); // a[19] > b[19] -> w[21]
GT m14 (.a(a[18]), .b(b[18]), .Output(w[20])); // a[18] > b[18] -> w[20]
GT m15 (.a(a[17]), .b(b[17]), .Output(w[19])); // a[17] > b[17] -> w[19]
GT m16 (.a(a[16]), .b(b[16]), .Output(w[18])); // a[16] > b[16] -> w[18]

GT m17 (.a(a[15]), .b(b[15]), .Output(w[17])); // a[15] > b[15] -> w[17]
GT m18 (.a(a[14]), .b(b[14]), .Output(w[16])); // a[14] > b[14] -> w[16]
GT m19 (.a(a[13]), .b(b[13]), .Output(w[15])); // a[13] > b[13] -> w[15]
GT m20 (.a(a[12]), .b(b[12]), .Output(w[14])); // a[12] > b[12] -> w[14]

GT m21 (.a(a[11]), .b(b[11]), .Output(w[13])); // a[11] > b[11] -> w[13]
GT m22 (.a(a[10]), .b(b[10]), .Output(w[12])); // a[10] > b[10] -> w[12]
GT m23 (.a(a[9]), .b(b[9]), .Output(w[11])); // a[9] > b[9] -> w[11]
GT m24 (.a(a[8]), .b(b[8]), .Output(w[10])); // a[8] > b[8] -> w[10]

GT m25 (.a(a[7]), .b(b[7]), .Output(w[9])); // a[7] > b[7] -> w[9]
GT m26 (.a(a[6]), .b(b[6]), .Output(w[8])); // a[6] > b[6] -> w[8]
GT m27 (.a(a[5]), .b(b[5]), .Output(w[7])); // a[5] > b[5] -> w[7]
GT m28 (.a(a[4]), .b(b[4]), .Output(w[6])); // a[4] > b[4] -> w[6]

GT m29 (.a(a[3]), .b(b[3]), .Output(w[5])); // a[3] > b[3] -> w[5]
GT m30 (.a(a[2]), .b(b[2]), .Output(w[4])); // a[2] > b[2] -> w[4]
GT m31 (.a(a[1]), .b(b[1]), .Output(w[3])); // a[1] > b[1] -> w[3]
GT m32 (.a(a[0]), .b(b[0]), .Output(w[0])); // a[0] > b[0] -> w[0] : LSB

GT m33 (.a(w[0]), .b(b[1]), .Output(w[1])); // w[0] > ~b[1] -> w[1] : consider LSB
and m34 (w[2],w[0],a[1]); // w[3] & a[1] -> w[2]

// interface : w[33] | ... | w[3] | w[1] | w[0]
or_32x1 or_1(.a(w[33:18]), .b(w[17:2]), .y(s)); //(input [1:0] a , b,  output y)
or(Output, s, w[1]);  

endmodule

//************************************
// 2_bit greater_than component
//************************************
module GT_2x1 (
input [1:0] a, b,
output Output 
);
wire [3:0] w;
wire s;
// instantiation of GT module : (a,b, Output)
// for n-bit  greater than -> n+1 GT components are needed
GT m1 (.a(a[1]), .b(b[1]),.Output(w[3])); // a[1] > b[1] -> w[3]
GT m2 (.a(a[0]), .b(b[0]), .Output(w[2])); // a[0] > b[0] -> w[2]
GT m3 (.a(w[2]), .b(b[1]), .Output(w[1])); // w[2] > ~b[1] -> w[1]
and m4 (w[0],w[2],a[1]); // w[3] & a[1] -> w[0]
// interface : (w[3] | w[1]) | w[0]
or(s, w[3], w[1]);
or(Output, s, w[0]);
//or_4x1 or_1(.a(w[1:0]), .b(w[3]), .y(Output)); //(input [1:0] a , b,  output y)

endmodule


//************************************
// 4_bit greater_than component
//************************************
module GT_4x1 (
input [3:0] a, b,
output Output 
);
wire [5:0] w;
wire s;
// instantiation of GT module : (a,b, Output)
// for n-bit  greater than -> n+1 GT components are needed
GT m1 (.a(a[3]), .b(b[3]),.Output(w[5])); // a[3] > b[3] -> w[5]
GT m2 (.a(a[2]), .b(b[2]), .Output(w[4])); // a[2] > b[2] -> w[4]
GT m3 (.a(a[1]), .b(b[1]), .Output(w[3])); // a[1] > b[1] -> w[3]
GT m4 (.a(a[0]), .b(b[0]), .Output(w[2])); // a[0] > b[0] -> w[2]
GT m5 (.a(w[2]), .b(b[1]), .Output(w[1])); // w[2] > ~b[1] -> w[1]
and m6 (w[0],w[2],a[1]); // w[3] & a[1] -> w[0]

// interface : w[5]| (w[4] | w[3] | w[1]| w[0])
or_4x1 or_1(.a(w[4:3]), .b(w[1:0]), .y(s)); //(input [1:0] a , b,  output y)
or(Output, s, w[5]);

endmodule
