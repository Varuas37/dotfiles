# dotfiles

My personal dotfiles managed with GNU stow.

## Quick Setup

```bash
git clone https://github.com/Varuas37/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

Then start tmux and press `Ctrl-s + Shift-I` to install plugins.

## Manual Installation

1. Install dependencies:
   ```bash
   # macOS
   brew install tmux stow
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/Varuas37/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

3. Use stow to symlink configurations:
   ```bash
   stow tmux
   ```

4. Install tpm (Tmux Plugin Manager):
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

5. Start tmux and install plugins:
   ```bash
   tmux
   # Inside tmux, press: Ctrl-s + Shift-I (capital I) to install plugins
   ```

## Configurations

- **tmux**: Tmux configuration with Catppuccin theme, custom keybindings, and plugins managed by tpm
  - Custom prefix: `Ctrl-s`
  - Vim-style pane navigation: `h/j/k/l`
  - Timezone toggle: `Ctrl-s + t` (toggles between PST and UTC)

## Requirements

- GNU stow
- tmux (with tpm for plugin management)
