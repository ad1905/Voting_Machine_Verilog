module voteLogger(
    input clock,
    input reset,
    input mode,
    input cand1_vote_valid,
    input cand2_vote_valid,
    input cand3_vote_valid,
    input cand4_vote_valid, 
    output reg [7:0] cand1_vote_recived,
    output reg [7:0] cand2_vote_recived,
    output reg [7:0] cand3_vote_recived,
    output reg [7:0] cand4_vote_recived  
);

    always @(posedge clock)
    begin
        if(reset)
        begin
            cand1_vote_recived <= 0;
            cand2_vote_recived <= 0;
            cand3_vote_recived <= 0;
            cand4_vote_recived <= 0;
        end
        else
        begin
            if(cand1_vote_valid && mode == 0)
                cand1_vote_recived <= cand1_vote_recived + 1;
            else if(cand2_vote_valid && mode == 0)
                cand2_vote_recived <= cand2_vote_recived + 1;
            else if(cand3_vote_valid && mode == 0)
                cand3_vote_recived <= cand3_vote_recived + 1;
            else if(cand4_vote_valid && mode == 0)
                cand4_vote_recived <= cand4_vote_recived + 1;
        end
    end

endmodule