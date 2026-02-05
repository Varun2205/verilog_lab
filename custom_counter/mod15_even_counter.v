`timescale 1ns / 1ps
module tb_even_counter();
reg clk,rst;
wire [3:0] count;
//mod15_even_counter uut(.clk(clk),.rst(rst),.count(count));
//mod15_odd_counter uut(.clk(clk),.rst(rst),.count(count));
custom_seq_counter uut(.clk(clk),.rst(rst),.q(count));
always #5 clk = ~clk;

initial begin
    clk=0;rst=1;
      // Hold reset for a few clock cycles
        #12;
        rst = 0;

        // Run long enough to see multiple wrap-arounds
        #200;

        // End simulation
        $finish;
end

endmodule

