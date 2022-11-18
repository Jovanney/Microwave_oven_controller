`timescale 1ms/1ps

module clock (output reg out);

    reg i;

    initial begin
        out <= 1;
        for (i=0; i<10; i=i+1) begin
            #5 out <= ~out;
        end
    end
endmodule