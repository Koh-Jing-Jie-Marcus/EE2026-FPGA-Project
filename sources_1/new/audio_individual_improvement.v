`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 14:45:10
// Design Name: 
// Module Name: audio_individual_improvement
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module audio_individual_improvement(
    input clk100M,
    input [11:0] keys_pressed,
    output reg [11:0] output_signal = 0
    );
    
    reg [3:0] number_of_keys = 0;
    
    always @ (keys_pressed) begin
        number_of_keys = 0;
        if (keys_pressed[11] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[10] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[9] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[8] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[7] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[6] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[5] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[4] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[3] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[2] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[1] == 1)
            number_of_keys = number_of_keys + 1;
        if (keys_pressed[0] == 1)
            number_of_keys = number_of_keys + 1;
    end
    
    wire [11:0] keyboard_signal;
    keyboard keyboard(clk100M, keys_pressed, keyboard_signal);
    
    always @ (keys_pressed) begin
        case (number_of_keys)
            0 : output_signal <= 0;
            1 : output_signal <= 60 * keyboard_signal;
            2 : output_signal <= 30 * keyboard_signal;
            3 : output_signal <= 20 * keyboard_signal;
            4 : output_signal <= 15 * keyboard_signal;
            5 : output_signal <= 12 * keyboard_signal;
            6 : output_signal <= 10 * keyboard_signal;
            7 : output_signal <= 8 * keyboard_signal;
            8 : output_signal <= 7 * keyboard_signal;
            9 : output_signal <= 6 * keyboard_signal;
            10 : output_signal <= 6 * keyboard_signal;
            11 : output_signal <= 5 * keyboard_signal;
            12 : output_signal <= 5 * keyboard_signal;
            default : output_signal <= 0;
        endcase
    end
    
endmodule
