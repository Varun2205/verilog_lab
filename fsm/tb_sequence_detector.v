`timescale 1ns / 1ps
module tb_sequence_detector();
reg data,rst,clk;
wire y;
sequence_detector dut(.data(data),.rst(rst),.y(y),.clk(clk));
initial begin
    rst=1;clk=0;data=0;
    #50;
    rst=0;
    
    data=0;#10;
    data=1;#10;
    data=0;#10;
    data=1;#10;
    data=0;#10;
    data=1;#10;
    data=0;#10;
    data=1;#10;
    data=0;#10;
    
    $finish;
    end
always #5 clk=~clk;
endmodule

