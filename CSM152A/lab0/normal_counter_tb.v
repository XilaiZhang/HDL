`timescale 1ns / 1ps

module bitcounter_tb;

	// Inputs
	reg clk;
	reg rst;
    wire [3:0] a;

	// Instantiate the Unit Under Test (UUT)
	counter4bit2 uut (
		.clk(clk), 
		.rst(rst), 
      	.a(a)
	);
  
  	initial begin
      $dumpfile("dump.vcd");$dumpvars;
	end

	initial begin
      // Initialize Inputs
      clk = 0;
      rst = 1;

      // Wait 100 ns for global reset to finish
      #100;
      
      #5 rst = 1'b0;
	  #200 rst = 1'b1;
      #5 rst = 1'b0;
      #360 $finish;
	end
 
    always begin
      #5 clk <= ~clk;
    end
      
endmodule