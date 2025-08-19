# 🏗️ Mock Generation System - Professional Architecture Overview

## 📋 **Executive Summary**

The **Mock Generation System** is an enterprise-grade solution for generating comprehensive mock data with probability-based scenarios, supporting software testing, development, and data validation workflows.

---

## 🏛️ **System Architecture Overview**

```
┌─────────────────────────────────────────────────────────────────────────────────┐
│                              MOCK GENERATION SYSTEM                            │
│                           Enterprise-Grade Mock Data Generation                │
└─────────────────────────────────────────────────────────────────────────────────┘

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

---

## 🔄 **Data Flow Architecture**

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   INPUT     │───▶│  PROCESSING │───▶│   OUTPUT    │───▶│   STORAGE   │
│             │    │             │    │             │    │             │
│ • user_input│    │ • Core      │    │ • JSON      │    │ • generated_│
│ • master.json│   │ • CLI       │    │ • WGS       │    │   outputs/  │
│ • config    │    │ • Generator │    │ • Split     │    │ • Timestamp │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

---

## 📁 **Project Structure**

```
Mockup_up_data-main/
├── 📚 docs/                           # Documentation & guides
├── 🔧 src/mockgen/                    # Core system modules
│   ├── __init__.py                    # Package initialization
│   ├── core.py                        # Core functionality
│   └── cli.py                         # Command-line interface
├── 📜 scripts/                        # Utility scripts
├── ⚙️ Configuration Files
│   ├── user_input.json                # User-defined models
│   └── master.json                    # Master template
├── 📊 generated_outputs/               # Generated mock data
└── 📋 Other Files
```

---

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

---

## 🔄 **Process Flow**

```
┌─────────────┐
│   START     │
└─────┬───────┘
      │
      ▼
┌─────────────────┐
│ Load Config     │ ◄─── user_input.json + master.json
└─────┬───────────┘
      │
      ▼
┌─────────────────┐
│ Parse Models    │ ◄─── Model_1, Model_1_Positive, etc.
└─────┬───────────┘
      │
      ▼
┌─────────────────┐
│ Generate Data   │ ◄─── Random selection + probability logic
└─────┬───────────┘
      │
      ▼
┌─────────────────┐
│ Apply Template  │ ◄─── Merge with master.json
└─────┬───────────┘
      │
      ▼
┌─────────────────┐
│ Format & Save   │ ◄─── JSON, WGS, Split files
└─────┬───────────┘
      │
      ▼
┌─────────────┐
│   END       │
└─────────────┘
```

---

## 🎯 **Core Features**

- **🔄 Probability-Based Generation**: Positive, Negative, Exclusion scenarios
- **📁 Flexible Output Formats**: Single file, Multiple records, Split files, WGS format
- **🎨 Master Template Integration**: Consistent data structure with default values
- **⚙️ Advanced Configuration**: Multiple model support, extensible architecture
- **🚀 Automation Ready**: CLI interface, batch scripts, CI/CD integration

---

## 🛠️ **Usage Methods**

| Method | Command | Description |
|--------|---------|-------------|
| **Enhanced CLI** | `python -m src.mockgen.cli --enhanced` | Full-featured system |
| **Probability Generator** | `python -m src.mockgen.cli --probability --all --model Model_1 --wgs` | Scenario-based generation |
| **WGS Format** | `python -m src.mockgen.cli --probability --positive --model Model_1 --wgs` | Web Genome Schema output |
| **Batch Files** | `generate_all_scenarios.bat` | Windows automation |
| **PowerShell** | `generate_all_scenarios.ps1` | PowerShell automation |

---

## 📊 **Output Structure**

```
generated_outputs/
├── Model_1_Positive_[timestamp].json
├── Model_1_Negative_[timestamp].json
├── Model_1_Exclusion_[timestamp].json
└── Model_1_All_Probabilities_[timestamp].json
```

---

## 🔧 **Configuration Example**

**user_input.json:**
```json
{
  "Model_1": {
    "proc_cd": ["Vishnu", "Priyan", "Raja"],
    "mail_id": ["vishnu@email.com", "priyan@email.com"],
    "address": ["123456", "654321"],
    "city": ["Hyderabad", "Chennai"]
  }
}
```

**master.json:**
```json
{
  "user_profile": {
    "first_name": ["John"],
    "last_name": ["Smith"],
    "email": ["john@email.com"]
  }
}
```

---

## 🚀 **Deployment Options**

- **💻 Standalone**: No external dependencies, portable
- **🔄 CI/CD**: Automated testing pipelines, build scripts
- **👥 Team**: Version control, configuration sharing
- **🌐 Web**: Future API endpoints, web interface

---

## 🎯 **Use Cases**

- **🧪 Software Testing**: Unit, integration, performance testing
- **🚀 Development**: API development, UI prototyping, database testing
- **📊 Data Analysis**: Algorithm testing, validation pipelines
- **🔍 Comprehensive Testing**: Positive, negative, exclusion scenarios

---

## 🔮 **Future Roadmap**

- **🌐 Web Interface**: Browser-based configuration
- **🔌 API Endpoints**: RESTful API integration
- **🗄️ Database**: Direct database connectivity
- **🎨 Advanced Templates**: Conditional field generation
- **📈 ML Integration**: Predictive data generation

---

## 🏆 **Business Value**

| Stakeholder | Benefits |
|-------------|----------|
| **Developers** | Time savings, quality improvement, consistency |
| **Teams** | Standardization, collaboration, maintenance |
| **Organizations** | Cost reduction, risk mitigation, scalability |

---

## 📚 **Quick Start**

1. **Setup**: Clone project, ensure Python 3.6+
2. **First Run**: `python -m src.mockgen.cli --enhanced`
3. **Customize**: Modify user_input.json and master.json
4. **Explore**: Test probability generation and split files
5. **Integrate**: Use in testing workflows and CI/CD

---

*Mock Generation System - Professional Architecture Documentation* 🏗️
