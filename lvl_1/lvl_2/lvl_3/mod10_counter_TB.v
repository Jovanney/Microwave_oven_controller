`include "mod10_counter.v"

module mod10_counter_TB();

    reg clock = 1;
    reg loadn = 1;
    reg clrn = 1;
    reg en = 1;
    reg [3:0] data;
    wire [3:0] Dout;
    wire tc;
    wire zero;

    mod10_counter DUT(Dout, tc, zero, data, loadn, clrn, clock, en);
    parameter NUM = 7;

    always #5 clock = ~clock;

    always @(posedge clock && loadn == 1) begin
        if(Dout == NUM + 1 && loadn == 1) begin 
            $finish;
        end
    end

    initial begin
        $dumpfile("mod10_counter.vcd");
        $dumpvars;
        data = NUM;
        loadn = 0;
        #10 loadn = 1;
    end

endmodule