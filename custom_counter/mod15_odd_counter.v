`timescale 1ns / 1ps
module mod15_odd_counter(input clk,rst,
                            output reg [3:0] count);

always @(posedge clk) begin
    if (rst)
        count <= 4'd1;
    else begin
        if (count == 4'd15)
            count <= 4'd1;
        else 
            count <= count + 4'd2;
    end
end

    
endmodule

