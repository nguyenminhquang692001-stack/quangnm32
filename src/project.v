/*
 * Full Adder for Tiny Tapeout SKY
 * Author: nguyenminhquang69
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_nguyenminhquang69_sys_full_adder (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // Bidirectional input path
    output wire [7:0] uio_out,  // Bidirectional output path
    output wire [7:0] uio_oe,   // Bidirectional output enable
    input  wire       ena,      // Design enable
    input  wire       clk,      // Clock (unused)
    input  wire       rst_n     // Active-low reset (unused)
);

    // Inputs
    wire a   = ui_in[0];
    wire b   = ui_in[1];
    wire cin = ui_in[2];

    // Full-adder equations
    wire sum  = a ^ b ^ cin;
    wire cout = (a & b) | (a & cin) | (b & cin);

    // Output mapping:
    // uo_out[0] = SUM
    // uo_out[1] = COUT
    assign uo_out = {6'b000000, cout, sum};

    // Bidirectional pins are unused
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

    // Mark unused inputs to avoid lint warnings
    wire _unused = &{ena, clk, rst_n, uio_in, ui_in[7:3], 1'b0};

endmodule

`default_nettype wire
