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
	input [6:0]  	opcode,
	input  			cin,
	input 			cout,
	input 			load,
	input 			ce,

	output [7:0]  	data_out
    );


reg [7:0] operands [0:7];
reg [7:0] alu_output;
reg cin_reg, cout_reg;
reg [3:0] operation;
reg [2:0] reg_selector;
wire [7:0] operandA, operandB, alu_data_out;
wire [3:0] op_wire;
wire cin_wire, cout_wire;



parameter IDLE    = 1'b0;
parameter OPERATION = 2'b1;
reg state;



assign op_wire = operation;
assign operandA = operands(0);
assign operandB = operands(reg_selector);
assign data_out = operands(0);
assign alu_data_out = alu_output;
 

always @ (posedge clk, posedge rst)
if (rst)
begin
	operands <= 0;
	reg_selector <= 0;
	state <= IDLE;
	cin_reg <= 0;
	cout_reg <= 0;
	operation <= 0;
end
else
begin
	if (state == IDLE)
	begin
		if (ce==1 && load ==1 )
		begin
			operands(opcode[6:4]) <= data_in;
		else 
		else if (ce == 1 && load == 0 )
		begin 
			reg_selector <= opcode[6:4];
			cin_reg <= cin;
			cout_reg <=cout;
			operation <= opcode[3:0];
			state <= OPERATION;
		end
	end
	begin
		operands(0) <= alu_output;
		state <=IDLE;
	end
end
		



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
