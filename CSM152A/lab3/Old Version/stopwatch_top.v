


module stopwatch_top(clk,seg,an,btnS,btnR,sw);
	input clk,btnR,btnS,sw[7:0];
	output seg[7:0],an[3:0];
	
	
	reg [3:0] seconds, deca_seconds, minutes, deca_minutes;
	wire rst,clk_1hz,clk_2hz,clk_5hz,clk_400hz;
	wire button_s_out;		//reset
	wire button_r_out;		//pause
	// wire [7:0] switch;
	wire [7:0] segout;
	wire [3:0] anout;
	
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
	
	//Module instance declarations
	clock_generator clockGenerator(.clk(clk),.rst(rst),.clk_1hz(clk_1hz),.clk_2hz(clk_2hz),.clk_5hz(clk_5hz),.clk_400hz(clk_400hz));
	seven_seg boardDisplay(.seconds(seconds),.deca_seconds(deca_seconds),.minutes(minutes),.deca_minutes(deca_minutes),.clk(clk),.seg_(segout),.an_(anout));
	debouncer buttonS(.btnS(btnS),.clk(clk_400hz),.button_s_out(button_s_out));	//reset 
	debouncer buttonR(.btnS(btnR),.clk(clk_400hz),.button_s_out(button_r_out));	//pause
	// debouncer switch0(.sw[0](stnS),.clk_400hz(clk),.switch[0](button_s_out));
	// debouncer switch0(.sw[1](stnS),.clk_400hz(clk),.switch[1](button_s_out));
	// debouncer switch0(.sw[2](stnS),.clk_400hz(clk),.switch[2](button_s_out));
	// debouncer switch0(.sw[3](stnS),.clk_400hz(clk),.switch[3](button_s_out));
	// debouncer switch0(.sw[4](stnS),.clk_400hz(clk),.switch[4](button_s_out));
	// debouncer switch0(.sw[5](stnS),.clk_400hz(clk),.switch[5](button_s_out));
	// debouncer switch0(.sw[6](stnS),.clk_400hz(clk),.switch[6](button_s_out));
	// debouncer switch0(.sw[7](stnS),.clk_400hz(clk),.switch[7](button_s_out));
	
	
	
	/*
		Will also need to handle the input from switches.
	*/
	
	
	
	
	always @(posedge clk_1hz) begin
		if(rst) begin
			seconds = 0;
			deca_seconds = 0;
			minutes = 0;
			deca_minutes = 0;
		end
		else begin
		//Add pause case here.
		
		
		
		
		
		//End space to add case
			if (seconds == 9) begin
				seconds = 0;
				if (deca_seconds == 5) begin
					deca_seconds = 0;
					if (minutes == 9) begin
						minutes = 0;
						if (deca_minutes == 9) begin
							deca_minutes = 0;
						end
						else
							deca_minutes = deca_minutes + 1;
					end
					else
						minutes = minutes + 1;
				end
				else
					deca_seconds = deca_seconds + 1;
			end
			else
				seconds = seconds + 1;
		end
	end
	
	
	
	
	
endmodule