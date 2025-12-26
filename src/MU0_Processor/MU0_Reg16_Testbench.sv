// COMP12111 Exercise 3 - MU0_Reg16 Testbench
// Version 2024. P W Nutter
//
// Testbench for the 16-bit Register
// DUT is instantiated for you.
// Need to complete the test stimulus.
//
// Comments:
//This design implements the 16-bit register testbench
//Updated November 2025
//By Ayomide Ojediran

// Do not touch the following lines as they required for simulation 
`timescale  1ns / 100ps 

module MU0_Reg16_Testbench();

//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter the names of these signals 

logic   [15:0] D;
logic          Clk;
logic          Reset;
logic          En; 
logic   [15:0] Q;


// The design has been instantiated for you below:

MU0_Reg16 top(.D(D), .Clk(Clk), .Reset(Reset), .En(En), .Q(Q) );


/* Comment block

#VALUE      creates a delay of VALUE ps
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/


// Clk setup
initial Clk = 1'b0; 	//Initialise Clk to 0 at time 0

always
	begin
		#50
		Clk = ~Clk;
	end


initial
begin
// Enter you stimulus below this line
// -------------------------------------------------------
#100
Reset = 1'b0;
En = 1'b0;
D = 16'h0000;		//Nothing happens

#100
D = 16'h1111;		//Nothing happens as En is low

#100
En = 1'b1;			//Q = 16'h1111 as En is set to high

#100
D = 16'h2222;		//Q changes to 16'h2222

#100
D = 16'h3333;
Reset = 1'b1;		//Reset goes high so Q returns to 16'h0000

#100
D = 16'h4444;		//Q remains 16'b0000 as Reset is still high

#100
Reset = 1'b0;		//Reset goes low so Q = 16'bh4444;

#100
En = 1'b0;
D = 16'h5555;		//Q remains at 16'h4444 as En is set to low

#100
D = 16'h6666;		//Q remains at 16'h4444 as En is set to low

#100
D = 16'h7777;		//Q remains at 16'h4444 as En is set to low

#100
En = 1'b1;			//Q becomes 16'h7777 as En is set to high

#100
Reset = 1'b1;		//Q becoemes 16'h0000 as reset goes high


// -------------------------------------------------------
// Please make sure your stimulus is above this line

#100 $stop;
end


endmodule
 
