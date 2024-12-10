#!/bin/bash

# Function to check if gh is installed
check_gh_installed() {
    if ! command -v gh &> /dev/null; then
        echo "GitHub CLI (gh) is not installed."
        echo "Installing GitHub CLI..."
        
        if [ "$(uname)" == "Darwin" ]; then
            # macOS
            brew install gh
        elif [ "$(uname)" == "Linux" ]; then
            # Linux
            sudo apt-get update
            sudo apt-get install -y gh
        else
            echo "Unsupported OS. Please install GitHub CLI manually."
            exit 1
        fi
    else
        echo "GitHub CLI (gh) is already installed."
    fi
}

# Function to authenticate with GitHub CLI
authenticate_with_gh() {
    read -p "Enter your GitHub token (press enter to skip): " token
    if [ ! -z "$token" ]; then
        echo "Authenticating with GitHub CLI using token..."
        echo $token | gh auth login --with-token
    else
        echo "No token provided. Please authenticate using 'gh auth login'."
        gh auth login
        if [ $? -ne 0 ]; then
            echo "Authentication failed. Exiting."
            exit 1
        fi
    fi
}

# Function to clone all repositories
clone_repos() {
    echo "Cloning all repositories from $org_or_user..."
    for repo in $(gh repo list $org_or_user --limit 1000 --json name -q '.[].name'); do
        gh repo clone $org_or_user/$repo
    done
    echo "All repositories cloned successfully."
}

# Function to pull all repositories
pull_repos() {
    echo "Pulling latest changes in all repositories..."
    for dir in */; do
        if [ -d "$dir/.git" ]; then
            cd "$dir"
            echo "Pulling latest changes in $dir..."
            git pull
            cd ..
        else
            echo "$dir is not a git repository, skipping..."
        fi
    done
    echo "Finished pulling all repositories."
}

# Function to update remotes with token
update_remotes() {
    if [ -z "$token" ]; then
        echo "No token provided, skipping remote update."
    else
        echo "Updating remotes with the provided token..."
        for dir in */; do
            if [ -d "$dir/.git" ]; then
                cd "$dir"
                echo "Updating remote for $dir..."
                git remote set-url origin https://$your_username:$token@github.com/$org_or_user/$(basename "$dir").git
                cd ..
            fi
        done
        echo "All remotes updated with token."
    fi
}

# Main script
check_gh_installed
authenticate_with_gh

# Ask if user wants to clone or pull
echo "Do you want to (1) clone all repositories or (2) pull the latest changes in all repositories?"
read -p "Enter 1 for clone or 2 for pull: " choice

# Ask for the GitHub organization or username of the repos to clone/pull
read -p "Enter the GitHub organization or username whose repositories you want to clone or pull: " org_or_user

# Ask for your GitHub username (used for token-based access)
read -p "Enter your GitHub username: " your_username

if [ "$choice" == "1" ]; then
    clone_repos
elif [ "$choice" == "2" ]; then
    pull_repos
else
    echo "Invalid choice. Exiting."
    exit 1
fi

# Ask if user wants to update remotes with token
if [ ! -z "$token" ]; then
    read -p "Do you want to update the remote URLs with your token? (y/n): " update_choice
    if [ "$update_choice" == "y" ]; then
        update_remotes
    fi
fi

echo "Script completed successfully."
