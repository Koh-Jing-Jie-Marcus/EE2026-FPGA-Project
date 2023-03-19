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
