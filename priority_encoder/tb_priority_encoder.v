`timescale 1ns / 1ps

module tb_priority_encoder();
reg [3:0]D;
wire A,B,V;
integer i;
priority_encoder dut(.D(D),.A(A),.B(B),.V(V));
initial
	begin
		for (i=0;i<17;i=i+1)
			begin
				D = $random;
					#10; $display("D=%b,A=%b,B=%b,V=%b",D,A,B,V);
			end
			#20 $finish;
		end
endmodule
