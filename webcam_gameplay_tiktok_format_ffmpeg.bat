
REM Webcam
REM ffplay -i test_clip.mp4 -vf "in_h*(12/16):260:0:in_h"
REM ffmpeg -i test_clip.mp4 -filter:v "crop=in_h*(12/16):260:0:in_h" -c:a copy webcam_out.mp4

REM Gameplay
REM ffplay -i test_clip.mp4 -vf "in_h*(12/16):in_h-260"
REM ffmpeg -i test_clip.mp4 -filter:v "in_h*(12/16):in_h-260" -c:a copy gameplay_out.mp4

set source_video=2022-11-07_14-25-54.mkv_02_00_35-00_00_47_clip.mp4
set webcam_h=260
set webcam=[0:v]crop=in_h:%webcam_h%:0:in_h[v0];
set gameplay=[1:v]crop=in_h:in_h-%webcam_h%[v1];
set stack=[v0][v1]vstack
ffmpeg -i %source_video% -i %source_video% -c:v h264_nvenc -c:a aac -filter_complex "%webcam%%gameplay%%stack%" short_%source_video%

pause
