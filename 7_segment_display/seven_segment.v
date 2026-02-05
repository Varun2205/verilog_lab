`timescale 1ns / 1ps

module seven_segment(
    input rst,
    input [3:0] a,b,
    input [2:0] op,
    output reg [7:0] y,
    output [6:0] s,
    output [7:0] AN
    );

wire [3:0] bcd;
reg [6:0] seg;
assign AN=8'b11111110;
assign s=~seg;

always @(*) begin
    if(rst)
        y=0;
    else
        begin
        case(op)
         3'b000:y=a+b;
         3'b001:y=a-b;
         3'b010:y=a&b;
         3'b011:y=a|b;
         3'b100:y=a^b;
         3'b101:y=a>>b;
         3'b110:y=a<<b;
         3'b111:y=a*b;
         endcase
         end
     end


assign bcd = y[3:0];
always @(*) begin
    case (bcd)
    4'd0: seg = 7'b1111110;
    4'd1: seg = 7'b0110000;
    4'd2: seg = 7'b1101101;
    4'd3: seg = 7'b1111001;
    4'd4: seg = 7'b0110011;
    4'd5: seg = 7'b1011011;
    4'd6: seg = 7'b1011111;
    4'd7: seg = 7'b1110000;
    4'd8: seg = 7'b1111111;
    4'd9: seg = 7'b1111011;
    default: seg = 7'b0000000;
    endcase
    end
endmodule

