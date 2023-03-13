`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 10:01:24
// Design Name: 
// Module Name: mouse_xy_scale
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


module mouse_xy_scale(
    input [11:0] xpos,
    input [11:0] ypos,
    output [6:0] x_scale_pos,
    output [6:0] y_scale_pos
    );
    assign x_scale_pos = (xpos /10)==96 ? 95 : (xpos /10);
    assign y_scale_pos = (ypos /10)==64 ? 63 : (ypos /10);
endmodule
