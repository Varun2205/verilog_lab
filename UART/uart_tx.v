module uart_tx (
    input  wire clk,
    input  wire reset,
    input  wire start,
    input  wire [7:0] data,
    output reg  tx,
    output wire ready
);

    parameter CLK_FREQ = 100_000_000;
    parameter BAUD     = 9600;
    localparam DIVIDER = CLK_FREQ / BAUD;

    reg [$clog2(DIVIDER)-1:0] baud_counter;
    reg baud_tick;

    reg [3:0] bit_index;
    reg [7:0] shift_reg;
    reg tx_busy;

    assign ready = ~tx_busy;

    // ------------------------------------------
    // Baud generator (1 clock pulse tick)
    // ------------------------------------------
    always @(posedge clk) begin
        if (reset) begin
            baud_counter <= 0;
            baud_tick    <= 0;
        end else if (baud_counter == DIVIDER-1) begin
            baud_counter <= 0;
            baud_tick    <= 1'b1;
        end else begin
            baud_counter <= baud_counter + 1;
            baud_tick    <= 1'b0;
        end
    end

    // ------------------------------------------
    // UART Transmitter
    // ------------------------------------------
    always @(posedge clk) begin
        if (reset) begin
            tx        <= 1'b1;  // idle
            tx_busy   <= 1'b0;
            bit_index <= 0;
        end else begin

            // Start transmission immediately when requested
            if (!tx_busy && start) begin
                tx_busy   <= 1'b1;
                shift_reg <= data;
                tx        <= 1'b0;   // start bit
                bit_index <= 0;
            end

            // Advance bits only on baud tick
            else if (tx_busy && baud_tick) begin
                if (bit_index < 8) begin
                    tx <= shift_reg[bit_index];
                    bit_index <= bit_index + 1;
                end else if (bit_index == 8) begin
                    tx <= 1'b1;  // stop bit
                    bit_index <= bit_index + 1;
                end else begin
                    tx_busy <= 1'b0; // transmission complete
                end
            end

        end
    end

endmodule
