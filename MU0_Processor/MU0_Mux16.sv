// COMP12111 Exercise 3 - MU0_Mux16 
// Version 2024. P W Nutter
// 
// 2-to-1 16-bit MUX implementation
//
// Implement using behavioural Verilog
//
// Comments:
//This design implements the 16-bit multiplexer as a combinatorial unit using a case staement with a default
//Updated November 2025
//By Ayomide Ojediran

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
 

// module definition

module MU0_Mux16 (
input  logic  [15:0] A, 
input  logic  [15:0] B, 
input  logic         S, 
output logic  [15:0]  Q
);


localparam zero = 1'b0;
localparam one = 1'b1;

// Combinatorial logic for 2to1 multiplexor
// S is select, A channel0, B channel1
always_comb
begin
	case(S)			
		zero: Q = A;	//IF S == 0 THEN Q = A 
		one: Q = B;	//IF S == 0 THEN Q = B
		default: Q = 16'hxxxx;
	endcase
end








endmodule 
 
