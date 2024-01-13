@echo off
set /p Folder=Enter the Folder Path:
echo Creating
copy "%Folder%" "%Folder%.File" >nul