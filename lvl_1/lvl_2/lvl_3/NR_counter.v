module NR_counter (input wire clock, clear,
                   output reg out);
    
    reg [2:0] counter;

    initial begin
        out <= 0;
        counter <= 0;
    end

    always @(clear) begin
        if (clear) begin
            counter <= 0;
            out <= 0;
        end
    end

    always @(posedge clock) begin
        if (counter < 8) begin
            counter <= counter + 1;
            if (counter == 3) begin
                out <= 1;
            end
        end
    end
endmodule