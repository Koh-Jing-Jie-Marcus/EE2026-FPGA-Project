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
    
   //For OLED display
    inout PS2Clk, PS2Data,
    output led15, led14, led13,
    output [7:0] JC
    );
    
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
    wire clk6p25mhz;
    clk_div clk6p25mHz(clock,7, clk6p25mhz);
    
    wire [15:0] oled_data;
    wire frame_begin, sending_pixel, sample_pixel;
    wire [12:0] pixel_index;
    
    Oled_Display oled (
            .clk(clk6p25mhz), 
            .reset(rst),
            .frame_begin(frame_begin),
            .sending_pixels(sending_pixel),
            .sample_pixel(sample_pixel),
            .pixel_index(pixel_index),
            .pixel_data(oled_data),
            .cs(JC[0]),
            .sdin(JC[1]),
            .sclk(JC[3]),
            .d_cn(JC[4]),
            .resn(JC[5]),
            .vccen(JC[6]),
            .pmoden(JC[7])
            );
            
    wire [6:0] oled_x;
    wire [6:0] oled_y;
    oled_x_y_coord xy(pixel_index, oled_x, oled_y);
    
    wire [6:0] mouse_x_scale;
    wire [6:0] mouse_y_scale;
    mouse_xy_scale xy_scale(mouse_xpos, mouse_ypos, mouse_x_scale, mouse_y_scale);
    wire [15:0] c_indiv_oled_data;
    stu_C_indiv_task c_indiv_task(clock, mouse_middle_click, oled_x, oled_y, mouse_x_scale, mouse_y_scale, c_indiv_oled_data);
    wire [15:0] ftw_oled_data;
    find_the_white ftw_game(clock, mouse_left_click, oled_x, oled_y, ftw_oled_data);
    wire is_ftw;
    assign is_ftw = sw[9];
    
    //assignment
    assign led15 = (mouse_left_click)? 1 : 0;
    assign led14 = (mouse_middle_click)? 1 : 0;
    assign led13 = (mouse_new_event)? 1 : 0;
    assign oled_data = is_ftw ? ftw_oled_data : c_indiv_oled_data;
    
    wire [15:0] d_indiv_oled_data;
    stu_D_indiv_task d_indiv_task(clock, oled_x, oled_y, sw, d_indiv_oled_data);
    assign oled_data = d_indiv_oled_data;     
    
    wire[15:0] group_task_oled_data;
    group_task task_group(clock, oled_x, oled_y, sw, group_task_oled_data);   
    assign oled_data = group_task_oled_data;
    
endmodule