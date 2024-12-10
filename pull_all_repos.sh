#!/bin/bash

# Loop through all directories in the current location
for dir in */; do
  # Enter the directory
  cd "$dir"
  
  # Check if the directory is a git repository
  if [ -d ".git" ]; then
    echo "Pulling latest changes in $dir..."
    git pull  # This will pull the latest changes from the current branch
  else
    echo "$dir is not a git repository, skipping..."
  fi
  
  # Go back to the parent directory
  cd ..
done

echo "Finished pulling all repositories."

