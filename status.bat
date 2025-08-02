@echo off
setlocal enabledelayedexpansion
set "LOCAL_VERSION=1.0.1"

echo This script checks the availability of all of the sites from list-banned.txt.
:: Set current version and URLs
chcp 437 > nul
echo Checking updates...
set "GITHUB_VERSION_URL=https://raw.githubusercontent.com/whyplural/banstatus/main/version.txt"
set "GITHUB_RELEASE_URL=https://github.com/whyplural/banstatus/releases/tag/"
set "GITHUB_DOWNLOAD_URL=https://github.com/whyplural/banstatus/releases/latest/download/banstatus-"

:: Get the latest version from GitHub
for /f "delims=" %%A in ('powershell -command "(Invoke-WebRequest -Uri \"%GITHUB_VERSION_URL%\" -Headers @{\"Cache-Control\"=\"no-cache\"} -TimeoutSec 5).Content.Trim()" 2^>nul') do set "GITHUB_VERSION=%%A"

:: Error handling
if not defined GITHUB_VERSION (
    echo Warning: failed to fetch the latest version. Check your internet connection. This warning does not affect the operation of zapret
    pause
    if "%1"=="soft" exit /b 
    goto menu
)

:: Version comparison
if "%LOCAL_VERSION%"=="%GITHUB_VERSION%" (
    echo Latest version installed: %LOCAL_VERSION%
    
    if "%1"=="soft" exit /b
    pause
    goto menu
) 

echo New version available: %GITHUB_VERSION%
echo Release page: %GITHUB_RELEASE_URL%%GITHUB_VERSION%

set "CHOICE="
set /p "CHOICE=Do you want to automatically download the new version? (Y/N) (default: Y) "
if "%CHOICE%"=="" set "CHOICE=Y"
if /i "%CHOICE%"=="y" set "CHOICE=Y"

if /i "%CHOICE%"=="Y" (
    echo Opening the download page...
    start "" "%GITHUB_DOWNLOAD_URL%%GITHUB_VERSION%.zip"
)


if "%1"=="soft" exit /b
pause
cls

:: Пингуем один раз
ping -n 1 nyaa.si > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "nyaa.si is available."
) else (
    :: Красный цвет текста
    call :PrintRed "nyaa.si is NOT available."
)

:: Удаляем временный файл



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ping -n 1 x.com > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "x.com is available."
) else (
    :: Красный цвет текста
    call :PrintRed "x.com is NOT available."
)




:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ping -n 1 instagram.com > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "instagram.com is available."
) else (
    :: Красный цвет текста
    call :PrintRed "instagram.com is NOT available."
)




:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ping -n 1 jut.su > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "jut.su is available."
) else (
    :: Красный цвет текста
    call :PrintRed "jut.su is NOT available."
)




:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ping -n 1 yummyani.me > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "yummyani.me is available."
) else (
    :: Красный цвет текста
    call :PrintRed "yummyani.me is NOT available."
)




:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ping -n 1 anilibria.top > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "anilibria.top is available."
) else (
    :: Красный цвет текста
    call :PrintRed "anilibria.top is NOT available."
)




:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ping -n 1 rule34.xxx > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "rule34.xxx is available."
) else (
    :: Красный цвет текста
    call :PrintRed "rule34.xxx is NOT available."
)


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ping -n 1 discord.gg > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "discord.gg is available."
) else (
    :: Красный цвет текста
    call :PrintRed "discord.gg is NOT available."
)


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ping -n 1 rutracker.org > nul


if %errorlevel%==0 (
    :: Зелёный цвет текста
    call :PrintGreen "rutracker.org is available."
) else (
    :: Красный цвет текста
    call :PrintRed "rutracker.org is NOT available."
)



endlocal
pause
goto :EOF

:PrintGreen
powershell -Command "Write-Host \"%~1\" -ForegroundColor Green"
exit /b

:PrintRed
powershell -Command "Write-Host \"%~1\" -ForegroundColor Red"
exit /b


