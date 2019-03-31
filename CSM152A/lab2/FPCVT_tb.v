`timescale 1ns / 1ps

module FPCVT_tb;

	// Inputs
	reg [11:0] test_signal;

	// Outputs
	wire sign;
	wire [2:0] exponent;
	wire [3:0] significand;

	// Instantiate the Unit Under Test (UUT)
	FPVCT uut (
		.D(test_signal), 
		.S(sign), 
		.E(exponent), 
		.F(significand)
	);
  
	initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
	#10000 $finish;
	end

	initial begin
		// Initialize Inputs
		test_signal = 0; // 0
		// Wait 100 ns for global reset to finish
		#20;
		test_signal = 1; 
		#20;
		test_signal = 10; 
		#20;
        test_signal = -10; 
		#20;
        test_signal = 15; 
		#20;
        test_signal = -15; 
		#20;
        test_signal = 16; 
		#20;
        test_signal = -16; 
		#20;
        test_signal = 44; 
		#20;
        test_signal = -44; 
		#20;
        test_signal = 45; 
		#20;
        test_signal = -45; 
		#20;
        test_signal = 46; 
		#20;
        test_signal = -46; 
		#20;
        test_signal = 47; 
		#20;
        test_signal = -47; 
		#20;
        test_signal = 125; 
		#20;
        test_signal = -125; 
		#20;
        test_signal = 128; 
		#20;
        test_signal = -128; 
		#20;
        test_signal = 416; 
		#20;
        test_signal = -416; 
		#20;
        test_signal = 422; 
		#20;
        test_signal = -422; 
		#20;
		test_signal = 2047; 
		#20;
        test_signal = -2047;
		#20;
		test_signal = -2048;
		#20;
	end
endmodule
