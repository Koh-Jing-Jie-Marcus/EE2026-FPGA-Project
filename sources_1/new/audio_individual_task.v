`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 11:36:20
// Design Name: 
// Module Name: audio_individual_task
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


module audio_individual_task(
    input clk100M, clk200, clk400,
    input pushbutton,
    input switch,
    output [11:0] audio_out
    );
    
    wire [11:0] signal_200;
    wire [11:0] signal_400;
    wire [11:0] signal_out;
    
    
    wire start;
    wire sound_on;
    button_sensor button(clk100M, pushbutton, start);
    timer_duration timer_1s(start, clk100M, 100_000_000, sound_on);
    
    beep_200Hz signal_200Hz(clk200, signal_200);
    beep_400Hz signal_400Hz(clk400, signal_400);
    
    assign signal_out = (switch == 1) ? signal_200 : signal_400;
    //assign audio_out = (start == 1) ? signal_out : 0;
    assign audio_out = (sound_on == 1) ? signal_out : 0;
        
endmodule
