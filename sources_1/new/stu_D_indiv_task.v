`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2023 16:51:15
// Design Name: 
// Module Name: stu_D_indiv_task
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


module stu_D_indiv_task(
    input clock,
    input [6:0] x, y,
    input [7:0] sw,
    output reg [15:0] oled_data = 0
    );
    
    always @ (posedge clock) begin 
        if ((x >= 57) && (x <= 59) && (y >= 1) && (y <= 59)) 
            begin
                oled_data <= (sw[0]) ? 16'b00000_000000_00000 : 16'b00000_111111_00000;
            end
        else if ((y >= 57) && (y <= 59) && (x >= 1) && (x <= 59))
            begin
                oled_data <= (sw[0]) ? 16'b00000_000000_00000 : 16'b00000_111111_00000;
            end
        else
            begin 
                oled_data <= 16'b00000_000000_00000;
            end
               
        if ((x >= 16) && (x <= 42) && (y >= 11) && (y <= 13))  
            begin
                oled_data <= (sw[1]) ? 16'b11111_111111_11111 : 16'b00000_000000_00000;
            end
        else if ((x >= 43) && (x <= 45) && (y >= 11) && (y <= 29)) 
            begin
                oled_data <= (sw[2]) ? 16'b11111_111111_11111 : 16'b00000_000000_00000;
            end
        else if ((x >= 43) && (x <= 45) && (y >= 30) && (y <= 48)) 
            begin
                oled_data <= (sw[3]) ? 16'b11111_111111_11111 : 16'b00000_000000_00000;
            end
        else if ((x >= 16) && (x <= 42) && (y >= 46) && (y <= 48)) 
            begin
                oled_data <= (sw[4]) ? 16'b11111_111111_11111 : 16'b00000_000000_00000;
            end 
        else if ((x >= 16) && (x <= 18) && (y >= 30) && (y <= 45)) 
            begin
                oled_data <= (sw[5]) ? 16'b11111_111111_11111 : 16'b00000_000000_00000;
            end 
        else if ((x >= 16) && (x <= 18) && (y >= 14) && (y <= 29)) 
            begin
                 oled_data <= (sw[6]) ? 16'b11111_111111_11111 : 16'b00000_000000_00000;
            end   
        else if ((x >= 19) && (x <= 42) && (y >= 29) && (y <= 31)) 
            begin
                 oled_data <= (sw[7]) ? 16'b11111_111111_11111 : 16'b00000_000000_00000;
            end 
        end              
endmodule
