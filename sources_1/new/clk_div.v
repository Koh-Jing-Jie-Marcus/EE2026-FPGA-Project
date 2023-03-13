`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 11:32:13
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clock,
    input [31:0] limit,
    output reg slow_clk = 0
    );
    reg[31:0] count = 0;
        
    always @(posedge clock)
    begin
        count <= (count==limit) ? 0 : count + 1; 
        slow_clk <= (count==0) ? ~slow_clk : slow_clk;
    end
endmodule
