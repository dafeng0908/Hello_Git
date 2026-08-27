@echo off
setlocal

echo Available local branches:
git branch

echo.
set /p "BRANCH=Enter branch name to switch to: "
if "%BRANCH%"=="" (
    echo Branch name is required.
    pause
    exit /b 1
)

git switch "%BRANCH%"
if errorlevel 1 (
    echo.
    echo Switch failed. If the branch only exists remotely, run: git fetch origin
    pause
    exit /b 1
)

echo.
echo Switched to branch: %BRANCH%
pause
