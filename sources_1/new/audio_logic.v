`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 14:11:01
// Design Name: 
// Module Name: audio_logic
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
    input switch,
    input valid,
    input [3:0] valid_number,
    output [11:0] audio_out
    );
    
    wire [11:0] individual_task_out;
    wire [11:0] group_task_out;
    assign audio_out = (valid == 1) ? group_task_out : individual_task_out;
    
    audio_individual_task individual_task(clk100M, clk200, clk400, pushbutton, switch, individual_task_out);
    audio_group_task group_task(clk100M, clk200, valid, valid_number, group_task_out);
    audio_individual_improvement individual_improvement();
    
endmodule
