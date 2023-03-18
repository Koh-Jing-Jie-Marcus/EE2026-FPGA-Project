`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 10:25:50
// Design Name: 
// Module Name: timer_duration
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


module timer_duration(
    input start,
    input clk100M,
    input [31:0] limit,
    output reg signal = 0
    );
    
    reg [31:0] count = 0;
    
    reg button_state = 0;
    
    always @ (posedge clk100M) begin
        if(button_state == 0) begin
            if(start == 1) begin
                signal <= 1;
                count <= 0;
            end
        end
        
        if(signal == 1) begin
            if(count == limit) begin
                count <= 0;
                signal <= 0;
            end
            else
                count = count + 1;
        end
        
        button_state <= start;
    end
    
endmodule
