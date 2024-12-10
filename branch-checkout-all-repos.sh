#!/bin/bash

# Ask the user for the branch name
read -p "Enter the branch name you want to check out: " branch_name

# Get the current directory
current_dir=$(pwd)

# Iterate through all directories in the current directory
for folder in */; do
    # Check if the directory is a git repository
    if [ -d "${folder}/.git" ]; then
        echo "Processing '$folder'..."
        cd "$folder" || continue

        # Fetch the latest branches
        git fetch --all

        # Check if the branch exists locally or remotely
        if git show-ref --verify --quiet refs/heads/"$branch_name"; then
            # Branch exists locally
            git checkout "$branch_name"
            echo "Checked out to branch '$branch_name' in '$folder'."
        elif git show-ref --verify --quiet refs/remotes/origin/"$branch_name"; then
            # Branch exists remotely, create and track it
            git checkout -b "$branch_name" origin/"$branch_name"
            echo "Checked out and set up tracking for branch '$branch_name' in '$folder'."
        else
            echo "Branch '$branch_name' does not exist in '$folder'."
        fi

        # Return to the parent directory
        cd "$current_dir" || exit
    else
        echo "WARNING: '$folder' is not a git repository."
    fi
done

echo "Done!"
