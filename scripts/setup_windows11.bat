@echo off
echo ========================================
echo Windows 11 Setup Script for MockGen
echo ========================================
echo.

REM Check Windows version
ver | findstr "10\.0\." >nul
if errorlevel 1 (
    echo WARNING: This script is optimized for Windows 11
    echo Current Windows version detected
)

echo Setting up environment for Windows 11...
echo.

REM Navigate to project directory
cd /d "%~dp0\.."
echo Current directory: %CD%
echo.

REM Check Python installation
echo Checking Python installation...
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python not found in PATH
    echo.
    echo Solutions:
    echo 1. Install Python from https://python.org
    echo 2. Add Python to PATH during installation
    echo 3. Or run: py --version
    echo.
    pause
    exit /b 1
)

echo Python found: 
python --version
echo.

REM Check if pip is available
echo Checking pip availability...
python -m pip --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: pip not available
    echo Installing pip...
    python -m ensurepip --upgrade
)

echo pip available:
python -m pip --version
echo.

REM Install dependencies
echo Installing project dependencies...
if exist "requirements.txt" (
    python -m pip install -r requirements.txt
    if errorlevel 1 (
        echo ERROR: Failed to install dependencies
        echo Trying alternative installation method...
        python -m pip install --user -r requirements.txt
    )
) else (
    echo WARNING: requirements.txt not found
    echo Installing basic dependencies...
    python -m pip install pathlib2 typing-extensions
)

echo.
echo ========================================
echo Environment Setup Complete!
echo ========================================
echo.
echo Next steps:
echo 1. Run: scripts\generate_all_scenarios.bat
echo 2. Or run: scripts\generate_all_scenarios.ps1
echo.
echo If you encounter PowerShell execution policy issues:
echo Run: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
echo.
pause
