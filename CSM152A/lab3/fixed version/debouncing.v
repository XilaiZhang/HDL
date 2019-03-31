module debouncer( btn, clk_debouncer, button_out); 

input wire btn, clk_debouncer;
output reg button_out = 0;

reg [2:0] step_d = 3'b000;

always @ (posedge clk_debouncer) begin
	if(~step_d[0] & step_d[1])begin
		button_out = 1'b1;
	end
	else if (step_d[0] & ~step_d[1])begin
		button_out = 1'b0;
	end
          
	step_d[2:0]  <= {btn, step_d[2:1]};
end

endmodule