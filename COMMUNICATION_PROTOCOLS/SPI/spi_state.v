module spi_state (
    input clk, rst,
    input [15:0] data_in,
    output spi_cs, spi_sclk, spi_data,
    output [4:0] counter
);

reg MOSI;
reg [4:0] count;
reg cs, sclk;
reg [2:0] state;

always @(posedge clk) begin
    if (rst) begin
        MOSI <= 1'd0;
        count <= 5'd16;
        cs <= 1'd1;
        sclk <= 1'd0;
        state <= 3'd0;
    end
    else begin
        case (state)
            0: begin // IDLE
                sclk <= 1'd0;
                cs <= 1'd1;
                state <= 1;
            end 

            1: begin // LOAD BIT
                sclk <= 1'd0;
                cs <= 1'd0;
                if (count > 0) begin
                    MOSI <= data_in[count-1];
                    count <= count - 1;
                end
                state <= 2;
            end

            2: begin // CLOCK HIGH
                sclk <= 1'd1;
                if (count > 0)
                    state <= 1;
                else begin
                    count <= 5'd16;
                    state <= 0;
                end
            end

            default: state <= 0;
        endcase
    end
end

assign spi_cs = cs;
assign spi_sclk = sclk;
assign spi_data = MOSI;
assign counter = count;

endmodule