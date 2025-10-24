#!/bin/bash

#removes "venv" directories from the system.

SEARCH_PATH="${1:-$HOME}"  # Default: search only inside your home directory

echo "Listing all found venvs $SEARCH_PATH"
echo

# Find all directories named 'venv'

venvs=$(find "$SEARCH_PATH" -type d -name "venv" 2>/dev/null)

echo "Venv directories: "
echo "$venvs"
echo

read -p "Y/N to delete: " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo
    echo "Deleting venvs"

    while IFS= read -r dir; do
        echo "Deleting: $dir"
        rm -rf "$dir"
    done <<< "$venvs"

    echo
    echo "Deleted successfully"
fi