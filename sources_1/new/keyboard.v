`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2023 16:30:35
// Design Name: 
// Module Name: keyboard
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


module keyboard(
    input clk100M,
    input [11:0] keys_pressed,
    output reg [11:0] sound_signal = 0
    );
    
    //clock period = 50_000_000 / 136.5 / freq
    
    //Note C
    //freq = 261.63;
    wire clk_C;
    clock_freq clock_C(clk100M, 1400, clk_C);
    wire [11:0] signal_C;
    note C(clk_C, signal_C);
    
    //Note CS
    //freq = 277.18;
    wire clk_CS;
    clock_freq clock_CS(clk100M, 1322, clk_CS);
    wire [11:0] signal_CS;
    note CS(clk_CS, signal_CS);
    
    //Note D
    //freq = 293.66;
    wire clk_D;
    clock_freq clock_D(clk100M, 1247, clk_D);
    wire [11:0] signal_D;
    note D(clk_D, signal_D);
    
    //Note DS
    //freq = 311.13;
    wire clk_DS;
    clock_freq clock_DS(clk100M, 1177, clk_DS);
    wire [11:0] signal_DS;
    note DS(clk_DS, signal_DS);

    //Note E
    //freq = 329.63;
    wire clk_E;
    clock_freq clock_E(clk100M, 1111, clk_E);
    wire [11:0] signal_E;
    note E(clk_E, signal_E);

    //Note F
    //freq = 349.23;
    wire clk_F;
    clock_freq clock_F(clk100M, 1049, clk_F);
    wire [11:0] signal_F;
    note F(clk_F, signal_F);

    //Note FS
    //freq = 369.99;
    wire clk_FS;
    clock_freq clock_FS(clk100M, 990, clk_FS);
    wire [11:0] signal_FS;
    note FS(clk_FS, signal_FS);

    //Note G
    //freq = 392.00;
    wire clk_G;
    clock_freq clock_G(clk100M, 934, clk_G);
    wire [11:0] signal_G;
    note G(clk_G, signal_G);

    //Note GS
    //freq = 415.30;
    wire clk_GS;
    clock_freq clock_GS(clk100M, 882, clk_GS);
    wire [11:0] signal_GS;
    note GS(clk_GS, signal_GS);

    //Note A
    //freq = 440.00;
    wire clk_A;
    clock_freq clock_A(clk100M, 833, clk_A);
    wire [11:0] signal_A;
    note A(clk_A, signal_A);

    //Note AS
    //freq = 466.16;
    wire clk_AS;
    clock_freq clock_AS(clk100M, 786, clk_AS);
    wire [11:0] signal_AS;
    note AS(clk_AS, signal_AS);

    //Note B
    //freq = 493.88;
    wire clk_B;
    clock_freq clock_B(clk100M, 742, clk_B);
    wire [11:0] signal_B;
    note B(clk_B, signal_B);
    
    always @ (keys_pressed) begin
        sound_signal = 0;
        if (keys_pressed[11] == 1)
            sound_signal = sound_signal + signal_C;
        if (keys_pressed[10] == 1)
            sound_signal = sound_signal + signal_CS;
        if (keys_pressed[9] == 1)
            sound_signal = sound_signal + signal_D;
        if (keys_pressed[8] == 1)
            sound_signal = sound_signal + signal_DS;
        if (keys_pressed[7] == 1)
            sound_signal = sound_signal + signal_E;
        if (keys_pressed[6] == 1)
            sound_signal = sound_signal + signal_F;
        if (keys_pressed[5] == 1)
            sound_signal = sound_signal + signal_FS;
        if (keys_pressed[4] == 1)
            sound_signal = sound_signal + signal_G;
        if (keys_pressed[3] == 1)
            sound_signal = sound_signal + signal_GS;
        if (keys_pressed[2] == 1)
            sound_signal = sound_signal + signal_A;
        if (keys_pressed[1] == 1)
            sound_signal = sound_signal + signal_AS;
        if (keys_pressed[0] == 1)
            sound_signal = sound_signal + signal_B;
    end
    
endmodule
