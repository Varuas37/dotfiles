#!/bin/bash

set -e

echo "Setting up dotfiles..."
echo ""

# Check OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS"

    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Please install Homebrew first:"
        echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi

    # Install dependencies
    echo ""
    echo "Checking dependencies..."

    if ! command -v tmux &> /dev/null; then
        echo "  Installing tmux..."
        brew install tmux
    else
        echo "  tmux already installed"
    fi

    if ! command -v stow &> /dev/null; then
        echo "  Installing stow..."
        brew install stow
    else
        echo "  stow already installed"
    fi

    if ! command -v atuin &> /dev/null; then
        echo "  Installing atuin..."
        bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)
    else
        echo "  atuin already installed"
    fi

    if ! command -v opencode &> /dev/null; then
        echo "  Installing opencode..."
        curl -fsSL https://opencode.ai/install | bash
    else
        echo "  opencode already installed"
    fi

    # Install sketchybar
    if ! command -v sketchybar &> /dev/null; then
        echo "  Installing sketchybar..."
        brew tap FelixKratz/formulae
        brew install sketchybar
    else
        echo "  sketchybar already installed"
    fi

    # Install borders (for window borders)
    if ! command -v borders &> /dev/null; then
        echo "  Installing borders..."
        brew install FelixKratz/formulae/borders
    else
        echo "  borders already installed"
    fi

    # Install aerospace
    if ! command -v aerospace &> /dev/null; then
        echo "  Installing aerospace..."
        brew install --cask nikitabobko/tap/aerospace
    else
        echo "  aerospace already installed"
    fi

    # Install ghostty
    if ! ls /Applications/Ghostty.app &> /dev/null; then
        echo "  Installing ghostty..."
        brew install --cask ghostty
    else
        echo "  ghostty already installed"
    fi

else
    echo "Non-macOS detected. sketchybar, aerospace, and ghostty are macOS only."
    echo "Please manually install tmux and stow."
    echo ""
    read -p "Press enter to continue after installing dependencies..."
fi

# Stow configurations
echo ""
echo "Creating symlinks with stow..."

cd "$(dirname "$0")"

# Backup helper function
backup_if_exists() {
    local file="$1"
    local name="$2"
    if [ -f "$file" ] && [ ! -L "$file" ]; then
        echo "  Existing $file found (not a symlink)"
        read -p "  Backup and replace? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            mv "$file" "$file.backup"
            echo "  Backed up to $file.backup"
        else
            echo "  Skipping $name stow"
            return 1
        fi
    fi
    return 0
}

backup_dir_if_exists() {
    local dir="$1"
    local name="$2"
    if [ -d "$dir" ] && [ ! -L "$dir" ]; then
        echo "  Existing $dir found (not a symlink)"
        read -p "  Backup and replace? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            mv "$dir" "$dir.backup"
            echo "  Backed up to $dir.backup"
        else
            echo "  Skipping $name stow"
            return 1
        fi
    fi
    return 0
}

# Stow tmux
if backup_if_exists ~/.tmux.conf "tmux"; then
    stow tmux
    echo "  tmux configuration stowed"
fi

# Stow aerospace
if backup_if_exists ~/.aerospace.toml "aerospace"; then
    stow aerospace
    echo "  aerospace configuration stowed"
fi

# Stow sketchybar
if backup_dir_if_exists ~/.config/sketchybar "sketchybar"; then
    stow sketchybar
    echo "  sketchybar configuration stowed"
fi

# Stow ghostty
if backup_dir_if_exists ~/.config/ghostty "ghostty"; then
    stow ghostty
    echo "  ghostty configuration stowed"
fi

# Install tpm
echo ""
echo "Installing tmux plugin manager (tpm)..."

if [ -d ~/.tmux/plugins/tpm ]; then
    echo "  tpm already installed"
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "  tpm installed"
fi

# Final instructions
echo ""
echo "Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Start tmux: tmux"
echo "  2. Install tmux plugins: Press Ctrl-s + Shift-I (capital I)"
echo "  3. Start sketchybar: brew services start sketchybar"
echo "  4. Start aerospace: open -a AeroSpace"
echo ""
echo "Keybindings (aerospace):"
echo "  alt-h/j/k/l    - Focus windows"
echo "  alt-1-5        - Switch workspaces"
echo "  alt-e          - Toggle tiles layout"
echo "  alt-comma      - Toggle accordion layout"
echo "  alt-f          - Fullscreen"
echo ""
