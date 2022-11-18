module mod6_counter(
        output reg [3:0] Dout,
        output wire tc, 
        output reg zero,
        input wire [3:0] data,
        input wire loadn, clrn, clock, en
    );

    assign tc = (en & !Dout[0] & !Dout[1] & !Dout[2] & !Dout[3]);
    initial begin 
        Dout = 0;
    end

    always @(posedge clock, negedge clrn)
    begin
        if (!clrn) begin
            Dout <= 0;
            zero <= 1;
        end

        else if (!loadn) begin 
            Dout <= data;
            zero <= (data == 0)? 1 : 0;
        end

        else if (en) begin 
            if (Dout == 0) begin 
                Dout <= 5;
                zero <= 0;
            end

            else if(Dout==1) begin
                Dout <= Dout - 1;
                zero <= 1;
            end

            else begin 
                Dout <= Dout - 1;
                zero <= 0;
            end
        end
    end

endmodule