`include "lvl_3/clock.v"
`include "input_timer_control.v"

module input_timer_control_TB ();

    reg [9:0] keypad;
    reg enable_;
    wire [3:0] bcd_out;
    wire load_, pgt_clock, clock;

    clock clock_DUT (.out(clock));
    input_timer_control input_timer_control_DUT (
        .keypad(keypad), .enable_(enable_), .clock_in(clock), 
        .bcd_out(bcd_out), .load_(load_), .pgt_clock(pgt_clock));
    
    initial begin
        $dumpfile("input_timer_control.vcd");
        $dumpvars(0, input_timer_control_TB);

        enable_ <= 1; // Disable

        #500 keypad <= 10'b11_1111_1111; //Invalid
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0000_0001; //0
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0000_0010; //1
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0000_0100; //2
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0000_1000; //3
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0001_0000; //4
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0010_0000; //5
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0100_0000; //6
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_1000_0000; //7
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b01_0000_0000; //8
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b10_0000_0000; //9
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input

        #5 enable_ <= 0; // Enable

        #500 keypad <= 10'b11_1111_1111; //Invalid
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0000_0001; //0
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0000_0010; //1
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0000_0100; //2
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0000_1000; //3
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0001_0000; //4
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0010_0000; //5
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_0100_0000; //6
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b00_1000_0000; //7
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b01_0000_0000; //8
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input
        #500 keypad <= 10'b10_0000_0000; //9
        #5 $display("enable_: %b | keypad: %b | bcd: %b | load_: %b", 
                    enable_, keypad, bcd_out, load_);
        #50 keypad <= 10'b00_0000_0000; //No input

        #500 enable_ <= 1; // Disable
    end
endmodule