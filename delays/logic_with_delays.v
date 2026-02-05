`timescale 1ns / 1ps

module logic_with_delays (
    input  wire a, b,
    input  wire en_and, en_or,
    output wire y_and,
    output wire y_or
);

    wire and_out, or_out;

    // Gate delays: #(rise, fall)
    and #(4, 2) u1 (and_out, a, b);   // rise=4ns, fall=2ns
    or  #(3, 5) u2 (or_out,  a, b);   // rise=3ns, fall=5ns

    // Tri-state buffer to observe turn-off delay to Z
    // turn-off delay = min(rise, fall)
    bufif1 #(4, 2) b1 (y_and, and_out, en_and); // to Z in 2ns
    bufif1 #(3, 5) b2 (y_or,  or_out,  en_or);  // to Z in 3ns

endmodule


