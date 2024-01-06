@echo off
setlocal enabledelayedexpansion

set "sourceFolder=%1"
set "zipFile=%2"

if not defined sourceFolder (
    echo Usage: %~nx0 ^<SourceFolder^> ^<ZipFile^>
    goto :eof
)

if not defined zipFile (
    echo Usage: %~nx0 ^<SourceFolder^> ^<ZipFile^>
    goto :eof
)

7z a "%zipFile%" "%sourceFolder%"

echo Compression complete. ZIP file created: %zipFile%
