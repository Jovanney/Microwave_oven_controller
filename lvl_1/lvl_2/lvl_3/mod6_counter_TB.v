`include "mod6_counter.v"

module mod6_counter_TB();

    reg clock = 1;
    reg loadn = 1;
    reg clrn = 1;
    reg en = 1;
    reg [3:0] data;
    wire [3:0] Dout;
    wire tc;
    wire zero;

    mod6_counter DUT(Dout, tc, zero, data, loadn, clrn, clock, en);
    parameter NUM = 4;

    always #5 clock = ~clock;

    always @(posedge clock) begin
        if(Dout == NUM + 1 && loadn == 1) $finish;
    end

    initial begin
        $dumpfile("mod6_counter.vcd");
        $dumpvars;
        data = NUM;
        loadn = 0;
        #10 loadn = 1;
    end

endmodule