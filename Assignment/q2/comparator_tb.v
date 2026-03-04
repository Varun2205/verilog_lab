`timescale 1ns/1ps

module comparator_tb();
reg [3:0] a;
reg [3:0] b;
wire gt,ls,eq;

comparator uut(.a(a),.b(b),.gt(gt),.ls(ls),.eq(eq));

initial begin
    $dumpfile("comparator.vcd");   // VCD file name
    $dumpvars(0, comparator_tb);

    $display("  a     b   |    gt      ls       eq");
    $display("--------------------------------------");

    // Test Case 1: a = b
    a = 4'b0000; b = 4'b0000; #10;
    $display(" %b  %b  |    %b       %b       %b", a, b, gt, ls, eq);

    // Test Case 2: a > b
    a = 4'b0101; b = 4'b0011; #10;
    $display(" %b  %b  |    %b       %b       %b", a, b, gt, ls, eq);

    // Test Case 3: a < b
    a = 4'b0010; b = 4'b0111; #10;
    $display(" %b  %b  |    %b       %b       %b", a, b, gt, ls, eq);

    // Test Case 4: Random values
    a = 4'b1111; b = 4'b0001; #10;
    $display(" %b  %b  |    %b       %b       %b", a, b, gt, ls, eq);

    a = 4'b1000; b = 4'b1001; #10;
    $display(" %b  %b  |    %b       %b       %b", a, b, gt, ls, eq);

    a = 4'b0110; b = 4'b0110; #10;
    $display(" %b  %b  |    %b       %b       %b", a, b, gt, ls, eq);

    $finish;
end

    
endmodule