@echo off
setlocal enabledelayedexpansion

set "zipFile=%1"

if not defined zipFile (
    echo Usage: %~nx0 ^<ZipFile^>
    goto :eof
)

set "outputFolder=%zipFile:.zip=%"
set "outputFolder=%outputFolder:"=%"
set "outputFolder=%outputFolder:-=_%"
set "outputFolder=%outputFolder:_=%"

if not exist "%outputFolder%" mkdir "%outputFolder%"

7z x "%zipFile%" -o"%outputFolder%"

echo Extraction complete. Output folder: %outputFolder%
