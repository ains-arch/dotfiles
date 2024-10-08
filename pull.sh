#!/bin/bash

# Define the paths
ROOT_DIR=~
BACKUP_REPO=~/dotfiles

# Change to the root directory
cd $ROOT_DIR

# Get the list of files to ignore
IGNORE_LIST=$(cat $BACKUP_REPO/.pullignore)

# Function to check if a file is ignored
is_ignored() {
    local file=$1
    for ignore in $IGNORE_LIST; do
        if [[ "$file" == "$ignore" ]]; then
            return 0  # true
        fi
    done
    return 1  # false
}

# Change to the backup repository directory
cd $BACKUP_REPO || { echo "Failed to change to backup repository directory"; exit 1; }

# Grab the whole nvim directory
cp -r ~/.config/nvim/ .config

# Iterate over the files in the backup repository
for file in $(git ls-files); do
    # Check if the file is in the ignore list
    if ! is_ignored "$file"; then
        # Check if the file exists in the root directory
        if [ -e "$ROOT_DIR/$file" ]; then
            # Update the file in the backup repository
            cp "$ROOT_DIR/$file" "$BACKUP_REPO/$file"
            echo "Updated: $file"
        else
            echo "File not found in root directory: $file"
        fi
    else
        echo "Ignored: $file"
    fi
done

echo "Backup update complete."
