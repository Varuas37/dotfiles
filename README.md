# dotfiles

My personal dotfiles managed with GNU stow.

## Quick Setup

```bash
git clone https://github.com/Varuas37/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

## What Gets Installed

- **tmux** - terminal multiplexer with Catppuccin theme
- **sketchybar** - custom macOS menu bar
- **aerospace** - tiling window manager
- **ghostty** - GPU-accelerated terminal
- **borders** - window border highlights
- **atuin** - shell history sync
- **starship** - cross-shell prompt

## Configurations

### tmux
- Custom prefix: `Ctrl-s`
- Vim-style pane navigation: `h/j/k/l`
- Timezone toggle: `Ctrl-s + t`
- Reload config: `Ctrl-s + r`

### aerospace (tiling window manager)
- `alt-h/j/k/l` - Focus windows
- `alt-1-5` - Switch workspaces
- `alt-e` - Toggle tiles layout (side by side)
- `alt-comma` - Toggle accordion layout (stacked fullscreen)
- `alt-f` - Fullscreen toggle
- `alt-shift-h/j/k/l` - Move windows

### ghostty
- Zed-inspired dark theme
- 70% transparent background with blur

### sketchybar
- Workspace indicators with aerospace integration
- Battery, CPU, clock widgets

## Manual Installation

1. Install dependencies:
   ```bash
   brew install tmux stow
   brew tap FelixKratz/formulae
   brew install sketchybar borders
   brew install --cask nikitabobko/tap/aerospace ghostty
   ```

2. Clone and stow:
   ```bash
   git clone https://github.com/Varuas37/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   stow tmux aerospace sketchybar ghostty
   ```

3. Start services:
   ```bash
   brew services start sketchybar
   open -a AeroSpace
   ```

## Requirements

- macOS
- Homebrew
- GNU stow
