`include "lvl_3/encoder.v"
`include "lvl_3/freq_div.v"
`include "lvl_3/MUX.v"
`include "lvl_3/NR_counter.v"

module input_timer_control (input wire enable_, clock_in,
                            input wire [9:0] keypad,
                            output wire pgt_clock, load_,
                            output wire [3:0] bcd_out);
    
    wire data_valid, clock_out, pgt;

    encoder encoder0 (.enable_(enable_), .keypad(keypad), .data_valid(data_valid), .bcd_out(bcd_out));
    freq_div freq_div0 (.clock_in(clock_in), .clock_out(clock_out));
    NR_counter NR_counter0(.clock(clock_in), .clear(data_valid), .out(pgt));
    mux mux0 (.pgt(pgt), .clock(clock_out), .select(enable_), .out(pgt_clock));

    assign load_ = ~data_valid;
endmodule