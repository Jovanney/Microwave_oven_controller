`include "./lvl_2/lvl_3/clock.v"
`include "microwave_oven_controller.v"

module microwave_oven_controller_TB ();

    wire clock_in;

    reg [9:0] keypad;
    reg start_, stop_, clear_, door_closed;

    wire mag_on;
    wire [6:0] blank_digit, sec_ones_segs, sec_tens_segs, min_segs;

    clock clock_DUT (.out(clock_in));
    microwave_oven_controller controller_DUT (.clock(clock_in), .start_(start_), 
        .stop_(stop_), .clear_(clear_), .door_closed(door_closed), .keypad(keypad),
        .mag_on(mag_on), .blank_digit(blank_digit), .sec_ones_segs(sec_ones_segs), 
        .sec_tens_segs(sec_tens_segs), .min_segs(min_segs));

    // Timescale = 1ms/1ps (from clock.v)
    initial begin
        $dumpfile("controller.vcd");
        $dumpvars(0, microwave_oven_controller_TB);
        $monitor("%b | %b | %b | %b ", blank_digit, min_segs, sec_tens_segs, sec_ones_segs);

        clear_ <= 0;
        start_ <= 1;
        stop_ <= 1;
        door_closed <= 1;
        #50 clear_ <= 1;

        // Invalid input
        $display("");
        $display("Invalid input");
        #50 keypad <= 10'b00_1111_0000;
        #50 keypad <= 10'b00_0000_0000;
        #1000 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;
        
        // Start with no input
        $display("");
        $display("Start with no input");
        #1000 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;

        // 0 seconds
        $display("");
        $display("0 seconds");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b00_0000_0001;
        #50 keypad <= 10'b00_0000_0000;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;

        // 5 seconds, 4 digits pressed
        $display("");
        $display("5 seconds, 4 digits pressed");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b00_0001_0000; // 4
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b00_0000_0001; // 0
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b00_0000_0001; // 0
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b00_0010_0000; // 5
        #50 keypad <= 10'b00_0000_0000;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;

        // 5 seconds, long press
        #15000 $display("");
        $display("5 seconds, long press");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b00_0010_0000;
        #1000 keypad <= 10'b00_0000_0000; // Long press
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;

        // 90 seconds
        #15000 $display("");
        $display("90 seconds");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b10_0000_0000;
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b00_0000_0001;
        #50 keypad <= 10'b00_0000_0000;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;

        // 9 minutes and 99 seconds
        #100000 $display("");
        $display("9 minutes and 99 seconds");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b10_0000_0000;
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b10_0000_0000;
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b10_0000_0000;
        #50 keypad <= 10'b00_0000_0000;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;

        // 10 seconds with Stop pause
        #650000 $display("");
        $display("10 seconds with Stop pause");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b00_0000_0010;
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b00_0000_0001;
        #50 keypad <= 10'b00_0000_0000;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;
        #5000 stop_ <= 0;
        $display("Stop for 5 seconds");
        #50 stop_ <= 1;
        #4050 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;

        // 10 seconds with Door pause
        #25000 $display("");
        $display("10 seconds with Door pause");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b00_0000_0010;
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b00_0000_0001;
        #50 keypad <= 10'b00_0000_0000;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;
        #5000 door_closed <= 0;
        $display("Door Open for 5 seconds");
        #5000 door_closed <= 1;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;

        // 10 seconds, Clear pressed after 5 seconds
        #25000 $display("");
        $display("10 seconds, Clear pressed after 5 seconds");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b00_0000_0010;
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b00_0000_0001;
        #50 keypad <= 10'b00_0000_0000;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;
        #5000 clear_ <= 0;
        $display("Interrupted by clear");
        #50 clear_ <= 1;

        // 10 seconds, Keypad 2 pressed after 5 seconds
        #25000 $display("");
        $display("10 seconds, Keypad 2 pressed after 10 seconds");
        $display("MinTens | MinOnes | SecTens | SecOnes");
        #50 keypad <= 10'b00_0000_0010;
        #50 keypad <= 10'b00_0000_0000;
        #50 keypad <= 10'b00_0000_0001;
        #50 keypad <= 10'b00_0000_0000;
        #50 start_ <= 0;
        $display("Start pressed");
        #50 start_ <= 1;
        #5000 keypad <= 10'b00_0000_0100;
        $display("Keypad 2 pressed");
        #50 keypad <= 10'b00_0000_0000;

        #15000 $finish;
    end

endmodule