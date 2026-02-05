`timescale 1ns / 1ps
module tb_d_flip_flop();
reg clk,rst,d;
wire q;

d_flip_flop uut(.clk(clk),.rst(rst),.d(d),.q(q));

always #5 clk = ~clk;
initial begin
     clk=0;rst=1;d=0;#10;
     rst=1;
     
     #10;
     d=1;#10;
     d=0;#10
     d=1;#10;
     
     rst=1;#10;
     rst=0;#10;
     
     d=0;#10;
     d=1;#10;
     $finish;
     
end
initial begin
        $monitor("Time=%0t | clk=%b reset=%b d=%b q=%b",
                  $time, clk, reset, d, q);
    end
endmodule

