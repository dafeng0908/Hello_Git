@echo off
setlocal

for /f "delims=" %%B in ('git branch --show-current 2^>nul') do set "BRANCH=%%B"
if "%BRANCH%"=="" set "BRANCH=main"

git status

echo.
set /p "MSG=Commit message [Update project]: "
if "%MSG%"=="" set "MSG=Update project"

git add -A

git diff --cached --quiet
if errorlevel 1 (
    git commit -m "%MSG%"
    if errorlevel 1 (
        echo.
        echo Commit failed.
        pause
        exit /b 1
    )
) else (
    echo.
    echo No local changes to commit.
)

echo.
echo Pulling latest changes from origin/%BRANCH% ...
git pull --rebase origin "%BRANCH%"
if errorlevel 1 (
    echo.
    echo Pull/rebase failed. Resolve conflicts, then run this script again.
    pause
    exit /b 1
)

echo.
echo Pushing to origin/%BRANCH% ...
git push origin "%BRANCH%"
if errorlevel 1 (
    echo.
    echo Push failed.
    pause
    exit /b 1
)

echo.
echo Update completed successfully.
pause
