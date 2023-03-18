`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 10:17:02
// Design Name: 
// Module Name: clock_freq
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


module clock_freq(
    input clock,
    input [31:0] limit,
    output reg signal = 0
    );
    
    reg [31:0] count = 1;
    
    always @ (posedge clock) begin
        count = (count == limit) ? 1 : count + 1;
        signal = (count == 1) ? ~signal : signal;
    end
    
endmodule
