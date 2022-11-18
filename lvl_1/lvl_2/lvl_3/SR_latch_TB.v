`include "SR_latch.v"

module SR_latch_TB ();

    reg S, R;
    wire mag_on;

    SR_latch DUT (.S(S), .R(R), .mag_on(mag_on));

    initial begin
        $dumpfile("SR_latch.vcd");
        $dumpvars(0, SR_latch_TB);

        #5 S = 0;
        #5 R = 0;

        #5 R = 1;
        #5 R = 0;

        #5 S = 1;
        #5 S = 0;

        #5 R = 1;
        #5 S = 1;

        #5 R = 0;
        #5 S = 0;

        #5 $finish;
    end
endmodule