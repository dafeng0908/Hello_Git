@echo off
setlocal

set /p "BRANCH=Enter new branch name: "
if "%BRANCH%"=="" (
    echo Branch name is required.
    pause
    exit /b 1
)

git switch -c "%BRANCH%"
if errorlevel 1 (
    echo.
    echo Branch creation failed.
    pause
    exit /b 1
)

echo.
echo Created and switched to branch: %BRANCH%
pause
