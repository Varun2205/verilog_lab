`timescale 1ns / 1ps

module sequence_detector (input data,rst,clk,  
                          output reg y  
);

// State encoding for 5 states
reg [2:0] state;
parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

always @(posedge clk) begin
    if (rst) begin
        state <= S0;
        y <= 0;
    end
    else begin
        case (state)
            S0: begin
                if (data) begin
                    state <= S1;  // first bit '1' matched
                    y <= 0;
                end else begin
                    state <= S0;  // stay in idle
                    y <= 0;
                end
            end
            S1: begin
                if (data) begin
                    state <= S1;  // another '1' -> restart from first bit
                    y <= 0;
                end else begin
                    state <= S2;  // '0' gives "10"
                    y <= 0;
                end
            end
            S2: begin
                if (data) begin
                    state <= S3;  // '1' gives "101"
                    y <= 0;
                end else begin
                    state <= S0;  // '0' resets
                    y <= 0;
                end
            end
            S3: begin
                if (data) begin
                    state <= S4;  // '1' gives "1011"
                    y <= 0;
                end else begin
                    state <= S2;  // '0' gives "1010" -> suffix "10" matches
                    y <= 0;
                end
            end
            S4: begin
                if (data) begin
                    state <= S1;  // '1' after "1011" -> suffix "1" matches
                    y <= 0;
                end else begin
                    state <= S0;  // '0' completes "10110" -> detect!
                    y <= 1;
                end
            end
            default: begin
                state <= S0;
                y <= 0;
            end
        endcase
    end
end

endmodule