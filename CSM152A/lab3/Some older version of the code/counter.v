module counter( rst, clk_normal, clk_fast, stop, sel, adjust, seconds, deca_seconds, minutes, deca_minutes); 

input wire rst, clk_normal, clk_fast, sel, stop, adjust;
output wire [3:0] seconds;
output wire [3:0] deca_seconds;
output wire [3:0] minutes;
output wire [3:0] deca_minutes;
wire clk_selected;

reg [3:0] seconds_count;
reg [3:0] deca_seconds_count;
reg [3:0] minutes_count;
reg [3:0] deca_minutes_count;
reg stopped;

assign seconds = seconds_count;
assign deca_seconds = deca_seconds_count;
assign minutes = minutes_count;
assign deca_minutes = deca_minutes_count;

always @(posedge stop) begin
	stopped <= ~stopped;
end

//Logic for adjustment mode set to 0
always @(posedge clk_normal or posedge rst) begin

	if(rst) begin
		seconds_count <= 0;
		deca_seconds_count <= 0;
		minutes_count <= 0;
		deca_minutes_count <= 0;
	end
	else begin
		//Normal Counter
		if (adjust == 0 && ~stopped) begin
			if (seconds_count == 9) begin
					seconds_count <= 0;
					if (deca_seconds_count == 5) begin
						deca_seconds_count <= 0;
						if (minutes_count == 9) begin
							minutes_count <= 0;
							if (deca_minutes_count == 9) begin
								deca_minutes_count <= 0;
							end
							else
								deca_minutes_count <= deca_minutes_count + 1;
						end
						else
							minutes_count <= minutes_count + 1;
					end
					else
						deca_seconds_count <= deca_seconds_count + 1;
			end
			else
					seconds_count <= seconds_count + 1;
			end
		end 
	end
end

//Logic for adjustment mode set to 1
always @(posedge clk_fast or posedge rst) begin
	if(rst) begin
		seconds_count <= 0;
		deca_seconds_count <= 0;
		minutes_count <= 0;
		deca_minutes_count <= 0;
	end
	
	// Seconds Selected
	else begin
		if (adjust == 1 && sel == 1 && ~stopped) begin
			if (seconds_count == 9) begin
				seconds_count <= 0;
				if (deca_seconds_count == 5) begin
					deca_seconds_count <= 0;
				end
				else begin
					deca_seconds_count = deca_seconds_count + 1;
				end
			end
			else begin
				seconds_count = seconds_count + 1;
			end
		end
	end
	
	// Minutes Selected
	else begin
		if (adjust == 1 && sel == 0 && ~stopped) begin
			if (minutes_count == 9) begin
				minutes_count <= 0;
				if (deca_minutes_count == 9) begin
					deca_minutes_count <= 0;
				end
				else begin
					deca_minutes_count = deca_minutes_count + 1;
				end
			end
			else begin
				minutes_count = minutes_count + 1;
			end
		end
	end
end

endmodule