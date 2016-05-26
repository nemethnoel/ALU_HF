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
	
	output [7:0]  	data_out,
    );


reg [7:0] operands [0:7];
reg cin_reg, cout_reg;
reg [3:0] operation;
reg [2:0] reg_selector;
wire [7:0] operandA, operandB, alu_data_out;
wire [3:0] op_wire;
wire cin_wire, cout_wire;
reg [3:0] actual_state;





always @ (posedge clk)
	



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
