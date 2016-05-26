`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:05 05/26/2016 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
	input 			clk,
	input				rst,

	input [7:0]  	data_in,
	input [7:0]  	opcode,
	input  			cin,
	input 			cout,
	input 			load,
	input 			ce,

	output [7:0]  	data_out,
    );


reg [7:0] operands [0:7];
reg cin_reg, cout_reg;
reg [3:0] operation;
reg [2:0] reg_selector;
wire [7:0] operandA, operandB, alu_data_out;
wire [3:0] op_wire;
wire cin_wire, cout_wire;



parameter IDLE    = 2'b00;
parameter OP1 = 2'b01;
parameter OP2 = 2'b10;
parameter   =   2'b11;
reg [2:0] state;





always @ (posedge clk, posedge rst)
if (rst)
	
else
	if (ce==1 && load ==1 && state==0)
		operands(opcode[6:4]) <= 

	else if (ce == 1 )


always @ (posedge clk, posedge rst)
if (rst)
	
else
		



ALU_unit (
         .clk     (clk),
			.opA		(operandA)
			.opB		(operandB)
			.outQ		(alu_data_out)
			.opcode	(op_wire)
			.cin		(cin_wire)
			.cout		(cout_wire)
);




endmodule
