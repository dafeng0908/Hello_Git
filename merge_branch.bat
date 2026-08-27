@echo off
setlocal

for /f "delims=" %%B in ('git branch --show-current 2^>nul') do set "CURRENT=%%B"
if "%CURRENT%"=="" (
    echo Unable to detect current branch.
    pause
    exit /b 1
)

echo Current branch: %CURRENT%
echo.
set /p "SOURCE=Enter branch to merge into %CURRENT%: "
if "%SOURCE%"=="" (
    echo Source branch is required.
    pause
    exit /b 1
)

git merge "%SOURCE%"
if errorlevel 1 (
    echo.
    echo Merge stopped. Resolve conflicts, then commit the merge.
    pause
    exit /b 1
)

echo.
echo Merge completed.
pause
