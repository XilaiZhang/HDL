`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:23 02/12/2019
// Design Name:   stopwatch_top
// Module Name:   C:/Users/152/Desktop/lab3/stopwatch_tb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stopwatch_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stopwatch_tb;

	// Inputs
	reg clk;
	reg btnS;
	reg btnR;
	reg [7:0] sw;

	// Outputs
	wire [7:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	stopwatch_top uut (
		.clk(clk), 
		.seg(seg), 
		.an(an), 
		.btnS(btnS), 
		.btnR(btnR), 
		.sw(sw)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		btnS = 0;
		btnR = 0;
		sw = 0;

		// Wait 100 ns for global reset to finish
		#10
		
		#500 $finish;
	end
        
		always begin
			#5 clk <= ~clk;
		end
		// Add stimulus here


      
endmodule

