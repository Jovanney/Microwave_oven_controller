`include "magnetron_logic.v"

module magnetron_logic_TB ();

    reg start_, stop_, clear_, door_closed, timer_done;
    wire S, R;

    magnetron_logic DUT (.start_(start_), .stop_(stop_), .clear_(clear_), 
        .door_closed(door_closed), .timer_done(timer_done), .S(S), .R(R));
    
    initial begin
        $dumpfile("magnetron_logic.vcd");
        $dumpvars(0, magnetron_logic_TB);

        start_ = 1;
        stop_ = 1;
        clear_ = 1;
        door_closed = 0;
        timer_done = 0;

        // Start with door open
        #5 start_ = 0;
        #5 start_ = 1;

        // Clear
        #5 door_closed = 1;
        #5 start_ = 0;
        #5 start_ = 1;
        #5 clear_ = 0;
        #5 clear_ = 1;

        // Timer done
        #5 start_ = 0;
        #5 start_ = 1;
        #5 timer_done = 1;
        #5 timer_done = 0;

        // Door open midway
        #5 start_ = 0;
        #5 start_ = 1;
        #5 door_closed = 0;
        #5 door_closed = 1;
        #5 start_ = 0;
        #5 start_ = 1;
        #5 timer_done = 1;

        #5 $finish;
    end
endmodule