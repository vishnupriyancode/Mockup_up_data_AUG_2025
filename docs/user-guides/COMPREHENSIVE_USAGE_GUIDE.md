# 🚀 Mock Generation System - Comprehensive Usage Guide

## 📋 **Table of Contents**
1. [Quick Start](#quick-start)
2. [Installation & Requirements](#installation--requirements)
3. [Core Commands](#core-commands)
4. [Automation Scripts](#automation-scripts)
5. [Advanced Usage](#advanced-usage)
6. [Testing & Verification](#testing--verification)
7. [Troubleshooting](#troubleshooting)
8. [Project Structure](#project-structure)

---

## 🚀 **Quick Start**

### **🎯 Your Main Commands (All Working!)**

```bash
# Navigate to project directory
cd "C:\Users\Vishnu\Cursor_AI_proj\GIT_HUB\Mockup_up_data"

# Generate positive scenarios
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --count 3

# Generate negative scenarios  
python -m src.mockgen.cli --probability --negative --model Model_1 --wgs --count 3

# Generate exclusion scenarios
python -m src.mockgen.cli --probability --exclusion --model Model_1 --wgs --count 3

# Generate all scenarios at once
python -m src.mockgen.cli --probability --all --model Model_1 --wgs --count 3
```

**✅ VERIFIED WORKING:** All commands have been tested and are working correctly!

---

## 📦 **Installation & Requirements**

### **Python Version**
- **Python 3.7 or higher** is required
- Uses modern Python features: type hints, pathlib, f-strings

### **Dependencies**
This project uses **only Python standard library modules** - no external packages needed:

- **json**: JSON file handling and parsing
- **random**: Random data generation for mock values
- **datetime**: Timestamp generation for output files
- **pathlib**: Modern file path handling
- **typing**: Type hints for better code quality
- **argparse**: Command line interface parsing
- **os**: Operating system interface operations

### **Installation**
```bash
# Clone the repository
git clone <your-repo-url>
cd Mockup_up_data

# No pip install needed - just ensure Python 3.7+ is available
python --version  # Should show Python 3.7 or higher
```

---

## 🎯 **Core Commands**

### **1. Generate Probability Scenarios (Main Interface)**

```bash
# Generate positive scenarios
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs

# Generate negative scenarios
python -m src.mockgen.cli --probability --negative --model Model_1 --wgs

# Generate exclusion scenarios
python -m src.mockgen.cli --probability --exclusion --model Model_1 --wgs

# Generate all scenario types
python -m src.mockgen.cli --probability --all --model Model_1 --wgs
```

### **2. Multiple Records & Split Files**

```bash
# Generate 3 positive scenarios in separate files
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --count 3

# Generate 5 negative scenarios in separate files
python -m src.mockgen.cli --probability --negative --model Model_1 --wgs --count 5

# Generate all types with 3 records each
python -m src.mockgen.cli --probability --all --model Model_1 --wgs --count 3
```

### **3. Help & Information**

```bash
# Get CLI help
python -m src.mockgen.cli --help

# List available models
python -m src.mockgen.cli --list

# Check specific model capabilities
python -m src.mockgen.cli --list
```

---

## 🤖 **Automation Scripts**

### **Option 1: Double-click Batch File (Windows) - RECOMMENDED**
1. Navigate to: `C:\Users\Vishnu\Cursor_AI_proj\GIT_HUB\Mockup_up_data`
2. Double-click: `scripts\generate_all_scenarios.bat`
3. Wait for completion
4. All files will be in `generated_outputs\` folder

### **Option 2: Run Batch File from Command Line**
```bash
cd "C:\Users\Vishnu\Cursor_AI_proj\GIT_HUB\Mockup_up_data"
scripts\generate_all_scenarios.bat
```

### **Option 3: PowerShell Script**
```bash
# Right-click and "Run with PowerShell":
scripts\generate_all_scenarios.ps1

# Or run from command line:
powershell -ExecutionPolicy Bypass -File scripts\generate_all_scenarios.ps1
```

**What the automation scripts do:**
- Generate positive scenarios (3 records)
- Generate negative scenarios (3 records)
- Generate exclusion scenarios (3 records)
- Generate all scenarios combined
- Open output folder automatically

---

## 🔧 **Advanced Usage**

### **Custom Configuration**

```bash
# Use custom config file
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --config my_config.json

# Use custom output directory
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --output-dir custom_outputs
```

### **Enhanced Mode (Legacy Support)**

```bash
# Generate enhanced output for all models
python -m src.mockgen.cli --enhanced

# Generate enhanced output for specific model
python -m src.mockgen.cli --enhanced --model Model_1

# Generate multiple records
python -m src.mockgen.cli --enhanced --count 5

# Generate split output files
python -m src.mockgen.cli --enhanced --output-format split
```

### **Legacy Mode (Edit_X Format)**

```bash
# Backward compatibility for Edit_X format
python -m src.mockgen.cli --legacy --model Edit_1

# Legacy mode with enhanced features
python -m src.mockgen.cli --legacy --enhanced --count 10
```

---

## 🧪 **Testing & Verification**

### **Run the Test Suite**
```bash
python scripts/test_wgs_commands.py
```

**Expected Output:**
```
🎯 OVERALL TEST SUMMARY
============================================================
CLI Module: ✅ PASS

Overall: 1/1 test categories passed
🎉 All test categories passed! The consolidated CLI module is working correctly.
```

### **Quick Verification Commands**
```bash
# Check current directory
pwd

# List files to verify you're in the right place
dir

# Check Python version
python --version

# Test a simple command
python -m src.mockgen.cli --help

# Run the complete test suite
python scripts/test_wgs_commands.py
```

---

## 🆘 **Troubleshooting**

### **Common Issues & Solutions**

#### **1. Python Not Found**
```bash
# Check if Python is in PATH
python --version

# If not found, install Python 3.7+ or add to PATH
```

#### **2. Import Errors**
```bash
# Make sure you're in the project root directory
cd "C:\Users\Vishnu\Cursor_AI_proj\GIT_HUB\Mockup_up_data"

# Verify the src/mockgen directory exists
dir src\mockgen
```

#### **3. Configuration File Issues**
```bash
# Check if user_input.json exists
dir user_input.json

# Verify JSON syntax
python -c "import json; json.load(open('user_input.json'))"
```

#### **4. Output Directory Issues**
```bash
# Create output directory if it doesn't exist
mkdir generated_outputs

# Check permissions
dir generated_outputs
```

### **Getting Help**
```bash
# Built-in help
python -m src.mockgen.cli --help

# List available models
python -m src.mockgen.cli --list

# Run test suite
python scripts/test_wgs_commands.py
```

---

## 📁 **Project Structure**

```
Mockup_up_data/
├── src/mockgen/                    # Core system (don't modify)
│   ├── __init__.py
│   ├── core.py                     # Core functionality
│   └── cli.py                      # Command line interface
├── scripts/                        # Automation scripts
│   ├── generate_all_scenarios.bat  # Windows batch file
│   ├── generate_all_scenarios.ps1  # PowerShell script
│   └── test_wgs_commands.py        # Test suite
├── docs/                           # Documentation
│   └── user-guides/                # User guides
├── user_input.json                 # Your data models and values
├── master.json                     # Base template structure
└── generated_outputs/              # Generated JSON files
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
✅ **All automation scripts working**  
✅ **Test suite passes completely**  

---

## 📁 **Output Location**

All files will be saved in: `C:\Users\Vishnu\Cursor_AI_proj\GIT_HUB\Mockup_up_data\generated_outputs\`

---

## 🔍 **File Structure After Generation**

```
generated_outputs/
├── Model_1_positive_[timestamp]_000001.json (WGS format)
├── Model_1_negative_[timestamp]_000001.json (WGS format)
├── Model_1_exclusion_[timestamp]_000001.json (WGS format)
├── Model_1_positive_[timestamp]_000002.json (WGS format)
├── Model_1_negative_[timestamp]_000002.json (WGS format)
├── Model_1_exclusion_[timestamp]_000002.json (WGS format)
└── [Additional files if using --count]
```

---

## 📝 **Summary**

1. **All commands are now working correctly** ✅
2. **All automation scripts have been updated** ✅
3. **Test suite passes completely** ✅
4. **Use the consolidated CLI interface** - it's the single source of truth!
5. **Batch and PowerShell scripts are fully functional** ✅

**🎉 The project has been cleaned up and consolidated! 🎯**

---

## 🔧 **What Was Cleaned Up**

- **Removed duplicate scripts**: `generate_probability_outputs.py` and `generate_wgs_format.py`
- **Consolidated functionality**: All features now in `src/mockgen/` module
- **Updated automation scripts**: Now use the single CLI interface
- **Simplified testing**: Single test suite for the consolidated module
- **Eliminated confusion**: One clear way to do everything

**Status: CLEANED UP AND CONSOLIDATED** ✅
