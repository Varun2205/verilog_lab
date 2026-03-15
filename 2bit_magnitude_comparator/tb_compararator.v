`timescale 1ns/1ps

module tb_comparator ();

reg [1:0] a,b;
wire lt,gt,eq;

comparator_2bit uut(.a(a),.b(b),.gt(gt),.lt(lt),.eq(eq));

initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(0, tb_comparator);

    $monitor("Time=%0t a=%b b=%b | a>b=%b a==b=%b a<b=%b",
              $time, a, b, gt, eq, lt);

    a = 2'b00; b = 2'b00; #10;
    a = 2'b01; b = 2'b00; #10;
    a = 2'b10; b = 2'b01; #10;
    a = 2'b11; b = 2'b10; #10;
    a = 2'b01; b = 2'b01; #10;
    a = 2'b00; b = 2'b11; #10;
    a = 2'b10; b = 2'b10; #10;

    #10 $finish;
end
    
endmodule