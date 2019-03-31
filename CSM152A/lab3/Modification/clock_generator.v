`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:05 02/06/2019 
// Design Name: 
// Module Name:    clock_generator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_generator(clk, rst, clk_1hz, clk_2hz, clk_5hz, clk_400hz
    );
	input clk, rst;
	output reg clk_1hz = 0, clk_2hz = 0, clk_5hz = 0, clk_400hz = 0;
	
	//Clock Speed is 100MHz
	parameter CLOCK_SPEED = 100000000 >> 1;
	parameter CLOCK_SPEED_2HZ = 50000000 >> 1;
	parameter CLOCK_SPEED_5HZ = 20000000 >> 1;
	parameter CLOCK_SPEED_400HZ = 25000 >> 1;
	
	//Count to CLOCK_SPEED/n to get n Hz clock.
	reg [31:0] clk_1hz_counter = 0;
	reg [31:0] clk_2hz_counter = 0;
	reg [31:0] clk_5hz_counter = 0;
	reg [31:0] clk_400hz_counter = 0;
		
	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			clk_1hz <= 0;
			clk_1hz_counter <= 0;
		end
		else begin
			if (clk_1hz_counter == CLOCK_SPEED - 1) begin
				clk_1hz <= ~clk_1hz;
				clk_1hz_counter <= 0;
			end
			else begin
				clk_1hz <= clk_1hz;
				clk_1hz_counter <= clk_1hz_counter + 1;
			end
		end
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			clk_2hz <= 0;
			clk_2hz_counter <= 0;
		end
		else begin
			if (clk_2hz_counter == CLOCK_SPEED_2HZ - 1) begin
				clk_2hz <= ~clk_2hz;
				clk_2hz_counter <= 0;
			end
			else begin
				clk_2hz <= clk_2hz;
				clk_2hz_counter <= clk_2hz_counter + 1;
			end
		end
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			clk_5hz <= 0;
			clk_5hz_counter <= 0;
		end
		else begin
			if (clk_5hz_counter == CLOCK_SPEED_5HZ - 1) begin
				clk_5hz <= ~clk_5hz;
				clk_5hz_counter <= 0;
			end
			else begin
				clk_5hz <= clk_5hz;
				clk_5hz_counter <= clk_5hz_counter + 1;
			end
		end
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1'b1) begin
			clk_400hz <= 0;
			clk_400hz_counter <= 0;
		end
		else begin
			if (clk_400hz_counter == CLOCK_SPEED_400HZ - 1) begin
				clk_400hz <= ~clk_400hz;
				clk_400hz_counter <= 0;
			end
			else begin
				clk_400hz <= clk_400hz;
				clk_400hz_counter <= clk_400hz_counter + 1;
			end
		end
	end


endmodule
