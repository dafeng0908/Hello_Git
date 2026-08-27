@echo off
setlocal

set "GITHUB_USER=dafeng0908"
set /p "REPO=Enter target GitHub repository name: "
if "%REPO%"=="" (
    echo Repository name is required.
    pause
    exit /b 1
)

echo.
echo WARNING: This will replace origin/main with your CURRENT LOCAL FILES.
echo Target: https://github.com/%GITHUB_USER%/%REPO%.git
echo This operation uses --force-with-lease.
echo.
set /p "CONFIRM1=Type YES to continue: "
if /I not "%CONFIRM1%"=="YES" (
    echo Cancelled.
    pause
    exit /b 0
)

set /p "CONFIRM2=Type repository name [%REPO%] again: "
if /I not "%CONFIRM2%"=="%REPO%" (
    echo Repository name does not match. Cancelled.
    pause
    exit /b 1
)

if not exist ".git" git init
git branch -M main

git remote remove origin 2>nul
git remote add origin "https://github.com/%GITHUB_USER%/%REPO%.git"
if errorlevel 1 (
    echo Failed to configure origin.
    pause
    exit /b 1
)

git add -A
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "Replace repo with local files"
    if errorlevel 1 (
        echo Commit failed. Replacement aborted.
        pause
        exit /b 1
    )
) else (
    echo No new local changes to commit.
)

echo.
echo Fetching remote state for lease protection...
git fetch origin
if errorlevel 1 (
    echo Fetch failed. Replacement aborted.
    pause
    exit /b 1
)

echo.
echo Replacing origin/main...
git push --force-with-lease -u origin main
if errorlevel 1 (
    echo.
    echo Replace failed. Remote may have changed or access may be denied.
    pause
    exit /b 1
)

echo.
echo Repository replaced successfully.
pause
