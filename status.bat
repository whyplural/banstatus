@echo off
setlocal enabledelayedexpansion

echo This script checks the availability of all of the sites from list-banned.txt.
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


