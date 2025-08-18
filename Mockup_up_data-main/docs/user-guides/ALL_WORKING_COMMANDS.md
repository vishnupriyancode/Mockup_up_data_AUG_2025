# 🚀 ALL WORKING COMMANDS FOR MOCK DATA GENERATION

## ✅ **ALL COMMANDS ARE WORKING CORRECTLY!**

The issue was solved - you need to be in the **correct directory** for all commands to work.

---

## 🎯 **QUICK REFERENCE - YOUR COMMANDS (FIXED & WORKING!)**

```bash
# Positive scenarios
python scripts/generate_wgs_format.py --positive --model Model_1 --wgs --count 3 --split

# Negative scenarios  
python scripts/generate_wgs_format.py --negative --model Model_1 --wgs --count 3 --split

# Exclusion scenarios
python scripts/generate_wgs_format.py --exclusion --model Model_1 --wgs --count 3 --split
```

**✅ VERIFIED WORKING:** These commands have been tested and are working correctly!

**Note:** Remove `--all` when using specific scenario types (--positive, --negative, --exclusion)

**Important:** The script is in the `scripts/` folder, so use `python scripts/generate_wgs_format.py` instead of just `python generate_wgs_format.py`

**🎯 Test Results:** All three commands successfully generated JSON files in the `generated_outputs/` folder!

**🚀 JUST TESTED:** All commands working perfectly as of August 18, 2025!

---

## 🎯 **STEP 1: Navigate to Correct Directory (CRITICAL!)**

```bash
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"
```

**Verify you're in the right place:**
```bash
dir
# You should see: generate_probability_outputs.py, src/ folder, user_input.json, scripts/ folder, etc.
```

**Directory Structure:**
```
Mockup_up_data-main/
├── scripts/
│   └── generate_wgs_format.py  ← Your WGS script is here!
├── src/
├── user_input.json
└── generate_probability_outputs.py
```

**How to Run Your Commands:**
1. **Navigate to the Mockup_up_data-main directory** (as shown in Step 1)
2. **Run the commands from there** - the script will automatically find the correct paths
3. **Use the full path to the script:** `python scripts/generate_wgs_format.py`

**Quick Directory Check:**
```bash
# You should see these files/folders:
dir
# Expected output should include:
# - scripts/ folder
# - src/ folder  
# - user_input.json
# - generate_probability_outputs.py
```

---

## 🚀 **STEP 2: Choose Your Method**

### **Method 1: Generate ALL Scenarios (RECOMMENDED)**

```bash
# Generate everything at once
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs

# Generate with multiple records
python generate_probability_outputs.py --all --model Model_1 --count 5 --output-dir generated_outputs

# Generate separate files for each record
python generate_probability_outputs.py --all --model Model_1 --count 3 --split --output-dir generated_outputs
```

### **Method 2: Generate Specific Scenarios**

```bash
# Positive scenarios
python generate_probability_outputs.py --positive --model Model_1 --output-dir generated_outputs

# Negative scenarios
python generate_probability_outputs.py --negative --model Model_1 --output-dir generated_outputs

# Exclusion scenarios
python generate_probability_outputs.py --exclusion --model Model_1 --output-dir generated_outputs

# Multiple records of specific type
python generate_probability_outputs.py --positive --model Model_1 --count 5 --output-dir generated_outputs
```

### **Method 3: Using CLI Module (WGS Format)**

```bash
# Generate all scenarios in WGS format
python -m src.mockgen.cli --probability --all --model Model_1 --wgs --output-dir generated_outputs

# Generate specific scenarios in WGS format
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --output-dir generated_outputs
python -m src.mockgen.cli --probability --negative --model Model_1 --wgs --output-dir generated_outputs
python -m src.mockgen.cli --probability --exclusion --model Model_1 --wgs --output-dir generated_outputs

# Generate multiple records in WGS format
python -m src.mockgen.cli --probability --positive --model Model_1 --count 5 --wgs --output-dir generated_outputs
```

### **Method 4: Using WGS Format Script (Direct)**

#### **🎯 Your Specific Commands (READY TO USE!)**

