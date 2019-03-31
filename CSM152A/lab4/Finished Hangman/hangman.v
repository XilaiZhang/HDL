`timescale 1ns / 1ps

module hangman(
	    input         clk,
		input         PS2Data,
		input         PS2Clk,
		input         clr,
		input         rst,
		output     [7:0] Led,
        output wire [6:0] seg,	//7-segment display LEDs
        output wire [3:0] an,	//7-segment display anode enable
        output wire dp,			//7-segment display decimal point
        output wire [2:0] red,	//red vga output - 3 bits
        output wire [2:0] green,//green vga output - 3 bits
        output wire [1:0] blue,	//blue vga output - 2 bits
        output wire hsync,		//horizontal sync out
        output wire vsync			//vertical sync out
        
    );
	
	wire [7:0] sc;
	reg [7:0] letters [0:9];
	reg [7:0] curr_letter = 0;
	reg [3:0] letter_index = 0;
	reg [7:0] led_reg = 0;
	reg [9:0] guess = 10'b1111111111;
	reg guessed_correct = 0;
	reg enter_was_pressed = 0;
	reg word_inputted = 0;
	reg ready = 1;
	reg game_won = 0;
	reg game_lost = 0;
	
	//Values to be passed into VGA module
	reg [7:0] letters_displayed [0:9];
	reg [3:0] incorrect = 0;
	
	//Led for debugging
	assign Led = led_reg;

	 Keyboard_Reader reader(
        .clk(clk),
        .PS2Data(PS2Data),
        .PS2Clk(PS2Clk),
        .scancode(sc)
    );
    
    VGA_interpreter vga(
		.clk(clk),			//master clock = 50MHz
		.clr(clr),			//right-most pushbutton for reset
		.letter_one(letters_displayed[0]),
		.letter_two(letters_displayed[1]),
		.letter_three(letters_displayed[2]),
		.letter_four(letters_displayed[3]),
		.letter_five(letters_displayed[4]),
		.letter_six(letters_displayed[5]),
		.letter_seven(letters_displayed[6]),
		.letter_eight(letters_displayed[7]),
		.letter_nine(letters_displayed[8]),
		.letter_ten(letters_displayed[9]),
		.incorrect(incorrect),
		.seg(seg),	//7-segment display LEDs
		.an(an),	//7-segment display anode enable
		.dp(dp),			//7-segment display decimal point
		.red(red),	//red vga output - 3 bits
		.green(green),//green vga output - 3 bits
		.blue(blue),	//blue vga output - 2 bits
		.hsync(hsync),		//horizontal sync out
		.vsync(vsync)			//vertical sync out
	);

	
	always @(posedge clk) begin
		
		if (rst == 1) begin
			letters[0] <= 0;
			letters[1] <= 0;
			letters[2] <= 0;
			letters[3] <= 0;
			letters[4] <= 0;
			letters[5] <= 0;
			letters[6] <= 0;
			letters[7] <= 0;
			letters[8] <= 0;
			letters[9] <= 0;
			curr_letter <= 0;
			letter_index <= 0;
	        led_reg <= 0;
	        guess <= 10'b1111111111;
			guessed_correct <= 0;
			enter_was_pressed <= 0;
			word_inputted <= 0;
			ready <= 0;
			letters_displayed[0] <= 0;
			letters_displayed[1] <= 0;
			letters_displayed[2] <= 0;
			letters_displayed[3] <= 0;
			letters_displayed[4] <= 0;
			letters_displayed[5] <= 0;
			letters_displayed[6] <= 0;
			letters_displayed[7] <= 0;
			letters_displayed[8] <= 0;
			letters_displayed[9] <= 0;
			incorrect <= 0;
			game_won <= 0;
			game_lost <= 0;
		end
		
		else if (word_inputted == 0) begin
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
				if (ready == 1 && curr_letter != 0) begin
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
		end else if (word_inputted == 1 && game_won == 0 && game_lost == 0) begin 
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
					game_won <= 1;
				end else if (incorrect == 6) begin //Loss
					led_reg <= 6;
					game_lost <= 1;
				end else begin
					led_reg <= incorrect; //Guesses left
				end
			end
			
			else if (sc != 8'b01011010 && ready == 1) begin
				curr_letter <= sc;
				led_reg <= led_reg;
				ready <= 0;
			end
			else if(sc == 8'b01011010 && ready == 1 && curr_letter != 0) begin
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
		end else if (game_won == 1) begin
			if (sc == 0) begin
				curr_letter <= curr_letter;
				led_reg <= led_reg;
				ready <= 1;
				letters_displayed[0] <= 8'h35; //Y
				letters_displayed[1] <= 8'h44; //O
				letters_displayed[2] <= 8'h3c; //U
				letters_displayed[3] <= 0;     //-
				letters_displayed[4] <= 8'h1d; //W
				letters_displayed[5] <= 8'h43; //I
				letters_displayed[6] <= 8'h31; //N
				letters_displayed[7] <= 0;     //-
				letters_displayed[8] <= 0;     //-
				letters_displayed[9] <= 0;     //-
			end
			
			else if (sc == 8'b01011010 && ready == 1) begin //reset the game on enter
				letters[0] <= 0;
				letters[1] <= 0;
				letters[2] <= 0;
				letters[3] <= 0;
				letters[4] <= 0;
				letters[5] <= 0;
				letters[6] <= 0;
				letters[7] <= 0;
				letters[8] <= 0;
				letters[9] <= 0;
				curr_letter <= 0;
				letter_index <= 0;
				led_reg <= 0;
				guess <= 10'b1111111111;
				guessed_correct <= 0;
				enter_was_pressed <= 0;
				word_inputted <= 0;
				ready <= 1;
				letters_displayed[0] <= 0;
				letters_displayed[1] <= 0;
				letters_displayed[2] <= 0;
				letters_displayed[3] <= 0;
				letters_displayed[4] <= 0;
				letters_displayed[5] <= 0;
				letters_displayed[6] <= 0;
				letters_displayed[7] <= 0;
				letters_displayed[8] <= 0;
				letters_displayed[9] <= 0;
				incorrect <= 0;
				game_won <= 0;
				game_lost <= 0;
			end
		end else begin //lose == 1;
			if (sc == 0) begin
				curr_letter <= curr_letter;
				led_reg <= led_reg;
				ready <= 1;
				letters_displayed[0] <= 8'h35; //Y
				letters_displayed[1] <= 8'h44; //O
				letters_displayed[2] <= 8'h3c; //U
				letters_displayed[3] <= 0;     //-
				letters_displayed[4] <= 8'h4b; //L
				letters_displayed[5] <= 8'h44; //O
				letters_displayed[6] <= 8'h1b; //S
				letters_displayed[7] <= 8'h24; //E
				letters_displayed[8] <= 0;     //-
				letters_displayed[9] <= 0;     //-
			end
			
			else if (sc == 8'b01011010 && ready == 1) begin //reset the game on enter
				letters[0] <= 0;
				letters[1] <= 0;
				letters[2] <= 0;
				letters[3] <= 0;
				letters[4] <= 0;
				letters[5] <= 0;
				letters[6] <= 0;
				letters[7] <= 0;
				letters[8] <= 0;
				letters[9] <= 0;
				curr_letter <= 0;
				letter_index <= 0;
				led_reg <= 0;
				guess <= 10'b1111111111;
				guessed_correct <= 0;
				enter_was_pressed <= 0;
				word_inputted <= 0;
				ready <= 1;
				letters_displayed[0] <= 0;
				letters_displayed[1] <= 0;
				letters_displayed[2] <= 0;
				letters_displayed[3] <= 0;
				letters_displayed[4] <= 0;
				letters_displayed[5] <= 0;
				letters_displayed[6] <= 0;
				letters_displayed[7] <= 0;
				letters_displayed[8] <= 0;
				letters_displayed[9] <= 0;
				incorrect <= 0;
				game_won <= 0;
				game_lost <= 0;
			end
		end
	end

endmodule
