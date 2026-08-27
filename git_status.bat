@echo off
setlocal

echo =====================================
echo Git Status
echo =====================================
git status

echo.
echo Current branch:
git branch --show-current

echo.
echo Remotes:
git remote -v

echo.
pause
