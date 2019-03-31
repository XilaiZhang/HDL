`timescale 1ns / 1ps

module FPVCT(
	D, S, E, F
    );

	input wire [11:0] D;
	output wire S;
	output wire [2:0] E;
	output wire [3:0] F;
	
	wire [11:0] sign_magnitude_out;
	wire [2:0] exp_out;
	wire [3:0] significand_out;
	wire fifth_bit_out;
	
	sign_magnitude_converter block1(
		.sign_mag(D),
		.twos_comp(sign_magnitude_out),
		.sign(S)
		);

	count_zeros_extract_bits block2(
        .sign_mag(sign_magnitude_out),
		.exp(exp_out),
		.significand(significand_out),
		.fifth_bit(fifth_bit_out)
		);

	rounding block3(
		.exp(exp_out),
		.significand(significand_out),
		.fifth_bit(fifth_bit_out),
		.rounded_significand(F),
		.rounded_exp(E)
		);
	
endmodule