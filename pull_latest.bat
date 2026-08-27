@echo off
setlocal

for /f "delims=" %%B in ('git branch --show-current 2^>nul') do set "BRANCH=%%B"
if "%BRANCH%"=="" (
    echo Not inside a Git repository or branch is unavailable.
    pause
    exit /b 1
)

echo Pulling latest changes from origin/%BRANCH% ...
git pull --rebase origin "%BRANCH%"
if errorlevel 1 (
    echo.
    echo Pull failed. Check conflicts, network, or remote configuration.
    pause
    exit /b 1
)

echo.
echo Local branch is up to date.
pause
