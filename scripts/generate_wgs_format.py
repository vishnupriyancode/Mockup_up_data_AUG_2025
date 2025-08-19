#!/usr/bin/env python3
"""
Generate WGS Format Script - Convenience wrapper for generating mock data in WGS format
This script provides a simplified interface for generating probability scenarios in WGS format
"""

import argparse
import sys
import os
from pathlib import Path

# Add the src directory to the Python path so we can import the mockgen module
sys.path.insert(0, str(Path(__file__).parent.parent / "src"))

from mockgen.cli import main as cli_main

def main():
    """Main function that parses arguments and calls the CLI module"""
    parser = argparse.ArgumentParser(
        description="Generate WGS Format Mock Data - Convenience wrapper for probability scenarios",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Generate 3 positive scenarios for Model_1 with WGS format
    python scripts/generate_wgs_format.py --positive --model Model_1 --wgs --count 3
    
    # Generate 1 negative scenario for Model_1 with WGS format
    python scripts/generate_wgs_format.py --negative --model Model_1 --wgs
    
    # Generate 2 exclusion scenarios for Model_1 with WGS format
    python scripts/generate_wgs_format.py --exclusion --model Model_1 --wgs --count 2
    
    # Generate all scenario types for Model_1 with WGS format
    python scripts/generate_wgs_format.py --all --model Model_1 --wgs
    
    # Split output into multiple files (default behavior)
    python scripts/generate_wgs_format.py --positive --model Model_1 --wgs --count 3 --split
    
Note: This script automatically adds the --probability and --wgs flags for convenience
        """
    )
    
    # Scenario type (mutually exclusive)
    scenario_group = parser.add_mutually_exclusive_group(required=True)
    scenario_group.add_argument("--positive", action="store_true", help="Generate positive scenarios")
    scenario_group.add_argument("--negative", action="store_true", help="Generate negative scenarios")
    scenario_group.add_argument("--exclusion", action="store_true", help="Generate exclusion scenarios")
    scenario_group.add_argument("--all", action="store_true", help="Generate all available scenario types")
    
    # Optional arguments
    parser.add_argument("--model", type=str, required=True, help="Model name to generate scenarios for")
    parser.add_argument("--count", type=int, default=1, help="Number of JSON files to generate (default: 1)")
    parser.add_argument("--wgs", action="store_true", help="Use WGS format for output (complete template structure)")
    parser.add_argument("--split", action="store_true", help="Split output into multiple files (default behavior)")
    parser.add_argument("--config", type=str, default="user_input.json", help="Path to config file")
    parser.add_argument("--output-dir", type=str, default="generated_outputs", help="Output directory")
    
    args = parser.parse_args()
    
    # Build the command line arguments for the CLI module
    cli_args = [
        "--probability",  # Always add probability flag
        "--wgs",         # Always add WGS flag
        "--config", args.config,
        "--output-dir", args.output_dir,
        "--count", str(args.count)
    ]
    
    # Add the scenario type
    if args.positive:
        cli_args.append("--positive")
    elif args.negative:
        cli_args.append("--negative")
    elif args.exclusion:
        cli_args.append("--exclusion")
    elif args.all:
        cli_args.append("--all")
    
    # Add the model
    cli_args.extend(["--model", args.model])
    
    # Temporarily replace sys.argv so the CLI module can parse the arguments
    original_argv = sys.argv
    sys.argv = ["generate_wgs_format.py"] + cli_args
    
    try:
        print(f"🚀 Generating WGS format scenarios with command: {' '.join(cli_args)}")
        print("=" * 60)
        
        # Call the CLI main function
        cli_main()
        
        print("=" * 60)
        print("✅ WGS format generation completed successfully!")
        
    except Exception as e:
        print(f"❌ Error during generation: {e}")
        sys.exit(1)
    finally:
        # Restore original sys.argv
        sys.argv = original_argv

if __name__ == "__main__":
    main()
