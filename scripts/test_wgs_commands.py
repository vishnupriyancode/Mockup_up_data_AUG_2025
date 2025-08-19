#!/usr/bin/env python3
"""
Test script to verify the consolidated CLI module works correctly
"""

import subprocess
import sys
import os
from pathlib import Path

def test_cli_module():
    """Test the consolidated CLI module"""
    print("🧪 Testing Consolidated CLI Module...")
    print("=" * 50)
    
    # Test commands for the CLI module
    test_commands = [
        {
            "name": "CLI Help",
            "cmd": ["python", "-m", "src.mockgen.cli", "--help"]
        },
        {
            "name": "List Models via CLI",
            "cmd": ["python", "-m", "src.mockgen.cli", "--list"]
        },
        {
            "name": "Positive Scenarios",
            "cmd": ["python", "-m", "src.mockgen.cli", "--probability", "--positive", "--model", "Model_1", "--wgs", "--count", "1"]
        },
        {
            "name": "Negative Scenarios", 
            "cmd": ["python", "-m", "src.mockgen.cli", "--probability", "--negative", "--model", "Model_1", "--wgs", "--count", "1"]
        },
        {
            "name": "Exclusion Scenarios",
            "cmd": ["python", "-m", "src.mockgen.cli", "--probability", "--exclusion", "--model", "Model_1", "--wgs", "--count", "1"]
        },
        {
            "name": "All Scenarios",
            "cmd": ["python", "-m", "src.mockgen.cli", "--probability", "--all", "--model", "Model_1", "--wgs", "--count", "1"]
        }
    ]
    
    results = []
    
    for test in test_commands:
        print(f"\n📋 Testing: {test['name']}")
        print(f"Command: {' '.join(test['cmd'])}")
        
        try:
            # Run the command
            result = subprocess.run(
                test['cmd'], 
                capture_output=True, 
                text=True, 
                timeout=30
            )
            
            if result.returncode == 0:
                print(f"✅ SUCCESS: {test['name']}")
                if result.stdout:
                    print(f"Output: {result.stdout.strip()}")
                results.append(True)
            else:
                print(f"❌ FAILED: {test['name']}")
                if result.stderr:
                    print(f"Error: {result.stderr.strip()}")
                results.append(False)
                
        except subprocess.TimeoutExpired:
            print(f"⏰ TIMEOUT: {test['name']} (took longer than 30 seconds)")
            results.append(False)
        except Exception as e:
            print(f"💥 ERROR: {test['name']} - {e}")
            results.append(False)
    
    # Summary
    print("\n" + "=" * 50)
    print("📊 TEST RESULTS SUMMARY")
    print("=" * 50)
    
    passed = sum(results)
    total = len(results)
    
    for i, (test, result) in enumerate(zip(test_commands, results)):
        status = "✅ PASS" if result else "❌ FAIL"
        print(f"{i+1}. {test['name']}: {status}")
    
    print(f"\nOverall: {passed}/{total} tests passed")
    
    if passed == total:
        print("🎉 All tests passed! The consolidated CLI module is working correctly.")
        return True
    else:
        print("⚠️  Some tests failed. Please check the error messages above.")
        return False

def main():
    """Main test function"""
    print("🚀 Starting Consolidated CLI Module Tests")
    print("=" * 60)
    
    # Test CLI module
    cli_success = test_cli_module()
    
    # Overall summary
    print("\n" + "=" * 60)
    print("🎯 OVERALL TEST SUMMARY")
    print("=" * 60)
    
    if cli_success:
        print("CLI Module: ✅ PASS")
        print("\nOverall: 1/1 test categories passed")
        print("🎉 All test categories passed! The consolidated CLI module is working correctly.")
        return 0
    else:
        print("CLI Module: ❌ FAIL")
        print("\nOverall: 0/1 test categories passed")
        print("⚠️  Some test categories failed. Please check the error messages above.")
        return 1

if __name__ == "__main__":
    sys.exit(main())
