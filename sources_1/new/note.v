`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 14:47:48
// Design Name: 
// Module Name: note
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


module note(
    input clk,
    output reg [11:0] signal = 0
    );
    
    reg count_up = 1;
    
    always @ (posedge clk) begin
        if (signal == 0) 
            count_up = 1;
        if (signal == 68)
            count_up = 0;
        signal = (count_up == 1) ? signal + 1 : signal - 1;
    end
    
endmodule
