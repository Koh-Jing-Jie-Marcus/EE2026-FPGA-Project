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

module Top_Student (
    input clock,
    input [15:0] sw,
    input btnC,
    
    //7-segment display
    output [3:0] an,
    output [6:0] seg,
    output dp,
    
    output [3:0] JB,
    
   //For OLED display
    inout PS2Clk, PS2Data,
    output [15:0] led,
    output [7:0] JC
    );
    
    //audio out
    //clocks for audio out
    wire clk20k;
    wire clk50M;
    wire clk200;
    wire clk400;
    
    //period = 50M / freq
    clock_freq clock_20kHz(clock, 2_500, clk20k);
    clock_freq clock_50MHz(clock, 1, clk50M);
    clock_freq clock_200Hz(clock, 250_000, clk200);
    clock_freq clock_400Hz(clock, 125_000, clk400);
    
    //group task audio
    //replace sw[15] and valid_number with signal from oled
    wire valid;
    button_sensor test_valid(clock, sw[15], valid);
    
    //audio out stuff
    wire [11:0] audio_out;
    
    //audio_logic audio_main(clock, clk200, clk400, btnC, sw[0], valid, valid_number, audio_out);
        
    Audio_Output speaker(
    .CLK(clk50M), .START(clk20k), .DATA1(audio_out), .RST(0),
    .D1(JB[1]), .D2(JB[2]), .CLK_OUT(JB[3]), .nSYNC(JB[0])
    );
    
    //mouse instantiation
    reg rst = 0;
    wire[11:0] mouse_xpos, mouse_ypos;
    wire[3:0] mouse_zpos;
    wire mouse_left_click, mouse_middle_click, mouse_right_click, mouse_new_event;
    MouseCtl mouse(
    .clk(clock), .rst(rst), 
    .xpos(mouse_xpos), .ypos(mouse_ypos), .zpos(mouse_zpos), 
    .left(mouse_left_click), .middle(mouse_middle_click), .right(mouse_right_click), .new_event(mouse_new_event),
    .value(0), .setx(0), .sety(0), .setmax_x(0), .setmax_y(0),
    .ps2_clk(PS2Clk), .ps2_data(PS2Data)
    );
    
    //OLED Instantiation
    wire clk6p25m;
    clk_div slow_clk6p25(clock,7, clk6p25m);
    
    wire [15:0] oled_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    
    Oled_Display oled(
         .clk(clk6p25m), .reset(rst), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
         .sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), 
         .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]), .pmoden(JC[7])
       );
            
    wire [6:0] oled_x;
    wire [6:0] oled_y;
    oled_x_y_coord xy(pixel_index, oled_x, oled_y);
    
    //Student C
    wire [6:0] mouse_x_scale;
    wire [6:0] mouse_y_scale;
    mouse_xy_scale xy_scale(mouse_xpos, mouse_ypos, mouse_x_scale, mouse_y_scale);
    wire [15:0] c_indiv_oled_data;
    stu_C_indiv_task c_indiv_task(clock, mouse_middle_click, oled_x, oled_y, mouse_x_scale, mouse_y_scale, c_indiv_oled_data);
    
    //Student C improvement: Find the white game 
    wire [15:0] ftw_oled_data;
    find_the_white ftw_game(clock, mouse_left_click, oled_x, oled_y, ftw_oled_data);

    //Student D
    wire [15:0] d_indiv_oled_data;
    stu_D_indiv_task d_indiv_task(clock, oled_x, oled_y, sw, d_indiv_oled_data);
    
    wire[15:0] group_task_oled_data;
    group_task task_group(clock, oled_x, oled_y, mouse_x_scale, mouse_y_scale, sw, group_task_oled_data);   
        
    wire isValid;
    wire [3:0] valid_number;
    wire [6:0] clicked;
    group_mouse_click group_task_click(
    clock, mouse_left_click, mouse_right_click, mouse_x_scale, mouse_y_scale,
    clicked, isValid, valid_number);
    seven_seg_display seven_seg_display(clk20k, valid, isValid, valid_number, an, seg, dp);
    
    wire is_ftw;
    assign is_ftw = sw[11];
    wire is_c_task;
    assign is_c_task = sw[12];
    wire is_d_task;
    assign is_d_task = sw[13]; 
    wire is_group_task;
    assign is_group_task = sw[14];
    //assignment
    assign led[15] = is_c_task ? ((mouse_left_click)? 1 : 0) : (is_group_task && sw[15]) ? isValid : 0;
    assign led[14] = (mouse_middle_click)? 1 : 0;
    assign led[13] = (mouse_right_click)? 1 : 0;
    
    assign oled_data = is_group_task ? group_task_oled_data : (is_c_task ? c_indiv_oled_data : is_d_task ? d_indiv_oled_data :(is_ftw ? ftw_oled_data : 0));
        
endmodule
