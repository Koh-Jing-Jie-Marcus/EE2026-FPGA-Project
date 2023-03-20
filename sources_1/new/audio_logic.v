`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 14:11:01
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


module audio_logic(
    input clk100M, clk200, clk400,
    input pushbutton,
    input [15:0] sw,
    input valid,
    input [3:0] valid_number,
    output [11:0] audio_out
    );
    
    wire [11:0] keys_pressed = sw[13:2];
    
    wire [11:0] individual_task_out;
    wire [11:0] group_task_out;
    wire [11:0] individual_improvement_out;
    assign audio_out = (sw[1] == 1) ? individual_improvement_out : (valid == 1) ? group_task_out : individual_task_out;
    
    audio_individual_task individual_task(clk100M, clk200, clk400, pushbutton, sw[0], individual_task_out);
    audio_group_task group_task(clk100M, clk200, valid, valid_number, group_task_out);
    audio_individual_improvement individual_improvement(clk100M, keys_pressed, individual_improvement_out);
    
endmodule
