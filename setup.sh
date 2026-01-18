#!/bin/bash

set -e

echo "🚀 Setting up dotfiles..."
echo ""

# Check OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "✓ Detected macOS"

    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "❌ Homebrew not found. Please install Homebrew first:"
        echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi

    # Install dependencies
    echo ""
    echo "📦 Checking dependencies..."

    if ! command -v tmux &> /dev/null; then
        echo "  Installing tmux..."
        brew install tmux
    else
        echo "  ✓ tmux already installed"
    fi

    if ! command -v stow &> /dev/null; then
        echo "  Installing stow..."
        brew install stow
    else
        echo "  ✓ stow already installed"
    fi

    if ! command -v atuin &> /dev/null; then
        echo "  Installing atuin..."
        bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)
    else
        echo "  ✓ atuin already installed"
    fi

    if ! command -v opencode &> /dev/null; then
        echo "  Installing opencode..."
        curl -fsSL https://opencode.ai/install | bash
    else
        echo "  ✓ opencode already installed"
    fi
else
    echo "⚠️  Non-macOS detected. Please manually install tmux and stow."
    echo ""
    read -p "Press enter to continue after installing dependencies..."
fi

# Stow configurations
echo ""
echo "🔗 Creating symlinks with stow..."

cd "$(dirname "$0")"

if [ -f ~/.tmux.conf ] && [ ! -L ~/.tmux.conf ]; then
    echo "  ⚠️  Existing ~/.tmux.conf found (not a symlink)"
    read -p "  Backup and replace? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv ~/.tmux.conf ~/.tmux.conf.backup
        echo "  Backed up to ~/.tmux.conf.backup"
    else
        echo "  Skipping tmux stow"
        exit 1
    fi
fi

stow tmux
echo "  ✓ tmux configuration stowed"

# Install tpm
echo ""
echo "🔌 Installing tmux plugin manager (tpm)..."

if [ -d ~/.tmux/plugins/tpm ]; then
    echo "  ✓ tpm already installed"
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "  ✓ tpm installed"
fi

# Final instructions
echo ""
echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "  1. Start tmux: tmux"
echo "  2. Install plugins: Press Ctrl-s + Shift-I (capital I)"
echo ""
echo "🎨 Features:"
echo "  • Custom prefix: Ctrl-s"
echo "  • Vim navigation: h/j/k/l"
echo "  • Timezone toggle: Ctrl-s + t"
echo "  • Reload config: Ctrl-s + r"
echo ""
