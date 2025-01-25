# =============================================================================
# post_attach.sh
#
# Description:
#
# Configuration script to configure git and install the repository dependencies
# after the container has been started.
#
# Usage:
#
# bash ./post_attach.sh
#
# =============================================================================

# ===================
# Basic configuration
# ===================

source .devcontainer/user_info.sh

# =================
# Git configuration
# =================

echo "Configuring git to treat working directory as safe..."
git config --global --add safe.directory $(pwd)

if [ $? -eq 0 ]; then
    echo "Successfully configured git!"
else
    echo "Failed to configure git to treat working directory as safe."
fi

# ====================
# Poetry configuration
# ====================

echo ""
echo "Adding poetry to path..."
poetry_path="/home/developer/.local/bin"
if [ -d "$poetry_path" ] && [[ ":$PATH:" != *":$poetry_path:"* ]]; then
    PATH="${PATH:+"$PATH:"}$poetry_path"
fi

echo "Checking poetry version..."
echo "Using poetry version:"
poetry --version

poetry config virtualenvs.in-project true

if [ $? -eq 0 ]; then
    echo "Successfully configured Poetry!"
else
    echo "Failed to configure Poetry."
fi

# =======================
# Repository installation
# =======================

echo ""
echo "Installing repository poetry environment..."

poetry install --with dev

if [ $? -eq 0 ]; then
    echo "Repository dependencies installed!"
else
    echo "Failed to install repository dependencies."
    exit 1
fi

echo ""
echo "Creating alias localpy to local Python environment..."

echo 'alias localpy="$(pwd)/.venv/bin/python"' >> ~/.bashrc
source ~/.bashrc

if [ $? -eq 0 ]; then
    echo "Alias created! To run a script with your local python use:"
    echo "localpy path/to/script.py"
else
    echo "Failed to create alias."
fi

# ===============
# Status messages
# ===============

echo ""
echo "Logged in as user:"
whoami

echo ""
echo "Environment:"
python3 --version
pip3 --version
poetry --version
echo ""
nvcc --version
echo ""
echo "Torch version:"
.venv/bin/python -c "import torch; print(torch.__version__); quit()"

exit 0