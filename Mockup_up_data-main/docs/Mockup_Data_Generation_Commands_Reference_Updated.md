# Mockup Data Generation Commands Reference
## Updated and Comprehensive Guide

### Table of Contents
1. [Quick Start Commands](#quick-start-commands)
2. [Batch and PowerShell Scripts](#batch-and-powershell-scripts)
3. [Python Script Commands](#python-script-commands)
4. [WGS Format Commands](#wgs-format-commands)
5. [CLI Module Commands](#cli-module-commands)
6. [Advanced Usage](#advanced-usage)
7. [Troubleshooting](#troubleshooting)

---

## Quick Start Commands

### 🚀 **Easiest Method: Use Batch File**
```bash
# Navigate to project directory
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"

# Double-click or run:
generate_all_scenarios.bat
```

### 🎯 **Generate All Scenarios at Once**
```bash
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs
```

---

## Batch and PowerShell Scripts

### **Windows Batch File (generate_all_scenarios.bat)**
```bash
# Run from project directory
generate_all_scenarios.bat

# Or from command line
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"
generate_all_scenarios.bat
```

**What it does:**
- Generates positive scenarios
- Generates negative scenarios  
- Generates exclusion scenarios
- Generates combined scenarios
- Generates multiple records (3 each)
- Opens output folder automatically

### **PowerShell Script (generate_all_scenarios.ps1)**
```powershell
# Run from project directory
.\generate_all_scenarios.ps1

# Or from command line
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"
.\generate_all_scenarios.ps1
```

**Features:**
- Better error handling
- Color-coded output
- Progress tracking
- File counting
- Automatic folder opening

---

## Python Script Commands

### **Main Probability Generator (generate_probability_outputs.py)**

#### **Generate All Scenarios**
```bash
# Generate all probability types
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs

# Generate with multiple records
python generate_probability_outputs.py --all --model Model_1 --count 5 --output-dir generated_outputs

# Generate with split files
python generate_probability_outputs.py --all --model Model_1 --count 3 --split --output-dir generated_outputs
```

#### **Generate Specific Scenarios**
```bash
# Positive scenarios only
python generate_probability_outputs.py --positive --model Model_1 --output-dir generated_outputs

# Negative scenarios only
python generate_probability_outputs.py --negative --model Model_1 --output-dir generated_outputs

# Exclusion scenarios only
python generate_probability_outputs.py --exclusion --model Model_1 --output-dir generated_outputs
```

#### **Advanced Options**
```bash
# Custom configuration file
python generate_probability_outputs.py --config custom_config.json --all --model Model_1

# Custom output directory
python generate_probability_outputs.py --all --model Model_1 --output-dir custom_output

# List available models
python generate_probability_outputs.py --list

# Get help
python generate_probability_outputs.py --help
```

---

## WGS Format Commands

### **WGS Format Generator (generate_wgs_format.py)**

#### **Generate All WGS Scenarios**
```bash
# Generate all scenario types in WGS format
python generate_wgs_format.py --model Model_1 --wgs --all --count 3 --split

# Generate with custom output directory
python generate_wgs_format.py --model Model_1 --wgs --all --count 3 --split --output-dir wgs_outputs
```

#### **Generate Specific WGS Scenarios**
```bash
# Positive scenarios in WGS format
python generate_wgs_format.py --model Model_1 --wgs --positive --count 3 --split

# Negative scenarios in WGS format
python generate_wgs_format.py --model Model_1 --wgs --negative --count 3 --split

# Exclusion scenarios in WGS format
python generate_wgs_format.py --model Model_1 --wgs --exclusion --count 3 --split
```

#### **WGS Format Options**
```bash
# Custom configuration
python generate_wgs_format.py --model Model_1 --wgs --all --config custom_config.json

# Get help
python generate_wgs_format.py --help
```

---

## CLI Module Commands

### **Core CLI Module (src.mockgen.cli)**

#### **Enhanced Mode (Recommended)**
```bash
# Generate enhanced output for all models
python -m src.mockgen.cli --enhanced

# Generate for specific model
python -m src.mockgen.cli --enhanced --model Model_1

# Generate multiple records
python -m src.mockgen.cli --enhanced --count 5

# Generate split output files
python -m src.mockgen.cli --enhanced --output-format split

# Generate multiple records in separate files
python -m src.mockgen.cli --enhanced --output-format multiple --count 3
```

#### **Probability Mode with WGS Format**
```bash
# Generate all probability scenarios in WGS format
python -m src.mockgen.cli --probability --all --model Model_1 --wgs --output-dir generated_outputs

# Generate specific probability scenarios in WGS format
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --output-dir generated_outputs
python -m src.mockgen.cli --probability --negative --model Model_1 --wgs --output-dir generated_outputs
python -m src.mockgen.cli --probability --exclusion --model Model_1 --wgs --output-dir generated_outputs
```

#### **CLI Help and Options**
```bash
# Get help for CLI options
python -m src.mockgen.cli --help

# Available options:
# --config: Path to input JSON file
# --master: Path to master template file
# --init: Create/overwrite template input JSON
# --count: Number of random outputs
# --split: Write each output to separate file
# --model: Generate output for specific model
# --enhanced: Use enhanced mode with master template
# --models: Specific models to generate for
# --output-format: single/multiple/split
# --legacy: Force legacy mode for Edit_X format
```

---

## Advanced Usage

### **Custom Configuration Files**
```bash
# Use custom configuration
python generate_probability_outputs.py --config my_config.json --all --model Model_1

# Use custom master template
python -m src.mockgen.cli --enhanced --master my_master.json --model Model_1
```

### **Output Format Options**
```bash
# Single combined file
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs

# Multiple separate files
python generate_probability_outputs.py --all --model Model_1 --count 5 --split --output-dir generated_outputs

# Custom output directory
python generate_probability_outputs.py --all --model Model_1 --output-dir my_custom_outputs
```

### **Model-Specific Generation**
```bash
# Generate for specific model only
python generate_probability_outputs.py --positive --model Model_1 --output-dir generated_outputs

# Generate for multiple specific models
python -m src.mockgen.cli --enhanced --models Model_1,Model_2,Model_3
```

---

## Testing Commands

### **Test WGS Commands (test_wgs_commands.py)**
```bash
# Test all WGS format commands
python test_wgs_commands.py

# This will test:
# - Positive scenarios generation
# - Negative scenarios generation
# - Exclusion scenarios generation
# - All scenarios generation
# - Help command functionality
```

---

## File Structure and Outputs

### **Generated Outputs**
All generated files are saved in the `generated_outputs/` directory by default:
- **Positive scenarios**: Valid/positive test case data
- **Negative scenarios**: Invalid/negative test case data  
- **Exclusion scenarios**: Exclusion scenario data
- **Combined scenarios**: Single file with all types
- **Multiple records**: Separate JSON files if using `--count` and `--split`

### **File Naming Convention**
```
Model_1_positive_YYYYMMDD_HHMMSS_000001.json
Model_1_negative_YYYYMMDD_HHMMSS_000001.json
Model_1_exclusion_YYYYMMDD_HHMMSS_000001.json
Model_1_all_YYYYMMDD_HHMMSS_000001.json
```

---

## Troubleshooting

### **Common Issues and Solutions**

#### **1. Directory Issues**
```bash
# Make sure you're in the correct directory
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"

# Verify with dir command - you should see:
# - generate_probability_outputs.py
# - src/ folder
# - user_input.json
# - master.json
# - generate_all_scenarios.bat
```

#### **2. Python Installation**
```bash
# Check Python version (should be 3.7+)
python --version

# If Python not found, install Python 3.7+ and add to PATH
```

#### **3. File Generation Issues**
```bash
# Check if output directory exists
dir generated_outputs

# If empty, run generation commands again
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs
```

#### **4. Permission Issues**
```bash
# Run as administrator if needed
# Or check folder permissions for generated_outputs directory
```

### **Success Indicators**
✅ **Commands run without errors**  
✅ **Files appear in `generated_outputs\` folder**  
✅ **Success messages displayed**  
✅ **JSON files contain realistic data**  
✅ **File count matches expected output**

---

## Quick Reference Summary

### **Most Common Commands**
```bash
# 1. Use batch file (easiest)
generate_all_scenarios.bat

# 2. Generate all scenarios
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs

# 3. Generate WGS format
python generate_wgs_format.py --model Model_1 --wgs --all --count 3 --split

# 4. Use CLI module
python -m src.mockgen.cli --enhanced --model Model_1
```

### **Required Parameters**
- **--model**: Always specify the model name (e.g., Model_1)
- **--wgs**: Required for WGS format generation
- **--output-dir**: Specify output directory (default: generated_outputs)

### **Optional Parameters**
- **--count**: Number of records to generate (default: 1)
- **--split**: Generate separate files for each record
- **--config**: Custom configuration file path
- **--all**: Generate all probability types
- **--positive/--negative/--exclusion**: Generate specific types

---

## Support and Documentation

### **Additional Resources**
- **Project Structure**: See `docs/user-guides/PROJECT_STRUCTURE.md`
- **Usage Guide**: See `docs/user-guides/USAGE_GUIDE.md`
- **Working Commands**: See `docs/user-guides/WORKING_COMMANDS_FINAL.md`
- **Troubleshooting**: See `docs/troubleshooting/CORRECTED_COMMANDS.md`

### **File Locations**
- **Main Scripts**: Project root directory
- **Generated Outputs**: `generated_outputs/` folder
- **Configuration**: `user_input.json` and `master.json`
- **Documentation**: `docs/` folder

---

*Last Updated: December 2024*  
*Version: 2.0 - Comprehensive Commands Reference*
