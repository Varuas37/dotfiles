# dotfiles

My personal dotfiles managed with GNU stow.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Varuas37/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Use stow to symlink configurations:
   ```bash
   stow tmux
   ```

## Configurations

- **tmux**: Tmux configuration with Catppuccin theme, custom keybindings, and plugins managed by tpm
  - Custom prefix: `Ctrl-s`
  - Vim-style pane navigation: `h/j/k/l`
  - Timezone toggle: `Ctrl-s + t` (toggles between PST and UTC)

## Requirements

- GNU stow
- tmux (with tpm for plugin management)
