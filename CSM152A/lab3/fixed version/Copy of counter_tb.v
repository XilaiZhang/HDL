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
	reg rst, clk_normal, clk_fast, sel, stop, adjust;

	// Outputs
    wire [3:0] seconds;
    wire [3:0] deca_seconds;
    wire [3:0] minutes;
    wire [3:0] deca_minutes;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
      .rst(rst), 
      .clk_normal(clk_normal), 
      .clk_fast(clk_fast),
      .stop(stop),
      .sel(sel),
      .adjust(adjust),
      .seconds(seconds),
      .deca_seconds(deca_seconds), 
      .minutes(minutes),
      .deca_minutes(deca_minutes)
	);
	

	
  	initial begin
        	$dumpfile("dump.vcd"); $dumpvars;
		// Initialize Inputs
		rst = 0;
        clk_normal = 0;
        clk_fast = 0;
        sel = 0; 
        stop = 0;
        adjust = 0;

		// Wait 100 ns for global reset to finish
		#10
      
      	adjust = 1;
      
      	#200
      
      	sel = 1;
      	#200
      	stop = 1;
      	#50
      	stop = 0;
		
		#5000 $finish;
	end
        
		always begin
			#10 clk_normal <= ~clk_normal;
		end
  
  		always begin
			#5 clk_fast <= ~clk_fast;
		end
		// Add stimulus here


      
endmodule

