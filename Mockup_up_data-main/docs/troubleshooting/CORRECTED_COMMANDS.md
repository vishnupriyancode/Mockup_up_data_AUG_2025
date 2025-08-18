# 🔧 CORRECTED COMMANDS FOR MOCK DATA GENERATION

## ⚠️ IMPORTANT: You MUST be in the correct directory!

**Current working directory must be:** `Mockup_up_data-main` (where the Python files are located)

## 📁 STEP 1: Navigate to Correct Directory

```bash
# Navigate to the folder containing the Python files
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"

# Verify you're in the right place (should see Python files)
dir
# You should see: generate_probability_outputs.py, src/ folder, etc.
```

## 🎯 STEP 2: Generate All Scenarios (FIXED COMMANDS)

### **Method 1: Using Probability Generator Script (RECOMMENDED)**

```bash
# Generate positive scenarios
python generate_probability_outputs.py --positive --model Model_1 --output-dir generated_outputs

# Generate negative scenarios  
python generate_probability_outputs.py --negative --model Model_1 --output-dir generated_outputs

# Generate exclusion scenarios
python generate_probability_outputs.py --exclusion --model Model_1 --output-dir generated_outputs

# Generate ALL scenarios at once
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs

# Generate multiple records
python generate_probability_outputs.py --positive --model Model_1 --count 5 --output-dir generated_outputs
python generate_probability_outputs.py --all --model Model_1 --count 3 --output-dir generated_outputs

# Generate separate files for each record
python generate_probability_outputs.py --all --model Model_1 --count 3 --split --output-dir generated_outputs
```

### **Method 2: Using CLI Module (WGS Format)**

```bash
# Generate positive scenarios (WGS format)
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --output-dir generated_outputs

# Generate negative scenarios (WGS format)
python -m src.mockgen.cli --probability --negative --model Model_1 --wgs --output-dir generated_outputs

# Generate exclusion scenarios (WGS format)
python -m src.mockgen.cli --probability --exclusion --model Model_1 --wgs --output-dir generated_outputs

# Generate ALL scenarios (WGS format)
python -m src.mockgen.cli --probability --all --model Model_1 --wgs --output-dir generated_outputs

# Generate multiple records
python -m src.mockgen.cli --probability --positive --model Model_1 --count 5 --wgs --output-dir generated_outputs
```

### **Method 3: Using WGS Format Script (Direct)**

```bash
# Generate positive scenarios (WGS format)
python generate_wgs_format.py --positive --model Model_1 --wgs --all --count 3 --split

# Generate negative scenarios (WGS format)
python generate_wgs_format.py --negative --model Model_1 --wgs --all --count 3 --split

# Generate exclusion scenarios (WGS format)
python generate_wgs_format.py --exclusion --model Model_1 --wgs --all --count 3 --split

# Generate ALL scenarios (WGS format)
python generate_wgs_format.py --all --model Model_1 --wgs --count 3 --split

# Generate single scenario types
python generate_wgs_format.py --positive --model Model_1 --wgs --output-dir generated_outputs
python generate_wgs_format.py --negative --model Model_1 --wgs --output-dir generated_outputs
python generate_wgs_format.py --exclusion --model Model_1 --wgs --output-dir generated_outputs
```

## 🚀 QUICK START (Easiest Method)

### **Option 1: Run the Batch File (Windows)**
```bash
# Double-click this file in Windows Explorer:
generate_all_scenarios.bat
```

### **Option 2: Run the PowerShell Script**
```bash
# Right-click and "Run with PowerShell":
generate_all_scenarios.ps1
```

### **Option 3: Manual Commands**
```bash
# Navigate to correct directory first, then:
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs
```

## 🔍 Troubleshooting

### **Error: "No such file or directory"**
**Solution:** You're in the wrong directory. Make sure you're in `Mockup_up_data-main` folder.

### **Error: "Module not found"**
**Solution:** You're in the wrong directory. Navigate to `Mockup_up_data-main` folder.

### **Error: "Python not found"**
**Solution:** Install Python 3.7+ and add it to your PATH.

## 📊 Expected Output

After running the commands successfully, you should see:
- Files generated in the `generated_outputs/` folder
- Success messages for each scenario type
- JSON files with realistic mock data

## 🎉 Success Indicators

✅ **Commands run without errors**
✅ **Files appear in `generated_outputs/` folder**
✅ **Success messages displayed**
✅ **JSON files contain realistic data**

---

## 📝 File Structure After Generation

```
generated_outputs/
├── Model_1_Positive_[timestamp].json
├── Model_1_Negative_[timestamp].json
├── Model_1_Exclusion_[timestamp].json
├── Model_1_All_Probabilities_[timestamp].json
└── [Additional files if using --count or --split]
```

## 🆘 Need Help?

1. **Check your current directory** - must be `Mockup_up_data-main`
2. **Verify Python is installed** - run `python --version`
3. **Use the batch/PowerShell scripts** for automatic execution
4. **Check file permissions** - ensure you can write to the folder
