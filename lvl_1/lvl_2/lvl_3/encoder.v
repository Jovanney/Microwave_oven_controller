module encoder (input wire enable_,
                input wire [9:0] keypad,
                output reg [3:0] bcd_out,
                output reg data_valid);
    
    always @(*) begin
        if (~enable_) begin
            case (keypad)
                10'b00_0000_0001 : begin //0
                    bcd_out = 4'b0000;
                    data_valid = 1;
                end
                10'b00_0000_0010 : begin //1
                    bcd_out = 4'b0001;
                    data_valid = 1;
                end
                10'b00_0000_0100 : begin //2
                    bcd_out = 4'b0010;
                    data_valid = 1;
                end
                10'b00_0000_1000 : begin //3
                    bcd_out = 4'b0011;
                    data_valid = 1;
                end
                10'b00_0001_0000 : begin //4
                    bcd_out = 4'b0100;
                    data_valid = 1;
                end
                10'b00_0010_0000 : begin //5
                    bcd_out = 4'b0101;
                    data_valid = 1;
                end
                10'b00_0100_0000 : begin //6
                    bcd_out = 4'b0110;
                    data_valid = 1;
                end
                10'b00_1000_0000 : begin //7
                    bcd_out = 4'b0111;
                    data_valid = 1;
                end
                10'b01_0000_0000 : begin //8
                    bcd_out = 4'b1000;
                    data_valid = 1;
                end
                10'b10_0000_0000 : begin //9
                    bcd_out = 4'b1001;
                    data_valid = 1;
                end
                default: data_valid = 0;
            endcase
        end else begin
            data_valid = 0;
        end
    end
endmodule