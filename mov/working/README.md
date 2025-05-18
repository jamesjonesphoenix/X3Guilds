# Preperation

1. Download and copy ffmpeg.exe to working directory
2. Copy X3FL voice stream 3 file from addon2/mov to working directory (ie 00344.dat)
3. Copy X3 Reunion voice file from Reunion/mov to working directory (ie 00144.dat)

# For other languages

Copy the voice xml (and dat) files into working directory (ie 00044.xml).
000??.xml from X3FL and 000??.xml from Reunion, rename the Reunion one to 000??_reunion.xml

# Building

run the build.bat file from working directory with the language id (ie build.bat 44)

# Process

1. ffmpeg will be used to convert the .dat files into wav, and place them in the language directory. (ie working/44)
2. voice command will extract each of the needed pagaes from the Reunion Voice file
3. voice command merge all the extracted Reunion Voice files into the FL stream 3 file.
4. voice command will then merge all the individual voice files from the language directory into the FL stream 3 file.
5. ffmpeg will be used to convert to newly created wav back into a .dat file

# Reunion Plot Voice Pages

169: Ban Danna<br/>
176: Julian<br/>
191: Gamma Flight Leader<br/>
192: Gamma Patrol: Kiman<br/>
193: Gamma Patrol: Loka<br/>
194: Gamma Patrol: Nia<br/>
196: Argon Police (Chase Scene)<br/>
961: Saya Kho<br/>
962: Noah<br/>
966: Ion Battler<br/>
967: Dogun<br/>
990: Argon Police (Chase Scene)<br/>
992: Yaki Leader (Turret Mission)<br/>
