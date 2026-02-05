`timescale 1ns / 1ps
module custom_seq_counter(input clk,rst,
                            output reg [3:0] q);
 // 1-2-3-5-9-11-15-repeat                      
always @(posedge clk) begin
    if (rst)
        q <= 4'd1;  // start from 1
    else begin
        case(q)
            4'd1:  q <= 4'd2;
            4'd2:  q <= 4'd3;
            4'd3:  q <= 4'd5;
            4'd5:  q <= 4'd9;
            4'd9:  q <= 4'd11;
            4'd11: q <= 4'd12;
            4'd12: q <= 4'd15;
            4'd15: q <= 4'd1;  // wrap around
            default: q <= 4'd0; // safety
        endcase
    end 
end

endmodule

