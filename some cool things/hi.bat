@echo off
:passcode
title Passcode
cls
echo Enter your passcode
set /p pass=
if %pass%==ABC goto :Enter
:fail
cls
echo wait for 30 seconds
timeout 30 /nobreak > nul
goto :passcode
:Enter
cls
title Winner
echo %username% is the winner
Pause > nul
goto :Enter