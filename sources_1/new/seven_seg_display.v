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
    input [3:0] valid_number,
    input [3:0] audio_in_number,
    output reg [3:0] an = ~4'b0000,
    output [6:0] seg,
    output reg dp
    );
    
    parameter valid_left = ~4'b1000;
    parameter valid_right = ~4'b0100;
    parameter audio_number = ~4'b0001;
    parameter digit_off = 10;
    //reg [3:0] an_to_display = valid_left;
    
    wire [3:0] digit_left;
    wire [3:0] digit_right;
    assign digit_left = (valid_number == 9) ? 1 : 0;
    assign digit_right = (valid_number == 9) ? 0 : valid_number + 1;
    
//    assign digit_to_display = (an_to_display == valid_left) ? digit_left : digit_right;
    
//    wire [6:0] digit_signal;
    reg [3:0] digit_to_display = 0;
        
    //use <== to sync the an and seg
    always @ (posedge clock) begin
        case (an)
            valid_left : begin
                an <= valid_right;
                digit_to_display <= (valid == 1) ? digit_right : digit_off;
                dp <= ~0;
            end
            valid_right : begin
                an <= audio_number;
                digit_to_display <= audio_in_number;
                dp <= ~0;
            end
            audio_number : begin
                an <= valid_left;
                digit_to_display <= (valid == 1) ? digit_left : digit_off;
                dp <= (valid == 1) ? ~1 : ~0;
            end
            default : an <= valid_left;
        endcase
    end 
    
    display_digit display_digit(digit_to_display, seg);
        
endmodule
