module votingMachine(
    input clock,
    input reset,
    input mode,
    input button1,
    input button2,
    input button3,
    input button4,
    output [7:0] led
);

    wire valid_vote1;
    wire valid_vote2;
    wire valid_vote3;
    wire valid_vote4;
    wire [7:0] cand1_vote_recived;
    wire [7:0] cand2_vote_recived;
    wire [7:0] cand3_vote_recived;
    wire [7:0] cand4_vote_recived;
    wire anyValidVote;

    assign anyValidVote = valid_vote1 | valid_vote2 |  valid_vote3 | valid_vote4;

    buttonControl bc1(
        .clock(clock),
        .reset(reset),
        .button(button1),
        .valid_vote(valid_vote1)
    );

    buttonControl bc2(
        .clock(clock),
        .reset(reset),
        .button(button2),
        .valid_vote(valid_vote2)
    );

    buttonControl bc3(
        .clock(clock),
        .reset(reset),
        .button(button3),
        .valid_vote(valid_vote3)
    );

    buttonControl bc4(
        .clock(clock),
        .reset(reset),
        .button(button4),
        .valid_vote(valid_vote4)
    );

    voteLogger VL(
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .cand1_vote_valid(valid_vote1),
        .cand2_vote_valid(valid_vote2),
        .cand3_vote_valid(valid_vote3),
        .cand4_vote_valid(valid_vote4),
        .cand1_vote_recived(cand1_vote_recived),
        .cand2_vote_recived(cand2_vote_recived),
        .cand3_vote_recived(cand3_vote_recived),
        .cand4_vote_recived(cand4_vote_recived)  
    );

    modelControl MC(
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .valid_vote_casted(anyValidVote),
        .candidate1_vote(cand1_vote_recived),
        .candidate2_vote(cand2_vote_recived),
        .candidate3_vote(cand3_vote_recived),
        .candidate4_vote(cand4_vote_recived),
        .candidate1_button_press(valid_vote1),
        .candidate2_button_press(valid_vote2),
        .candidate3_button_press(valid_vote3),
        .candidate4_button_press(valid_vote4),
        .leds(led)
    );
endmodule