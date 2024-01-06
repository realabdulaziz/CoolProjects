@echo off
:a
cls
set /p m=Enter what to open:
if exist %m% start %m%
goto :a