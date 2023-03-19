`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2023 23:51:36
// Design Name: 
// Module Name: group_mouse_click
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


module group_mouse_click(
    input clock,
    input mouse_left_click, mouse_right_click,
    input [6:0] mouse_x_scale, mouse_y_scale,
    output reg [6:0] clicked = 7'b0000000,
    output valid,
    output reg [3:0] valid_number = 0
    );
    parameter zero  = 7'b0111111;
    parameter one   = 7'b0000110;
    parameter two   = 7'b1011011;
    parameter three = 7'b1001111;
    parameter four  = 7'b1100110;
    parameter five  = 7'b1101101;
    parameter six   = 7'b1111101;
    parameter seven = 7'b0000111;
    parameter eight = 7'b1111111;
    parameter nine  = 7'b1101111;
    assign valid = ((clicked == zero) || (clicked == one) || (clicked == two) || (clicked == three) || (clicked == four) || (clicked == five) || (clicked == six) || (clicked == seven) || (clicked == eight) || (clicked == nine)) ? 1 : 0;
    always @(posedge clock) begin
        if ((mouse_x_scale > 18) && (mouse_x_scale < 40) && (mouse_y_scale >= 11) && (mouse_y_scale <= 13)) begin
            if (mouse_left_click == 1) begin
                clicked[0] <= 1;
            end
            else if (mouse_right_click == 1) begin
                clicked[0] <= 0;
            end
        end
        else if ((mouse_x_scale >= 40) && (mouse_x_scale <= 42) && (mouse_y_scale > 13) && (mouse_y_scale < 29)) begin
            if (mouse_left_click == 1) begin
                clicked[1] <= 1;
            end
            else if (mouse_right_click == 1) begin
                clicked[1] <= 0;
            end
        end
        else if ((mouse_x_scale >= 40) && (mouse_x_scale <= 42) && (mouse_y_scale > 31) && (mouse_y_scale < 46)) begin
            if (mouse_left_click == 1) begin
                clicked[2] <= 1;
            end
            else if (mouse_right_click == 1) begin
                clicked[2] <= 0;
            end
        end
        else if ((mouse_x_scale > 18) && (mouse_x_scale < 40) && (mouse_y_scale >= 46) && (mouse_y_scale <= 48)) begin
            if (mouse_left_click == 1) begin
                clicked[3] <= 1;
            end
            else if (mouse_right_click == 1) begin
                clicked[3] <= 0;
            end
        end
        else if ((mouse_x_scale >= 16) && (mouse_x_scale <= 18) && (mouse_y_scale > 31) && (mouse_y_scale < 46)) begin
            if (mouse_left_click == 1) begin
                clicked[4] <= 1;
            end
            else if (mouse_right_click == 1) begin
                clicked[4] <= 0;
            end
        end
        else if ((mouse_x_scale >= 16) && (mouse_x_scale <= 18) && (mouse_y_scale > 13) && (mouse_y_scale < 29)) begin
            if (mouse_left_click == 1) begin
                clicked[5] <= 1;
            end
            else if (mouse_right_click == 1) begin
                clicked[5] <= 0;
            end
        end
        else if ((mouse_x_scale > 18) && (mouse_x_scale < 40) && (mouse_y_scale >= 29) && (mouse_y_scale <= 31)) begin
            if (mouse_left_click == 1) begin
                clicked[6] <= 1;
            end
            else if (mouse_right_click == 1) begin
                clicked[6] <= 0;
            end
        end
        
        case (clicked)
        zero: valid_number <= 0;
        one: valid_number <= 1;
        two: valid_number <= 2;
        three: valid_number <= 3;
        four: valid_number <= 4;
        five: valid_number <= 5;
        six: valid_number <= 6;
        seven: valid_number <= 7;
        eight: valid_number <= 8;
        nine: valid_number <= 9;
        endcase
    end
endmodule
