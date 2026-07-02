`default_nettype none
`timescale 1ns / 1ps

module tb ();

    // Dump waveform để GitHub Actions tìm thấy file
    initial begin
        $dumpfile("test/tb.vcd");   // tạo file VCD đúng đường dẫn
        $dumpvars(0, tb);
    end

    // Khai báo tín hiệu
    reg        clk;
    reg        rst_n;
    reg        ena;
    reg  [7:0] ui_in;
    reg  [7:0] uio_in;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

`ifdef GL_TEST
    wire VPWR = 1'b1;
    wire VGND = 1'b0;
`endif

    // Đồng bộ tên module với project
    tt_um_nguyenminhquang69_sys_full_adder user_project (
`ifdef GL_TEST
        .VPWR(VPWR),
        .VGND(VGND),
`endif
        .ui_in  (ui_in),
        .uo_out (uo_out),
        .uio_in (uio_in),
        .uio_out(uio_out),
        .uio_oe (uio_oe),
        .ena     (ena),
        .clk     (clk),
        .rst_n   (rst_n)
    );

    // Sinh tín hiệu test
    initial begin
        clk   = 0;
        rst_n = 0;
        ena   = 0;
        ui_in = 8'b00000000;
        uio_in= 8'b00000000;

        #5  rst_n = 1; ena = 1;
        #10 ui_in = 8'b00000011; uio_in = 8'b00000001; // 3 + 1
        #10 ui_in = 8'b00000101; uio_in = 8'b00000010; // 5 + 2
        #10 ui_in = 8'b00001010; uio_in = 8'b00000101; // 10 + 5
        #50 $finish;
    end

    // Clock 100MHz (chu kỳ 10ns)
    always #5 clk = ~clk;

endmodule
