@echo off
setlocal

set "GITHUB_USER=dafeng0908"
set /p "REPO=Enter repository name: "

if "%REPO%"=="" (
    echo Repository name is required.
    pause
    exit /b 1
)

echo.
echo Cloning https://github.com/%GITHUB_USER%/%REPO%.git

git clone "https://github.com/%GITHUB_USER%/%REPO%.git"
if errorlevel 1 (
    echo.
    echo Clone failed.
    pause
    exit /b 1
)

cd /d "%REPO%"

echo.
echo Clone completed.
git status
pause
