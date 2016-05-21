`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:37 05/21/2016 
// Design Name: 
// Module Name:    ALU_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_unit(
      input         clk,
      input         rst,
		
		input  [7:0]  opA,
		input  [7:0]  opB,
		output [7:0]  outQ,
		
		input  [3:0]  opcode,
		
		input         cin,
		output        cout,
    );


parameter ADD    = 4'h0;
parameter SUB    = 4'h1;
parameter LSHIFT = 4'h2;
parameter RSHIFT = 4'h3;
parameter EXOR   = 4'h4;
parameter CMP   = 4'h5;
parameter AND    = 4'h6;
parameter NAND   = 4'h7;
parameter OR     = 4'h8;
parameter NOR    = 4'h9;

reg outReg;

always  @ ( opA, opB, cin, opcode)  
case (opcode)
	ADD: 	{cout,outReg} <= opA + opB + cin;		
	SUB:	outReg <= opA + opB + carryIn;
	LSHIFT: outReg <= {opA[6:0],cin} ;
	RSHIFT: outReg <= { cin, opB[7:1] };
	XOR:  outReg <= opA^opB;
	AND:  outReg <= opA&opB;
	NAND: outReg <= ~(opA&opB);
	OR:	outReg <= opA|opB;
	NOR:  outReg <= ~(opA|opB);
	CMP: 
	begin
		if(opA == opB) outReg<=8'h01;
		else if (opA>opB) outReg<=8'h02;
		else if (opA<opB) outReg=8'h03;	
	end
	default:  outReg <= 8'h0;
	
endcase 

always @ (posedge clk)
	outQ <= outReg;



endmodule
