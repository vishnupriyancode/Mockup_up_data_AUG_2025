# 🎯 Mock Generation System - Visual Architecture Diagram

## 🏗️ **System Overview**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                        MOCK GENERATION SYSTEM                                  │
│                    Enterprise-Grade Mock Data Generation                       │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 🔄 **High-Level Data Flow**

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   INPUT     │───▶│  PROCESSING │───▶│   OUTPUT    │───▶│   STORAGE   │
│             │    │             │    │             │    │             │
│ • user_input│    │ • Core      │    │ • JSON      │    │ • generated_│
│ • master.json│   │ • CLI       │    │ • WGS       │    │   outputs/  │
│ • config    │    │ • Generator │    │ • Split     │    │ • Timestamp │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

## 🏛️ **System Architecture Layers**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              USER INTERFACE LAYER                              │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                │
│  │   CLI Interface │  │  Batch Scripts  │  │  PowerShell     │                │
│  │   (Enhanced)   │  │   (.bat/.ps1)   │  │   Scripts       │                │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                │
└─────────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────────┐
│                            CORE PROCESSING ENGINE                             │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                │
│  │  MockGen Core   │  │  Configuration  │  │  Data Generator │                │
│  │   (core.py)     │  │    Parser       │  │   Engine        │                │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                │
│                                                                                │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                │
│  │  Probability    │  │  Output         │  │  Validation     │                │
│  │    Engine       │  │  Formatter      │  │   Engine        │                │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                │
└─────────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────────┐
│                            DATA MANAGEMENT LAYER                              │
├─────────────────────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                │
│  │  Input Config   │  │  Master Template│  │  Output         │                │
│  │ (user_input.json)│  │   (master.json) │  │  Directory      │                │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 📁 **Project Structure & File Organization**

```
Mockup_up_data-main/
├── 📚 docs/                           # Documentation
│   ├── user-guides/                   # User guides and tutorials
│   ├── project-workflow/              # Workflow documentation
│   └── project-documentation/         # Project overview
│
├── 🔧 src/mockgen/                    # Core system modules
│   ├── __init__.py                    # Package initialization
│   ├── core.py                        # Core functionality
│   └── cli.py                         # Command-line interface
│
├── 📜 scripts/                        # Utility scripts
│   ├── generate_wgs_format.py         # WGS format generator
│   ├── generate_probability_outputs.py # Probability generator
│   ├── generate_all_scenarios.bat     # Windows batch script
│   └── generate_all_scenarios.ps1     # PowerShell script
│
├── ⚙️ Configuration Files
│   ├── user_input.json                # User-defined models & data
│   ├── master.json                    # Master template structure
│   └── user_input.json                # User configuration
│
├── 📊 generated_outputs/               # Generated mock data (auto-created)
│   ├── Model_1_Positive_[timestamp].json
│   ├── Model_1_Negative_[timestamp].json
│   ├── Model_1_Exclusion_[timestamp].json
│   └── Model_1_All_Probabilities_[timestamp].json
│
└── 📋 Other Files
    ├── README.md                       # Project overview
    ├── .gitignore                      # Git ignore rules
    └── all scenarios in single file.txt # Reference scenarios
```

## 🎲 **Data Models & Scenarios**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              DATA MODEL TYPES                                  │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                │
│  │   Model_1       │  │ Model_1_Positive│  │ Model_1_Negative│                │
│  │                 │  │                 │  │                 │                │
│  │ • proc_cd       │  │ • Valid data    │  │ • Invalid data  │                │
│  │ • mail_id       │  │ • Normal cases  │  │ • Edge cases    │                │
│  │ • address       │  │ • Expected      │  │ • Error testing │                │
│  │ • city          │  │   scenarios     │  │ • Validation    │                │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                │
│                                                                                │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐                │
│  │Model_1_Exclusion│  │  Master Template│  │  Custom Models  │                │
│  │                 │  │                 │  │                 │                │
│  • Filtered data   │  │ • Base structure│  │ • User-defined  │                │
│  • Rejection cases │  │ • Default values│  │ • Extensible    │                │
│  • Test filtering  │  │ • Field schema  │  │ • Configurable  │                │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘                │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 🔄 **Data Generation Process Flow**

```
┌─────────────┐
│   START     │
└─────┬───────┘
      │
      ▼
┌─────────────────┐
│ Load Config     │ ◄─── user_input.json
│ Files           │ ◄─── master.json
└─────┬───────────┘
      │
      ▼
┌─────────────────┐
│ Parse Models    │ ◄─── Model_1, Model_1_Positive, etc.
│ & Scenarios     │
└─────┬───────────┘
      │
      ▼
┌─────────────────┐
│ Generate Data   │ ◄─── Random selection from arrays
│ Based on Type   │
└─────┬───────────┘
      │
      ▼
┌─────────────────┐
│ Apply Master    │ ◄─── Merge with master.json template
│ Template        │
└─────┬───────────┘
      │
      ▼
┌─────────────────┐
│ Format Output   │ ◄─── JSON, WGS, Split files
│ & Save          │
└─────┬───────────┘
      │
      ▼
┌─────────────┐
│   END       │
└─────────────┘
```

