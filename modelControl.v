module modelControl(
    input clock,
    input reset,
    input mode,
    input valid_vote_casted,
    input [7:0] candidate1_vote,
    input [7:0] candidate2_vote,
    input [7:0] candidate3_vote,
    input [7:0] candidate4_vote,
    input candidate1_button_press,
    input candidate2_button_press,
    input candidate3_button_press,
    input candidate4_button_press,
    output reg[7:0] leds
);
    reg [30:0] counter;

    always @(posedge clock)
    begin
        if(reset)
            counter <= 0;
        else if(valid_vote_casted) // if valid_vote then increment counter by 1
            counter <= counter + 1;
        else if(counter != 0 && counter < 10) // if counter is not 0 increment it till 10
            counter <= counter + 1;
        else
            counter <= 0;
    end

    always @(posedge clock)
    begin
        if(reset)
            leds <= 0;
        else
        begin
            if(mode == 0 && counter > 0) // voting mode
                leds <= 8'hFF;
            else if(mode == 0)
                leds <= 8'h00;
            else if(mode == 1) /// result mode
            begin
                if(candidate1_button_press)
                    leds <= candidate1_vote;
                else if(candidate2_button_press)
                    leds <= candidate2_vote;
                else if(candidate3_button_press)
                    leds <= candidate3_vote;
                else if(candidate4_button_press)
                    leds <= candidate4_vote;
            end
        end
    end
endmodule