@echo off
REM Llamada directa a la subrutina con parámetros
call :recorta_video "Hunt  Showdown 2025.03.22 - 00.55.29.38.Hunter killed.DVR.mp4" "00:00:14.0" "00:00:09"
exit

:recorta_video
	REM Mostrar los parámetros
	echo Parametro 1: %1
	echo Parametro 2: %2
	echo Parametro 3: %3

	REM Asignar los valores a variables
	set "source_video=%~1"
	echo Fuente de video: %source_video%

	REM Si el archivo existe, renombrarlo eliminando espacios
	set "new_name=%source_video: =%"
	if exist "%source_video%" (
		ren "%source_video%" "%new_name%"
	set "source_video=%new_name%"
	) else (
		set "source_video=%new_name%"
		echo El archivo no existe.
	)

	REM Imprimir el nuevo nombre de archivo
	echo Nuevo nombre de video: %source_video%

	REM Asignar otros parámetros
	set "ini_clip=%~2"
	set "clip_duration=%~3"
	set "output=%source_video%_%ini_clip%-%clip_duration%"
	set "output=%output::=_%"
	set "output=%output:.0=%"

	REM Imprimir el nombre del archivo de salida
	echo Nombre del archivo de salida: %output%_clip.mp4

	REM Ejecutar ffmpeg
	ffmpeg -ss %ini_clip% -accurate_seek -i "%source_video%" -c:v h264_nvenc -preset 11 -c:a aac -t %clip_duration% "%output%_clip.mp4"
	REM ffmpeg -i %source_video% -ss %ini_clip% -t %clip_duration% -c:v libx264 -crf 18 -b:v 2000k -c:a aac -b:a 256k %output%_clip.mp4
	pause