## 🎯 **Key Features & Capabilities**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              CORE FEATURES                                    │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  🔄 **Probability-Based Generation**                                          │
│     • Positive Scenarios (valid data)                                         │
│     • Negative Scenarios (invalid data)                                       │
│     • Exclusion Scenarios (filtered data)                                     │
│                                                                                │
│  📁 **Flexible Output Formats**                                               │
│     • Single consolidated file                                                │
│     • Multiple records in one file                                           │
│     • Split files (one per record)                                           │
│     • WGS (Web Genome Schema) format                                         │
│                                                                                │
│  🎨 **Master Template Integration**                                           │
│     • Consistent data structure                                               │
│     • Default field values                                                    │
│     • Template wrapping for outputs                                           │
│                                                                                │
│  ⚙️ **Advanced Configuration**                                                │
│     • Multiple model support                                                  │
│     • Custom field definitions                                                │
│     • Extensible architecture                                                 │
│                                                                                │
│  🚀 **Automation Ready**                                                      │
│     • CLI interface                                                           │
│     • Batch scripts                                                           │
│     • CI/CD integration                                                       │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 🛠️ **Usage Methods & Commands**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              USAGE METHODS                                    │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  🎯 **Method 1: Enhanced CLI System**                                        │
│     python -m src.mockgen.cli --enhanced --model Model_1                      │
│                                                                                │
│  🎲 **Method 2: Probability Generator**                                       │
│     python generate_probability_outputs.py --all --count 3 --split            │
│                                                                                │
│  📜 **Method 3: WGS Format Script**                                           │
│     python scripts/generate_wgs_format.py --positive --model Model_1          │
│                                                                                │
│  🖱️ **Method 4: Batch Files**                                                 │
│     • Double-click generate_all_scenarios.bat                                 │
│     • Run generate_all_scenarios.ps1                                          │
│                                                                                │
│  🔧 **Method 5: Direct Core Module**                                          │
│     python generate_probability_outputs.py --help                              │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 📊 **Output Examples & Structure**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              OUTPUT STRUCTURE                                  │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  📄 **Single File Output**                                                    │
│     {                                                                         │
│       "Model_1": {                                                           │
│         "proc_cd": "Vishnu",                                                 │
│         "mail_id": "vishnu@email.com",                                       │
│         "address": "123456",                                                  │
│         "city": "Hyderabad"                                                   │
│       }                                                                       │
│     }                                                                         │
│                                                                                │
│  📁 **Split File Output**                                                     │
│     generated_outputs/                                                        │
│     ├── Model_1_Positive_Record_001_[timestamp].json                         │
│     ├── Model_1_Positive_Record_002_[timestamp].json                         │
│     ├── Model_1_Negative_Record_001_[timestamp].json                         │
│     └── Model_1_Exclusion_Record_001_[timestamp].json                        │
│                                                                                │
│  🎨 **Master Template Wrapped Output**                                        │
│     {                                                                         │
│       "user_profile": {                                                      │
│         "first_name": "John",                                                 │
│         "last_name": "Smith",                                                 │
│         "proc_cd": "Vishnu",                                                  │
│         "mail_id": "vishnu@email.com"                                        │
│       }                                                                       │
│     }                                                                         │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 🔧 **Configuration & Customization**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                            CONFIGURATION SYSTEM                               │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  📝 **user_input.json**                                                       │
│     {                                                                         │
│       "Model_1": {                                                           │
│         "proc_cd": ["Vishnu", "Priyan", "Raja"],                             │
│         "mail_id": ["vishnu@email.com", "priyan@email.com"],                 │
│         "address": ["123456", "654321"],                                      │
│         "city": ["Hyderabad", "Chennai"]                                      │
│       }                                                                       │
│     }                                                                         │
│                                                                                │
│  🎨 **master.json**                                                           │
│     {                                                                         │
│       "user_profile": {                                                       │
│         "first_name": ["John"],                                               │
│         "last_name": ["Smith"],                                               │
│         "email": ["john@email.com"]                                           │
│       }                                                                       │
│     }                                                                         │
│                                                                                │
│  ⚙️ **CLI Options**                                                           │
│     --model: Specify model to generate                                        │
│     --count: Number of records                                                │
│     --split: Generate separate files                                          │
│     --output-dir: Custom output directory                                     │
│     --config: Custom configuration file                                       │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 🚀 **Deployment & Integration**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                            DEPLOYMENT OPTIONS                                 │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  💻 **Standalone Operation**                                                  │
│     • No external dependencies                                                │
│     • Portable across environments                                            │
│     • Self-contained system                                                   │
│                                                                                │
│  🔄 **CI/CD Integration**                                                     │
│     • Automated testing pipelines                                             │
│     • Build and deployment scripts                                            │
│     • Continuous integration workflows                                        │
│                                                                                │
│  👥 **Team Collaboration**                                                     │
│     • Version control ready                                                   │
│     • Configuration sharing                                                   │
│     • Standardized outputs                                                    │
│                                                                                │
│  🌐 **Web Integration**                                                       │
│     • API endpoints (future)                                                  │
│     • Web interface (planned)                                                 │
│     • Database connectivity (planned)                                         │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 🎯 **Use Cases & Applications**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              USE CASES                                        │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  🧪 **Software Testing**                                                      │
│     • Unit testing data generation                                            │
│     • Integration testing scenarios                                           │
│     • Performance testing datasets                                            │
│     • User acceptance testing                                                 │
│                                                                                │
│  🚀 **Development & Prototyping**                                             │
│     • API development test data                                               │
│     • UI development sample data                                              │
│     • Database schema testing                                                 │
│     • System integration validation                                           │
│                                                                                │
│  📊 **Data Analysis**                                                         │
│     • Algorithm testing                                                       │
│     • Data validation pipelines                                               │
│     • Performance analysis                                                    │
│     • Quality assurance                                                       │
│                                                                                │
│  🔍 **Comprehensive Testing**                                                 │
│     • Positive scenario testing                                               │
│     • Negative scenario testing                                               │
│     • Exclusion scenario testing                                              │
│     • Edge case validation                                                    │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 🔮 **Future Enhancements & Roadmap**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              FUTURE PLANS                                     │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  🌐 **Web Interface**                                                         │
│     • Browser-based configuration                                             │
│     • Visual data preview                                                     │
│     • Drag-and-drop configuration                                             │
│                                                                                │
│  🔌 **API Endpoints**                                                         │
│     • RESTful API for integration                                             │
│     • JSON-based configuration                                                │
│     • Programmatic access                                                     │
│                                                                                │
│  🗄️ **Database Integration**                                                  │
│     • Direct database connectivity                                            │
│     • Data source integration                                                 │
│     • Real-time data generation                                               │
│                                                                                │
│  🎨 **Advanced Templates**                                                    │
│     • Sophisticated template systems                                          │
│     • Conditional field generation                                            │
│     • Dynamic data relationships                                              │
│                                                                                │
│  📈 **Enhanced Probability Models**                                           │
│     • Complex probability distributions                                       │
│     • Machine learning integration                                            │
│     • Predictive data generation                                              │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 🏆 **Project Benefits & Value**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              PROJECT VALUE                                     │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  👨‍💻 **For Developers**                                                       │
│     • Time savings in test data generation                                    │
│     • Quality improvement through realistic data                               │
│     • Consistency across testing scenarios                                    │
│     • Flexibility for different testing needs                                 │
│                                                                                │
│  👥 **For Teams**                                                             │
│     • Standardization across team members                                     │
│     • Easy configuration sharing                                               │
│     • Simple maintenance and updates                                          │
│     • Clear documentation and examples                                        │
│                                                                                │
│  🏢 **For Organizations**                                                     │
│     • Cost reduction in development cycles                                    │
│     • Better software quality through testing                                 │
│     • Risk mitigation through comprehensive testing                            │
│     • Scalability for growing testing needs                                   │
└─────────────────────────────────────────────────────────────────────────────────┘
```

## 📚 **Getting Started Guide**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              QUICK START                                      │
├─────────────────────────────────────────────────────────────────────────────────┤
│                                                                                │
│  1️⃣ **Setup**                                                                 │
│     • Clone/download project files                                            │
│     • Ensure Python 3.6+ is available                                        │
│     • Navigate to Mockup_up_data-main directory                               │
│                                                                                │
│  2️⃣ **First Run**                                                             │
│     • Run: python -m src.mockgen.cli --enhanced                               │
│     • Check generated_outputs/ folder                                         │
│     • Review generated JSON files                                             │
│                                                                                │
│  3️⃣ **Customize**                                                             │
│     • Modify user_input.json for your data                                    │
│     • Update master.json template if needed                                   │
│     • Test with different models                                              │
│                                                                                │
│  4️⃣ **Explore Features**                                                      │
│     • Try probability generation                                              │
│     • Experiment with split file generation                                   │
│     • Test exclusion scenarios                                                │
│                                                                                │
│  5️⃣ **Integration**                                                            │
│     • Use in your testing workflows                                           │
│     • Integrate with CI/CD pipelines                                          │
│     • Customize for your specific needs                                       │
└─────────────────────────────────────────────────────────────────────────────────┘
```

---

## 🎉 **Summary**

The **Mock Generation System** is a comprehensive, enterprise-grade solution that provides:

- **🎯 Multiple Data Models**: Support for positive, negative, and exclusion scenarios
- **🔄 Flexible Generation**: Multiple output formats and file splitting options
- **🎨 Template Integration**: Master template system for consistent data structure
- **🚀 Automation Ready**: CLI interface and batch scripts for easy integration
- **📚 Comprehensive Documentation**: Complete guides and examples
- **🔧 Extensible Architecture**: Easy to customize and extend for specific needs

This system is designed to streamline the process of generating realistic mock data for software testing, development, and data validation workflows, making it an essential tool for modern software development teams.

---

*Generated by Mock Generation System Documentation Generator* 📊
