`timescale 1ns / 1ps

module mux4_2(input i0,i1,i2,i3,s0,s1,
                output y);
wire w1,w2;
mux2_1 mux1(.i0(i0),.i1(i1),.s(s0),.y(w1));
mux2_1 mux2(.i0(i2),.i1(i3),.s(s0),.y(w2));
mux2_1 mux3(.i0(w1),.i1(w2),.s(s1),.y(y));
endmodule

