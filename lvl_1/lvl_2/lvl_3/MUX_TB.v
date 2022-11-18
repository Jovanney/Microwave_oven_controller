`include "clock.v"
`include "freq_div.v"
`include "MUX.v"

module MUX_TB ();
    
    reg pgt, select;
    wire out, clock_in, clock_out;

    clock clock_DUT (clock_in);
    freq_div freq_div_DUT (.clock_in(clock_in), .clock_out(clock_out));
    mux MUX_DUT (.pgt(pgt), .clock(clock_out), .select(select), .out(out));

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, MUX_TB);

        select <= 1; // Selects 1Hz clock
        pgt <= 0;

        #20000 select <= 0; // Selects PGT
        #1000 pgt <= 1;
        #1000 pgt <= 0;
        #3000 pgt <= 1;
        #10000 pgt <= 0;

        #10000 select <= 1;
        #20000 select <= 0;

        #1000 $finish;
    end
endmodule