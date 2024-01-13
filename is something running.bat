@echo off
:a
cls
set /p Process=Enter an Process:
echo.
tasklist | find "%Process%" >nul
if %Errorlevel%==0 echo "%Process%" is running
if not %Errorlevel%==0 echo "%Process%" is not running
Pause >nul
goto :a