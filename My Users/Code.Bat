@echo off
title My-App Start-Up Manager
color 4F
cd "V's"
cls
dir/b
set /p m=
if not exist "%m%" goto :incorrectMvar
cd %m%
cls
if not exist start-up.bat goto :error
start-up.bat
:error
echo cannot find start-up.bat to Run %m%
Pause >nul
exit
:incorrectMvar
echo Error: the thing you typed is Not Found
Pause >nul
exit