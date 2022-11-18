`include "lvl_3/mod10_counter.v"
`include "lvl_3/mod6_counter.v"

module timer(
        output wire [3:0] sec_ones, 
        output wire [3:0] sec_tens, 
        output wire [3:0] mins,
        output reg zero,
        input wire [3:0] data,
        input wire loadn, clrn, clock, en
    );

    wire zero_ones, zero_tens, zero_mins;
    wire tc_en_tens, tc_en_mins, unused;

    mod10_counter one_secs(.Dout(sec_ones), .tc(tc_en_tens), .zero(zero_ones), .data(data), .loadn(loadn), .clrn(clrn), .clock(clock), .en(en)); // 0:0|0|
    mod6_counter ten_secs(.Dout(sec_tens), .tc(tc_en_mins), .zero(zero_tens), .data(sec_ones), .loadn(loadn), .clrn(clrn), .clock(clock), .en(tc_en_tens)); // 0:|0|0
    mod10_counter minutes(.Dout(mins), .tc(unused), .zero(zero_mins), .data(sec_tens), .loadn(loadn), .clrn(clrn), .clock(clock), .en(tc_en_mins)); // |0|:00

    always @(zero_ones, zero_tens, zero_mins) begin
        zero = zero_ones & zero_tens & zero_mins; // quando chega em 0:00 vai para o magnetron
    end

endmodule