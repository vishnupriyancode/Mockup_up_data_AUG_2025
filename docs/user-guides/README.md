# 📚 User Guides

## 🎯 **Start Here: Comprehensive Usage Guide**

**[📖 COMPREHENSIVE_USAGE_GUIDE.md](./COMPREHENSIVE_USAGE_GUIDE.md)** - **Your single source of truth for everything!**

This guide contains:
- ✅ All working commands
- ✅ Quick start instructions  
- ✅ Automation scripts
- ✅ Testing and verification
- ✅ Troubleshooting
- ✅ Project structure

---

## 🔧 **What Was Cleaned Up**

The project has been **consolidated and deduplicated** to eliminate confusion:

### **Removed Duplicates:**
- ❌ `generate_probability_outputs.py` (duplicate functionality)
- ❌ `generate_wgs_format.py` (duplicate functionality)
- ❌ `ALL_WORKING_COMMANDS.md` (duplicate documentation)
- ❌ `USAGE_GUIDE.md` (duplicate documentation)
- ❌ `Mockup_Data_Generation_Commands_Reference_Updated.md` (duplicate documentation)

### **Consolidated Into:**
- ✅ **Single CLI interface**: `python -m src.mockgen.cli`
- ✅ **Single documentation**: `COMPREHENSIVE_USAGE_GUIDE.md`
- ✅ **Updated automation scripts**: Now use the consolidated CLI
- ✅ **Simplified testing**: Single test suite

---

## 🚀 **Quick Start (TL;DR)**

```bash
# Navigate to project
cd "C:\Users\Vishnu\Cursor_AI_proj\GIT_HUB\Mockup_up_data"

# Generate scenarios
python -m src.mockgen.cli --probability --positive --model Model_1 --wgs --count 3 --split

# Or use automation
scripts\generate_all_scenarios.bat
```

---

## 📖 **Other Guides**

- **[PROJECT_EXPLANATION.md](./PROJECT_EXPLANATION.md)** - Technical architecture and system design
- **[PROJECT_STRUCTURE.md](./PROJECT_STRUCTURE.md)** - Project organization and file structure
- **[ENHANCEMENT_ROADMAP.md](./ENHANCEMENT_ROADMAP.md)** - Future development plans

---

**🎉 Result: Clean, consolidated project with one clear way to do everything!**
