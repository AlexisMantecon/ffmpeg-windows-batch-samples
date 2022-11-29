for %%i In (*.mp4) do echo file %%i >> lista_clips.txt
ffmpeg -f concat -i lista_clips.txt -safe 0 -c:v h264_nvenc -vcodec copy -af aselect=1 output_concat.mp4
del /F lista_clips.txt
pause
