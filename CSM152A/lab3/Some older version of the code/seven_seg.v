/*
	Agreed Interface:
	
	
	Inputs: Need seconds,deca_seconds,minutes,deca_minutes,on_off
*/


module seven_seg(number, seven_seg_display_number);

	//The format for the sevenSegCathodes is as below DC G F E D C B A
	//												  7  6 5 4 3 2 1 0
	parameter ZERO  = 8'b11000000;
	parameter ONE   = 8'b11111001;
	parameter TWO   = 8'b10100100;
	parameter THREE = 8'b10110000;
	parameter FOUR  = 8'b10011001;
	parameter FIVE  = 8'b10010010;
	parameter SIX   = 8'b10000010;
	parameter SEVEN = 8'b11111000;
	parameter EIGHT = 8'b10000000;
	parameter NINE  = 8'b10011000;
	
	reg [7:0] seven_seg_value;
	assign seven_seg_display_number = seven_seg_value;
	
	always @(*) begin
		case (number)
			0: seven_seg_value <= ZERO;
			1: seven_seg_value <= ONE;
			2: seven_seg_value <= TWO;
			3: seven_seg_value <= THREE;
			4: seven_seg_value <= FOUR;
			5: seven_seg_value <= FIVE;
			6: seven_seg_value <= SIX;
			7: seven_seg_value <= SEVEN;
			8: seven_seg_value <= EIGHT;
			9: seven_seg_value <= NINE;
		endcase
	end

endmodule