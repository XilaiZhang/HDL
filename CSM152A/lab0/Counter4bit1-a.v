/*
 * Module: Testbench for multiplexed combinational gates
 * 
 * Filename: combinational_gates_muxed_TB.v
 * Version: 1.0
 *
 * Author: Cejo Konuparamban Lonappan
 *
 * Description: The testbench code for verifying the multiplexed outputs of
 * eight comnibational gates. 
 */

`timescale 1ns / 1ps

module counter4bit1; // No inputs for a testbench!

// Inputs in the module to be tested will be port mapped to register variables
reg clk;
reg rst;

// Outputs in the module to be tested will be port mapped to wire variables
wire a0, a1, a2, a3;

// Instantiation of the design module to be verified by the testbench
// Use named portmapping to map inputs to regsiter variables and outputs to
// wires
  counter4bit1 UUT 	(.clk(clk), 
                     .rst(rst),
                     .a0(a0),
                     .a1(a1),
                     .a2(a2),
                     .a3(a3)
                    )

// Used for saving Value Change Dump (.vcd) file that records the waveforms of
// the simulation. Not needed while using Xilinx ISIM simulator.
initial
begin
        $dumpfile("combinational_gates_muxed.vcd");
        $dumpvars(2, combinational_gates_muxed_tb.UUT);
end

// IMPORTANT: Initialize all inputs. Otherwise the default value of register
// will be don't care (x).
initial
begin
	clk = 1'b0;
  	rst = 1'b0;
end
  
initial
  begin
    #5 rst = 1'b1;
    #10 rst = 1'b0;
  end

// Use an always block to generate all the test cases
always
	#5 clk = clk 1'b1;

// Code to terminate simulation after all the test cases have been covered.
initial
	#160 $finish; // After 160 timeunits, terminate simulation.

endmodule
