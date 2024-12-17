#!/bin/bash

# Function to check if folder is a git repository
check_git_folder() {
    if [ -d ".git" ]; then
        return 0
    else
        return 1
    fi
}

# Ask for commit message
read -p "Enter the commit message: " commit_message

# Loop through all folders in the current directory
for folder in */ ; do
    if [ -d "$folder" ]; then
        cd "$folder" || continue

        # Check if the folder is a git repository
        check_git_folder
        if [ $? -eq 0 ]; then
            # Check for changes
            if [[ -n $(git status --porcelain) ]]; then
                echo "Changes found in $folder"
                git add .
                git commit -m "$commit_message"
                git push
                echo "Changes pushed for $folder"
            else
                echo "No changes in $folder"
            fi
        else
            echo "$folder is not a git repository"
        fi
        cd ..
    fi

done

echo "Script execution completed."
