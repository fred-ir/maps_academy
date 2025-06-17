#!/bin/tcsh

# Check if file is sourced
set sourced = ($_)
if ("$sourced" == "") then
   echo "Script should be sourced."
   exit 1
endif

# Set the name of the virtual environment from first argument
set VENV_NAME="../venv"
set PYTHON_EXEC="python3"

# Check if directory already exists
if (-d $VENV_NAME) then
    echo "Error: Directory '$VENV_NAME' already exists!"
    exit 1
endif

# Check if Python is installed
which $PYTHON_EXEC >& /dev/null
if ($status != 0) then
    echo "Error: $PYTHON_EXEC not found!"
    exit 1
endif

# Create the virtual environment
echo "Creating virtual environment '$VENV_NAME' using $PYTHON_EXEC..."
$PYTHON_EXEC -m venv $VENV_NAME

if ($status != 0) then
    echo "Error: Failed to create virtual environment!"
    exit 1
endif

# Activate the virtual environment
source $VENV_NAME/bin/activate.csh

if ($status != 0) then
    echo "Error: Failed to activate virtual environment!"
    exit 1
endif

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

if ($status != 0) then
    echo "Error: Failed to upgrade pip!"
    exit 1
endif

pip install --upgrade setuptools

if ($status != 0) then
    echo "Error: Failed to upgrade setuptools!"
    exit 1
endif

# Install commonly used packages
echo "Installing required packages..."
xargs --max-args=1 --max-procs=8 pip install < .python_requirements

echo "Virtual environment '$VENV_NAME' created and activated successfully!"
rehash
cd ..
echo "To deactivate, use 'deactivate'"