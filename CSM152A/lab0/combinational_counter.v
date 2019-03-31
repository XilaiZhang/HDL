`timescale 1ns / 1ps

module counter4bit1(clk, rst, a0,a1,a2,a3
    );
	input clk, rst;
	output a0, a1, a2, a3;
	reg a0, a1, a2, a3;
	
	always @ (posedge clk)
    begin
      //a0 impl.
       if (rst)
         a0 <= 1'b0;
       else
         a0 <= ~a0;

       //a1 impl.
       if (rst)
         a1 <= 1'b0;
       else
         a1 <= a0 ^ a1;

       //a2 impl.
       if (rst)
         a2 <= 1'b0;
       else
         a2 <= (a0 & a1) ^ a2;

       //a3 impl.
       if (rst)
         a3 <= 1'b0;
       else
         a3 <= ((a0 & a1) & a2) ^ a3;
    end
endmodule