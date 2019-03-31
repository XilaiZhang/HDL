`timescale 1ns / 1ps

module rounding(
	exp, significand, fifth_bit, rounded_significand, rounded_exp
    );

	input [2:0] exp;
	input [3:0] significand;
	input fifth_bit;
	
	output reg [3:0] rounded_significand;
	output reg [2:0] rounded_exp;
	
	always @(*) begin
		if (fifth_bit == 1'b1) begin
			if (significand == 4'b1111) begin
				if (exp == 3'b111) begin
					rounded_exp = exp;
					rounded_significand = significand;
				end else begin 
					rounded_exp = 1 + exp;
					rounded_significand = 4'b1000;
				end
			end else begin
				rounded_significand = significand + 1;
				rounded_exp = exp;
			end
		end 
		else begin
			rounded_significand = significand;
			rounded_exp = exp;
		end
	end
	
endmodule