`include "clock.v"
`include "NR_counter.v"

module NR_counter_TB ();

    wire clk, out;
    reg clear;

    clock clock_DUT (clk);
    NR_counter NR_counter_DUT (.clock(clk), .clear(clear), .out(out));

    initial begin
        $dumpfile("NR_counter.vcd");
        $dumpvars(0, NR_counter_TB);
        clear <= 1;

        #50 clear <= 0;
        #10 clear <= 1;

        #100 clear <= 0;
        #10 clear <= 1;

        #500 clear <= 0;
        #10 clear <= 1;

        #10 $finish;
    end
endmodule