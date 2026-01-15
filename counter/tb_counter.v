`timescale 1ns / 1ps
module tb_counter();
reg rst,clk;
wire [7:0]count;
counter dut(.rst(rst),.clk(clk),.count(count));
initial begin
    clk = 0; rst = 1; #50;
    rst = 0;
    #200;
    $finish;
end 
always #5 clk = ~clk;
endmodule

