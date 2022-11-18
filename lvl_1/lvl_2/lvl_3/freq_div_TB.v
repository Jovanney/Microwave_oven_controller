`include "freq_div.v"
`include "clock.v"

module freq_div_TB ();

wire clock_in, clock_out;

clock clock_DUT (.out(clock_in));
freq_div freq_div_DUT (.clock_in(clock_in), .clock_out(clock_out));

initial begin
    $dumpfile("freq_div.vcd");
    $dumpvars(0, freq_div_TB);

    #10000 $finish;
end
    
endmodule