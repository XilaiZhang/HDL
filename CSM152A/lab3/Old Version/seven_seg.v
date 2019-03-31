/*
	Agreed Interface:
	
	
	Inputs: Need seconds,deca_seconds,minutes,deca_minutes,on_off
*/


module seven_seg(seconds,deca_seconds,minutes,deca_minutes,clk,seg_,an_);
	
	input clk;
	input [3:0] seconds, deca_seconds, minutes, deca_minutes;
	output [7:0] seg_;
	output [3:0] an_;
	
	reg [3:0] sevenSegAnodes;
	reg [7:0] sevenSegCathodes;
	
	assign seg_ = sevenSegCathodes;
	assign an_ = sevenSegAnodes;
	
//	assign seg[0] = sevenSegCathodes[0];
//	assign seg[1] = sevenSegCathodes[1];
//	assign seg[2] = sevenSegCathodes[2];
//	assign seg[3] = sevenSegCathodes[3];
//	assign seg[4] = sevenSegCathodes[4];
//	assign seg[5] = sevenSegCathodes[5];
//	assign seg[6] = sevenSegCathodes[6];
//	assign seg[7] = sevenSegCathodes[7];
//	
//	assign an[0] = sevenSegAnodes[0];
//	assign an[1] = sevenSegAnodes[1];
//	assign an[2] = sevenSegAnodes[2];
//	assign an[3] = sevenSegAnodes[3];
	
	
	// assign sevenSegAnodes = 4'b1111;
		
	
	/*
		Add a mess of assign statements to connect sevenSegCathodes to the .ucf file.
		Also, connect sevenSegAnodes to .ucf file. All anodes assigned to single signal.
	*/
	
	//The format for the sevenSegCathodes is as below DC G F E D C B A
	//												  7  6 5 4 3 2 1 0
	
	parameter ZERO = 8'b11000000;		//Might need to change this since if cathodes is high, the segment will be off.
	parameter ONE = 8'b11111001;
	parameter TWO = 8'b10100100;
	parameter THREE = 8'b10110000;
	parameter FOUR = 8'b10011001;
	parameter FIVE = 8'b10010010;
	parameter SIX = 8'b10000010;
	parameter SEVEN = 8'b11111000;
	parameter EIGHT = 8'b10000000;
	parameter NINE = 8'b10011000;
	
	
	always @(posedge clk) begin
		case (sevenSegAnodes)
			4'b1000: begin
				sevenSegAnodes <= 4'b0001;
				case (seconds)
					0: sevenSegCathodes <= ZERO;
					1: sevenSegCathodes <= ONE;
					2: sevenSegCathodes <= TWO;
					3: sevenSegCathodes <= THREE;
					4: sevenSegCathodes <= FOUR;
					5: sevenSegCathodes <= FIVE;
					6: sevenSegCathodes <= SIX;
					7: sevenSegCathodes <= SEVEN;
					8: sevenSegCathodes <= EIGHT;
					9: sevenSegCathodes <= NINE;
				endcase
			end
			4'b0001: begin
				sevenSegAnodes <= 4'b0010;
				case (deca_seconds)
					0: sevenSegCathodes <= ZERO;
					1: sevenSegCathodes <= ONE;
					2: sevenSegCathodes <= TWO;
					3: sevenSegCathodes <= THREE;
					4: sevenSegCathodes <= FOUR;
					5: sevenSegCathodes <= FIVE;
					6: sevenSegCathodes <= SIX;
					7: sevenSegCathodes <= SEVEN;
					8: sevenSegCathodes <= EIGHT;
					9: sevenSegCathodes <= NINE;
				endcase
			end
			4'b0010: begin
				sevenSegAnodes <= 4'b0100;
				case (minutes)
					0: sevenSegCathodes <= ZERO;
					1: sevenSegCathodes <= ONE;
					2: sevenSegCathodes <= TWO;
					3: sevenSegCathodes <= THREE;
					4: sevenSegCathodes <= FOUR;
					5: sevenSegCathodes <= FIVE;
					6: sevenSegCathodes <= SIX;
					7: sevenSegCathodes <= SEVEN;
					8: sevenSegCathodes <= EIGHT;
					9: sevenSegCathodes <= NINE;
				endcase
			end
			4'b0100: begin
				sevenSegAnodes <= 4'b1000;
				case (deca_minutes)
					0: sevenSegCathodes <= ZERO;
					1: sevenSegCathodes <= ONE;
					2: sevenSegCathodes <= TWO;
					3: sevenSegCathodes <= THREE;
					4: sevenSegCathodes <= FOUR;
					5: sevenSegCathodes <= FIVE;
					6: sevenSegCathodes <= SIX;
					7: sevenSegCathodes <= SEVEN;
					8: sevenSegCathodes <= EIGHT;
					9: sevenSegCathodes <= NINE;
				endcase
			end
			default:
				sevenSegAnodes <= 4'b0001;
		endcase




	end

endmodule