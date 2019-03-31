`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:25 03/19/2013 
// Design Name: 
// Module Name:    NERP_demo_top 
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
module NERP_demo(
	input wire clk,			//master clock = 50MHz
	input wire clr,			//right-most pushbutton for reset
	input wire [7:0]letter_one,
	input wire [7:0]letter_two,
	input wire [7:0]letter_three,
	input wire [7:0]letter_four,
	input wire [7:0]letter_five,
	input wire [7:0]letter_six,
	input wire [7:0]letter_seven,
	input wire [7:0]letter_eight,
	input wire [7:0]letter_nine,
	input wire [7:0]letter_ten,
	output wire [6:0] seg,	//7-segment display LEDs
	output wire [3:0] an,	//7-segment display anode enable
	output wire dp,			//7-segment display decimal point
	output wire [2:0] red,	//red vga output - 3 bits
	output wire [2:0] green,//green vga output - 3 bits
	output wire [1:0] blue,	//blue vga output - 2 bits
	output wire hsync,		//horizontal sync out
	output wire vsync			//vertical sync out
	);

//wire [7:0]letter_one;
//wire [7:0]letter_two;
//wire [7:0]letter_three;
//wire [7:0]letter_four;
//wire [7:0]letter_five;
//wire [7:0]letter_six;
//wire [7:0]letter_seven;
//wire [7:0]letter_eight;
//wire [7:0]letter_nine;
//wire [7:0]letter_ten;
//
//assign letter_one[7:0] = 8'h00;
//assign letter_two[7:0] = 8'h01;
//assign letter_three[7:0] = 8'h00;
//assign letter_four[7:0] = 8'h01;
//assign letter_five[7:0] = 8'h00;
//assign letter_six[7:0] = 8'h01;
//assign letter_seven[7:0] = 8'h00;
//assign letter_eight[7:0] = 8'h01;
//assign letter_nine[7:0] = 8'h00;
//assign letter_ten[7:0] = 8'h01;

// 7-segment clock interconnect
wire segclk;

// VGA display clock interconnect
wire dclk;

// disable the 7-segment decimal points
assign dp = 1;

// generate 7-segment clock & display clock
clockdiv U1(
	.clk(clk),
	.clr(clr),
	.segclk(segclk),
	.dclk(dclk)
	);

// 7-segment display controller
segdisplay U2(
	.segclk(segclk),
	.clr(clr),
	.seg(seg),
	.an(an)
	);

// VGA controller
vga640x480 U3(
	.dclk(dclk),
	.clr(clr),
	.letter_one(letter_one),
	.letter_two(letter_two),
	.letter_three(letter_three),
	.letter_four(letter_four),
	.letter_five(letter_five),
	.letter_six(letter_six),
	.letter_seven(letter_seven),
	.letter_eight(letter_eight),
	.letter_nine(letter_nine),
	.letter_ten(letter_ten),
	.hsync(hsync),
	.vsync(vsync),
	.red(red),
	.green(green),
	.blue(blue)
	);

endmodule
