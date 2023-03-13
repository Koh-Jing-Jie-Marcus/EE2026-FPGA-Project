`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 09:26:52
// Design Name: 
// Module Name: clk20khz
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


module clk20khz(
    input clk,
    output reg [31:0] limit,
    output reg slow_clk = 0
    );
    
    reg[31:0] count = 0;
    
    always @(posedge clk)
    begin
        slow_clk = (count==limit)? ~slow_clk : slow_clk;
        count = (count==limit)? 0 : count+1;
    end
endmodule
