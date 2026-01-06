@echo off
setlocal enabledelayedexpansion

REM Set the title
title Video to Audio

REM Clear the screen
cls

echo.
echo ========================================================
echo                   Video to Audio
echo ========================================================
echo.

REM Set the script directory as the current directory
REM This ensures relative paths (like 'icons/') work correctly
cd /d "%~dp0"
echo [*] Working Directory set to: %CD%

REM Check for essential assets
if not exist "icons\" (
    echo [!] WARNING: 'icons' folder not found! The app may crash or show missing images.
) else (
    echo [*] Assets directory found.
)

REM Define environment paths
set "VENV_DIR=.env"
set "VENV_ACTIVATE=%VENV_DIR%\Scripts\activate.bat"

REM Check for Virtual Environment
if exist "!VENV_ACTIVATE!" (
    echo [*] Virtual Environment found at: !VENV_DIR!
    echo [*] Activating environment...
    
    call "!VENV_ACTIVATE!"
    
    if !errorlevel! equ 0 (
        echo [V] Environment activated successfully.
        
        echo.
        echo [*] Starting Application...
        echo --------------------------------------------------------
        
        REM Run the application using full path to venv python
        "!VENV_DIR!\Scripts\python.exe" app.py
        
        echo --------------------------------------------------------
        echo [*] Application closed.
    ) else (
        echo [X] FAILED to activate environment.
        goto :fallback
    )
    goto :end
)

:fallback
echo.
echo [!] Virtual environment not found or failed to activate.
echo [*] Attempting to use system Python...

python --version >nul 2>&1
if !errorlevel! equ 0 (
    echo [V] System Python found.
    echo.
    echo [*] Starting Application (System Python)...
    echo --------------------------------------------------------
    python.exe app.py
    echo --------------------------------------------------------
) else (
    echo.
    echo [X] CRITICAL ERROR: Python is not installed or not in PATH.
    echo.
    echo Please install Python or set up the virtual environment:
    echo   1. Install Python from python.org
    echo   2. Run 'python -m venv .env'
    echo   3. Run '.env\Scripts\pip install -r requirements.txt'
    echo.
    pause
    exit /b 1
)

:end
echo.
echo Press any key to exit...
pause >nul
