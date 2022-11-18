`include "lvl_2/input_timer_control.v"
`include "lvl_2/timer.v"
`include "lvl_2/magnetron_control.v"
`include "lvl_2/BCD_decoder.v"

module microwave_oven_controller 
    (input wire clock, start_, stop_, clear_, door_closed,
        input wire [9:0] keypad,
        output wire mag_on,
        output wire [6:0] blank_digit, sec_ones_segs, sec_tens_segs, min_segs);
    
    wire [3:0] bcd_out, sec_ones, sec_tens, mins;
    wire pgt_clock, load_, timer_done;

    input_timer_control input_timer_control_DUT 
        (.enable_(mag_on), .keypad(keypad), .clock_in(clock), 
        .bcd_out(bcd_out), .pgt_clock(pgt_clock), .load_(load_));
    timer timer_DUT 
        (.data(bcd_out), .loadn(load_), .clrn(clear_), .clock(pgt_clock), .en(mag_on), 
        .sec_ones(sec_ones), .sec_tens(sec_tens), .mins(mins), .zero(timer_done));
    magnetron_control magnetron_control_DUT 
        (.start_(start_), .stop_(stop_), .clear_(clear_), .door_closed(door_closed), 
        .timer_done(timer_done), .mag_on(mag_on));
    BCD_decoder BCD_decoder_DUT 
        (.sec_ones(sec_ones), .sec_tens(sec_tens), .min(mins), 
        .sec_ones_segs(sec_ones_segs), .sec_tens_segs(sec_tens_segs), .min_segs(min_segs));
    
    assign blank_digit = 0;
    
endmodule