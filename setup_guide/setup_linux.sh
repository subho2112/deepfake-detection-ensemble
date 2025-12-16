#!/usr/bin/env bash
set -e

# Create virtual environment in 'venv' directory
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install required packages
pip install -r requirements.txt

echo "Setup complete. Activate with 'source venv/bin/activate'"
