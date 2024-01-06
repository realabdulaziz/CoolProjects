@echo off
Title Timer
set wait=0
:Main
cls
echo %wait% secsonds
timeout 1 /nobreak >nul
set /a wait=1+%wait%
goto :Main