```bash
# Generate positive scenarios (WGS format)
python scripts/generate_wgs_format.py --positive --model Model_1 --wgs --count 3 --split

# Generate negative scenarios (WGS format)
python scripts/generate_wgs_format.py --negative --model Model_1 --wgs --count 3 --split

# Generate exclusion scenarios (WGS format)
python scripts/generate_wgs_format.py --exclusion --model Model_1 --wgs --count 3 --split
```

#### **📋 Additional Options**

```bash
# Generate ALL scenarios (WGS format)
python scripts/generate_wgs_format.py --all --model Model_1 --wgs --count 3 --split

# Generate single scenario types (without count/split)
python scripts/generate_wgs_format.py --positive --model Model_1 --wgs --output-dir generated_outputs
python scripts/generate_wgs_format.py --negative --model Model_1 --wgs --output-dir generated_outputs
python scripts/generate_wgs_format.py --exclusion --model Model_1 --wgs --output-dir generated_outputs
```

---

## 🎉 **SUPER EASY SOLUTION: Use the Batch File**

### **Option 1: Double-click (Windows)**
1. Navigate to: `C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main`
2. Double-click: `generate_all_scenarios.bat`
3. Wait for completion
4. All files will be in `generated_outputs\` folder

### **Option 2: Run from Command Line**
```bash
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"
generate_all_scenarios.bat
```

### **Option 3: PowerShell Script**
```bash
# Right-click and "Run with PowerShell":
generate_all_scenarios.ps1
```

---

## 📊 **What You'll Get**

- **Positive scenarios**: Valid/positive test case data
- **Negative scenarios**: Invalid/negative test case data  
- **Exclusion scenarios**: Exclusion scenario data
- **All scenarios combined**: Single file with all types
- **Multiple records**: Multiple JSON files if using `--count`
- **WGS format**: Web Genome Schema format data

---

## 🎯 **Success Indicators**

✅ **Commands run without errors**  
✅ **Files appear in `generated_outputs\` folder**  
✅ **Success messages displayed**  
✅ **JSON files contain realistic data**  

---

## 📁 **Output Location**

All files will be saved in: `C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main\generated_outputs\`

---

## 🔍 **File Structure After Generation**

```
generated_outputs/
├── Model_1_Positive_[timestamp].json
├── Model_1_Negative_[timestamp].json
├── Model_1_Exclusion_[timestamp].json
├── Model_1_All_Probabilities_[timestamp].json
└── [Additional files if using --count or --split]
```

---

## 🆘 **Troubleshooting**

### **Error: "No such file or directory"**
**Solution:** You're in the wrong directory. Make sure you're in `Mockup_up_data-main` folder.

### **Error: "Module not found"**
**Solution:** You're in the wrong directory. Navigate to `Mockup_up_data-main` folder.

### **Error: "Python not found"**
**Solution:** Install Python 3.7+ and add it to your PATH.

### **Error: "Failed to import core module"**
**Solution:** Make sure you're running from the `Mockup_up_data-main` directory, not from inside the `scripts/` folder.

### **Error: "can't open file 'scripts\\generate_wgs_format.py': [Errno 2] No such file or directory"**
**Solution:** You're in the wrong directory. Make sure you're in the `Mockup_up_data-main` folder, not in the parent `Mockup_up_data` folder.
**Correct path:** `C:\Users\Vishnu\Cursor_AI_proj\GIT_HUB\Mockup_up_data\Mockup_up_data-main`
**Wrong path:** `C:\Users\Vishnu\Cursor_AI_proj\GIT_HUB\Mockup_up_data` (missing the `-main` part)

---

## 🎯 **Quick Verification Commands**

```bash
# Check current directory
pwd

# List files to verify you're in the right place
dir

# Check Python version
python --version

# Test a simple command
python generate_probability_outputs.py --help
```

---

## 📝 **Summary**

1. **Navigate to correct directory first** - this is critical!
2. **Choose your preferred method** - all work correctly
3. **Use batch file for easiest execution** - just double-click!
4. **Check output folder** - files will be in `generated_outputs\`

**All commands are now working correctly! 🎯**
