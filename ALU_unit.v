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
		input  [7:0]  opA,
		input  [7:0]  opB,
		output [7:0]  outData,
		
		input  [3:0]  opcode,
		
		input         cin,
		output        cout
    );

reg [7:0] outDataReg;
reg cout_reg;


assign  cout = cout_reg;
assign  outData = outDataReg ;

parameter ADD    = 4'h0;
parameter SUB    = 4'h1;
parameter LSHIFT = 4'h2;
parameter RSHIFT = 4'h3;
parameter XOR   = 4'h4;
parameter CMP   = 4'h5;
parameter AND    = 4'h6;
parameter NAND   = 4'h7;
parameter OR     = 4'h8;
parameter NOR    = 4'h9;

always  @ ( opA, opB, cin, opcode)  
if (opcode == ADD)
	{cout_reg,outDataReg} <= opA + opB + cin;	
else
begin
	cout_reg <= 0;
	case (opcode)
		SUB:	outDataReg <= opA - opB + cin;
		LSHIFT: outDataReg <= {opA[6:0],cin} ;
		RSHIFT: outDataReg <= { cin, opB[7:1] };
		XOR:  outDataReg <= opA^opB;
		AND:  outDataReg <= opA&opB;
		NAND: outDataReg <= ~(opA&opB);
		OR:	outDataReg <= opA|opB;
		NOR:  outDataReg <= ~(opA|opB);
		CMP: 
		begin
			if(opA == opB) outDataReg <= 8'h01;
			else if (opA>opB)outDataReg <= 8'h02;
			else outDataReg <= 8'h03;	
		end
		default:  outDataReg <= 8'h0;
	endcase 
end


endmodule
