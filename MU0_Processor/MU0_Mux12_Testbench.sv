// COMP12111 Exercise 3 - MU0_Mux12 Testbench
// Version 2024. P W Nutter
//
// Testbench for the 2-to-1 12-bit MUX
// DUT is instantiated for you.
// Need to complete the test stimulus.
//
// Comments:
//This design implements the 12-bit multiplexer testbench
//Updated November 2025
//By Ayomide Ojediran

// Do not touch the following lines as they required for simulation 
`timescale  1ns / 100ps 

module MU0_Mux12_Testbench();

//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter the names of these signals 

logic   [11:0] A, B;
logic          S; 
logic   [11:0] Q; 


// The design has been instantiated for you below:

MU0_Mux12 top(.A(A), .B(B), .S(S), .Q(Q) );


/* Comment block

#VALUE      creates a delay of VALUE ps
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/


initial
begin
// Enter you stimulus below this line
// -------------------------------------------------------
    A = 12'hxxx; // Unknown mode
    B = 12'hxxx;
    S = 1'bx;
    // Expect Q = 16'hxxx

    #100; 
	S = 1'b0;
    A = 12'h123; // S = A mode
    B = 12'h321; 
    // Expect Q = 16'h123
    
    #100;  // S = B mode  
    S = 1'b1; 
    // Expect Q = 16'h321
    
    #100; // S = B mode
    A = 12'h777; 
    B = 12'h222;
    // Expect Q = 16'h222

    #100; // S = A
     S = 1'b0;
    // Expect Q = 16'h777

    #100; // S = A
    A = 16'h020;
    // Expect Q = 16'h020

    #100; // S = B
    S = 1'b1;
    // Expect Q = 16'h222





// -------------------------------------------------------
// Please make sure your stimulus is above this line

#100 $stop;
end


endmodule
 
