`timescale 1ms/1ps
`include "encoder.v"

module encoder_TB ();
    
    reg enable_;
    reg [9:0] keypad;
    wire data_valid;
    wire [3:0] bcd_out;

    encoder encoder_DUT (.enable_(enable_), .keypad(keypad), .bcd_out(bcd_out), .data_valid(data_valid));

    initial begin
        $dumpfile("encoder.vcd");
        $dumpvars(0, encoder_TB);

        enable_ <= 1; // Disable

        #50 keypad <= 10'b00_0000_0001; //0
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0000_0010; //1
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0000_0100; //2
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0000_1000; //3
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0001_0000; //4
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0010_0000; //5
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0100_0000; //6
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_1000_0000; //7
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b01_0000_0000; //8
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b10_0000_0000; //9
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);

        #50 enable_ <= 0; // Enable

        keypad <= 10'b11_1111_1111; //Invalid
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        
        #50 keypad <= 10'b00_0000_0001; //0
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0000_0010; //1
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0000_0100; //2
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0000_1000; //3
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0001_0000; //4
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0010_0000; //5
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_0100_0000; //6
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b00_1000_0000; //7
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b01_0000_0000; //8
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);
        #50 keypad <= 10'b10_0000_0000; //9
        #5 $display("enable_: %b | keypad: %b | valid: %b | bcd: %b", enable_, keypad, data_valid, bcd_out);

        #50 $finish;
    end
endmodule