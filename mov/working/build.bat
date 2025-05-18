@echo off
SET lang=%1
if "%lang%" == "" (
	echo Missing language id, please specific the language to use [ie build.bat 44]
	exit /b
)

echo Building voice files for language: %lang%
echo.

if not exist "ffmpeg.exe" (
	echo Missing ffmpeg, check Readme.md for preperation info
	exit /b
)

SET rfile=001%lang%.dat
SET file=003%lang%.dat

if not exist "%rfile%" (
	echo Missing Reunion voice file, %rfile%, check Readme.md for preperation info
	exit /b
)
if not exist "%file%" (
	echo Missing FL voice file, %file%, check Readme.md for preperation info
	exit /b
)

if not exist "000%lang%_reunion.xml" (
	echo Missing Reunion stream file, "000%lang%_reunion.xml", check Readme.md for preperation info
	exit /b
)

if not exist "000%lang%.xml" (
	echo Missing FL stream file, "000%lang%.xml", check Readme.md for preperation info
	exit /b
)

if exist "%lang%\001%lang%.wav" (
	echo voice file, "%lang%\001%lang%.wav", already exists, skipping...
) else (
	echo.
	echo Converting reunion voice file to wav...
	ffmpeg -y -i %rfile% -ar 44100 "%lang%\001%lang%.wav"
)

if exist "%lang%\003%lang%.wav" (
	echo voice file, "%lang%\003%lang%.wav", already exists, skipping...
) else (
	echo.
	echo Converting fl voice file to wav...
	ffmpeg -y -i %file% -ar 44100 "%lang%\003%lang%.wav"
)


echo.
echo Extracting Reunion voice files
voice --quiet --showresult extract --stream:1 169 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\bandanna.wav
voice --quiet --showresult extract --stream:1 176 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\julian.wav
voice --quiet --showresult extract --stream:1 191 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\gamma_leader.wav
voice --quiet --showresult extract --stream:1 192 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\kiman.wav
voice --quiet --showresult extract --stream:1 193 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\loka.wav
voice --quiet --showresult extract --stream:1 194 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\nia.wav
voice --quiet --showresult extract --stream:1 196 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\argon_police_1.wav
voice --quiet --showresult extract --stream:1 961 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\saya.wav
voice --quiet --showresult extract --stream:1 962 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\noah.wav
voice --quiet --showresult extract --stream:1 966 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\ion.wav
voice --quiet --showresult extract --stream:1 967 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\dogun.wav
voice --quiet --showresult extract --stream:1 990 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\argon_police_2.wav
voice --quiet --showresult extract --stream:1 992 "000%lang%_reunion.xml" "%lang%\001%lang%.wav" %lang%\yaki_leader.wav

echo.
echo Merging Reunion voice files
voice --quiet --showresult merge --out:"003%lang%_output.wav" --outxml:"000%lang%_output.xml" "000%lang%.xml" "%lang%\003%lang%.wav" "000%lang%_reunion.xml" "%lang%\bandanna.wav" --stream:3 --page:169
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\julian.wav" --stream:3 --page:176
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\gamma_leader.wav" --stream:3 --page:191
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\kiman.wav" --stream:3 --page:192
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\loka.wav" --stream:3 --page:193
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\nia.wav" --stream:3 --page:194
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\argon_police_1.wav" --stream:3 --page:196
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\saya.wav" --stream:3 --page:961
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\noah.wav" --stream:3 --page:962
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\ion.wav" --stream:3 --page:966
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\dogun.wav" --stream:3 --page:967
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\argon_police_2.wav" --stream:3 --page:990
voice --quiet --showresult merge "000%lang%_output.xml" "003%lang%_output.wav" "000%lang%_reunion.xml" "%lang%\yaki_leader.wav" --stream:3 --page:992

echo.
echo Merging individual sound files
voice --quiet --showresult --verboseresult compile --stream:3 "000%lang%_output.xml" "003%lang%_output.wav" %lang%

echo.
echo Converting wav to dat
ffmpeg -y -i "003%lang%_output.wav" -ac 1 -c:a wmav2 -b:a 48k "003%lang%_output.wma"

echo.
echo Converting wav for linux
ffmpeg -y -i "003%lang%_output.wav" -c:a libvorbis "003%lang%_output.oga"

echo.
echo Copying output files to build directory
xcopy /Y "000%lang%_output.xml" "../000%lang%.xml" > nul
move /Y "003%lang%_output.wma" "../003%lang%.dat" > nul

