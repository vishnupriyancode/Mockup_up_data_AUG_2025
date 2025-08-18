# ✅ ALL COMMANDS FIXED AND WORKING!

## 🚨 **THE PROBLEM WAS SOLVED**
All commands are now working correctly! The issue was that you need to be in the **correct directory**.

## 🎯 **EXACT COMMANDS TO COPY & PASTE**

### **Step 1: Navigate to Correct Directory**
```bash
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"
```

### **Step 2: Run Any of These Working Commands**

#### **Generate ALL Scenarios (Recommended)**
```bash
python generate_probability_outputs.py --all --model Model_1 --output-dir generated_outputs
```

#### **Generate Specific Scenarios**
```bash
# Positive scenarios
python generate_probability_outputs.py --positive --model Model_1 --output-dir generated_outputs

# Negative scenarios
python generate_probability_outputs.py --negative --model Model_1 --output-dir generated_outputs

# Exclusion scenarios
python generate_probability_outputs.py --exclusion --model Model_1 --output-dir generated_outputs
```

#### **Generate Multiple Records**
```bash
# Generate 5 records of each type
python generate_probability_outputs.py --all --model Model_1 --count 5 --output-dir generated_outputs

# Generate separate files for each record
python generate_probability_outputs.py --all --model Model_1 --count 3 --split --output-dir generated_outputs
```

#### **Using CLI Module (WGS Format)**
```bash
# Generate all scenarios in WGS format
python -m src.mockgen.cli --probability --all --model Model_1 --wgs --output-dir generated_outputs

# Generate specific scenarios in WGS format
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --output-dir generated_outputs
python -m src.mockgen.cli --probability --negative --model Model_1 --wgs --output-dir generated_outputs
python -m src.mockgen.cli --probability --exclusion --model Model_1 --wgs --output-dir generated_outputs
```

## 🚀 **SUPER EASY SOLUTION: Use the Batch File**

### **Option 1: Double-click**
1. Navigate to: `C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main`
2. Double-click: `generate_all_scenarios.bat`
3. Wait for completion
4. All files will be in `generated_outputs\` folder

### **Option 2: Run from Command Line**
```bash
cd "C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main"
generate_all_scenarios.bat
```

## 🔍 **How to Verify You're in the Right Directory**
```bash
# Run this command - you should see Python files
dir

# You should see:
# - generate_probability_outputs.py
# - src/ folder
# - user_input.json
# - master.json
# - generate_all_scenarios.bat
```

## 📊 **What You'll Get**
- **Positive scenarios**: Valid/positive test case data
- **Negative scenarios**: Invalid/negative test case data
- **Exclusion scenarios**: Exclusion scenario data
- **All scenarios combined**: Single file with all types
- **Multiple records**: Multiple JSON files if using `--count`

## 🎉 **Success Indicators**
✅ **Commands run without errors**  
✅ **Files appear in `generated_outputs\` folder**  
✅ **Success messages displayed**  
✅ **JSON files contain realistic data**  

## 📁 **Output Location**
All files will be saved in: `C:\Users\Vishnu\Downloads\Mockup_up_data-main (1)\Mockup_up_data-main\generated_outputs\`

---

## 🆘 **Still Having Issues?**

1. **Make sure you're in the right directory** - use `dir` command to verify
2. **Check Python installation** - run `python --version`
3. **Use the batch file** - it's the easiest solution
4. **Copy the exact commands above** - they've been tested and work

**All commands are now working correctly! 🎯**
