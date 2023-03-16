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
    input [15:0] pixel_data,
    input [15:0] sw,
    output [7:0] Jc
    );
    
    wire clk_6p25mhz;
    my_clock_divider clk6p25mHz(clock,7, clk_6p25mhz);
    
    wire [15:0] oled_data;
    wire frame_begin, sending_pixel, sample_pixel;
    wire [12:0] pixel_index;
    
    Oled_Display oled (
            .clk(clk_6p25mhz),
            .reset(0),
            .frame_begin(frame_begin),
            .sending_pixels(sending_pixel),
            .sample_pixel(sample_pixel),
            .pixel_index(pixel_index),
            .pixel_data(oled_data),
            .cs(Jc[0]),
            .sdin(Jc[1]),
            .sclk(Jc[3]),
            .d_cn(Jc[4]),
            .resn(Jc[5]),
            .vccen(Jc[6]),
            .pmoden(Jc[7])
            );
            
    wire [6:0] x;
    wire [6:0] y;
    oled_x_y_coord xy(pixel_index, x, y);
    
    wire [15:0] d_indiv_oled_data;
    //stu_D_indiv_task d_indiv_task(clock, x, y, sw, d_indiv_oled_data);
    //assign oled_data = d_indiv_oled_data;     
    
    wire[15:0] group_task_oled_data;
    group_task task_group(clock, x, y, sw, group_task_oled_data);   
    assign oled_data = group_task_oled_data;
    
endmodule