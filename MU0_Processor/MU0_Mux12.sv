// COMP12111 Exercise 3 - MU0_Mux12 
// Version 2024. P W Nutter
// 
// 2-to-1 12-bit MUX implementation
//
// Implement using behavioural Verilog
//
// Comments:
//This design implements the 12-bit multiplexer as a combinatorial circuit using a case statement with default
//Updated November 2025
//By Ayomide Ojediran

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
 

// module definition

module MU0_Mux12 (
input  logic [11:0] A, 
input  logic [11:0] B, 
input  logic        S, 
output logic [11:0] Q);


localparam zero = 1'b0;
localparam one = 1'b1;


// Combinatorial logic for 2to1 multiplexor
// S is select, A channel0, B channel1
			
always_comb
begin
	case(S)			
		zero: Q = A;	//IF S == 0 THEN Q = A 
		one: Q = B;	//IF S == 0 THEN Q = B
		default: Q = 12'hxxx;
	endcase
end

endmodule 
 
