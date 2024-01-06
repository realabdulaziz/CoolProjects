@echo off

setlocal enabledelayedexpansion

set "SourceFolder=%1"
set "SetupName=%2"
set "OutputZip=%3"
set "OutputFolder=%4"

if not defined SourceFolder (
    goto :Help
)

if not defined SetupName (
    goto :Help
)

if not defined OutputZip (
    goto :Help
)

if not defined OutputFolder (
    goto :Help
)

mkdir "%OutputFolder%"
cd Tools

:: Call your Zip.bat script to create the ZIP archive
call :ZipScript "!SourceFolder!" "!OutputZip!"

:: Move the ZIP file to the specified output folder
move "!OutputZip!" "..\!OutputFolder!"

cd "..\!OutputFolder!"

:: Create UnZip.bat file
echo @echo off > "%SetupName%"
echo UnZip.bat "!OutputZip!" >> "%SetupName%"

:CopyTools
:: Copy necessary tools to the output folder
xcopy "..\Tools\*" ".\" /E /Y

:HideTools
:: Hide the files in the Tools folder using attrib
attrib +h "Tools\*.*"

:: Unhide the SetupName file
attrib -h "%SetupName%"

goto :Help

:Help
echo Creator: AmazingAbdulTV
echo Go to https://www.youtube.com/@AmazingAbdulTV And Subsribe
echo Usage: MakeSetup.bat ^<SourceFolder^> ^<SetupName^> ^<OutputZip^> ^<OutputFolder^>
goto :eof

:ZipScript
:: Call your Zip.bat script to create the ZIP archive
call Zip.bat %1 %2
goto :eof
