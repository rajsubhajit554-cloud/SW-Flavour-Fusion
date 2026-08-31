@echo off
title SW Flavour Fusion - Git Auto Update & Push
color 0B
cls
echo ======================================================
echo       SW FLAVOUR FUSION - GIT UPDATE SCRIPT
echo ======================================================
echo.

:: Check current git status
echo [1/4] Checking Git Status...
git status -s
echo.

:: Ask for commit message
set /p commit_msg="Enter commit message (Press ENTER for default timestamp): "
if "%commit_msg%"=="" (
    set commit_msg=Update: %date% %time%
)

echo.
echo [2/4] Adding all changed files...
git add .

echo.
echo [3/4] Creating commit: "%commit_msg%"...
git commit -m "%commit_msg%"

echo.
echo [4/4] Pushing to GitHub (origin/main)...
git push origin main

echo.
if %ERRORLEVEL% equ 0 (
    color 0A
    echo ======================================================
    echo       SUCCESSFULLY UPDATED AND PUSHED TO GITHUB!
    echo ======================================================
) else (
    color 0C
    echo ======================================================
    echo       FAILED TO PUSH! PLEASE CHECK YOUR CONNECTION.
    echo ======================================================
)

echo.
pause
