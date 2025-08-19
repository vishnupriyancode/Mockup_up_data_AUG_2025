# Windows 11 Compatibility Troubleshooting Guide

## Common Issues and Solutions

### 1. **Python Not Found in PATH**

**Symptoms:**
- `'python' is not recognized as an internal or external command`
- `python --version` fails

**Solutions:**
1. **Install Python properly:**
   - Download from https://python.org
   - **IMPORTANT:** Check "Add Python to PATH" during installation
   - Restart Command Prompt/PowerShell after installation

2. **Use Python Launcher (py):**
   ```cmd
   py --version
   py -m pip install package_name
   ```

3. **Add Python to PATH manually:**
   - Find Python installation path (usually `C:\Users\Username\AppData\Local\Programs\Python\Python3x\`)
   - Add to System Environment Variables → Path

### 2. **PowerShell Execution Policy Issues**

**Symptoms:**
- `File cannot be loaded because running scripts is disabled on this system`
- `Execution policy of the file is more restrictive than required`

**Solutions:**
1. **Run as Administrator and change policy:**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
   ```

2. **Change for current user only:**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **Use the setup script:**
   ```powershell
   .\scripts\setup_windows11.ps1
   ```

### 3. **Module Import Errors**

**Symptoms:**
- `ModuleNotFoundError: No module named 'src.mockgen'`
- `ImportError: cannot import name 'MockGenCore'`

**Solutions:**
1. **Run from project root directory:**
   ```cmd
   cd C:\path\to\Mockup_up_data
   python -m src.mockgen.cli --help
   ```

2. **Install dependencies:**
   ```cmd
   python -m pip install -r requirements.txt
   ```

3. **Use the setup script:**
   ```cmd
   scripts\setup_windows11.bat
   ```

### 4. **File Path Issues**

**Symptoms:**
- `FileNotFoundError: [Errno 2] No such file or directory`
- Path-related errors with backslashes/forward slashes

**Solutions:**
1. **Use Windows-optimized scripts:**
   - `scripts\generate_all_scenarios_win11.bat`
   - `scripts\generate_all_scenarios_win11.ps1`

2. **Check file locations:**
   - Ensure `user_input.json` is in project root
   - Ensure `src\mockgen\` folder structure is intact

### 5. **Permission Denied Errors**

**Symptoms:**
- `PermissionError: [Errno 13] Permission denied`
- Cannot create/write to directories

**Solutions:**
1. **Run as Administrator**
2. **Check Windows Defender exclusions**
3. **Check antivirus software settings**
4. **Use user-specific directories:**
   ```cmd
   python -m pip install --user package_name
   ```

### 6. **Dependencies Installation Issues**

**Symptoms:**
- `pip install` fails
- Package conflicts

**Solutions:**
1. **Upgrade pip:**
   ```cmd
   python -m pip install --upgrade pip
   ```

2. **Use user installation:**
   ```cmd
   python -m pip install --user -r requirements.txt
   ```

3. **Install packages individually:**
   ```cmd
   python -m pip install pathlib2
   python -m pip install typing-extensions
   ```

## Step-by-Step Setup for Windows 11

### Option 1: Automated Setup (Recommended)

1. **Run the setup script:**
   ```cmd
   scripts\setup_windows11.bat
   ```
   or
   ```powershell
   .\scripts\setup_windows11.ps1
   ```

2. **Use Windows-optimized generation scripts:**
   ```cmd
   scripts\generate_all_scenarios_win11.bat
   ```
   or
   ```powershell
   .\scripts\generate_all_scenarios_win11.ps1
   ```

### Option 2: Manual Setup

1. **Install Python 3.7+:**
   - Download from https://python.org
   - Check "Add Python to PATH"
   - Restart terminal

2. **Install dependencies:**
   ```cmd
   python -m pip install pathlib2 typing-extensions
   ```

3. **Test installation:**
   ```cmd
   python -c "from src.mockgen.core import MockGenCore; print('Success')"
   ```

4. **Run generation:**
   ```cmd
   python -m src.mockgen.cli --probability --positive --model Model_1 --wgs
   ```

## Environment Variables for Windows 11

### Python PATH
```
C:\Users\Username\AppData\Local\Programs\Python\Python3x\
C:\Users\Username\AppData\Local\Programs\Python\Python3x\Scripts\
```

### PowerShell Profile
```powershell
# Add to $PROFILE
Set-Alias -Name python -Value py
```

## Antivirus and Security Software

### Windows Defender
- Add project folder to exclusions
- Allow Python and scripts through firewall

### Third-party Antivirus
- Check real-time protection settings
- Add project folder to trusted locations
- Allow Python executables

## Network and Proxy Issues

### Corporate Networks
- Check proxy settings
- Use `--trusted-host` with pip:
  ```cmd
  python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org package_name
  ```

### Firewall Settings
- Allow Python through Windows Firewall
- Check corporate firewall policies

## Debugging Commands

### Check Python Installation
```cmd
python --version
py --version
where python
where py
```

### Check PATH
```cmd
echo %PATH%
```

### Check PowerShell Execution Policy
```powershell
Get-ExecutionPolicy -List
```

### Test Module Import
```cmd
python -c "import sys; print(sys.path)"
python -c "from src.mockgen.core import MockGenCore"
```

### Check Dependencies
```cmd
python -m pip list
python -m pip show pathlib2
```

## Getting Help

### 1. **Check the setup scripts first:**
   - `scripts\setup_windows11.bat`
   - `scripts\setup_windows11.ps1`

### 2. **Use Windows-optimized generation scripts:**
   - `scripts\generate_all_scenarios_win11.bat`
   - `scripts\generate_all_scenarios_win11.ps1`

### 3. **Common Windows 11 specific issues:**
   - PowerShell execution policies
   - Python PATH not set correctly
   - Antivirus blocking scripts
   - Permission issues with user directories

### 4. **If all else fails:**
   - Run Command Prompt as Administrator
   - Check Windows Event Viewer for errors
   - Temporarily disable Windows Defender real-time protection
   - Use virtual environment: `python -m venv venv && venv\Scripts\activate`
