`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 09:16:00
// Design Name: 
// Module Name: beep_200Hz
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


module beep_200Hz(
    input clock,
    output reg [11:0] signal
    );
    
    always @ (clock) begin
        signal = (clock == 1) ? 12'hFFF : 0;
    end
    
endmodule
