`timescale 1ns / 1ps

module sign_magnitude_converter(sign_mag, twos_comp, sign);
input [11:0] sign_mag;
output [11:0] twos_comp;
output sign;
assign sign = sign_mag[11];

assign twos_comp = (sign_mag[11] == 1) ? ~sign_mag + 1'b1 : sign_mag;

endmodule