//*********************
// 32 input OR gate
//*********************
module or_32x1(
	input [15:0] a , b,
	output y
);
wire [1:0] s;
// instances 
or_16x1 u1(.a(a[15:8]),.b(b[15:8]), .y(s[1]));
or_16x1 u2(.a(a[7:0]),.b(b[7:0]), .y(s[0]));
// interface: (x2) 16x1_or -> 32x1_or
or(y,s[1],s[0]);
endmodule

//*********************
// 16 input OR gate
//*********************
module or_16x1(
	input [7:0] a , b,
	output y
);
wire [1:0] s;
// instace  
or_8x1 u1(.a(a[7:4]),.b(b[7:4]), .y(s[1]));
or_8x1 u2(.a(a[3:0]),.b(b[3:0]), .y(s[0]));
// interface: 4x1_or -> 8x1_and
or(y,s[1],s[0]);
endmodule	

//*********************
// 8 input OR gate
//*********************
module or_8x1(
	input [3:0] a , b,
	output y
);
wire [1:0] s; 
// instantiations
or_4x1 or1(.a(a[3:2]), .b(b[3:2]), .y(s[1]));
or_4x1 or2(.a(a[1:0]), .b(b[1:0]), .y(s[0]));
// interface 
or(y,s[1],s[0]);
endmodule

//*********************
// 4 input OR gate
//*********************
module or_4x1(
	input [1:0] a , b,
	output y
);
wire [1:0] s; 
// interface 
or(s[1],a[1],b[1]);
or(s[0],a[0],b[0]);
or(y,s[1],s[0]);
endmodule