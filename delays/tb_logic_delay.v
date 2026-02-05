`timescale 1ns/1ps

module tb_logic_delay();

    reg a, b;
    reg en_and, en_or;
    wire y_and, y_or;

    logic_with_delays DUT (a, b, en_and, en_or, y_and, y_or);

    initial begin
        $monitor("T=%0t | a=%b b=%b | en_and=%b en_or=%b | y_and=%b y_or=%b",
                  $time, a, b, en_and, en_or, y_and, y_or);

        // Initial state
        a = 0; b = 0; en_and = 1; en_or = 1;

        #5  a = 1;          // AND/OR rising transitions
        #5  b = 1;

        #10 en_and = 0;     // AND output → Z (after 2ns)
        #10 en_or  = 0;     // OR output  → Z (after 3ns)

        #10 en_and = 1;     // Re-enable
        #10 a = 0;          // Falling transitions

        #20 $finish;
    end

endmodule


