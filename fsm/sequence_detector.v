`timescale 1ns / 1ps
module sequence_detector(input data,rst,clk,
                          output reg y);
reg [1:0] state;
parameter s0=0,s1=1,s2=2,s3=3;
always @(posedge clk) begin
    if (rst) begin
        state <= s0;y<=0;
    end
    else
        case (state)
            s0:begin
                state <=data?s1:s0;
                y<=0;
                end
             s1:begin
                state <=data?s1:s2;
                y<=0;
                end
             s2:begin
                state <=data?s3:s0;
                y<=0;
                end
             s3:begin
                state <=data?s1:s2;
                y<=data?0:1;
                end
        endcase
end
endmodule

