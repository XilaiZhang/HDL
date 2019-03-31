
module stopwatch_top(clk, seg, an, btnS, btnR, sw);

	input clk, btnR, btnS;
	input [7:0] sw;
	output [7:0] seg;
	output [3:0] an;
	
	wire [3:0] seconds_value;
	wire [3:0] deca_seconds_value;
	wire [3:0] minutes_value;
	wire [3:0] deca_minutes_value;
	wire [7:0] seconds_seg_value;
	wire [7:0] deca_seconds_seg_value;
	wire [7:0] minutes_seg_value;
	wire [7:0] deca_minutes_seg_value;
	
	wire reset, pause, adjust, select, clk_seconds, clk_adjust_mode, clk_blinking, clk_segment_selector;
	
	reg [7:0] segout = 8'b0000000;
	reg [3:0] anout = 4'b0000;
	
	assign seg[0] = segout[0];
	assign seg[1] = segout[1];
	assign seg[2] = segout[2];
	assign seg[3] = segout[3];
	assign seg[4] = segout[4];
	assign seg[5] = segout[5];
	assign seg[6] = segout[6];
	assign seg[7] = segout[7];
	
	assign an[0] = anout[0];
	assign an[1] = anout[1];
	assign an[2] = anout[2];
	assign an[3] = anout[3];
	
	reg[1:0] anode_selected = 2'b00;
	
	//Module instance declarations
	clock_generator clockGenerator(
		.clk(clk),
		.rst(reset),
		.clk_1hz(clk_seconds),
		.clk_2hz(clk_adjust_mode),
		.clk_5hz(clk_blinking),
		.clk_400hz(clk_segment_selector)
	);
	
	counter number_determiner(
		.rst(reset),
		.clk_normal(clk_seconds), 
		.clk_fast(clk_adjust_mode),
		.stop(pause),
		.sel(select),
		.adjust(adjust),
		.seconds(seconds_value),
		.deca_seconds(deca_seconds_value),
		.minutes(minutes_value),
		.deca_minutes(deca_minutes_value)
	); 
	
	seven_seg seconds_display(
		.number(seconds_value),
		.seven_seg_display_number(seconds_seg_value)
	);
	
	seven_seg deca_seconds_display(
		.number(deca_seconds_value),
		.seven_seg_display_number(deca_seconds_seg_value)
	);
	
	seven_seg minutes_display(
		.number(minutes_value),
		.seven_seg_display_number(minutes_seg_value)
	);
	
	seven_seg deca_minutes_display(
		.number(deca_minutes_value),
		.seven_seg_display_number(deca_minutes_seg_value)
	);
	
	debouncer buttonS(
		.btn(btnS),
		.clk_debouncer(clk_segment_selector),
		.button_out(reset)
	);	//reset 
	
	debouncer buttonR(
		.btn(btnR),
		.clk_debouncer(clk_segment_selector),
		.button_out(pause)
	);	//pause
	
		debouncer switch_adjust(
		.btn(sw[0]),
		.clk_debouncer(clk_segment_selector),
		.button_out(adjust)
	);	//adjust
	
		debouncer switch_select(
		.btn(sw[1]),
		.clk_debouncer(clk_segment_selector),
		.button_out(select)
	);	//select

	always @(posedge clk_segment_selector) begin
	
		//Blinking not active
		if (adjust == 0) begin
			if (anode_selected == 0) begin
				anout <= 4'b1110;
				segout <= seconds_seg_value;
				anode_selected <= anode_selected + 1;
			end
			else if (anode_selected == 1) begin
				anout <= 4'b1101;
				segout <= deca_seconds_seg_value;
				anode_selected <= anode_selected + 1;
			end 
			else if (anode_selected == 2) begin
				anout <= 4'b1011;
				segout <= minutes_seg_value;
				anode_selected <= anode_selected + 1;
			end 
			else if (anode_selected == 3) begin 
				anout <= 4'b0111;
				segout <= deca_minutes_seg_value;
				anode_selected <= anode_selected + 1;
			end
		end
		
		//Blinking is active
		else begin
			//Seconds blinking
			if (select == 1) begin
				if (anode_selected == 0) begin
					if (clk_blinking == 1)
						anout <= 4'b0001;
					else
						anout <= 4'b0000;
					segout <= seconds_seg_value;
					anode_selected <= anode_selected + 1;
				end
				else if (anode_selected == 1) begin
					if (clk_blinking == 1)
						anout <= 4'b0010;
					else
						anout <= 4'b0000;
					segout <= deca_seconds_seg_value;
					anode_selected <= anode_selected + 1;
				end 
				else if (anode_selected == 2) begin
					anout <= 4'b0100;
					segout <= minutes_seg_value;
					anode_selected <= anode_selected + 1;
				end 
				else if (anode_selected == 3) begin 
					anout <= 4'b1000;
					segout <= deca_minutes_seg_value;
					anode_selected <= anode_selected + 1;
				end
			end
			//Minutes blinking
			else begin
				if (anode_selected == 0) begin
					anout <= 4'b0001;
					segout <= seconds_seg_value;
					anode_selected <= anode_selected + 1;
				end
				else if (anode_selected == 1) begin
					anout <= 4'b0010;
					segout <= deca_seconds_seg_value;
					anode_selected <= anode_selected + 1;
				end 
				else if (anode_selected == 2) begin
					if (clk_blinking == 1)
						anout <= 4'b0100;
					else
						anout <= 4'b0000;
					segout <= minutes_seg_value;
					anode_selected <= anode_selected + 1;
				end 
				else if (anode_selected == 3) begin 
					if (clk_blinking == 1)
						anout <= 4'b1000;
					else
						anout <= 4'b0000;
					segout <= deca_minutes_seg_value;
					anode_selected <= anode_selected + 1;
				end
			end
		end
	end
	
endmodule