`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
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
module vga640x480(
	input wire dclk,			//pixel clock: 25MHz
	input wire clr,			//asynchronous reset
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue	//blue vga output
	);

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

//Add constants for bitmap ranges here:

//End bitmap region constants area.

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge dclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =
always @(*)
begin
	// first check if we're within vertical active video range
	
	
	//We have a constant array for each of 26 letters and for two special [?] and [X].
	//We set an origin for each of the 10 letter positions.
	
	
	//horizontal range is from 144 - 784 (hbp - hfp)
	//vertical range is from 31 - 511 (vbp - vfp)
	if (vc >= vbp && vc < vfp)
	begin
		if (hc >= hbp && hc < hfp)
			begin
				if (hc > hbp && hc <= hbp + 64 && vc < vfp && vc >= vfp - 64)	//Letter 1: Origin = (hbp,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b000;
						green = 3'b000;
						blue = 2'b00;
					end
				else if (hc > hbp + 64 && hc <= hbp + 128 && vc < vfp && vc >= vfp - 64)	//Letter 2: Origin = (hbp+64,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b111;
						green = 3'b000;
						blue = 2'b11;
					end
				else if (hc > hbp + 128 && hc <= hbp + 192 && vc < vfp && vc >= vfp - 64)	//Letter 3: Origin = (hbp+128,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b000;
						green = 3'b000;
						blue = 2'b00;
					end
				else if (hc > hbp + 192 && hc <= hbp + 256 && vc < vfp && vc >= vfp - 64)	//Letter 4: Origin = (hbp+192,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b111;
						green = 3'b000;
						blue = 2'b11;
					end
				else if (hc > hbp + 256 && hc <= hbp + 320 && vc < vfp && vc >= vfp - 64)	//Letter 5: Origin = (hbp+256,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b000;
						green = 3'b000;
						blue = 2'b00;
					end
				else if (hc > hbp + 320 && hc <= hbp + 384 && vc < vfp && vc >= vfp - 64)	//Letter 6: Origin = (hbp+320,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b111;
						green = 3'b000;
						blue = 2'b11;
					end
				else if (hc > hbp + 384 && hc <= hbp + 448 && vc < vfp && vc >= vfp - 64)	//Letter 7: Origin = (hbp+384,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b000;
						green = 3'b000;
						blue = 2'b00;
					end
				else if (hc > hbp + 448 && hc <= hbp + 512 && vc < vfp && vc >= vfp - 64)	//Letter 8: Origin = (hbp+448,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b111;
						green = 3'b000;
						blue = 2'b11;
					end
				else if (hc > hbp + 512 && hc <= hbp + 576 && vc < vfp && vc >= vfp - 64)	//Letter 9: Origin = (hbp+512,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b000;
						green = 3'b000;
						blue = 2'b00;
					end
				else if (hc > hbp + 576 && hc <= hbp + 640 && vc < vfp && vc >= vfp - 64)	//Letter 10: Origin = (hbp+576,vfp)
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b111;
						green = 3'b000;
						blue = 2'b11;
					end
				else if ((hc > hbp + 144 && hc <= hbp + 160 && vc < vfp - 96 && vc >= vbp + 32) 
								|| (hc > hbp + 144 && hc <= hfp - 144 && vc < vbp + 48 && vc >= vbp + 32) 
								|| (hc > hbp + 96 && hc <= hbp + 208 && vc < vfp - 96 && vc >= vbp - 112))	//Gallows
					begin
						red = 3'b000;
						green = 3'b000;
						blue = 2'b00;
					end
				else
					begin
						//Add case statements to assign letter bitmaps.
						red = 3'b000;
						green = 3'b100;
						blue = 2'b11;
					end
			end
		else
			begin
				red = 3'b000;
				green = 3'b000;
				blue = 2'b00;
			end
	end
	else	// we're outside active vertical range so display black
	begin
		red = 3'b000;
		green = 3'b000;
		blue = 2'b00;
	end
end

endmodule
