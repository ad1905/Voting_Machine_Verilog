module test;

    reg clock;
    reg reset;
    reg mode;
    reg button1;
    reg button2;
    reg button3;
    reg button4;

    wire [7:0] led;

    //instantiation of unit under test
    votingMachine uut(
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .button1(button1),
        .button2(button2),
        .button3(button3),
        .button4(button4),
        .led(led)
    );

    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin 
        reset = 1;
        mode = 0;
        button1 = 0;
        button2 = 0;
        button3 = 0;
        button4 = 0;

        //wait 100ns for global reset to finish
        #100;

        // adding stimulus here

        #100 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=1; button2=0; button3=0; button4=0;
        #10 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=1; button2=0; button3=0; button4=0;
        #200 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #10 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;

        #5 reset=0; mode=0; button1=0; button2=1; button3=0; button4=0;
        #200 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #10 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;

        #5 reset=0; mode=0; button1=0; button2=1; button3=1; button4=0;
        #200 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #10 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;

        #5 reset=0; mode=1; button1=0; button2=1; button3=0; button4=0;
        #200 reset=0; mode=1; button1=0; button2=0; button3=1; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #10 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        
        #5 reset=0; mode=0; button1=0; button2=0; button3=1; button4=0;
        #200 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #10 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0;
        #5 reset=0; mode=0; button1=0; button2=0; button3=0; button4=0; 
        
        // Add more test scenarios as needed

        // 1000 $finish
    end

    initial begin 
        $dumpvars;
            $dumpfile("dump.vcd");
    end

    // Monitor outputs
    initial begin
        $monitor($time, " mode = %b, button1 = %b, button2 = %b, button3 = %b, button4 = %b, led = %d", mode, button1, button2, button3, button4, led);
    end
endmodule