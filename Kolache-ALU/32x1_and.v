// input: a[15:0], b[15:0]
// output: y as 1-bit binary
module and_32x1(
	input [15:0] a , b,
	output y
);
wire [1:0] s;
// instace of and_8x1 
and_16x1 u1(.a(a[15:8]),.b(b[15:8]), .y(s[1]));
and_16x1 u2(.a(a[7:0]),.b(b[7:0]), .y(s[0]));
// interface: 16x1_and -> 32x1_and
and(y,s[1],s[0]);
endmodule

// input: a[7:0], b[7:0]
// output: y as 1-bit binary
module and_16x1(
	input [7:0] a , b,
	output y
);
wire [1:0] s;
// instace of and_8x1 
and_8x1 u1(.a(a[7:4]),.b(b[7:4]), .y(s[1]));
and_8x1 u2(.a(a[3:0]),.b(b[3:0]), .y(s[0]));
// interface: 4x1_and -> 8x1_and
and(y,s[1],s[0]);
endmodule	


// input: a[3:0], b[3:0] 
// output: y as 1-bit binary
module and_8x1(
	input [3:0] a , b,
	output y
);
wire [1:0] s; 
// instace of and_4x1 
and_4x1 u1(.a(a[3:2]),.b(b[3:2]), .y(s[1]));
and_4x1 u2(.a(a[1:0]),.b(b[1:0]), .y(s[0]));
// interface: 4x1_and -> 8x1_and
and(y,s[1],s[0]);
endmodule	

// input: a[1:0], b[1:0]
// output: y as 1-bit binary
module and_4x1(
	input [1:0] a , b,
	output y
);
wire [1:0] s; 
// interface 
and(s[1],a[1],b[1]);
and(s[0],a[0],b[0]);
and(y,s[1],s[0]);
endmodule	