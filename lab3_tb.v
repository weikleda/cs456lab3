`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: lab3_tb JMU
/////////////////////////////////////////////////////////////////
module lab3_tb(

    );

    reg [3:0] buttons;
    wire [5:0] leds;
    reg [5:0] e_led;

    integer i;

    lab3 dut(.LEDS(leds),.BUTTONS(buttons));

    function [3:0] expected_led;
       input [3:0] btn;
    begin
       expected_led[0] = ~btn[0];
       expected_led[1] = btn[1] & ~btn[2];
       expected_led[3] = btn[2] & btn[3];
       expected_led[2] = expected_led[1] | expected_led[3];
    end
    endfunction

    initial
    begin
        for (i=0; i < 255; i=i+2)
        begin
            #50 buttons=i;
            #10 e_led = expected_led(buttons);
            if(leds == e_led)
                $display("LED output matched at", $time);
            else
                $display("LED output mis-matched at ",$time,": expected: %b, actual: %b", e_led, leds);
        end
    end

endmodule
