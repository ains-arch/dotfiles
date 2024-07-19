#!/bin/bash

# Function to print messages with colors
print_msg() {
    local color="$1"
    local msg="$2"
    echo -e "${color}${msg}\033[0m"
}

# Colors for printing
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

# Directories to create
directories=(
    "$HOME/.config"
    "$HOME/.config/nvim"
    "$HOME/.config/nvim/lua"
    "$HOME/.config/nvim/lua/plugins"
)

# URLs to download from
declare -A files=(
    ["$HOME/.config/nvim/lua/plugins/lualine.lua"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/lualine.lua"
    ["$HOME/.config/nvim/lua/plugins/neo-tree.lua"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/neo-tree.lua"
    ["$HOME/.config/nvim/lua/plugins.lua"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins.lua"
    ["$HOME/.config/nvim/.luarc.json"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/.luarc.json"
    ["$HOME/.config/nvim/init.lua"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/init.lua"
    ["$HOME/.bashrc"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.bashrc"
    ["$HOME/.dircolors"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.dircolors"
    ["$HOME/.git-prompt.sh"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.git-prompt.sh"
    ["$HOME/.gitconfig"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.gitconfig"
    ["$HOME/.vimrc"]="https://raw.githubusercontent.com/ains-arch/dotfiles/main/.vimrc"
)

# Create directories
for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir" && print_msg "$GREEN" "Created directory: $dir" || { print_msg "$RED" "Failed to create directory: $dir"; exit 1; }
    else
        print_msg "$YELLOW" "Directory already exists: $dir"
    fi
done

# Download files
for file in "${!files[@]}"; do
    curl -fLo "$file" "${files[$file]}" && print_msg "$GREEN" "Downloaded: $file" || { print_msg "$RED" "Failed to download: $file"; exit 1; }
done

print_msg "$YELLOW" "Don't forget to add your email to the .gitconfig"

print_msg "$YELLOW" "You may need to change the file path for the Neovim executable,"
print_msg "$YELLOW" "and make sure you download a Neovim version >=0.9.0 or lazy.nvim won't work."

print_msg "$YELLOW" "Don't forget to source the files or log out and log in again"

print_msg "$GREEN" "Script completed successfully"
