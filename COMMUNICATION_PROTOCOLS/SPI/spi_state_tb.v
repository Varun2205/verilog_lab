`timescale 1ns/1ps

module spi_state_tb;

    // Inputs
    reg clk;
    reg rst;
    reg start;
    reg [15:0] data_in;

    // Outputs
    wire spi_cs;
    wire spi_sclk;
    wire spi_data;
    wire busy;
    wire done;
    wire [4:0] counter;

    // Instantiate DUT
    spi_state uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .data_in(data_in),
        .spi_cs(spi_cs),
        .spi_sclk(spi_sclk),
        .spi_data(spi_data),
        .busy(busy),
        .done(done),
        .counter(counter)
    );

    // Clock generation (10ns period → 100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        start = 0;
        data_in = 16'h0000;

        // Dump waveform
        $dumpfile("spi_state.vcd");
        $dumpvars(0, spi_state_tb);

        // Reset
        #20;
        rst = 0;

        // Wait a bit
        #20;

        // Send first data
        data_in = 16'hA5A5;
        start = 1;
        #10;
        start = 0;

        // Wait until done
        wait(done);

        #20;

        // Send another data
        data_in = 16'h3C7E;
        start = 1;
        #10;
        start = 0;

        wait(done);

        #50;

        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | CS=%b SCLK=%b MOSI=%b | BUSY=%b DONE=%b COUNT=%d DATA=%h",
                  $time, spi_cs, spi_sclk, spi_data, busy, done, counter, data_in);
    end

endmodule