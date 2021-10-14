/*
   Team: Kolache
   Software: iverilog
   Source: http://iverilog.icarus.com/
 */
// CONSTANTS                    | decimal:
//====================================================================
`define NOOP			4'b0000 //0
`define RESET			4'b0001 //1
`define OR 		        4'b0011 //3
`define AND          	4'b0101 //5
`define ADD  			4'b0110 //6
`define SUB	 		    4'b1000 //8 
`define EQUAL           4'b1100 //12
`define GREATER_THAN    4'b1101 //13
`define LESS_THAN		4'b1110 //14
`define ERROR           4'b1111 //15
//====================================================================

`timescale 1ns/1ns
`include "16_1_MUX_V2.v"
`include "32_bit_and.v"
`include "32_bit_or.v"
`include "32_bit_greater_than.v"
`include "32_bit_equal.v"
`include "32_bit_adder_subtractor.v"
//`include "32_bit_less_than.v"
`include "32_bit_register.v"

// NOTE: zero means reset to zero
module alu_32_bit(result, reset ,clk ,a ,b ,opCode ,error);

output [31:0] result;
output zero,carry,error;
input [31:0] a;
input [31:0] b;
input [3:0] opCode;
input clk, reset;

wire [31:0] s0;
wire [31:0] s1;
wire [31:0] s2;
wire [31:0] s3;
wire [31:0] s4;
wire [31:0] s5;
wire [31:0] s6;
wire [31:0] s7;
wire [31:0] s8;
wire [31:0] s9;
wire [31:0] s10;
wire [31:0] s11;
wire s12;
wire s13;
wire s14;
wire [31:0] s15;

wire c_out; // OVERFLOW

acc op0(clock,reset,result,s0); 			//opcode 0000
acc op1(clock,reset,result,s1); 			//opcode 0001
OR_32b op3(a,b,s3); 						//opcode 0011
AND_32b op5(a,b,s5); 						//opcode 0101
Adder_subtractor op6(.a(a),.b(b),.M(opCode[3]),.sum(s6),.c_out(c_out)); //opcode 0110,   Where M=0 denotes the mode ADD
Adder_subtractor op8(.a(a),.b(b),.M(opCode[3]),.sum(s8),.c_out(c_out)); //opcode 1000    WHERE M=1 denotes the mode SUBTRACT
equal op12(a,b,s12); 						//opcode 1100
Greater_than op13(a,b,s13); 				//opcode 1101
//LT_32B op14(a,b,s14);						//opcode 1110

MUX_16_1_V2 mux1(result[0],s0[0],s1[0],s2[0],s3[0],s4[0],s5[0],s6[0],s7[0],s8[0],s9[0],s10[0],s11[0],s12,s13,s14,s15[0],opCode),
			mux2(result[1],s0[1],s1[1],s2[1],s3[1],s4[1],s5[1],s6[1],s7[1],s8[1],s9[1],s10[1],s11[1],s12,s13,s14,s15[1],opCode),
			mux3(result[2],s0[2],s1[2],s2[2],s3[2],s4[2],s5[2],s6[2],s7[2],s8[2],s9[2],s10[2],s11[2],s12,s13,s14,s15[2],opCode),
			mux4(result[3],s0[3],s1[3],s2[3],s3[3],s4[3],s5[3],s6[3],s7[3],s8[3],s9[3],s10[3],s11[3],s12,s13,s14,s15[3],opCode),
			mux5(result[4],s0[4],s1[4],s2[4],s3[4],s4[4],s5[4],s6[4],s7[4],s8[4],s9[4],s10[4],s11[4],s12,s13,s14,s15[4],opCode),
			mux6(result[5],s0[5],s1[5],s2[5],s3[5],s4[5],s5[5],s6[5],s7[5],s8[5],s9[5],s10[5],s11[5],s12,s13,s14,s15[5],opCode),
			mux7(result[6],s0[6],s1[6],s2[6],s3[6],s4[6],s5[6],s6[6],s7[6],s8[6],s9[6],s10[6],s11[6],s12,s13,s14,s15[6],opCode),
			mux8(result[7],s0[7],s1[7],s2[7],s3[7],s4[7],s5[7],s6[7],s7[7],s8[7],s9[7],s10[7],s11[7],s12,s13,s14,s15[7],opCode),
			mux9(result[8],s0[8],s1[8],s2[8],s3[8],s4[8],s5[8],s6[8],s7[8],s8[8],s9[8],s10[8],s11[8],s12,s13,s14,s15[8],opCode),
			mux10(result[9],s0[9],s1[9],s2[9],s3[9],s4[9],s5[9],s6[9],s7[9],s8[9],s9[9],s10[9],s11[9],s12,s13,s14,s15[9],opCode),
			mux11(result[10],s0[10],s1[10],s2[10],s3[10],s4[10],s5[10],s6[10],s7[10],s8[10],s9[10],s10[10],s11[10],s12,s13,s14,s15[10],opCode),
			mux12(result[11],s0[11],s1[11],s2[11],s3[11],s4[11],s5[11],s6[11],s7[11],s8[11],s9[11],s10[11],s11[11],s12,s13,s14,s15[11],opCode),
			mux13(result[12],s0[12],s1[12],s2[12],s3[12],s4[12],s5[12],s6[12],s7[12],s8[12],s9[12],s10[12],s11[12],s12,s13,s14,s15[12],opCode),
			mux14(result[13],s0[13],s1[13],s2[13],s3[13],s4[13],s5[13],s6[13],s7[13],s8[13],s9[13],s10[13],s11[13],s12,s13,s14,s15[13],opCode),
			mux15(result[14],s0[14],s1[14],s2[14],s3[14],s4[14],s5[14],s6[14],s7[14],s8[14],s9[14],s10[14],s11[14],s12,s13,s14,s15[14],opCode),
			mux16(result[15],s0[15],s1[15],s2[15],s3[15],s4[15],s5[15],s6[15],s7[15],s8[15],s9[15],s10[15],s11[15],s12,s13,s14,s15[15],opCode),
			mux17(result[16],s0[16],s1[16],s2[16],s3[16],s4[16],s5[16],s6[16],s7[16],s8[16],s9[16],s10[16],s11[16],s12,s13,s14,s15[16],opCode),
			mux18(result[17],s0[17],s1[17],s2[17],s3[17],s4[17],s5[17],s6[17],s7[17],s8[17],s9[17],s10[17],s11[17],s12,s13,s14,s15[17],opCode),
			mux19(result[18],s0[18],s1[18],s2[18],s3[18],s4[18],s5[18],s6[18],s7[18],s8[18],s9[18],s10[18],s11[18],s12,s13,s14,s15[18],opCode),
			mux20(result[19],s0[19],s1[19],s2[19],s3[19],s4[19],s5[19],s6[19],s7[19],s8[19],s9[19],s10[19],s11[19],s12,s13,s14,s15[19],opCode),
			mux21(result[20],s0[20],s1[20],s2[20],s3[20],s4[20],s5[20],s6[20],s7[20],s8[20],s9[20],s10[20],s11[20],s12,s13,s14,s15[20],opCode),
			mux22(result[21],s0[21],s1[21],s2[21],s3[21],s4[21],s5[21],s6[21],s7[21],s8[21],s9[21],s10[21],s11[21],s12,s13,s14,s15[21],opCode),
			mux23(result[22],s0[22],s1[22],s2[22],s3[22],s4[22],s5[22],s6[22],s7[22],s8[22],s9[22],s10[22],s11[22],s12,s13,s14,s15[22],opCode),
			mux24(result[23],s0[23],s1[23],s2[23],s3[23],s4[23],s5[23],s6[23],s7[23],s8[23],s9[23],s10[23],s11[23],s12,s13,s14,s15[23],opCode),
			mux25(result[24],s0[24],s1[24],s2[24],s3[24],s4[24],s5[24],s6[24],s7[24],s8[24],s9[24],s10[24],s11[24],s12,s13,s14,s15[24],opCode),
			mux26(result[25],s0[25],s1[25],s2[25],s3[25],s4[25],s5[25],s6[25],s7[25],s8[25],s9[25],s10[25],s11[25],s12,s13,s14,s15[25],opCode),
			mux27(result[26],s0[26],s1[26],s2[26],s3[26],s4[26],s5[26],s6[26],s7[26],s8[26],s9[26],s10[26],s11[26],s12,s13,s14,s15[26],opCode),
			mux28(result[27],s0[27],s1[27],s2[27],s3[27],s4[27],s5[27],s6[27],s7[27],s8[27],s9[27],s10[27],s11[27],s12,s13,s14,s15[27],opCode),
			mux29(result[28],s0[28],s1[28],s2[28],s3[28],s4[28],s5[28],s6[28],s7[28],s8[28],s9[28],s10[28],s11[28],s12,s13,s14,s15[28],opCode),
			mux30(result[29],s0[29],s1[29],s2[29],s3[29],s4[29],s5[29],s6[29],s7[29],s8[29],s9[29],s10[29],s11[29],s12,s13,s14,s15[29],opCode),
			mux31(result[30],s0[30],s1[30],s2[30],s3[30],s4[30],s5[30],s6[30],s7[30],s8[30],s9[30],s10[30],s11[30],s12,s13,s14,s15[30],opCode),
			mux32(result[31],s0[31],s1[31],s2[31],s3[31],s4[31],s5[31],s6[31],s7[31],s8[31],s9[31],s10[31],s11[31],s12,s13,s14,s15[31],opCode);


nor n0(zero,result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],
        result[9],result[10],result[11],result[12],result[13],result[14],result[15],result[16],result[17],
	     result[18],result[19],result[20],result[21],result[22],result[23],result[24],result[25],result[26],
	     result[27],result[28],result[29],result[30],result[31]);
	

			  
endmodule
//***********************************************************************
//  Testbench Module
//***********************************************************************

module testbench();

// Local Variables  for
// alu_32_bit(result, reset ,clk ,a ,b ,opCode ,error);

    reg clk;
    reg reset;
	reg carry;
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] result;
    reg [3:0] opcode;
	wire error;
// Instantiate an ALU
alu_32_bit my_alu(.result(result),.reset(reset),.clk(clk), .a(A), .b(B), .opCode(opcode),.error(error));

//CLOCK
initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk; // pulsate the clock every 5 time units
    end
end

 //OUTPUT
 initial begin //Start Output Thread
     $display("OPCODE GUIDE: NOOP-0, RESET-1, OR-3, AND-5, ADD-6, SUB-8, EQUAL-12, GREATER_THAN-13, LESS_THAN-14, ERROR - 15");  
     $display("\tA\t\t\t\t\t\tB\t\t\t\t\topcode\t\t\t\t\tresult\t\t\terror");

    forever
         begin
		// format: binary| [decimal] | binary[decimal] | binary[decimal] |  binary
		//          A  A    B  B  opcode opcode result result error
         $display("%b[%d]\t %b[%d]\t %b[%d]\t %b[%d]\t %b\t", A, A, B, B, opcode, opcode, result, result, error);
         #10;
         end
    end
 //STIMULUS
    initial begin;
    #4;    
    //---------------------------------
    opcode=`RESET;
    #5;
    //---------------------------------    //demonstrating Addition
    A=32'b00000000000000001111111111111111; // 65535
    B=32'b00000000000000000000000000000010; //2
    opcode=`ADD;
    #7;
	//---------------------------------
    opcode=`RESET;
    #9;
    //---------------------------------
    A=32'b00000000000000011111111111111111;
    B=32'b00000000000000011111111111111111;
    opcode=`AND;
    #3;
    // //---------------------------------
    // opcode=`NOOP;
    // #10;
    // //---------------------------------
    // opcode=`RESET;
    // #10;
    // //---------------------------------
    // opcode=`NOOP;
    // #10;
    // //--------------------------------- // demonstrate subtraction
    // A=10;
    // B=30;
    // opcode=`SUB;
    // #10;
    // //---------------------------------
    // opcode=`RESET;
    // #10;
    // //---------------------------------
    // A=666;
    // B=420;
    // opcode=`ADD;
    // #10;
    // //---------------------------------
    // opcode=`NOOP;
    // #10;
    // //---------------------------------
    // opcode=`ADD; //demonstrating free transition between math and logic
    // #10;
    // //---------------------------------
    // opcode=`NOOP; 
    // #10;
    // //---------------------------------
    // opcode=`RESET; 
    #10;
    $finish;
    end
endmodule