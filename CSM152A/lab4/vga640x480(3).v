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
	
	input wire [7:0] letter_one,
	input wire [7:0] letter_two,
	input wire [7:0] letter_three,
	input wire [7:0] letter_four,
	input wire [7:0] letter_five,
	input wire [7:0] letter_six,
	input wire [7:0] letter_seven,
	input wire [7:0] letter_eight,
	input wire [7:0] letter_nine,
	input wire [7:0] letter_ten,

	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue	
	
	);
			

reg [9:0] x;
reg [9:0] y;



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
			begin
			hc <= hc + 1;
			
		end	
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
	if (vc >= vbp && vc < vfp)
	begin
		// now display different colors every 80 pixels
		// while we're within the active horizontal range
		// try to draw the block of the first character
		
		if (hc >= hbp && hc < hfp) //
		begin
			 
			//start of gigantic block1
			x=150;
			y=150;
			// A 7*9

           
				
				if (vc >= (vbp + y+18) && vc < (vbp + y+18+1) && hc >= (hbp + x+13+2) && hc < (hbp + x+13+5))
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+18+1) && vc < (vbp + y+18+2) && hc >= (hbp + x+13+1) && hc < (hbp + x+13+6))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+18+2) && vc < (vbp + y+18+9) && hc >= (hbp + x+13) && hc < (hbp + x+13+2))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
                else if (vc >= (vbp + y+18+4) && vc < (vbp + y+18+6) && hc >= (hbp + x+13+2) && hc < (hbp + x+13+5))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+18+2) && vc < (vbp + y+18+9) && hc >= (hbp + x+13+5) && hc < (hbp + x+13+7))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				
				
				 // Body 

           
				else if (vc >= (vbp + y+32) && vc < (vbp + y+64) && hc >= (hbp + x+14) && hc < (hbp + x+16))
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end

				// left arm

                else if (vc >= (vbp + y+45) && vc < (vbp + y+47) && hc >= (hbp + x) && hc < (hbp + x+14))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end

				//right arm

				else if (vc >= (vbp + y+45) && vc < (vbp + y+47) && hc >= (hbp + x+16) && hc < (hbp + x+30))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end

				//left foot

				else if (vc >= (vbp + y+62) && vc < (vbp + y+64) && hc >= (hbp + x) && hc < (hbp + x+14))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end

				//right foot

				else if (vc >= (vbp + y+62) && vc < (vbp + y+64) && hc >= (hbp + x+16) && hc < (hbp + x+30))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				
				

        // O

				else if (vc >= (vbp + y+5) && vc < (vbp + y+30) && hc >= (hbp + x+4) && hc < (hbp + x+6))
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+5) && vc < (vbp + y+30) && hc >= (hbp + x+28) && hc < (hbp + x+30))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+3) && vc < (vbp + y+5) && hc >= (hbp + x+5) && hc < (hbp + x+29))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+30) && vc < (vbp + y+32) && hc >= (hbp + x+5) && hc < (hbp + x+29))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				
				// X 7*9

            
				else if (vc >= (vbp + y+8) && vc < (vbp + y+8+3) && hc >= (hbp + x+8) && hc < (hbp + x+8+1))
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
                else if (vc >= (vbp + y+8) && vc < (vbp + y+8+3) && hc >= (hbp + x+8+6) && hc < (hbp + x+8+7))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+2) && vc < (vbp + y+8+4) && hc >= (hbp + x+8+1) && hc < (hbp + x+8+2))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+2) && vc < (vbp + y+8+4) && hc >= (hbp + x+8+5) && hc < (hbp + x+8+6))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+4) && vc < (vbp + y+8+5) && hc >= (hbp + x+8+2) && hc < (hbp + x+8+5))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+5) && vc < (vbp + y+8+7) && hc >= (hbp + x+8+1) && hc < (hbp + x+8+2))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+5) && vc < (vbp + y+8+7) && hc >= (hbp + x+8+5) && hc < (hbp + x+8+6))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+6) && vc < (vbp + y+8+9) && hc >= (hbp +8+ x) && hc < (hbp + x+8+1))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+6) && vc < (vbp + y+8+9) && hc >= (hbp + x+8+6) && hc < (hbp + x+8+7))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				
				 // X2

           
				else if (vc >= (vbp + y+8) && vc < (vbp + y+8+3) && hc >= (hbp + x+18) && hc < (hbp + x+18+1))
				begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
                else if (vc >= (vbp + y+8) && vc < (vbp + y+8+3) && hc >= (hbp + x+18+6) && hc < (hbp + x+18+7))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+2) && vc < (vbp + y+8+4) && hc >= (hbp + x+18+1) && hc < (hbp + x+18+2))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+2) && vc < (vbp + y+8+4) && hc >= (hbp + x+18+5) && hc < (hbp + x+18+6))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+4) && vc < (vbp + y+8+5) && hc >= (hbp + x+18+2) && hc < (hbp + x+18+5))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+5) && vc < (vbp + y+8+7) && hc >= (hbp + x+18+1) && hc < (hbp + x+18+2))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+5) && vc < (vbp + y+8+7) && hc >= (hbp + x+18+5) && hc < (hbp + x+18+6))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+6) && vc < (vbp + y+8+9) && hc >= (hbp + x+18) && hc < (hbp + x+18+1))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else if (vc >= (vbp + y+8+6) && vc < (vbp + y+8+9) && hc >= (hbp + x+18+6) && hc < (hbp + x+18+7))
                begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b11;
				end
				else
				begin
					red = 3'b000;
					green = 3'b000;
					blue = 2'b00;
				end
            
			//end of giantic block1
		end
		// we're outside active horizontal range so display black
		else
		begin
			red = 0;
			green = 0;
			blue = 0;
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule


