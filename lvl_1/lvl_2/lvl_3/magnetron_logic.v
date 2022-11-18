module magnetron_logic (input wire start_, stop_, clear_, door_closed, timer_done,
                        output reg S, R);

    always @(start_ or stop_ or clear_ or door_closed or timer_done)
    begin
        if (~clear_ || ~stop_ || ~door_closed || timer_done) begin
            S = 0;
            R = 1;
        end else if (~start_ && door_closed) begin
            S = 1;
            R = 0;
        end else begin
            S = 0;
            R = 0;
        end
    end
endmodule