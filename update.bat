@echo off
setlocal enabledelayedexpansion
set "LOCAL_VERSION=2.0.1"

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
    echo Warning: failed to fetch the latest version.
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
set /p "CHOICE=Do you want to download the new version? (Y/N) (default: Y) "
if "%CHOICE%"=="" set "CHOICE=Y"
if /i "%CHOICE%"=="y" set "CHOICE=Y"

if /i "%CHOICE%"=="Y" (
    echo Opening the download page...
    start "" "%GITHUB_DOWNLOAD_URL%%GITHUB_VERSION%.zip"
)


if "%1"=="soft" exit /b
pause
cls