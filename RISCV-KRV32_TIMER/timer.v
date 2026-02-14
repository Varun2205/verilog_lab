`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: VARUN VARMA
// 
// Create Date: 02/14/2026 05:25:23 PM
// Design Name: TIMER
// Module Name: timer
// Project Name: KRV32
// Target Devices: ARTYX7 NEXUS 4DDR
// Tool Versions: VIVADO 2024.2

// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module timer( input  wire clk,
              input  wire rst,
              input  wire [31:0] addr,
              input  wire [31:0] wdata,
              input  wire [3:0]  wr,
              input  wire        rstrb,

              output reg  [31:0] rdata,
              output wire        irq);
      
   reg [63:0] mtime;
    reg [63:0] mtimecmp;

    //counter
    always @(posedge clk or posedge rst) begin
        if (rst)
            mtime <= 64'd0;
        else
            mtime <= mtime + 1;
    end

    // Write logic
    wire timer_sel = (addr[31:16] == 16'h4000);

    always @(posedge clk) begin
        if (timer_sel && |wr) begin
            case (addr[3:2])
                2'b10: begin // mtimecmp low
                    if (wr[0]) mtimecmp[7:0]   <= wdata[7:0];
                    if (wr[1]) mtimecmp[15:8]  <= wdata[15:8];
                    if (wr[2]) mtimecmp[23:16] <= wdata[23:16];
                    if (wr[3]) mtimecmp[31:24] <= wdata[31:24];
                end

                2'b11: begin // mtimecmp high
                    if (wr[0]) mtimecmp[39:32] <= wdata[7:0];
                    if (wr[1]) mtimecmp[47:40] <= wdata[15:8];
                    if (wr[2]) mtimecmp[55:48] <= wdata[23:16];
                    if (wr[3]) mtimecmp[63:56] <= wdata[31:24];
                end
            endcase
        end
    end


    // Read logic
    always @(*) begin
        rdata = 32'd0;

        if (timer_sel && rstrb) begin
            case (addr[3:2])
                2'b00: rdata = mtime[31:0];
                2'b01: rdata = mtime[63:32];
                2'b10: rdata = mtimecmp[31:0];
                2'b11: rdata = mtimecmp[63:32];
            endcase
        end
    end

    // Interrupt generation
    assign irq = (mtime >= mtimecmp);
endmodule

