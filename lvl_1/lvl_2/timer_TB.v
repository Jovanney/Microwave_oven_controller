`timescale 1ms/1ps
`include "timer.v"
module timer_tb();

    reg [3:0] data = 4'b0111;
    wire [3:0] Dout;
    reg loadn;
    reg clrn=1'b1;
    reg clock=1'b0;
    reg en = 1'b1;
    wire [3:0] sec_ones;
    wire [3:0] sec_tens;
    wire [3:0] mins;
    wire zero;

    timer DUT(sec_ones, sec_tens, mins, zero, data, loadn, clrn, clock, en);

    always #5 clock = ~clock;

    initial begin
        $dumpfile("timer.vcd");
        $dumpvars;
        loadn = 0;
        data = 1;
        #10 data = 9;
        #10 data = 9;
        #10 loadn = 1;
    end

    always @ (zero, sec_ones, sec_tens, mins) begin
        if(sec_ones==0 && sec_tens ==5 && mins == 0) clrn <= 0;
        if(loadn ==1 && zero==1) $finish;
    end

endmodule