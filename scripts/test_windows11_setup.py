#!/usr/bin/env python3
"""
Test script to verify Windows 11 setup is working correctly
Run this script to check if all components are properly configured
"""

import sys
import os
import json
from pathlib import Path

def test_python_version():
    """Test Python version compatibility."""
    print("✓ Testing Python version...")
    version = sys.version_info
    if version.major >= 3 and version.minor >= 7:
        print(f"  Python {version.major}.{version.minor}.{version.micro} - Compatible")
        return True
    else:
        print(f"  Python {version.major}.{version.minor}.{version.micro} - Requires Python 3.7+")
        return False

def test_imports():
    """Test if required modules can be imported."""
    print("✓ Testing module imports...")
    
    try:
        from src.mockgen.core import MockGenCore
        print("  MockGenCore - OK")
    except ImportError as e:
        print(f"  MockGenCore - FAILED: {e}")
        return False
    
    try:
        from src.mockgen.cli import main
        print("  CLI module - OK")
    except ImportError as e:
        print(f"  CLI module - FAILED: {e}")
        return False
    
    return True

def test_file_structure():
    """Test if required files and directories exist."""
    print("✓ Testing file structure...")
    
    required_files = [
        "user_input.json",
        "src/mockgen/__init__.py",
        "src/mockgen/core.py",
        "src/mockgen/cli.py"
    ]
    
    all_exist = True
    for file_path in required_files:
        if Path(file_path).exists():
            print(f"  {file_path} - OK")
        else:
            print(f"  {file_path} - MISSING")
            all_exist = False
    
    return all_exist

def test_config_file():
    """Test if configuration file can be loaded."""
    print("✓ Testing configuration file...")
    
    try:
        with open("user_input.json", "r", encoding="utf-8") as f:
            config = json.load(f)
        
        if isinstance(config, dict):
            print(f"  user_input.json - OK (loaded {len(config)} keys)")
            return True
        else:
            print("  user_input.json - INVALID (not a dictionary)")
            return False
    except FileNotFoundError:
        print("  user_input.json - NOT FOUND")
        return False
    except json.JSONDecodeError as e:
        print(f"  user_input.json - INVALID JSON: {e}")
        return False
    except Exception as e:
        print(f"  user_input.json - ERROR: {e}")
        return False

def test_output_directory():
    """Test if output directory can be created and accessed."""
    print("✓ Testing output directory...")
    
    try:
        output_dir = Path("generated_outputs")
        output_dir.mkdir(exist_ok=True)
        
        # Test write access
        test_file = output_dir / "test_write.tmp"
        test_file.write_text("test")
        test_file.unlink()  # Clean up
        
        print("  generated_outputs - OK (writable)")
        return True
    except Exception as e:
        print(f"  generated_outputs - ERROR: {e}")
        return False

def test_cli_help():
    """Test if CLI help command works."""
    print("✓ Testing CLI help command...")
    
    try:
        import subprocess
        result = subprocess.run([
            sys.executable, "-m", "src.mockgen.cli", "--help"
        ], capture_output=True, text=True, timeout=10)
        
        if result.returncode == 0:
            print("  CLI help - OK")
            return True
        else:
            print(f"  CLI help - FAILED (exit code: {result.returncode})")
            if result.stderr:
                print(f"    Error: {result.stderr.strip()}")
            return False
    except subprocess.TimeoutExpired:
        print("  CLI help - TIMEOUT")
        return False
    except Exception as e:
        print(f"  CLI help - ERROR: {e}")
        return False

def main():
    """Run all tests and provide summary."""
    print("=" * 60)
    print("Windows 11 Setup Verification Test")
    print("=" * 60)
    print()
    
    tests = [
        ("Python Version", test_python_version),
        ("File Structure", test_file_structure),
        ("Configuration", test_config_file),
        ("Output Directory", test_output_directory),
        ("Module Imports", test_imports),
        ("CLI Help", test_cli_help)
    ]
    
    results = []
    for test_name, test_func in tests:
        try:
            result = test_func()
            results.append((test_name, result))
        except Exception as e:
            print(f"  {test_name} - ERROR: {e}")
            results.append((test_name, False))
        print()
    
    # Summary
    print("=" * 60)
    print("TEST SUMMARY")
    print("=" * 60)
    
    passed = 0
    total = len(results)
    
    for test_name, result in results:
        status = "PASS" if result else "FAIL"
        color = "✓" if result else "✗"
        print(f"{color} {test_name}: {status}")
        if result:
            passed += 1
    
    print()
    print(f"Results: {passed}/{total} tests passed")
    
    if passed == total:
        print("🎉 All tests passed! Your Windows 11 setup is working correctly.")
        print()
        print("Next steps:")
        print("1. Run: scripts\\generate_all_scenarios_win11.bat")
        print("2. Or run: .\\scripts\\generate_all_scenarios_win11.ps1")
    else:
        print("❌ Some tests failed. Please check the troubleshooting guide:")
        print("   WINDOWS11_TROUBLESHOOTING.md")
        print()
        print("Quick fixes:")
        print("1. Run: scripts\\setup_windows11.bat")
        print("2. Or run: .\\scripts\\setup_windows11.ps1")
    
    print()
    return passed == total

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
