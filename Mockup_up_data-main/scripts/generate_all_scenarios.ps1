# Mock Data Generation - All Scenarios (PowerShell)
# Run this script from the Mockup_up_data-main folder

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Mock Data Generation - All Scenarios" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Navigate to the script directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath
Write-Host "Current directory: $(Get-Location)" -ForegroundColor Green
Write-Host ""

# Check if Python is available
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Python is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Python 3.7+ and try again" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Starting scenario generation..." -ForegroundColor Yellow
Write-Host ""

# Create generated_outputs directory if it doesn't exist
if (!(Test-Path "generated_outputs")) {
    New-Item -ItemType Directory -Name "generated_outputs" | Out-Null
    Write-Host "Created generated_outputs directory" -ForegroundColor Green
}

# Function to run command and check for errors
function Invoke-CommandWithCheck {
    param($Command, $Description)
    
    Write-Host "========================================" -ForegroundColor Blue
    Write-Host $Description -ForegroundColor Blue
    Write-Host "========================================" -ForegroundColor Blue
    
    try {
        Invoke-Expression $Command
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ $Description completed successfully" -ForegroundColor Green
        } else {
            Write-Host "✗ $Description failed with exit code $LASTEXITCODE" -ForegroundColor Red
            throw "Command failed"
        }
    } catch {
        Write-Host "ERROR: Failed to $Description" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
    Write-Host ""
}

# Generate all scenarios
Invoke-CommandWithCheck "python generate_probability_outputs.py --positive --model Model_1 --output-dir generated_outputs" "Generate POSITIVE scenarios"
Invoke-CommandWithCheck "python generate_probability_outputs.py --negative --model Model_1 --output-dir generated_outputs" "Generate NEGATIVE scenarios"
Invoke-CommandWithCheck "python generate_probability_outputs.py --exclusion --model Model_1 --output-dir generated_outputs" "Generate EXCLUSION scenarios"
Invoke-CommandWithCheck "python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs" "Generate ALL scenarios combined"
Invoke-CommandWithCheck "python generate_probability_outputs.py --all --model Model_1 --count 3 --split --output-dir generated_outputs" "Generate multiple records (3 each)"

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
Write-Host "Generated files:" -ForegroundColor Yellow
Get-ChildItem "generated_outputs\*.json" | ForEach-Object { Write-Host "  $($_.Name)" -ForegroundColor White }

Write-Host ""
Write-Host "Press Enter to open the generated_outputs folder..." -ForegroundColor Cyan
Read-Host

# Open the folder in Windows Explorer
Start-Process "explorer.exe" -ArgumentList $outputPath
