for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=%dt:~0,4%" & set "mm=%dt:~4,2%"  & set "dd=%dt:~6,2%"
set "HH=%dt:~8,2%"   & set "MM=%dt:~10,2%" & set "SS=%dt:~12,2%" & set "ff=%dt:~15,2%"
set "fullstamp=%YYYY%-%mm%-%dd%_%HH%-%MM%-%SS%-%ff%"

set output=%fullstamp%_output_concat.mp4
for %%i In (*.mp4) do echo file %%i >> lista_clips.txt
ffmpeg -f concat -i lista_clips.txt -safe 0 -c:v h264_nvenc -preset 18 -vcodec copy -c:a aac -af aselect=1 temp_output.mp4
del /F lista_clips.txt
ffmpeg -ss 00:00:01.0 -accurate_seek -i temp_output.mp4 -c:v h264_nvenc -preset 18 -c:a aac -acodec copy -vcodec copy -qscale 0 %output%
del /F temp_output.mp4
pause
