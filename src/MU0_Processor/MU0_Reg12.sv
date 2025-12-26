// COMP12111 Exercise 3 - MU0_Reg12 
// Version 2024. P W Nutter
// 
// 12-bit Register implementation
//
// Implement using behavioural Verilog
//
// Comments:
//This design implements the 12-bit register as a sequential circuit
//Updated November 2025
//By Ayomide Ojediran

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
 

// module definition

module MU0_Reg12 (
input  logic          Clk, 
input  logic          Reset,     
input  logic          En, 
input  logic   [11:0] D, 
output logic   [11:0] Q
);

// behavioural code - clock driven
always_ff @ (posedge Clk, posedge Reset)	//Asynchronous Reset
begin
 	if (Reset) Q <= 12'h000;			//If Reset goes high then Q <= 12'b0000_0000_0000
	else if (En) Q <= D;				//If En goes high then Q <= D
end









endmodule 
 
