# Mock Data Generation - Windows 11 Optimized (PowerShell)
# Run this script from the Mockup_up_data folder

param(
    [switch]$SkipChecks,
    [switch]$Verbose
)

# Set error action preference
$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Mock Data Generation - Windows 11 Optimized" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Navigate to the parent directory (where user_input.json is located)
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$parentPath = Split-Path -Parent $scriptPath
Set-Location $parentPath
Write-Host "Current directory: $(Get-Location)" -ForegroundColor Green
Write-Host ""

# Check if required files exist
if (-not $SkipChecks) {
    Write-Host "Checking project files..." -ForegroundColor Yellow
    
    if (-not (Test-Path "user_input.json")) {
        Write-Host "ERROR: user_input.json not found in current directory" -ForegroundColor Red
        Write-Host "Please ensure you're running this script from the project root" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
    
    if (-not (Test-Path "src\mockgen\core.py")) {
        Write-Host "ERROR: Core module not found" -ForegroundColor Red
        Write-Host "Please ensure the project structure is intact" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
    
    Write-Host "✓ Project files verified" -ForegroundColor Green
    Write-Host ""
}

# Check if Python is available (try multiple methods)
Write-Host "Checking Python installation..." -ForegroundColor Yellow
$pythonCmd = $null

try {
    $pythonVersion = python --version 2>&1
    $pythonCmd = "python"
    Write-Host "Python found via 'python' command: $pythonVersion" -ForegroundColor Green
} catch {
    try {
        $pythonVersion = py --version 2>&1
        $pythonCmd = "py"
        Write-Host "Python found via 'py' command: $pythonVersion" -ForegroundColor Green
        # Create alias for easier use
        Set-Alias -Name python -Value py
    } catch {
        Write-Host "ERROR: Python is not installed or not in PATH" -ForegroundColor Red
        Write-Host ""
        Write-Host "Solutions for Windows 11:" -ForegroundColor Yellow
        Write-Host "1. Install Python from https://python.org" -ForegroundColor White
        Write-Host "2. Check 'Add Python to PATH' during installation" -ForegroundColor White
        Write-Host "3. Restart PowerShell after installation" -ForegroundColor White
        Write-Host "4. Or run: .\scripts\setup_windows11.ps1" -ForegroundColor White
        Write-Host ""
        Read-Host "Press Enter to exit"
        exit 1
    }
}

Write-Host ""

# Create generated_outputs directory if it doesn't exist
if (-not (Test-Path "generated_outputs")) {
    New-Item -ItemType Directory -Name "generated_outputs" | Out-Null
    Write-Host "Created generated_outputs directory" -ForegroundColor Green
}

# Function to run command and check for errors
function Invoke-CommandWithCheck {
    param($Command, $Description)
    
    Write-Host "========================================" -ForegroundColor Blue
    Write-Host $Description -ForegroundColor Blue
    Write-Host "========================================" -ForegroundColor Blue
    
    if ($Verbose) {
        Write-Host "Running: $Command" -ForegroundColor Gray
    }
    
    try {
        $result = Invoke-Expression $Command 2>&1
        $exitCode = $LASTEXITCODE
        
        if ($exitCode -eq 0) {
            Write-Host "✓ $Description completed successfully" -ForegroundColor Green
            if ($Verbose -and $result) {
                Write-Host "Output: $result" -ForegroundColor Gray
            }
        } else {
            Write-Host "✗ $Description failed with exit code $exitCode" -ForegroundColor Red
            if ($result) {
                Write-Host "Error output: $result" -ForegroundColor Red
            }
            throw "Command failed with exit code $exitCode"
        }
    } catch {
        Write-Host "ERROR: Failed to $Description" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        Write-Host ""
        Write-Host "Troubleshooting for Windows 11:" -ForegroundColor Yellow
        Write-Host "1. Run: .\scripts\setup_windows11.ps1" -ForegroundColor White
        Write-Host "2. Check Python installation: $pythonCmd --version" -ForegroundColor White
        Write-Host "3. Check dependencies: $pythonCmd -m pip list" -ForegroundColor White
        Write-Host "4. Try running as Administrator" -ForegroundColor White
        Write-Host "5. Check Windows Defender/antivirus exclusions" -ForegroundColor White
        Write-Host ""
        Read-Host "Press Enter to exit"
        exit 1
    }
    Write-Host ""
}

Write-Host "Starting scenario generation..." -ForegroundColor Yellow
Write-Host ""

# Generate all scenarios using consolidated CLI
Invoke-CommandWithCheck "$pythonCmd -m src.mockgen.cli --probability --positive --model Model_1 --wgs --count 3" "Generate POSITIVE scenarios"
Invoke-CommandWithCheck "$pythonCmd -m src.mockgen.cli --probability --negative --model Model_1 --wgs --count 3" "Generate NEGATIVE scenarios"
Invoke-CommandWithCheck "$pythonCmd -m src.mockgen.cli --probability --exclusion --model Model_1 --wgs --count 3" "Generate EXCLUSION scenarios"
Invoke-CommandWithCheck "$pythonCmd -m src.mockgen.cli --probability --all --model Model_1 --wgs --count 3" "Generate ALL scenarios combined"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Generation Complete!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$outputPath = Join-Path (Get-Location) "generated_outputs"
Write-Host "Files generated in: $outputPath" -ForegroundColor Green
Write-Host ""

# Count generated files
$fileCount = (Get-ChildItem "generated_outputs\*.json" | Measure-Object).Count
Write-Host "Total JSON files generated: $fileCount" -ForegroundColor Green
Write-Host ""

# List all generated files
if ($fileCount -gt 0) {
    Write-Host "Generated files:" -ForegroundColor Yellow
    Get-ChildItem "generated_outputs\*.json" | ForEach-Object { 
        Write-Host "  $($_.Name)" -ForegroundColor White 
    }
    Write-Host ""
} else {
    Write-Host "WARNING: No JSON files were generated" -ForegroundColor Yellow
    Write-Host "Check the error messages above for troubleshooting" -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "Press Enter to open the generated_outputs folder..." -ForegroundColor Cyan
Read-Host

# Open the folder in Windows Explorer
if (Test-Path $outputPath) {
    try {
        Start-Process "explorer.exe" -ArgumentList $outputPath
        Write-Host "Opened folder in Windows Explorer" -ForegroundColor Green
    } catch {
        Write-Host "WARNING: Could not open folder automatically" -ForegroundColor Yellow
        Write-Host "Please navigate to: $outputPath" -ForegroundColor White
    }
} else {
    Write-Host "ERROR: generated_outputs folder not found" -ForegroundColor Red
}

Write-Host ""
Write-Host "Script completed successfully!" -ForegroundColor Green
