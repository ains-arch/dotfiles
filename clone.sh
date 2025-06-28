#!/bin/bash

# Colors for printing
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

print_msg() {
    echo -e "${1}${2}${NC}"
}

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Dotfiles in repo root to copy directly into $HOME
top_level_dotfiles=(
    ".bash_aliases"
    ".bash_prompt"
    ".bashrc"
    ".git-prompt.sh"
    ".gitconfig"
    ".vimrc"
)

# Copy all top-level dotfiles
for file in "${top_level_dotfiles[@]}"; do
    src="$REPO_DIR/$file"
    dest="$HOME/$file"
    # [ -f "$src" ] && rsync -avh --dry-run "$src" "$dest"
    if [ -f "$src" ]; then
        cp "$src" "$dest" && print_msg "$GREEN" "Copied: $file" || print_msg "$RED" "Failed to copy: $file"
    else
        print_msg "$YELLOW" "Skipped missing file: $file"
    fi
done

# Copy everything from .config/ recursively
if [ -d "$REPO_DIR/.config" ]; then
    # rsync -avh --dry-run "$REPO_DIR/.config/"
    cp -rT "$REPO_DIR/.config" "$HOME/.config" && print_msg "$GREEN" "Copied .config directory" || print_msg "$RED" "Failed to copy .config"

else
    print_msg "$YELLOW" "No .config directory found in repo"
fi

print_msg "$YELLOW" "Don't forget to edit your .gitconfig and install a Nerd Font"
print_msg "$GREEN" "Dotfiles installed successfully"
