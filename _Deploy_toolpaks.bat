echo off

REM ---------- Edit these variables as needed. --------------------------------

REM 	Set the collection name, which is used for the archive name.
set "setname=AdjLCD"

REM ---------- No user-editable variables below. ------------------------------

REM	Ask for new version number, which is used to find-replace in files.
set /p ver="Enter a new version number: "



REM	Copy target files to temporary folder.
if exist "temp\" rmdir "temp" /s /q
if not exist "temp\" mkdir "temp\"
robocopy src\ temp\ /s

REM Copy the readme up and rename it to .txt (because I've seen people
REM in the retro gaming community get confused expecting .md to be a MegaDrive ROM).
robocopy .\ temp\ README.md
rename temp\README.md AdjLCD-README.txt

REM	Do the final zipping.
if not exist "distrib\" mkdir "distrib\"
if exist "distrib\%setname%-%ver%.zip" del distrib\%setname%-%ver%.zip
7z a -tzip -r- distrib\%setname%-%ver%.zip .\temp\*

REM	Delete the temporary folder and announce success
REM	Wait for a second to wait for the processes to finish.
timeout /t 2 /nobreak
if exist "temp\" rmdir "temp" /s /q

echo.
echo Version v%ver% of %setname% was built.
echo The distributable is at 'distrib/%etname%-%ver%.zip'.
echo.

PAUSE
