`timescale 1ns / 1ps

module counter4bit2(clk, rst, a
    );
	input clk, rst;
    output reg [3:0] a;

    always @ (posedge clk)
        if (rst)
            a <= 4'b0000;
        else
            a <= a + 1'b1;
endmodule