`timescale 1ns / 1ps
module add_sub(
	input [3:0] a,b,
	input mode,
	output [3:0] sum,
	output cout
);
wire c0,c1,c2;
wire [3:0] b_xor;
assign b_xor = b^{4{mode}};
full_adder fa0
(.a(a[0]),.b(b_xor[0]),.cin(mode),.s(sum[0]),.cout(c0));
full_adder fa1 (.a(a[1]),.b(b_xor[1]),.cin(c0),.s(sum[1]),.cout(c1));
full_adder fa2 (.a(a[2]),.b(b_xor[2]),.cin(c1),.s(sum[2]),.cout(c2));
full_adder fa3
(.a(a[3]),.b(b_xor[3]),.cin(c2),.s(sum[3]),.cout(cout));
endmodule
