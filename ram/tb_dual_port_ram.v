`timescale 1ns/1ps

module tb_dual_port_ram();

reg clk,rst,rw_a,rw_b;
reg [9:0] addr_a, addr_b;
reg [7:0] din_a,din_b;
wire [7:0] dout_a,dout_b;

dual_port_ram uut(.clk(clk),.rst(rst),.rw_a(rw_a),.rw_b(rw_b),
                  .addr_a(addr_a),.addr_b(addr_b),.din_a(din_a),.din_b(din_b),
                  .dout_a(dout_a),.dout_b(dout_b));

initial begin
    $dumpfile("dual_port_ram.vcd");
    $dumpvars(0, tb_dual_port_ram);

    rst=1;clk=0;
    #50;rst=0;

    //ALL WRITE
    rw_a = 1; rw_b = 1;
    din_a = 13; din_b = 32;
    addr_a = 29; addr_b = 78;

    #50;

     // WRITE A , READ B
    rw_a = 1; rw_b = 0;
    din_a = 55;
    addr_a = 100;
    addr_b = 29;

    #50;

    // READ A , WRITE B
    rw_a = 0; rw_b = 1;
    addr_a = 78;
    addr_b = 500;
    din_b = 99;

    #50;

    // BOTH READ
    rw_a = 0; rw_b = 0;
    addr_a = 29;
    addr_b = 78;

    #50;

    // SAME ADDRESS TEST
    rw_a = 1; rw_b = 0;
    addr_a = 300;
    din_a = 77;
    addr_b = 300;

    #50;

    $finish;

end

always #10 clk = ~clk;


endmodule 