`timescale 1ns / 1ps
module tb_sequence_detector();
reg data, rst, clk;
wire y;

sequence_detector dut(.data(data),.rst(rst),.clk(clk),.y(y));

always #5 clk = ~clk;

initial begin
    $dumpfile("sequence_detector.vcd");
    $dumpvars(0, tb_sequence_detector);
    $monitor("Time=%0t, clk=%b, rst=%b, data=%b, y=%b", $time, clk, rst, data, y);

    rst = 1;data = 0;clk = 0;
    #20;
    rst = 0;
    #10;

    #10 data = 1; // bit 1
    #10 data = 0; // bit 2
    #10 data = 1; // bit 3
    #10 data = 1; // bit 4
    #10 data = 0; // bit 5 -> detection should occur here (y = 1)

    // Additional bits to observe behavior after detection
    #10 data = 1;
    #10 data = 0;
    #10 data = 1;
    #10 data = 1;
    #10 data = 0; // another detection
    #10 data = 1;
    #10 data = 0;
    #10 data = 1;
    #10 data = 0;
    #10 data = 1;
    #10 data = 1;
    #10 data = 0; // detection again
    #10;

    $finish;
end

endmodule