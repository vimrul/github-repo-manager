# GitHub Repo Manager

A comprehensive Bash script to manage your GitHub repositories with ease. This script allows you to clone or pull all repositories from a GitHub organization or user, authenticate using a GitHub token, and optionally update remote URLs for seamless authenticated operations.

## Features

- **Check GitHub CLI Installation**: Automatically checks if `gh` (GitHub CLI) is installed and installs it if not present.
- **GitHub Authentication**: Easily authenticate with GitHub using a token or manual login.
- **Clone or Pull Repositories**: Clone all repositories from a specified organization or user, or pull the latest changes in existing repositories.
- **Update Remote URLs with Token**: Optionally update the remote URLs of cloned repositories to include your GitHub token for authenticated pushes.

## Usage

### 1. Clone or Download the Script

```bash
git clone https://github.com/yourusername/github-repo-manager.git
cd github-repo-manager

