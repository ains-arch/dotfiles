#!/bin/bash

set -euo pipefail
shopt -s extglob nullglob globstar

REPO="$HOME/Utils/dotfiles"
NVIM_SRC="$HOME/.config/nvim"
NVIM_DEST="$REPO/.config/nvim"
PULLIGNORE="$REPO/.pullignore"

# Convert .pullignore lines into rsync --exclude args
EXCLUDE_ARGS=()
while IFS= read -r line; do
    # Skip empty lines or comments
    [[ -z "$line" || "$line" == \#* ]] && continue
    EXCLUDE_ARGS+=("--exclude=$line")
done < "$PULLIGNORE"

cd "$REPO"

# Load pullignore as a grep pattern (escaped)
IGNORE_PATTERNS=$(cat "$PULLIGNORE" | sed 's/[].[^$*]/\\&/g' | paste -sd '|')

print_msg() {
    local color="$1"
    local msg="$2"
    echo -e "${color}${msg}\033[0m"
}

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'

# Sync .config/nvim
print_msg "$YELLOW" "Syncing Neovim config..."

rsync -av "${EXCLUDE_ARGS[@]}" \
    --delete \
    --exclude spell \
    --exclude '*.swp' \
    "$NVIM_SRC/" "$NVIM_DEST/"

print_msg "$GREEN" "Finished syncing .config/nvim"

# Update other tracked files
print_msg "$YELLOW" "Updating other tracked dotfiles..."

for file in $(git ls-files); do
    # Skip files inside .config/nvim (already handled)
    [[ "$file" == .config/nvim/* ]] && continue

    # Skip ignored files
    for pattern in "${EXCLUDE_ARGS[@]##--exclude=}"; do
        [[ "$file" == $pattern ]] && {
            print_msg "$YELLOW" "Ignored: $file"
            continue 2
        }
    done

    # Skip files deleted from $HOME
    if [ ! -e "$HOME/$file" ]; then
        print_msg "$RED" "Missing in home, not copying: $file"
        continue
    fi

    cp "$HOME/$file" "$REPO/$file"
    print_msg "$GREEN" "Updated: $file"
done

print_msg "$GREEN" "Dotfiles pull complete."
