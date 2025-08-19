# Windows 11 Quick Start Guide

## 🚀 Get Running in 5 Minutes

### Step 1: Setup Environment
```cmd
# Run the automated setup script
scripts\setup_windows11.bat
```

**OR** (if you prefer PowerShell):
```powershell
# Run PowerShell setup (may require Administrator)
.\scripts\setup_windows11.ps1
```

### Step 2: Test Your Setup
```cmd
# Verify everything is working
python scripts\test_windows11_setup.py
```

### Step 3: Generate Mock Data
```cmd
# Use Windows-optimized script
scripts\generate_all_scenarios_win11.bat
```

**OR** (PowerShell):
```powershell
# PowerShell version
.\scripts\generate_all_scenarios_win11.ps1
```

## 🔧 If You Encounter Issues

### Quick Fixes (Try in Order)

1. **Python not found:**
   ```cmd
   py --version
   # If this works, use 'py' instead of 'python'
   ```

2. **PowerShell execution policy:**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **Permission denied:**
   - Right-click Command Prompt/PowerShell → "Run as Administrator"

4. **Module import errors:**
   ```cmd
   # Install dependencies manually
   python -m pip install pathlib2 typing-extensions
   ```

5. **Antivirus blocking:**
   - Add project folder to Windows Defender exclusions
   - Temporarily disable real-time protection

### Still Having Issues?

1. **Check the troubleshooting guide:** `WINDOWS11_TROUBLESHOOTING.md`
2. **Run the test script:** `python scripts\test_windows11_setup.py`
3. **Use virtual environment:**
   ```cmd
   python -m venv venv
   venv\Scripts\activate
   python -m pip install -r requirements.txt
   ```

## 📁 What Gets Created

After running the scripts, you'll have:
- `generated_outputs/` folder with JSON files
- Each scenario type (positive, negative, exclusion)
- WGS format data ready for use

## 🎯 Common Commands

### Generate Specific Scenarios
```cmd
# Single positive scenario
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs

# Multiple scenarios
python -m src.mockgen.cli --probability --all --model Model_1 --wgs --count 5
```

### List Available Models
```cmd
python -m src.mockgen.cli --list
```

### Get Help
```cmd
python -m src.mockgen.cli --help
```

## 🆘 Emergency Recovery

If everything breaks:

1. **Delete and reinstall Python**
2. **Restart computer**
3. **Run setup script again:**
   ```cmd
   scripts\setup_windows11.bat
   ```

## 📞 Need More Help?

- Check `WINDOWS11_TROUBLESHOOTING.md` for detailed solutions
- Run `python scripts\test_windows11_setup.py` to diagnose issues
- Ensure you're running from the project root directory
- Check that `user_input.json` exists in the current folder

---

**Remember:** Always run scripts from the `Mockup_up_data` project root directory!
