`timescale 1ns / 1ps
module counter(
    input rst,clk,
    output reg [7:0] count
    );
    reg tick;
    reg [25:0] divcount;
    initial begin
        count = 0;
        tick = 0;
        divcount = 0;
    end 
    //clock divisor
    always @ (posedge clk) begin
        if (divcount == 50000000) begin
            divcount <= 0;
            tick <= !tick;
        end 
        else
            divcount <= divcount+1;
        end 
    
    // main counter 
    always @(posedge tick) begin
        if (rst)
            count <= 0;
        else
            count <= count+1;
        end
endmodule
