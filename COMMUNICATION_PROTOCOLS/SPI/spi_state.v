module spi_state (
    input       clk, rst,
    input       start,                //  edge triggers a new transmission
    input [15:0] data_in,
    output      spi_cs, spi_sclk, spi_data,
    output      busy,                 // high during transmission
    output      done,                 // single‑cycle pulse at the end
    output [4:0] counter
);

    // SPI mode 0: idle low, data valid on rising edge
    reg        mosi, cs, sclk;
    reg [15:0] shift_reg;             // latched data, shifted left each bit
    reg [4:0]  bits_remaining;        // bits left to send (16,15,...,0)
    reg [1:0]  state;

    // Handshake
    reg        busy_reg;
    reg        done_reg;
    reg        start_d;               // edge detector for 'start'
    wire       start_rise = start && !start_d;

    // States
    localparam IDLE      = 2'b00,
               LOAD_BIT  = 2'b01,
               CLOCK_HIGH= 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mosi           <= 1'b0;
            cs             <= 1'b1;
            sclk           <= 1'b0;
            shift_reg      <= 16'd0;
            bits_remaining <= 5'd16;
            state          <= IDLE;
            busy_reg       <= 1'b0;
            done_reg       <= 1'b0;
            start_d        <= 1'b0;
        end 
        else begin
            start_d <= start;                     // sample start for edge detection
            done_reg <= 1'b0;                    // default: done pulse low

            case (state)
                IDLE: begin
                    cs       <= 1'b1;
                    sclk     <= 1'b0;
                    busy_reg <= 1'b0;

                    if (start_rise) begin
                        // latch data and begin transmission
                        shift_reg      <= data_in;
                        bits_remaining <= 5'd16;
                        cs             <= 1'b0;  // assert chip select
                        busy_reg       <= 1'b1;
                        state          <= LOAD_BIT;
                    end
                end

                LOAD_BIT: begin
                    sclk <= 1'b0;
                    cs   <= 1'b0;
                    // output MSB first
                    mosi <= shift_reg[15];
                    state <= CLOCK_HIGH;
                end

                CLOCK_HIGH: begin
                    sclk <= 1'b1;                 // rising edge – slave captures
                    // prepare for next bit
                    shift_reg <= {shift_reg[14:0], 1'b0};
                    bits_remaining <= bits_remaining - 1'b1;

                    if (bits_remaining == 5'd1) begin
                        // last bit just sent
                        cs       <= 1'b1;
                        sclk     <= 1'b0;
                        busy_reg <= 1'b0;
                        done_reg <= 1'b1;
                        state    <= IDLE;
                    end else begin
                        state    <= LOAD_BIT;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end

    // Output assignments
    assign spi_cs   = cs;
    assign spi_sclk = sclk;
    assign spi_data = mosi;
    assign busy     = busy_reg;
    assign done     = done_reg;
    assign counter  = bits_remaining;

endmodule