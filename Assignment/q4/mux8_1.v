module mux8_1 (input a,b,c,d,
               output F
);

always @(*) begin
    case ({a,b,c})
        3'b000: F = 1'b0;  // I0
        3'b001: F = 1'b1;  // I1
        3'b010: F = 1'b0;  // I2
        3'b011: F = D;     // I3
        3'b100: F = 1'b0;  // I4
        3'b101: F = 1'b1;  // I5
        3'b110: F = 1'b1;  // I6
        3'b111: F = 1'b1;  // I7 
    endcase
end

endmodule