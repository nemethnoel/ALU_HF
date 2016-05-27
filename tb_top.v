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
	wire 			cout;
	reg 			load;
	reg 			ce;
	
	
	wire cout_wire;
	wire [7:0] data_out_wire;
	
	
	

parameter ADD    = 4'h0;
parameter SUB    = 4'h1;
parameter LSHIFT = 4'h2;
parameter RSHIFT = 4'h3;
parameter XOR    = 4'h4;
parameter CMP    = 4'h5;
parameter AND    = 4'h6;
parameter NAND   = 4'h7;
parameter OR     = 4'h8;
parameter NOR    = 4'h9;
parameter CPY	  = 4'ha;

parameter ACCU = 3'b000;
parameter REG0 = 3'b001;
parameter REG1 = 3'b010;
parameter REG2 = 3'b011;
parameter REG3 = 3'b100;
parameter REG4 = 3'b101;
parameter REG5 = 3'b110;
parameter REG6 = 3'b111;


initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;
		data_in = 0;
		opcode = 0;
		cin = 0;
		load = 0;
		ce = 0;
	end
   
   initial #102 rst = 0;
   
   always #5 clk <= ~clk;



initial
begin

//Loading registers with valid data
#1002
   load = 1;
   ce = 1;
   opcode = {ACCU , 4'b0000};
   data_in = 8'b00000001;
#10	
	opcode = {REG0 , 4'b0000};
   data_in = 8'b00000010;
#10	
	opcode = {REG1 , 4'b0000};
   data_in = 8'b00000100;
	
#10	
	opcode = {REG2 , 4'b0000};
   data_in = 8'b00001000;
	
#10	
	opcode = {REG3 , 4'b0000};
   data_in = 8'b00010000;
	
#10	
	opcode = {REG4 , 4'b0000};
   data_in = 8'b00100000;
	
#10	
	opcode = {REG5 , 4'b0000};
   data_in = 8'b01000000;
	
#10	
	opcode = {REG6 , 4'b0000};
   data_in = 8'b10000000;
#10	
	load = 0;
   ce = 0;
   opcode = 0;
   data_in = 0;
//End of register initialsation 

//DUT functionality test: 	
#100
	ce = 1;
	opcode = {REG0,ADD};  	// = 8'b00000011
#10
	ce = 0;
#10
	ce = 1;
	opcode = {ACCU,SUB };	//Accu-Accu=8'b000000000
#10
	ce = 0;
#30 
	ce=1;
	opcode = {REG0,ADD}; 	// = 8'b00000011
	cin = 1; //
#20
	opcode = {ACCU,LSHIFT}; // 8'b00000110
	cin = 0;
#20
	cin = 1;						//8'b00001101
#20 
	opcode = {ACCU,RSHIFT}; //8'b10000110






/*parameter ADD    = 4'h0;
parameter SUB    = 4'h1;
parameter LSHIFT = 4'h2;
parameter RSHIFT = 4'h3;
parameter XOR    = 4'h4;
parameter CMP    = 4'h5;
parameter AND    = 4'h6;
parameter NAND   = 4'h7;
parameter OR     = 4'h8;
parameter NOR    = 4'h9;
parameter CPY	  = 4'ha;
	*/
	
	
end 

//Device Under Test instantiation 
CPU DUT(
	.clk 			(clk),
	.rst 			(rst),
	.data_in		(data_in),
	.opcode 		(opcode),
	.cin 			(cin),
	.cout 		(cout),
	.load 		(load),
	.ce 			(ce),
	.data_out 	(data_out_wire)
  );


endmodule
