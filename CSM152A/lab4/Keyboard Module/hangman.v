`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:55 03/05/2019 
// Design Name: 
// Module Name:    hangman 
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
module hangman(
	    input         clk,
		input         PS2Data,
		input         PS2Clk,
		output     [7:0] Led
    );
	
	wire [7:0] sc;
	reg [7:0] letters [0:9];
	reg [7:0] curr_letter = 0;
	reg [3:0] letter_index = 0;
	reg [7:0] led_reg = 0;
	reg [9:0] guess = 10'b1111111111;
	reg guessed_correct = 0;
	reg enter_was_pressed = 0;
	assign Led = led_reg;
	reg word_inputted = 0;
	reg ready = 1;
	
	//Values to be passed into VGA module
	reg [7:0] letters_displayed [0:9];
	reg [3:0] incorrect = 0;

	 Keyboard_Reader reader(
        .clk(clk),
        .PS2Data(PS2Data),
        .PS2Clk(PS2Clk),
        .scancode(sc)
    );
	
	always @(posedge clk) begin
		if (word_inputted == 0) begin
			if (sc == 0) begin
				curr_letter <= curr_letter;
				led_reg <= led_reg;
				ready <= 1;
			end
			
			else if (sc == 8'b01011101 && ready == 1) begin // '\'  is pressed
				word_inputted <= 1;
				ready <= 0;
				curr_letter <= 0;
			end
		
			else if (sc != 8'b01011010 && ready == 1) begin
				curr_letter <= sc;
				letters_displayed[letter_index] <= sc;
				led_reg <= led_reg;
				ready <= 0;
			end
			
			else begin //Enter is pressed
				if (ready == 1) begin
					if (letter_index == 10) begin
						word_inputted <= 1;
						letter_index <= 0;
					end else begin
						letters[letter_index] <= curr_letter;
						guess[letter_index] <= 0;
						letter_index <= letter_index + 1;
						letters_displayed[letter_index] <= 1; //display a ? for that letter
					end
					
					led_reg <= curr_letter;
					ready <= 0;
				end else begin
					led_reg <= led_reg;
					curr_letter <= curr_letter;
					ready <= ready;
				end
			end
		end else begin //word_inputted == 1
			if (sc == 0) begin
				curr_letter <= curr_letter;
				ready <= 1;
				if (enter_was_pressed == 1) begin
					if (guessed_correct == 1) begin
						incorrect <= incorrect;
						enter_was_pressed <= 0;
						guessed_correct <= 0;
					end else begin
						incorrect <= incorrect + 1;
						enter_was_pressed <= 0;
						guessed_correct <= 0;
					end
				end else begin
					incorrect <= incorrect;
				end
				
				if (guess == 10'b1111111111) begin //Win
					led_reg <= 8'b11111111;
				end else if (incorrect == 5) begin //Loss
					led_reg <= 5;
				end else begin
					led_reg <= incorrect; //Guesses left
				end
			end
			
			else if (sc != 8'b01011010 && ready == 1) begin
				curr_letter <= sc;
				led_reg <= led_reg;
				ready <= 0;
			end
			else if(sc == 8'b01011010 && ready == 1) begin
				enter_was_pressed <= 1;
				led_reg <= led_reg;
				ready <= 0;
				if (curr_letter == letters[0]) begin
					guess[0] <= 1;
					guessed_correct <= 1;
					letters_displayed[0] <= curr_letter;
				end 
				if (curr_letter == letters[1]) begin
					guess[1] <= 1;
					guessed_correct <= 1;
					letters_displayed[1] <= curr_letter;
				end 
				if (curr_letter == letters[2]) begin
					guess[2] <= 1;
					guessed_correct <= 1;
					letters_displayed[2] <= curr_letter;
				end 
				if (curr_letter == letters[3]) begin
					guess[3] <= 1;
					guessed_correct <= 1;
					letters_displayed[3] <= curr_letter;
				end 
				if (curr_letter == letters[4]) begin
					guess[4] <= 1;
					guessed_correct <= 1;
					letters_displayed[4] <= curr_letter;
				end 
				if (curr_letter == letters[5]) begin
					guess[5] <= 1;
					guessed_correct <= 1;
					letters_displayed[5] <= curr_letter;
				end 
				if (curr_letter == letters[6]) begin
					guess[6] <= 1;
					guessed_correct <= 1;
					letters_displayed[6] <= curr_letter;
				end 
				if (curr_letter == letters[7]) begin
					guess[7] <= 1;
					guessed_correct <= 1;
					letters_displayed[7] <= curr_letter;
				end 
				if (curr_letter == letters[8]) begin
					guess[8] <= 1;
					guessed_correct <= 1;
					letters_displayed[8] <= curr_letter;
				end 
				if (curr_letter == letters[9]) begin
					guess[9] <= 1;
					guessed_correct <= 1;
					letters_displayed[9] <= curr_letter;
				end 
			end else begin
				led_reg <= led_reg;
				curr_letter <= curr_letter;
				ready <= ready;
				guessed_correct <= guessed_correct;
			end
		end
	end

endmodule
