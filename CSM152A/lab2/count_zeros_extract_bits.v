`timescale 1ns / 1ps

//Remember to convert names since sign magnitude is the input to this module, not twos_comp.

module count_zeros_extract_bits(
	sign_mag, exp, significand, fifth_bit 
    );
	
	input [11:0] sign_mag;
	output reg [2:0] exp;
	output reg [3:0] significand;
	output reg fifth_bit;
	
	wire is_leading_zero11, is_leading_zero10, is_leading_zero9, is_leading_zero8, is_leading_zero7, is_leading_zero6, is_leading_zero5, is_leading_zero4, is_leading_zero3, is_leading_zero2, is_leading_zero1, is_leading_zero0;

	wire [3:0] num_leading_zeros;

	assign is_leading_zero11 = ~sign_mag[11];
	assign is_leading_zero10 = is_leading_zero11 & ~sign_mag[10];
	assign is_leading_zero9 = is_leading_zero10 & ~sign_mag[9];
	assign is_leading_zero8 = is_leading_zero9 & ~sign_mag[8];
	assign is_leading_zero7 = is_leading_zero8 & ~sign_mag[7];
	assign is_leading_zero6 = is_leading_zero7 & ~sign_mag[6];
	assign is_leading_zero5 = is_leading_zero6 & ~sign_mag[5];
	assign is_leading_zero4 = is_leading_zero5 & ~sign_mag[4];
	assign is_leading_zero3 = is_leading_zero4 & ~sign_mag[3];
	assign is_leading_zero2 = is_leading_zero3 & ~sign_mag[2];
	assign is_leading_zero1 = is_leading_zero2 & ~sign_mag[1];
	assign is_leading_zero0 = is_leading_zero1 & ~sign_mag[0];

	assign num_leading_zeros = is_leading_zero11 + is_leading_zero10 + is_leading_zero9 + is_leading_zero8 + is_leading_zero7 + is_leading_zero6 + is_leading_zero5 + is_leading_zero4 + is_leading_zero3 + is_leading_zero2 + is_leading_zero1 + is_leading_zero0;

	always @(*)
	begin
      case (num_leading_zeros)
          	0: exp[2:0] = 7;
			1: exp[2:0] = 7;
			2: exp[2:0] = 6;
			3: exp[2:0] = 5;
			4: exp[2:0] = 4;
			5: exp[2:0] = 3;
			6: exp[2:0] = 2;
			7: exp[2:0] = 1;
			8: exp[2:0] = 0;
			9: exp[2:0] = 0;
			10: exp[2:0] = 0;
			11: exp[2:0] = 0;
			12: exp[2:0] = 0;
			default: exp[2:0] = 0;
		endcase
	end
	
	always @(*)
	begin
      case (num_leading_zeros)
			0: significand[3:0] = 4'b1111;
			1: significand[3:0] = sign_mag[10:7];
			2: significand[3:0] = sign_mag[9:6];
			3: significand[3:0] = sign_mag[8:5];
			4: significand[3:0] = sign_mag[7:4];
			5: significand[3:0] = sign_mag[6:3];
			6: significand[3:0] = sign_mag[5:2];
			7: significand[3:0] = sign_mag[4:1];
			8: significand[3:0] = sign_mag[3:0];
			9: significand[3:0] = sign_mag[3:0];
			10: significand[3:0] = sign_mag[3:0];
			11: significand[3:0] = sign_mag[3:0];
			12: significand[3:0] = sign_mag[3:0];
			default: significand[3:0] = sign_mag[3:0];
		endcase
	end

	always @(*)
	begin
      case (num_leading_zeros)
			0: fifth_bit = 0;
			1: fifth_bit = sign_mag[6];
			2: fifth_bit = sign_mag[5];
			3: fifth_bit = sign_mag[4];
			4: fifth_bit = sign_mag[3];
			5: fifth_bit = sign_mag[2];
			6: fifth_bit = sign_mag[1];
			7: fifth_bit = sign_mag[0];
			8: fifth_bit = 1'b0;
			9: fifth_bit = 1'b0;
			10: fifth_bit = 1'b0;
			11: fifth_bit = 1'b0;
			12: fifth_bit = 1'b0;
			default: fifth_bit = 1'b0;
		endcase
	end

endmodule