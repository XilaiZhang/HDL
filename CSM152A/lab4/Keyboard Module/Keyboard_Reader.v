`timescale 1ns / 1ps

module Keyboard_Reader(
    input         clk,
    input         PS2Data,
    input         PS2Clk,
	output     [7:0] scancode
);

    reg         CLK50MHZ=0;
    reg  [15:0] keycodev=0;
    wire [15:0] keycode;
    reg  [ 2:0] bcount=0;
	reg  [ 7:0] key_reg = 0;
    wire        flag;
    reg         cn=0;
	assign scancode = key_reg;
    
    always @(posedge(clk))begin
        CLK50MHZ<=~CLK50MHZ;
    end
    
    PS2Receiver uut (
        .clk(CLK50MHZ),
        .kclk(PS2Clk),
        .kdata(PS2Data),
        .keycode(keycode),
        .oflag(flag)
    );
    
    always@(keycode, keycodev)
        if (keycode[7:0] == 8'hf0) begin
            cn <= 1'b0;
            bcount <= 3'd0;
        end else if (keycode[15:8] == 8'hf0) begin
            cn <= keycode != keycodev;
            bcount <= 3'd5;
        end else begin
            cn <= keycode[7:0] != keycodev[7:0] || keycodev[15:8] == 8'hf0;
            bcount <= 3'd2;
        end
    
    always@(posedge clk)
        if (flag == 1'b1 && cn == 1'b1) begin
            keycodev <= keycode;
			if (keycode[15:8] == 8'hf0)
				key_reg <= 0;
			else
				key_reg <= keycode[7:0];
        end 
endmodule
