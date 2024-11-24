# =============================================================================
# configure_environment.sh
#
# Description:
# Configuration script to set up a development environment with CUDA, Torch,
# and other deep learning dependencies; assumes a debian base image.
#
# Usage:
#
# sudo bash ./configure_environment.sh
#
# =============================================================================

# ===================
# Basic configuration
# ===================

export DEBIAN_FRONTEND=noninteractive
project_directory="projectname"
scripts_directory="scripts"
user_name="developer"
group_name="developer"
developer_home="/home/$user_name"

poetry_dir=".local/bin"
poetry_command="$developer_home/$poetry_dir/poetry"
poetry_install_command="curl -sSL https://install.python-poetry.org | python3 -"

# Check to ensure sudo is enabled
if grep -q "^root ALL=(ALL) NOPASSWD:ALL" /etc/sudoers; then
    echo "sudo is successfully enabled for root."
else
    echo "Warning: sudo is not enabled for root. Some operations that require sudo may not work."
fi

# ==========================
# Permissions configuration
# ==========================

echo "Changing ownership of files in workspace to user group..."

user_files="pyproject.toml .cspell.json .gitattributes .gitignore LICENSE README.md"

find . \
    -mindepth 1 -maxdepth 1 \
    -type f \
    -exec chown "$user_name":"$group_name" {} ';' \
&& find . \
    -mindepth 1 -maxdepth 1 -type d \
    -not \( -name '.venv' -o -name '.git' -o -name '.devcontainer' \) \
    -exec chown -R "$user_name":"$group_name" {} ';'

if [ $? -eq 0 ]; then
    echo "Success!"
else
    echo "Failed to change ownership."
    exit 1
fi

# ===================
# Poetry installation
# ===================

echo "Installing Poetry..."

sudo -u "$user_name" bash -c "$poetry_install_command"

if "$poetry_command" --version &>/dev/null; then
    echo "Poetry installed!"
else
    echo "Failed to install Poetry."
fi

echo "Adding Poetry to path..."

echo "export PATH=\"$developer_home/$poetry_dir:\$PATH\"" >> $developer_home/.bashrc

# ==========================
# Extra package installation
# ==========================

# Add user package install commands here

# =====================
# Aliases configuration
# =====================

command_line_aliases_file="https://raw.githubusercontent.com/mauro-j-sanchirico/personal-scripts/refs/heads/main/bash_aliases/command_line.bash_aliases"
git_aliases_file="https://raw.githubusercontent.com/mauro-j-sanchirico/personal-scripts/refs/heads/main/bash_aliases/git.bash_aliases"
poetry_aliases_file="https://raw.githubusercontent.com/mauro-j-sanchirico/personal-scripts/refs/heads/main/bash_aliases/poetry.bash_aliases"

echo "Getting convenient bash shortcuts..."

add_aliases() {
    touch $developer_home/.bashrc
    file_name=$(basename "$1")
    curl -o "$developer_home/$file_name" $1
    echo "source $developer_home/$file_name" >> "$developer_home/.bashrc"
}

add_aliases $command_line_aliases_file
add_aliases $git_aliases_file
add_aliases $poetry_aliases_file

echo "source $developer_home/.bashrc" >> "$developer_home/.bash_profile"
echo "source $developer_home/.bashrc" >> "$developer_home/.profile"

# ====================
# Project installation
# ====================

echo "Configuring Poetry to create virtual environment in-project..."

sudo -u "$user_name" "$poetry_command" config virtualenvs.in-project true

echo "Installing repository..."

sudo -u "$user_name" "$poetry_command" install --with dev

if [ $? -eq 0 ]; then
    echo "Repository dependencies installed!"
else
    echo "Failed to install repository dependencies."
    exit 1
fi

echo "Success!"

exit 0