`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////

module Clock_divider (
    input CLOCK,
    input [31:0] m,
    output reg clock_SMTHhz = 0
    );
    reg [31:0] count = 4'b00000000000000000000000000000000; 
    
    always @ (posedge CLOCK) begin
        count <= count + 1;
        count <= (count == m) ? 0 : count + 1;
        clock_SMTHhz  <= (count == 4'b00000000000000000000000000000000) ? ~clock_SMTHhz : clock_SMTHhz;
    end   
endmodule

module Volume_level (
    input [11:0] peak_value,
    output reg [3:0] volume_level = 0
    );
    always @ (*)
    begin
    if (peak_value <= 2048) //volume level 0
        volume_level <= 0;
    if (peak_value > 2048 && peak_value <= 2275) //volume level 1
        volume_level <= 1;
    if (peak_value > 2275 && peak_value <= 2503) //volume level 2
        volume_level <= 2;
    if (peak_value > 2503 && peak_value <= 2730) //volume level 3
        volume_level <= 3;
    if (peak_value > 2730 && peak_value <= 2958) //volume level 4
        volume_level <= 4;
    if (peak_value > 2958 && peak_value <= 3185) //volume level 5
        volume_level <= 5;
    if (peak_value > 3185 && peak_value <= 3413) //volume level 6
        volume_level <= 6;
    if (peak_value > 3413 && peak_value <= 3640) //volume level 7
        volume_level <= 7;
    if (peak_value > 3640 && peak_value <= 3868) //volume level 8
        volume_level <= 8;
    if (peak_value > 3868 && peak_value <= 4095) //volume level 9
        volume_level <= 9;
    end
endmodule

module Update_display (
    input [3:0] volume_level,
    output reg [8:0] led = 9'b000000000,
    output reg [3:0] an = 4'b1111,
    output reg [6:0] seg = 7'b1111111
    );
    always @ (*)
    begin
        if(volume_level == 0) //volume level 0    
        begin
            led <= 9'b000000000; 
            an <= 4'b1111;
            seg <= 7'b1111111;
        end
        if(volume_level == 1) //volume level 1, display '1' on 7 segment display
        begin
            led <= 9'b000000001;
            an <= 4'b1110;  
            seg <= 7'b1001111;
        end
        if(volume_level == 2) //volume level 2    
        begin
            led <= 9'b000000011;
             an <= 4'b1110;
             seg <= 7'b0100100;
        end
        if(volume_level == 3) //volume level 3    
        begin
            led <= 9'b000000111;
             an <= 4'b1110;
             seg <= 7'b0110000;
        end
        if(volume_level == 4) //volume level 4
        begin
            led <= 9'b000001111;
             an <= 4'b1110;
             seg <= 7'b1100110;
        end  
        if(volume_level == 5) //volume level 5
        begin
            led <= 9'b000011111;
             an <= 4'b1110;
             seg <= 7'b0010010;
        end  
        if(volume_level == 6) //volume level 6  
        begin
            led <= 9'b000111111;
             an <= 4'b1110;
             seg <= 7'b1111101; 
        end  
        if(volume_level == 7) //volume level 7
        begin
           led <= 9'b001111111;
            an <= 4'b1110;
            seg <= 7'b1111000;
        end  
        if(volume_level == 8) //volume level 8 
        begin
            led <= 9'b011111111;
             an <= 4'b1110;
             seg <= 7'b0000000;
        end  
        if(volume_level == 9) //volume level 9
        begin
            led <= 9'b111111111;
             an <= 4'b1110;
             seg <= 7'b0001000;
        end  
    end
endmodule

module Student_a (
    input CLOCK,
    input J_MIC_Pin3,
    output J_MIC_Pin1,
    output J_MIC_Pin4,
    output reg [8:0] led = 0,
    output reg [3:0] an = 1,
    output reg [6:0] seg = 1
    );
    reg [31:0] count = 32'b00000000000000000000000000000000;
    reg [11:0] peak_value = 12'b000000000000;
    reg [11:0] current_value = 12'b000000000000;
    wire clock_20khz;
    wire [11:0] MIC_in;
    wire [3:0] volume_level;
    wire [8:0] LED; 
    wire [3:0] AN;
    wire [6:0] SEG;
    Clock_divider fa1(CLOCK, 2499, clock_20khz);
    Volume_level unit_level(peak_value, volume_level);
    Update_display unit_display(volume_level, LED, AN, SEG); 
    
    Audio_Input unit_Audio (
        .CLK(CLOCK), // 100MHz clock
        .cs(clock_20khz), // sampling clock, 20kHz
        .MISO(J_MIC_Pin3), // J_MIC3_Pin3, serial mic input
        .clk_samp(J_MIC_Pin1), // J_MIC3_Pin1
        .sclk(J_MIC_Pin4), // J_MIC3_Pin4, MIC3 serial clock
        .sample(MIC_in) // 12-bit audio sample data
        );
   
   always @ (posedge clock_20khz) //every 50ms
   begin
        current_value <= MIC_in;
        count <= count + 1;
        if(current_value > peak_value)
            peak_value <= current_value;
        if(count >= 4000) //every 4000 x 50ms = 0.2s
        begin
            //update LEDs & 7 segment display
            led <= LED;
            seg <= SEG;
            an <= AN;
            //reset count to zero
            count <= 32'b00000000000000000000000000000000;
            //reset peak_value back to zero
            peak_value <= 32'b00000000000000000000000000000000;
        end
   end
endmodule
