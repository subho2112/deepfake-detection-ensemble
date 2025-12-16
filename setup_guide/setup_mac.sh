#!/usr/bin/env bash
# macOS setup script for DeepFake Detection Prototype

set -e

# Ensure Homebrew is installed (optional, for installing python if needed)
if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. You may need to install Homebrew to get Python 3.9+ if not already installed."
fi

# Check Python version
if ! command -v python3 >/dev/null 2>&1; then
    echo "Python3 is not installed. Please install Python 3.9+ (e.g., via Homebrew: brew install python)"
    exit 1
fi

PYVER=$(python3 -c "import sys; print('.'.join(map(str, sys.version_info[:2])))")
if (( $(echo "$PYVER < 3.9" | bc -l) )); then
    echo "Python version $PYVER is less than required 3.9. Please upgrade Python."
    exit 1
fi

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Upgrade pip and install requirements
python -m pip install --upgrade pip
pip install -r requirements.txt

# Verify CUDA availability (optional)
python - <<'PY'
import torch, sys
print('CUDA available:', torch.cuda.is_available())
PY

echo "Setup complete. Activate the environment with 'source venv/bin/activate' before running the app."
