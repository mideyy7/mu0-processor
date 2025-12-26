// COMP12111 Exercise 3 - MU0_Mux16 Testbench
// Version 2024. P W Nutter
//
// Testbench for the 2-to-1 16-bit MUX
// DUT is instantiated for you.
// Need to complete the test stimulus.
//
// Comments:
//
//
//

// Do not touch the following lines as they required for simulation 
`timescale  1ns / 100ps 

module MU0_Mux16_Testbench();

//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter the names of these signals 

logic   [15:0] A, B;
logic          S; 
logic   [15:0] Q;


// The design has been instantiated for you below:

MU0_Mux16 top(.A(A), .B(B), .S(S), .Q(Q) );


/* Comment block

#VALUE      creates a delay of VALUE ps
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

initial
begin
// Enter you stimulus below this line
// -------------------------------------------------------
  	A = 16'hxxxx; // Unknown mode
    B = 16'hxxxx;
    S = 1'bx;
    // Expect Q = 16'hxxx

    #100; 
    S = 1'b0;
    A = 16'h1234; // S = A mode
    B = 16'h4321; 
    // Expect Q = 16'h1234
    
    #100;  // S = B mode  
    S = 1'b1; 
    // Expect Q = 16'h4321
    
    #100; // S = B mode
    A = 16'h7777; 
    B = 16'h2222;
    // Expect Q = 16'h2222

    #100; // S = A
     S = 1'b0;
    // Expect Q = 16'h7777

    #100; // S = A
    A = 16'h0201;
    // Expect Q = 16'h0201

    #100; // S = B
    S = 1'b1;
    // Expect Q = 16'h2222





// -------------------------------------------------------
// Please make sure your stimulus is above this line

#100 $stop;
end


endmodule
 
