@echo off
ping google.com >nul && (
    echo You are connected to the network
) || (
    echo You are not connected to the network
)
pause >nul