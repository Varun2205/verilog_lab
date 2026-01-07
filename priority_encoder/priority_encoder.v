`timescale 1ns / 1ps
module priority_encoder(
input [3:0]D,
output A,B,V
);
assign V = |D;
assign B = ((~D[2])&(~D[0]));
assign A = (D[2] | ((~D[0])&(~D[1])));
endmodule
