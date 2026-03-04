module tb_decade_counter();
reg clk,rst;
wire [3:0] count;

decade_counter uut(.clk(clk),.rst(rst),.count(count));

initial begin
    $dumpfile("counter.vcd");   // VCD file name
    $dumpvars(0, tb_decade_counter);
    $monitor("Time = %0t | Reset = %b | Counter = %d", $time, rst, count);
    clk = 0;rst = 1;

    #20; rst = 0;clk=1;
    #200;
    #20;rst = 1;
    #20;rst = 0;
    #200;

    $finish;
end

always #10 clk = ~clk;
endmodule