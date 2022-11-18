module SR_latch (input wire S, R,
                 output reg mag_on);

    always @(R or S)
    begin
        if (R & ~S) mag_on <= 0;
        else if (~R & S) mag_on <= 1;
        else mag_on <= mag_on;
    end
endmodule