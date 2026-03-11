`timescale 1ns/1ps

module dual_port_ram (
    input clk, rst,
    input rw_a, rw_b,
    input [9:0] addr_a, addr_b,
    input [7:0] din_a, din_b,
    output reg [7:0] dout_a, dout_b
);

reg [7:0] RAM [0:1023];

always @(posedge clk) begin
    if (rst) begin
        dout_a <= 8'b0;
        dout_b <= 8'b0;
    end else begin
        case ({rw_a, rw_b})
            2'b00: begin 
                dout_a <= RAM[addr_a];
                dout_b <= RAM[addr_b];
            end
            2'b01: begin 
                dout_a <= RAM[addr_a];
                if (addr_a != addr_b)begin
                    RAM[addr_b] <= din_b;
                    dout_b <= RAM[addr_b];
                end

            end
            2'b10: begin               
                RAM[addr_a] <= din_a;        
                dout_b <= RAM[addr_b];      
            end
            2'b11: begin                    
                if (addr_a != addr_b) begin  
                    RAM[addr_a] <= din_a;
                    RAM[addr_b] <= din_b;
                    dout_a <= RAM[addr_a];
                    dout_b <= RAM[addr_b];
                 end
            end
        endcase
    end
end

endmodule