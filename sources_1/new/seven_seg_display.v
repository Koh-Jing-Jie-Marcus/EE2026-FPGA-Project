`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 12:12:42
// Design Name: 
// Module Name: seven_seg_display
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


module seven_seg_display(
    input clock,
    input valid,
    input isValid,
    input [3:0] valid_number,
    output reg [3:0] an,
    output reg [6:0] seg,
    output reg dp
    );
    
    parameter left_digit = 0;
    reg an_to_display = left_digit;
    
    wire [3:0] digit_left;
    wire [3:0] digit_right;
    assign digit_left = (valid_number == 9) ? 1 : 0;
    assign digit_right = (valid_number == 9) ? 0 : valid_number + 1;
    
    wire [3:0] digit_to_display;
    assign digit_to_display = (an_to_display == left_digit) ? digit_left : digit_right;
    
    wire [6:0] digit_signal;
    display_digit display_digit(digit_to_display, digit_signal);
        
    //use <== to sync the an and seg
    always @ (posedge clock) begin
            an_to_display <= ~an_to_display;
            seg <= digit_signal;
            an <= (valid == 1 && isValid == 1) ? (an_to_display == left_digit) ? ~4'b1000 : ~4'b0100 : ~4'b0000;
            dp <= (an_to_display == left_digit) ? ~1 : ~0;
    end 
    
endmodule
