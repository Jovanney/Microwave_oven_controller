module BCD_decoder (input wire [3:0] sec_ones, sec_tens, min,
                      output reg [6:0] sec_ones_segs, sec_tens_segs, min_segs);

    always @(*) begin
        case(min)
            4'b0001 : min_segs = 7'b000_0110; // 1
            4'b0010 : min_segs = 7'b101_1011; // 2
            4'b0011 : min_segs = 7'b100_1111; // 3
            4'b0100 : min_segs = 7'b110_0110; // 4
            4'b0101 : min_segs = 7'b110_1101; // 5
            4'b0110 : min_segs = 7'b111_1101; // 6
            4'b0111 : min_segs = 7'b000_0111; // 7
            4'b1000 : min_segs = 7'b111_1111; // 8
            4'b1001 : min_segs = 7'b110_1111; // 9
            default : min_segs = 7'b000_0000;
        endcase

        if (min == 0 && sec_tens == 0) begin
            sec_tens_segs = 7'b000_0000;
        end else begin
            case(sec_tens)
                4'b0000 : sec_tens_segs = 7'b011_1111; // 0
                4'b0001 : sec_tens_segs = 7'b000_0110; // 1
                4'b0010 : sec_tens_segs = 7'b101_1011; // 2
                4'b0011 : sec_tens_segs = 7'b100_1111; // 3
                4'b0100 : sec_tens_segs = 7'b110_0110; // 4
                4'b0101 : sec_tens_segs = 7'b110_1101; // 5
                4'b0110 : sec_tens_segs = 7'b111_1101; // 6
                4'b0111 : sec_tens_segs = 7'b000_0111; // 7
                4'b1000 : sec_tens_segs = 7'b111_1111; // 8
                4'b1001 : sec_tens_segs = 7'b110_1111; // 9
                default : sec_tens_segs = 7'b000_0000;
            endcase
        end
        
        if (min == 0 && sec_tens == 0 && sec_ones == 0) begin
            sec_ones_segs = 7'b000_0000;
        end else begin
            case(sec_ones)
                4'b0000 : sec_ones_segs = 7'b011_1111; // 0
                4'b0001 : sec_ones_segs = 7'b000_0110; // 1
                4'b0010 : sec_ones_segs = 7'b101_1011; // 2
                4'b0011 : sec_ones_segs = 7'b100_1111; // 3
                4'b0100 : sec_ones_segs = 7'b110_0110; // 4
                4'b0101 : sec_ones_segs = 7'b110_1101; // 5
                4'b0110 : sec_ones_segs = 7'b111_1101; // 6
                4'b0111 : sec_ones_segs = 7'b000_0111; // 7
                4'b1000 : sec_ones_segs = 7'b111_1111; // 8
                4'b1001 : sec_ones_segs = 7'b110_1111; // 9
                default : sec_ones_segs = 7'b000_0000;
            endcase
        end
    end
endmodule