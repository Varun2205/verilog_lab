//testbench code
`timescale 1ns / 1ps
module add_sub_tst();
reg [3:0] a,b;
reg mode;
wire [3:0] SUM;
wire COUT;
add_sub uut(.a(a),.b(b),.mode(mode),.sum(SUM),.cout(COUT));
initial begin
	a=4;b=5;mode=0;
	#10 a=9;b=8;
	#10 mode=1;a=7;b=5;
	#10 a=2;b=8;
	#20 $finish;
	end
endmodule
