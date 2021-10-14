`include "32x1_and.v"
module EQ (
input a, b,
output y
);
wire n;
xor(n,a,b);
not(y,n);

endmodule

// input: [31:0] a , b[31:0]
module equal (
    input [31:0] a, b, output y
);
wire [31:0] s;

// instatiate 32 EQ components
EQ m1(.a(a[0]), .b(b[0]),.y(s[0]));
EQ m2(.a(a[1]), .b(b[1]),.y(s[1]));
EQ m3(.a(a[2]), .b(b[2]),.y(s[2]));
EQ m4(.a(a[3]), .b(b[3]),.y(s[3]));

EQ m5(.a(a[4]), .b(b[4]),.y(s[4]));
EQ m6(.a(a[5]), .b(b[5]),.y(s[5]));
EQ m7(.a(a[6]), .b(b[6]),.y(s[6]));
EQ m8(.a(a[7]), .b(b[7]),.y(s[7]));

EQ m9(.a(a[8]), .b(b[8]),.y(s[8]));
EQ m10(.a(a[9]), .b(b[9]),.y(s[9]));
EQ m11(.a(a[10]), .b(b[10]),.y(s[10]));
EQ m12(.a(a[11]), .b(b[11]),.y(s[11]));

EQ m13(.a(a[12]), .b(b[12]),.y(s[12]));
EQ m14(.a(a[13]), .b(b[13]),.y(s[13]));
EQ m15(.a(a[14]), .b(b[14]),.y(s[14]));
EQ m16(.a(a[15]), .b(b[15]),.y(s[15]));

EQ m17(.a(a[16]), .b(b[16]),.y(s[16]));
EQ m18(.a(a[17]), .b(b[17]),.y(s[17]));
EQ m19(.a(a[18]), .b(b[18]),.y(s[18]));
EQ m20(.a(a[19]), .b(b[19]),.y(s[19]));

EQ m21(.a(a[20]), .b(b[20]),.y(s[20]));
EQ m22(.a(a[21]), .b(b[21]),.y(s[21]));
EQ m23(.a(a[22]), .b(b[22]),.y(s[22]));
EQ m24(.a(a[23]), .b(b[23]),.y(s[23]));

EQ m25(.a(a[24]), .b(b[24]),.y(s[24]));
EQ m26(.a(a[25]), .b(b[25]),.y(s[25]));
EQ m27(.a(a[26]), .b(b[26]),.y(s[26]));
EQ m28(.a(a[27]), .b(b[27]),.y(s[27]));

EQ m29(.a(a[28]), .b(b[28]),.y(s[28]));
EQ m30(.a(a[29]), .b(b[29]),.y(s[29]));
EQ m31(.a(a[30]), .b(b[30]),.y(s[30]));
EQ m32(.a(a[31]), .b(b[31]),.y(s[31]));

// Interface: connect all 32 EQ components to 32x1 AND_gate
and_32x1 uut(.a(s[31:16]), .b(s[15:0]), .y(y));

endmodule 
