# Windows 11 Setup Script for MockGen (PowerShell)
# Run this script as Administrator or with appropriate execution policy

param(
    [switch]$SkipExecutionPolicy,
    [switch]$Force
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Windows 11 Setup Script for MockGen" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin -and -not $SkipExecutionPolicy) {
    Write-Host "WARNING: Not running as Administrator" -ForegroundColor Yellow
    Write-Host "Some operations may require elevated privileges" -ForegroundColor Yellow
    Write-Host ""
}

# Check execution policy
$currentPolicy = Get-ExecutionPolicy
Write-Host "Current PowerShell execution policy: $currentPolicy" -ForegroundColor Yellow

if ($currentPolicy -eq "Restricted" -or $currentPolicy -eq "AllSigned") {
    if (-not $SkipExecutionPolicy) {
        Write-Host "Execution policy is restrictive. Attempting to change..." -ForegroundColor Yellow
        try {
            if ($isAdmin) {
                Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
                Write-Host "Changed execution policy to RemoteSigned for LocalMachine" -ForegroundColor Green
            } else {
                Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
                Write-Host "Changed execution policy to RemoteSigned for CurrentUser" -ForegroundColor Green
            }
        } catch {
            Write-Host "ERROR: Could not change execution policy" -ForegroundColor Red
            Write-Host "Run this script as Administrator or manually set:" -ForegroundColor Red
            Write-Host "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Red
            Write-Host ""
            if (-not $Force) {
                Read-Host "Press Enter to continue anyway"
            }
        }
    }
}

# Navigate to project directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectPath = Split-Path -Parent $scriptPath
Set-Location $projectPath
Write-Host "Project directory: $(Get-Location)" -ForegroundColor Green
Write-Host ""

# Check Windows version
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
Write-Host "Windows Version: $($osInfo.Caption) $($osInfo.Version)" -ForegroundColor Cyan
Write-Host ""

# Check Python installation
Write-Host "Checking Python installation..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Python found: $pythonVersion" -ForegroundColor Green
} catch {
    try {
        $pythonVersion = py --version 2>&1
        Write-Host "Python found (py launcher): $pythonVersion" -ForegroundColor Green
        # Create alias for easier use
        Set-Alias -Name python -Value py
    } catch {
        Write-Host "ERROR: Python not found" -ForegroundColor Red
        Write-Host "Please install Python 3.7+ from https://python.org" -ForegroundColor Red
        Write-Host "Make sure to check 'Add Python to PATH' during installation" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

# Check pip
Write-Host "Checking pip..." -ForegroundColor Yellow
try {
    $pipVersion = python -m pip --version 2>&1
    Write-Host "pip found: $pipVersion" -ForegroundColor Green
} catch {
    Write-Host "Installing pip..." -ForegroundColor Yellow
    python -m ensurepip --upgrade
}

# Install dependencies
Write-Host "Installing project dependencies..." -ForegroundColor Yellow
if (Test-Path "requirements.txt") {
    try {
        python -m pip install -r requirements.txt
        Write-Host "Dependencies installed successfully" -ForegroundColor Green
    } catch {
        Write-Host "Trying user installation..." -ForegroundColor Yellow
        python -m pip install --user -r requirements.txt
    }
} else {
    Write-Host "Installing basic dependencies..." -ForegroundColor Yellow
    python -m pip install pathlib2 typing-extensions
}

# Test import
Write-Host "Testing project imports..." -ForegroundColor Yellow
try {
    python -c "from src.mockgen.core import MockGenCore; print('✓ Core module imported successfully')"
    Write-Host "Project modules working correctly" -ForegroundColor Green
} catch {
    Write-Host "WARNING: Some imports failed" -ForegroundColor Yellow
    Write-Host "This may not affect basic functionality" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Setup Complete!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Green
Write-Host "1. Run: .\scripts\generate_all_scenarios.bat" -ForegroundColor White
Write-Host "2. Or run: .\scripts\generate_all_scenarios.ps1" -ForegroundColor White
Write-Host ""
Write-Host "If you encounter issues:" -ForegroundColor Yellow
Write-Host "- Check that Python is in PATH" -ForegroundColor White
Write-Host "- Run as Administrator if needed" -ForegroundColor White
Write-Host "- Check Windows Defender/antivirus exclusions" -ForegroundColor White
Write-Host ""

Read-Host "Press Enter to exit"
