#!/bin/bash

# Prompt the user for the GitHub token
read -sp "Enter your GitHub token: " TOKEN
echo # Add a new line after the user input for better readability

# Check if the token is empty
if [ -z "$TOKEN" ]; then
  echo "Error: GitHub token cannot be empty. Exiting."
  exit 1
fi

# Prompt the user for the GitHub enterprise name
read -p "Enter your GitHub enterprise name (e.g., pentaglobalsltd): " ENTERPRISE

# Check if the enterprise name is empty
if [ -z "$ENTERPRISE" ]; then
  echo "Error: Enterprise name cannot be empty. Exiting."
  exit 1
fi

# Prompt the user for the Git username
read -p "Enter your Git username (e.g., vimrul): " GIT_USERNAME

# Check if the username is empty
if [ -z "$GIT_USERNAME" ]; then
  echo "Error: Git username cannot be empty. Exiting."
  exit 1
fi

# Loop through all directories in the current directory
for dir in */; do
  # Check if the directory is a Git repository
  if [ -d "$dir/.git" ]; then
    cd "$dir" || continue
    echo "Updating remote for $dir"
    # Update the Git remote URL
    git remote set-url origin https://$GIT_USERNAME:$TOKEN@github.com/$ENTERPRISE/$(basename "$dir").git
    cd ..
  else
    echo "Skipping $dir: Not a Git repository."
  fi
done

echo "Remote URLs updated successfully."
