`include "magnetron_control.v"

module magnetron_control_TB ();

    reg start_, stop_, clear_, door_closed, timer_done;
    wire mag_on;

    magnetron_control DUT (.start_(start_), .stop_(stop_), .clear_(clear_), 
        .door_closed(door_closed), .timer_done(timer_done), .mag_on(mag_on));
    
    initial begin
        $dumpfile("magnetron_control.vcd");
        $dumpvars(0, magnetron_control_TB);

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