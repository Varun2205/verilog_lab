module decade_counter (input clk,rst,
                       output reg [3:0] count
);

always @(posedge clk) begin
    if (rst)
        count <= 4'd0;
    else begin
        if (count >= 4'd9)
            count <= 4'd0;
        else
            count <= count + 4'd1;
    end
end

endmodule