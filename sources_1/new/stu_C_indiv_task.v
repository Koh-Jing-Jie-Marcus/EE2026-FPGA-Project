`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 13:14:47
// Design Name: 
// Module Name: stu_C_indiv_task
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


module stu_C_indiv_task(
    input clock,
    input mouse_middle_click,
    input [6:0] x, y, mouse_x_scale_pos, mouse_y_scale_pos,
    output reg [15:0] oled_data = 0
    );
    reg cursor = 0;
    reg [6:0] x_lower = 0;
    reg [6:0] y_lower = 0;
    parameter [1:0] cursor_size = 3;
    always @(posedge clock)
    begin
        cursor = (mouse_middle_click)? ~cursor : cursor;
        x_lower = (mouse_x_scale_pos + cursor_size > 95) ? 92 : mouse_x_scale_pos;
        y_lower = (mouse_y_scale_pos + cursor_size > 63) ? 60 : mouse_y_scale_pos;
        if (cursor == 0)
        begin
            if (x == mouse_x_scale_pos && y == mouse_y_scale_pos)
            begin
                oled_data <= 16'hF800;
            end 
            else
            begin
                oled_data <= 0;
            end 
        end
        else
        begin
            if (x >= x_lower && x <= x_lower + cursor_size && y >= y_lower && y <= y_lower + cursor_size)
            begin
                oled_data <= 16'h043F;
            end
            else
            begin
                oled_data <= 0;
            end
        end
    end
endmodule
