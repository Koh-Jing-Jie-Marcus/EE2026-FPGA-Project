`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 10:44:22
// Design Name: 
// Module Name: button_sensor
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


module button_sensor(
    input clk100M,
    input pushbutton,
    output reg signal = 0
    );
    
//    reg ignore = 0;
    reg [15:0] ignore_limit = 10_000;
    reg [15:0] ignore_count = 0;
    
    always @ (posedge clk100M) begin
        if (pushbutton !== signal) begin
            if(ignore_count < ignore_limit)
                ignore_count <= ignore_count + 1;
            else begin
                ignore_count <= 0;
                signal <= pushbutton;
            end
        end
        else 
            ignore_count = 0;
    end
    
//    assign signal = (ignore == 1) ? signal : pushbutton;
    
//    always @ (signal) begin
//        ignore = 1;
//    end
    
//    always @ (posedge clk100M) begin
//        if (ignore == 1) begin
//            if (ignore_count == ignore_limit) begin
//                ignore_count <= 0;
//                ignore <= 0;
//            end
//            else 
//                ignore_count = ignore_count + 1;
//        end
//    end
    
endmodule
