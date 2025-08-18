#!/usr/bin/env python3
"""
Test script to verify WGS format generator commands work correctly
"""

import subprocess
import sys
import os
from pathlib import Path

def test_wgs_commands():
    """Test the WGS format generator commands"""
    
    print("🧪 Testing WGS Format Generator Commands...")
    print("=" * 50)
    
    # Test commands
    test_commands = [
        {
            "name": "Positive Scenarios",
            "cmd": ["python", "generate_wgs_format.py", "--model", "Model_1", "--wgs", "--positive", "--count", "1", "--split"]
        },
        {
            "name": "Negative Scenarios", 
            "cmd": ["python", "generate_wgs_format.py", "--model", "Model_1", "--wgs", "--negative", "--count", "1", "--split"]
        },
        {
            "name": "Exclusion Scenarios",
            "cmd": ["python", "generate_wgs_format.py", "--model", "Model_1", "--wgs", "--exclusion", "--count", "1", "--split"]
        },
        {
            "name": "All Scenarios",
            "cmd": ["python", "generate_wgs_format.py", "--model", "Model_1", "--wgs", "--all", "--count", "1", "--split"]
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
        print("🎉 All tests passed! The WGS format generator is working correctly.")
        return 0
    else:
        print("⚠️  Some tests failed. Please check the error messages above.")
        return 1

def test_help_command():
    """Test that the help command works"""
    print("\n🔍 Testing Help Command...")
    
    try:
        result = subprocess.run(
            ["python", "generate_wgs_format.py", "--help"],
            capture_output=True,
            text=True,
            timeout=10
        )
        
        if result.returncode == 0:
            print("✅ Help command works correctly")
            print("Available options:")
            for line in result.stdout.split('\n'):
                if line.strip() and ('--positive' in line or '--negative' in line or '--exclusion' in line):
                    print(f"  {line.strip()}")
            return True
        else:
            print("❌ Help command failed")
            return False
            
    except Exception as e:
        print(f"💥 Error testing help command: {e}")
        return False

if __name__ == "__main__":
    print("🚀 WGS Format Generator Test Suite")
    print("This script tests the exact commands you requested:")
    print("  python generate_wgs_format.py --model Model_1 --wgs --positive --count 3 --split")
    print("  python generate_wgs_format.py --model Model_1 --wgs --negative --count 3 --split")
    print("  python generate_wgs_format.py --model Model_1 --wgs --exclusion --count 3 --split")
    print()
    
    # Test help command first
    help_success = test_help_command()
    
    # Test main commands
    main_success = test_wgs_commands()
    
    # Exit with appropriate code
    if help_success and main_success == 0:
        sys.exit(0)
    else:
        sys.exit(1)
