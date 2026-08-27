@echo off
setlocal

set "GITHUB_USER=dafeng0908"
set /p "REPO=Enter new GitHub repository name: "
if "%REPO%"=="" (
    echo Repository name is required.
    pause
    exit /b 1
)

if not exist ".git" git init

git add -A
git commit -m "Initial commit"
git branch -M main

git remote remove origin 2>nul
git remote add origin "https://github.com/%GITHUB_USER%/%REPO%.git"

echo.
echo NOTE: The repository must already exist on GitHub.
echo Remote: https://github.com/%GITHUB_USER%/%REPO%.git
set /p "CONFIRM=Push local files now? [Y/N]: "
if /I not "%CONFIRM%"=="Y" (
    echo Cancelled.
    pause
    exit /b 0
)

git push -u origin main
if errorlevel 1 (
    echo.
    echo Push failed. Check whether the GitHub repository exists and your login is valid.
    pause
    exit /b 1
)

echo.
echo Repository setup completed.
pause
