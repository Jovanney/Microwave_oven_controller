module mux (input wire pgt, clock, select,
            output reg out);

    always @(*) begin
        if (select) begin
            out = clock;
        end else begin
            out = pgt;
        end
    end
endmodule