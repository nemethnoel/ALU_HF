`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:05 05/21/2016 
// Design Name: 
// Module Name:    tb_top 
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
module tb_top;

	
	reg 			clk;
	reg			rst;
	reg [7:0]  	data_in;
	reg [6:0]  	opcode;
	reg  			cin;
	reg 			cout;
	reg 			load;
	reg 			ce;
	reg [7:0]  	data_out;
	
	

parameter ADD    = 4'b0000;
parameter SUB    = 4'b0001;
parameter SHIFT  = 4'b0010;
parameter CMP    = 4'b0011;
parameter EXOR   = 4'b0100;
parameter BCMP   = 4'b0101;
parameter AND    = 4'b0110;
parameter NAND   = 4'b0111;
parameter OR     = 4'b1000;
parameter NOR    = 4'b1001;




initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		data_in = 0;
		opcode = 0;
		cin = 0;
		cout = 0;
		load = 0;
		ce = 0;
	end
   
   initial #102 rst = 0;
   
   always #5.2 clk <= ~clk;





//Device Under Test instantiation 
module CPU DUT(
	.clk 			(clk)
	.rst 			(rst)
	.data_in		(data_in)
	.opcode 		(opcode)
	.cin 			(cin)
	.cout 		(cout)
	.load 		(load) 
	.ce 			(ce)
	.data_out 	(data_out)
  );


endmodule
