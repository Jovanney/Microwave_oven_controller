`include "clock.v"

module clock_TB ();

    wire out;
    clock clock_DUT (out);

    initial begin
        $dumpfile("clock.vcd");
        $dumpvars(0, clock_TB);

        #1000 $finish;
    end
endmodule