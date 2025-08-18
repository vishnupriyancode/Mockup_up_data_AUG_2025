@echo off
echo ========================================
echo Mock Data Generation - All Scenarios
echo ========================================
echo.

REM Navigate to the correct directory
cd /d "%~dp0"
echo Current directory: %CD%
echo.

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.7+ and try again
    pause
    exit /b 1
)

echo Python found. Starting scenario generation...
echo.

REM Create generated_outputs directory if it doesn't exist
if not exist "generated_outputs" mkdir "generated_outputs"

echo ========================================
echo Generating POSITIVE scenarios...
echo ========================================
python generate_probability_outputs.py --positive --model Model_1 --output-dir generated_outputs
if errorlevel 1 (
    echo ERROR: Failed to generate positive scenarios
    pause
    exit /b 1
)

echo.
echo ========================================
echo Generating NEGATIVE scenarios...
echo ========================================
python generate_probability_outputs.py --negative --model Model_1 --output-dir generated_outputs
if errorlevel 1 (
    echo ERROR: Failed to generate negative scenarios
    pause
    exit /b 1
)

echo.
echo ========================================
echo Generating EXCLUSION scenarios...
echo ========================================
python generate_probability_outputs.py --exclusion --model Model_1 --output-dir generated_outputs
if errorlevel 1 (
    echo ERROR: Failed to generate exclusion scenarios
    pause
    exit /b 1
)

echo.
echo ========================================
echo Generating ALL scenarios combined...
echo ========================================
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs
if errorlevel 1 (
    echo ERROR: Failed to generate combined scenarios
    pause
    exit /b 1
)

echo.
echo ========================================
echo Generating multiple records (3 each)...
echo ========================================
python generate_probability_outputs.py --all --model Model_1 --count 3 --split --output-dir generated_outputs
if errorlevel 1 (
    echo ERROR: Failed to generate multiple records
    pause
    exit /b 1
)

echo.
echo ========================================
echo Generation Complete!
echo ========================================
echo.
echo Files generated in: %CD%\generated_outputs\
echo.

REM Count JSON files using a simpler method
set file_count=0
for %%f in (generated_outputs\*.json) do set /a file_count+=1
echo Total JSON files generated: %file_count%
echo.
echo Press any key to open the generated_outputs folder...
pause >nul
explorer "generated_outputs"
