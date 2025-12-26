// COMP12111 Exercise 3 - MU0_Alu 
// Version 2024. P W Nutter
//
// MU0 ALU design 
//
// Comments:
//This design implements the ALU as a combinatorial unit using a case staement with a default
//Updated November 2025
//By Ayomide Ojediran

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps 

// module header

module MU0_Alu (
               input  logic  [15:0]  X, 
               input  logic  [15:0]  Y, 
               input  logic  [1:0]   M, 
               output logic  [15:0]  Q
	       );

localparam zero = 2'b00;
localparam one = 2'b01;
localparam two = 2'b10;
localparam three = 2'b11;


// behavioural description for the ALU
always_comb
begin
case (M)
	zero: Q = Y;				//Passthrough
	one: Q = X + Y;			//Addition
	two: Q = X + 1;			//Increment
	three: Q = X + (~Y + 1); //Subtraction - (~Y + 1) represents Two's complement of Y hence this expression evaluates to Q = X - Y
	default: Q = 16'hxxxx;
endcase
end
endmodule 
 
