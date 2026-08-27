@echo off
setlocal

:menu
cls
echo =====================================
echo          Git Utility Menu
echo =====================================
echo 1. Clone repository
echo 2. Update local changes to GitHub
echo 3. Pull latest version
echo 4. Create new repository link
echo 5. Replace GitHub repo with local files
echo 6. Check Git status
echo 7. Create branch
echo 8. Switch branch
echo 9. Merge branch
echo 0. Exit
echo =====================================
set /p "CHOICE=Select: "

if "%CHOICE%"=="1" call "%~dp0clone_git.bat"
if "%CHOICE%"=="2" call "%~dp0Update_localfile_and_then_update_repo.bat"
if "%CHOICE%"=="3" call "%~dp0pull_latest.bat"
if "%CHOICE%"=="4" call "%~dp0create_repo.bat"
if "%CHOICE%"=="5" call "%~dp0replace_repo_with_local_files.bat"
if "%CHOICE%"=="6" call "%~dp0git_status.bat"
if "%CHOICE%"=="7" call "%~dp0create_branch.bat"
if "%CHOICE%"=="8" call "%~dp0switch_branch.bat"
if "%CHOICE%"=="9" call "%~dp0merge_branch.bat"
if "%CHOICE%"=="0" exit /b 0

goto menu
