# dotfiles

Personal dotfiles for macOS, managed with [homeshick](https://github.com/andsens/homeshick).

## What's included

- **zsh** — zprezto + zsh-autosuggestions + zsh-syntax-highlighting
- **Starship** — terminal prompt (gruvbox-rainbow preset)
- **Vim** — vim-plug based config, shared with Neovim
- **VS Code** — settings, keybindings, extensions (see `vscode/`)
- **Git** — global config and ignore rules
- **SSH** — config template

## Setup on a new Mac

### 1. Prerequisites

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install homeshick starship gh
brew install --cask font-meslo-lg-nerd-font visual-studio-code
```

### 2. Clone and symlink dotfiles

```bash
mkdir -p ~/.homesick/repos
gh repo clone joeytall/dotfiles ~/.homesick/repos/dotfiles -- --recurse-submodules

# Fix zsh-autosuggestions (uses deprecated git:// protocol)
rm -rf ~/.homesick/repos/dotfiles/home/.zsh/zsh-autosuggestions
rm -rf ~/.homesick/repos/dotfiles/home/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.homesick/repos/dotfiles/home/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.homesick/repos/dotfiles/home/.zsh/zsh-syntax-highlighting

# Symlink to home directory
source /opt/homebrew/opt/homeshick/homeshick.sh
homeshick symlink dotfiles

# Fix zsh plugin symlinks (homeshick doesn't follow submodule dirs)
rm -rf ~/.zsh/zsh-autosuggestions ~/.zsh/zsh-syntax-highlighting
ln -s ~/.homesick/repos/dotfiles/home/.zsh/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
ln -s ~/.homesick/repos/dotfiles/home/.zsh/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
```

### 3. VS Code

```bash
~/.homesick/repos/dotfiles/vscode/install.sh
```

Installs all extensions and restores settings/keybindings.

### 4. VS Code font

Set the terminal font to **MesloLGS Nerd Font** in iTerm2:
- iTerm2 → Preferences → Profiles → Text → Font → MesloLGS Nerd Font

### 5. Neovim (optional)

```bash
neovimsetup   # defined in .zshrc, links .vim and .vimrc into nvim config
```

## Updating VS Code config

After changing VS Code settings or installing new extensions, run:

```bash
cp ~/Library/Application\ Support/Code/User/settings.json ~/.homesick/repos/dotfiles/vscode/settings.json
cp ~/Library/Application\ Support/Code/User/keybindings.json ~/.homesick/repos/dotfiles/vscode/keybindings.json
code --list-extensions > ~/.homesick/repos/dotfiles/vscode/extensions.txt
```

Then commit and push.

## Key aliases

| Alias | Command |
|-------|---------|
| `hscd` | cd into dotfiles repo |
| `hslink` | re-symlink dotfiles |
| `ss` | reload zshrc |
| `se` | edit zshrc |
