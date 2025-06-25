@echo off
SET lang=%1
if "%lang%" == "" (
	echo Missing language id, please specific the language to use [ie convert.bat 44]
	exit /b
)

echo Converting voice files for language: %lang%
echo.

if not exist "ffmpeg.exe" (
	echo Missing ffmpeg, check Readme.md for preperation info
	exit /b
)


if not exist "convert\" (
	echo Missing convert directory, create the convert directory and copy the audio files in
	exit /b
)

FOR /F "tokens=*" %%G IN ('dir /b convert\*.mp3') DO (
	echo Converting '%%G'...
	ffmpeg -y -i "convert\%%G" -acodec pcm_s16le -ac 1 -ar 44100 -filter:a "volume=8dB" "%lang%\%%~nG.wav"
)
