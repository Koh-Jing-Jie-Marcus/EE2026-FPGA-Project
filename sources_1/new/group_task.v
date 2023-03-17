`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2023 20:52:31
// Design Name: 
// Module Name: group_task
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


module group_task(
    input clock,
    input [6:0] x, y,
    input [15:0] sw,
    output reg [15:0] oled_data
    );
    
    //4E-1
    always @ (posedge clock) begin 
        if ((x >= 57) && (x <= 59) && (y >= 1) && (y <= 59)) 
             begin
                  oled_data <= (sw[0]) ? 16'b00000_000000_00000 : 16'b00000_111111_00000;
             end
        else if ((y >= 57) && (y <= 59) && (x >= 1) && (x <= 59))
             begin
                  oled_data <= (sw[0]) ? 16'b00000_000000_00000 : 16'b00000_111111_00000;
             end
        else if ((x >= 16) && (x <= 42) && (y == 11))  
             begin
                  oled_data <= 16'b11111_111111_11111;
             end
        else if ((x >= 16) && (x <= 42) && (y == 13))  
             begin
                  oled_data <= 16'b11111_111111_11111;
             end
        else if ((x >= 16) && (x <= 42) && (y == 29))  
              begin
                  oled_data <= 16'b11111_111111_11111;
              end
        else if ((x >= 16) && (x <= 42) && (y == 31))  
              begin
                  oled_data <= 16'b11111_111111_11111;
              end
        else if ((x >= 16) && (x <= 42) && (y == 46))  
              begin
                  oled_data <= 16'b11111_111111_11111;
              end
        else if ((x >= 16) && (x <= 42) && (y == 48))  
              begin
                  oled_data <= 16'b11111_111111_11111;
              end
        else if ((x == 16) && (y >= 11) && (y <= 48))  
              begin
                  oled_data <= 16'b11111_111111_11111;
              end
        else if ((x == 18) && (y >= 11) && (y <= 48))  
              begin
                   oled_data <= 16'b11111_111111_11111;
              end
        else if ((x == 40) && (y >= 11) && (y <= 48))  
              begin
                   oled_data <= 16'b11111_111111_11111;
              end
        else if ((x == 42) && (y >= 11) && (y <= 48))  
              begin
                   oled_data <= 16'b11111_111111_11111;
              end
        else
              begin 
                   oled_data <= 16'b00000_000000_00000;
              end
        end
endmodule
