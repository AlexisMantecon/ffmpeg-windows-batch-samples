
set source_video=2022-11-28_16-46-26.mkv
set ini_clip=00:11:44.0
set clip_duration=00:00:07.0
set output=%source_video%_%ini_clip%-%clip_duration%
set output=%output::=_%
set output=%output:.0=%
ffmpeg -ss %ini_clip% -accurate_seek -i %source_video% -c:v h264_nvenc -preset 18 -c:a aac -t %clip_duration% -acodec copy -vcodec copy -qscale 0 %output%_clip.mp4

pause