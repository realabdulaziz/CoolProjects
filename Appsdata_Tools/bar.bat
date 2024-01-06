@echo off
set Line1=%1
set Time=%2
set Line2=%3

for /l %%i in (1, 1, 100) do (
    echo %Line1% %%i%% %Line2%
    timeout /nobreak /t %Time% >nul
    cls
)

echo Done
