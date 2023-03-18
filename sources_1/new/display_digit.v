`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 22:14:16
// Design Name: 
// Module Name: display_digit
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


module display_digit(
    input [3:0] digit,
    output reg [6:0] digit_output = ~7'b0000000
    );
    
    parameter zero  = ~7'b0111111;
    parameter one   = ~7'b0000110;
    parameter two   = ~7'b1011011;
    parameter three = ~7'b1001111;
    parameter four  = ~7'b1100110;
    parameter five  = ~7'b1101101;
    parameter six   = ~7'b1111101;
    parameter seven = ~7'b0000111;
    parameter eight = ~7'b1111111;
    parameter nine  = ~7'b1101111;
    
    always @ digit begin
        case (digit)
            0 : digit_output = zero;
            1 : digit_output = one;
            2 : digit_output = two;
            3 : digit_output = three;
            4 : digit_output = four;
            5 : digit_output = five;
            6 : digit_output = six;
            7 : digit_output = seven;
            8 : digit_output = eight;
            9 : digit_output = nine;
            default : digit_output = ~7'b0000000;
        endcase
    end
    
endmodule
