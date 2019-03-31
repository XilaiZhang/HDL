module debouncer( btnS, clk, button_s_out); 

input btnS, clk;
output reg button_s_out;

reg [2:0] step_d; //= 3'b000;

always @ (posedge clk) begin
	if(~step_d[0] & step_d[1])begin
		button_s_out=1'b1;
	end
	else if (step_d[0] & ~step_d[1])begin
		button_s_out=1'b0;
	end
          
	step_d[2:0]  <= {btnS, step_d[2:1]};
end

endmodule