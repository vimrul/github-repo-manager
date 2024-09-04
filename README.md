
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
```

### 2. Make the Script Executable

After cloning the repository, you need to make the script executable:

```bash
chmod +x manage_repos.sh
```

### 3. Run the Script

Now run the script to manage your repositories:

```bash
./manage_repos.sh
```

### 4. Follow the Prompts

Once you run the script, you will be prompted to:

- **Choose to Clone or Pull**: You can clone all repositories from a specified organization or user or pull the latest changes from existing repositories.
- **Provide GitHub Token (Optional)**: Enter your GitHub token for authentication. If skipped, you will be prompted to manually log in.
- **Update Remote URLs (Optional)**: If you provide a token, you can choose to update the remote URLs of cloned repositories to include the token for easier authenticated pushes.

## Example

```bash
./manage_repos.sh

# Sample prompts and responses:
# Do you want to (1) clone all repositories or (2) pull the latest changes in all repositories?
# Enter 1 for clone or 2 for pull: 1
# Enter the GitHub organization or username whose repositories you want to clone or pull: pentaglobalsltd
# Enter your GitHub username: yourusername
# Enter your GitHub token (press enter to skip): yourtoken
# Cloning all repositories from pentaglobalsltd...
```

## Requirements

- Bash (Unix-based systems)
- GitHub CLI (`gh`)
- Git

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributions

Contributions are welcome! Feel free to open an issue or submit a pull request.

## Author

[Imrul](https://imrul.net)

## Contact

For any inquiries, please contact me at [hello@imrul.net](mailto:hello@imrul.net).
