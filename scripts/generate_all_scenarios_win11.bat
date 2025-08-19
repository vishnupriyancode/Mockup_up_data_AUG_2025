@echo off
setlocal enabledelayedexpansion

echo ========================================
echo Mock Data Generation - Windows 11 Optimized
echo ========================================
echo.

REM Set console code page to UTF-8 for better character display
chcp 65001 >nul 2>&1

REM Navigate to the parent directory (where user_input.json is located)
cd /d "%~dp0\.."
echo Current directory: %CD%
echo.

REM Check if Python is available (try multiple methods)
set "PYTHON_CMD="
python --version >nul 2>&1
if not errorlevel 1 (
    set "PYTHON_CMD=python"
    echo Python found via 'python' command
) else (
    py --version >nul 2>&1
    if not errorlevel 1 (
        set "PYTHON_CMD=py"
        echo Python found via 'py' command
    ) else (
        echo ERROR: Python is not installed or not in PATH
        echo.
        echo Solutions for Windows 11:
        echo 1. Install Python from https://python.org
        echo 2. Check "Add Python to PATH" during installation
        echo 3. Restart Command Prompt after installation
        echo 4. Or run: scripts\setup_windows11.bat
        echo.
        pause
        exit /b 1
    )
)

echo Python version:
%PYTHON_CMD% --version
echo.

REM Check if required files exist
if not exist "user_input.json" (
    echo ERROR: user_input.json not found in current directory
    echo Please ensure you're running this script from the project root
    pause
    exit /b 1
)

if not exist "src\mockgen\core.py" (
    echo ERROR: Core module not found
    echo Please ensure the project structure is intact
    pause
    exit /b 1
)

echo Starting scenario generation...
echo.

REM Create generated_outputs directory if it doesn't exist
if not exist "generated_outputs" (
    mkdir "generated_outputs"
    echo Created generated_outputs directory
)

REM Function to run command and handle errors
:run_command
set "cmd_desc=%~1"
set "cmd_line=%~2"
echo ========================================
echo %cmd_desc%
echo ========================================
echo Running: %cmd_line%
echo.

%cmd_line%
set "exit_code=!errorlevel!"

if !exit_code! neq 0 (
    echo.
    echo ERROR: %cmd_desc% failed with exit code !exit_code!
    echo.
    echo Troubleshooting for Windows 11:
    echo 1. Run: scripts\setup_windows11.bat
    echo 2. Check Python installation: %PYTHON_CMD% --version
    echo 3. Check dependencies: %PYTHON_CMD% -m pip list
    echo 4. Try running as Administrator
    echo.
    pause
    exit /b !exit_code!
) else (
    echo ✓ %cmd_desc% completed successfully
    echo.
)

goto :eof

REM Generate all scenarios using the function
call :run_command "Generate POSITIVE scenarios" "%PYTHON_CMD% -m src.mockgen.cli --probability --positive --model Model_1 --wgs --count 3"
call :run_command "Generate NEGATIVE scenarios" "%PYTHON_CMD% -m src.mockgen.cli --probability --negative --model Model_1 --wgs --count 3"
call :run_command "Generate EXCLUSION scenarios" "%PYTHON_CMD% -m src.mockgen.cli --probability --exclusion --model Model_1 --wgs --count 3"
call :run_command "Generate ALL scenarios combined" "%PYTHON_CMD% -m src.mockgen.cli --probability --all --model Model_1 --wgs --count 3"

echo ========================================
echo Generation Complete!
echo ========================================
echo.
echo Files generated in: %CD%\generated_outputs\
echo.

REM Count JSON files using a Windows-compatible method
set file_count=0
for %%f in (generated_outputs\*.json) do set /a file_count+=1
echo Total JSON files generated: %file_count%
echo.

REM List generated files
if %file_count% gtr 0 (
    echo Generated files:
    for %%f in (generated_outputs\*.json) do echo   %%~nxf
    echo.
)

echo Press any key to open the generated_outputs folder...
pause >nul

REM Open folder in Windows Explorer
if exist "generated_outputs" (
    explorer "generated_outputs"
) else (
    echo ERROR: generated_outputs folder not found
)

echo.
echo Script completed successfully!
pause
