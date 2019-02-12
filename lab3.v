`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab3 JMU
//////////////////////////////////////////////////////////////////////////////////


module lab3(
    input [3:0] BUTTONS,
    output [5:0] LEDS
    );

    assign LEDS[0] = ~BUTTONS[0];
    assign LEDS[1] = BUTTONS[1] & ~BUTTONS[2];
    assign LEDS[3] = BUTTONS[2] & BUTTONS[3];
    assign LEDS[2] = LEDS[1] | LEDS[3];


endmodule
