module freq_div (input wire clock_in,
                 output reg clock_out);

    reg [5:0] counter;

    initial begin
        clock_out <= 1;
        counter <= 0;
    end

    always @(posedge clock_in) begin
        if (counter == 49) begin
            clock_out <= ~clock_out;
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule