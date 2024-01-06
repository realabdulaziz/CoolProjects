@echo off
title Chat

set /p Name=Enter your name:

:Main
set /p Message=Type something:
echo %Name%: %Message% >> Chat.txt
cls
goto :Main
