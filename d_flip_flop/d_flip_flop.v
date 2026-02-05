`timescale 1ns / 1ps
module d_flip_flop(input clk,rst,d,
                    output reg q);

always @(posedge clk) begin
    if (rst)
        q <= 1'b0;
    else 
        q <= d;
end

endmodule

