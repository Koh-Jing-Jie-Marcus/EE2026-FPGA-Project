`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 09:51:11
// Design Name: 
// Module Name: oled_x_y_coord
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


module oled_x_y_coord(
    input [12:0] pixel_index,
    output [6:0] x,
    output [6:0] y
    );
    assign x = (pixel_index % 96);
    assign y = (pixel_index / 96);
endmodule
