`include "lvl_3/magnetron_logic.v"
`include "lvl_3/SR_latch.v"

module magnetron_control (input wire start_, stop_, clear_, door_closed, timer_done,
                          output wire mag_on);
    
    wire  S, R;

    magnetron_logic magnetron_logic_DUT (.start_(start_), .stop_(stop_), .clear_(clear_), 
        .door_closed(door_closed), .timer_done(timer_done), .S(S), .R(R));
    SR_latch SR_latch_DUT (.S(S), .R(R), .mag_on(mag_on));
endmodule