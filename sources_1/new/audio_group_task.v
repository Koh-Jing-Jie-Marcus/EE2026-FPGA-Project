`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 14:27:17
// Design Name: 
// Module Name: audio_group_task
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


module audio_group_task(
    input clk100M, clk200, 
    input valid, 
    input [3:0] valid_number, 
    output [11:0] audio_out
    );
    
    wire [31:0] sound_duration = valid_number * 10_000_000;
    wire sound_on;
    wire [11:0] signal_200;
    
    beep_200Hz signal_200Hz(clk200, signal_200);
    timer_duration beep_timer(valid, clk100M, sound_duration, sound_on);
    
    assign audio_out = (sound_on == 1) ? signal_200 : 0;
    
endmodule
