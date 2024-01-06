@echo off
cls
Title Chat List
if exist "Chat.txt" goto :Main
if not exist "Chat.txt" goto :CreateMain
:CreateMain
echo. >Chat.txt
goto :Main
:Main
echo Time:%Time%       Date:%Date%
type "Chat.txt"
timeout 0 /nobreak >nul
timeout 0 /nobreak >nul
cls
goto :Main