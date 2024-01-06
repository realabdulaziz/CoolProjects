@echo off
cd Data
Echo Loading
mode 90,30
set Name=%*
title User: %Name%
color 1F
setlocal EnableDelayedExpansion
:Main
title User: %Name%
cls

rem Define menu items
set "menu[1]=Settings"
set "menu[2]=Game"
set "menu[3]=More"
set "menu[4]=Exit"

rem Initialize variables
set /A "selected=1"

:displayMenu
cls
echo Choose an option:
echo Use the W to move up
echo Use the S to move down
echo Use the X to Start
echo.
for /L %%i in (1,1,4) do (
    if %%i equ !selected! (
        echo [!menu[%%i]!]
    ) else (
        echo !menu[%%i]!
    )
)

rem Use choice command to capture arrow keys
choice /C WSX /N /M " "
set "key=%errorlevel%"

rem Process arrow keys
if %key% equ 1 (
    set /A "selected-=1"
    if !selected! lss 1 set "selected=4"
) else if %key% equ 2 (
    set /A "selected+=1"
    if !selected! gtr 4 set "selected=1"
) else if %key% equ 3 (
    goto :selectedOption
)

rem Repeat the loop
goto displayMenu

:selectedOption
cls
if %selected%==1 goto :Settings
if %selected%==2 goto :Game
if %selected%==3 goto :More
if %selected%==4 goto :Exit
:Settings
echo 1. Set Background and Text Color
echo 2. Help
echo 3. go Back
choice /C 123 /N /M " "
if %Errorlevel%==1 goto :Color
if %Errorlevel%==2 goto :Help
if %Errorlevel%==3 goto :Main
:Help
cls
echo the Settings is the easy way to set your own things up
echo the Chat App is the way to chat your friends,Other Users in the Computer
echo the Game is an Fun Game do everyday you play
echo the Notes is the easy way to type,create files
echo the Bug Reporter is the way to report an bug to be fixed
echo the Exit is the easy way to exit
Pause
goto :Settings
:Color
Echo Enter the Background Color
Echo.
echo 0 = Black       8 = Gray
echo 1 = Blue        9 = Light Blue
echo 2 = Green       A = Light Green
echo 3 = Aqua        B = Light Aqua
echo 4 = Red         C = Light Red
echo 5 = Purple      D = Light Purple
echo 6 = Yellow      E = Light Yellow
echo 7 = White       F = Bright White
set /p backg=
cls
Echo Enter the Text Color
Echo.
echo 0 = Black       8 = Gray
echo 1 = Blue        9 = Light Blue
echo 2 = Green       A = Light Green
echo 3 = Aqua        B = Light Aqua
echo 4 = Red         C = Light Red
echo 5 = Purple      D = Light Purple
echo 6 = Yellow      E = Light Yellow
echo 7 = White       F = Bright White
set /p TextColor=
cls
color %backg%%TextColor%
goto :Settings
:Chat
cd Apps\Chat
start "" "cmd /k Chat.bat"
start "" "cmd /k App.bat  %Name% "
cd ..\..
goto :Main
:Game
title Math Game

set /a score=0
set /a rounds=5

echo Welcome to the Math Game!
echo You will be asked %rounds% addition questions.

REM Loop for the specified number of rounds
for /l %%i in (1, 1, %rounds%) do (
    call :GenerateQuestion
    call :AskQuestion
)

echo Game Over! Your final score is: %score%
pause
exit /b

:GenerateQuestion
set /a num1=%random% %% 10 + 1
set /a num2=%random% %% 10 + 1
set /a answer=num1+num2
exit /b

:AskQuestion
set /p userAnswer=What is %num1% + %num2%? 
if %userAnswer% equ %answer% (
    echo Correct!
    set /a score+=1
) else (
    echo Incorrect. The correct answer is %answer%.
)
echo.
goto :Main
:More
cls
echo 1. Chat
echo 2. Notes
echo 3. Bug Reporter
echo 4. Go Back
choice /C 1234 /N /M " "
cls
if %Errorlevel%==1 goto :Chat
if %Errorlevel%==2 goto :Notes
if %Errorlevel%==3 goto :BugReport
if %Errorlevel%==4 goto :Main
:Notes
Echo Files you have
dir/b MyFiles
Echo.
echo for Text File Type [[YourFileName]].txt
set /p File=Enter a Filename:
cd MyFiles
:a
cls
if exist "%File%" type "%File%"
set /p m=
echo. %m% >> "%File%"
goto :a
:BugReport
cd Apps\BugReport
start "" "App.bat"
cd ..\..
goto :More
:Exit
Exit