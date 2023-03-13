`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2023 09:36:43
// Design Name: 
// Module Name: sim_clk
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


module sim_clk(

    );
    reg clk = 0;
    wire slow_clk;
    clk20khz simclk(clk,slow_clk);
    
    
    always
    begin
        #5 clk = ~clk;
    end
endmodule
