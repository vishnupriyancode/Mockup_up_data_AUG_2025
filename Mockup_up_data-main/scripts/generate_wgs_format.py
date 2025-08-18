#!/usr/bin/env python3
"""
WGS Format Probability Scenario Generator

Provides the exact commands requested to generate positive, negative, exclusion,
and all scenarios in WGS format without modifying existing core code.

SUPPORTED COMMANDS:
  python generate_wgs_format.py --model Model_1 --wgs --positive --count 3 --split
  python generate_wgs_format.py --model Model_1 --wgs --negative --count 3 --split
  python generate_wgs_format.py --model Model_1 --wgs --exclusion --count 3 --split
  python generate_wgs_format.py --model Model_1 --wgs --all --count 3 --split
"""

import argparse
import sys
import os
from pathlib import Path

# Add the parent directory to Python path so we can import from src
current_dir = Path(__file__).parent
parent_dir = current_dir.parent
sys.path.insert(0, str(parent_dir))

try:
    from src.mockgen.core import MockGenCore
except Exception as exc:
    print(f"Failed to import core module: {exc}")
    print(f"Current directory: {os.getcwd()}")
    print(f"Python path: {sys.path}")
    sys.exit(1)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate WGS-format probability scenarios (positive, negative, exclusion)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Examples:\n"
            "  python generate_wgs_format.py --model Model_1 --wgs --all --count 3 --split\n"
            "  python generate_wgs_format.py --model Model_1 --wgs --positive --count 3 --split\n"
            "  python generate_wgs_format.py --model Model_1 --wgs --negative --count 3 --split\n"
            "  python generate_wgs_format.py --model Model_1 --wgs --exclusion --count 3 --split\n"
        ),
    )

    # Accept flags independently so commands with redundant --all still work
    parser.add_argument("--all", action="store_true", help="Generate all available scenario types")
    parser.add_argument("--positive", action="store_true", help="Generate positive scenarios")
    parser.add_argument("--negative", action="store_true", help="Generate negative scenarios")
    parser.add_argument("--exclusion", action="store_true", help="Generate exclusion scenarios")

    parser.add_argument("--model", required=True, help="Model name to generate scenarios for")
    parser.add_argument("--count", type=int, default=1, help="Number of JSON files to generate (default: 1)")
    parser.add_argument("--wgs", action="store_true", help="Use WGS format (required)")
    parser.add_argument("--split", action="store_true", help="Generate separate files per record (accepted; always true)")
    parser.add_argument("--config", default="user_input.json", help="Path to configuration file")
    parser.add_argument("--output-dir", default="generated_outputs", help="Output directory (default: generated_outputs)")

    return parser.parse_args()


def main() -> int:
    args = parse_args()

    if not args.wgs:
        print("Error: --wgs flag is required for WGS-format generation")
        return 1

    try:
        core = MockGenCore(args.config, args.output_dir)

        output_dir_path = Path(args.output_dir)
        output_dir_path.mkdir(parents=True, exist_ok=True)

        generated_files = []

        # Determine which scenario types to generate
        selected_types = []
        if args.positive:
            selected_types.append("positive")
        if args.negative:
            selected_types.append("negative")
        if args.exclusion:
            selected_types.append("exclusion")

        # If none specifically selected, but --all provided, generate all
        if not selected_types and args.all:
            selected_types = ["positive", "negative", "exclusion"]

        # If still none selected, error
        if not selected_types:
            print("Error: Select at least one scenario flag (--positive/--negative/--exclusion) or use --all")
            return 1

        for prob_type in selected_types:
            files = core.generate_probability_scenarios(prob_type, args.model, args.count, wgs=True)
            generated_files.extend(files)

        for fp in generated_files:
            print(f"Generated: {fp}")

        print(f"\nGeneration completed. {len(generated_files)} file(s) written to '{args.output_dir}'.")
        return 0

    except Exception as e:
        print(f"Error: {e}")
        return 1


if __name__ == "__main__":
    sys.exit(main())


