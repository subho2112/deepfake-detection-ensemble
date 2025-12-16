@echo off
rem Windows setup script for DeepFake Detection Prototype

rem Ensure Python is in PATH
python --version >nul 2>&1 || (
    echo Python is not installed or not in PATH. Please install Python 3.9+ and add it to your PATH.
    exit /b 1
)

rem Create virtual environment
python -m venv venv

rem Activate virtual environment
call venv\Scripts\activate

rem Upgrade pip and install requirements
python -m pip install --upgrade pip
pip install -r requirements.txt


rem Verify CUDA availability (optional)
python -c "import torch; print('CUDA available:', torch.cuda.is_available())"

echo Setup complete. Activate the environment with "call venv\\Scripts\\activate" before running the app.
pause
