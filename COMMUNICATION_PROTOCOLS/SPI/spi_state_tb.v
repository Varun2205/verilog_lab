`timescale 1ns/1ps

module spi_state_tb;

    reg clk;
    reg rst;
    reg [15:0] data_in;

    wire spi_cs;
    wire spi_sclk;
    wire spi_data;
    wire [4:0] counter;

    // Instantiate DUT
    spi_state uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .spi_cs(spi_cs),
        .spi_sclk(spi_sclk),
        .spi_data(spi_data),
        .counter(counter)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Dump waveform
        $dumpfile("spi_state.vcd");
        $dumpvars(0, spi_state_tb);

        // Initialize signals
        clk = 0;
        rst = 1;
        data_in = 16'hA5A5; // test pattern

        // Apply reset
        #20;
        rst = 0;

        // Let it run for a while
        #500;

        // Change input data mid-simulation
        data_in = 16'h3C7E;

        #500;

        // Finish simulation
        $finish;
    end

endmodule