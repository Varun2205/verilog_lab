`timescale 1ns / 1ps
module mux2_1(input i0,i1,s,
               output y);
assign y = (s)?i1:i0;
endmodule

