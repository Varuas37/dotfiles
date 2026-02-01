#!/bin/bash
# Machine-specific configuration for dotfiles

# Get hostname without domain
HOSTNAME=$(hostname -s)

# Default browser configuration per machine
case "$HOSTNAME" in
    "Shadows-Mac-mini"|"shadow")
        export DEFAULT_BROWSER="Zen"
        export DEFAULT_BROWSER_PATH="/Applications/Zen.app"
        export DEFAULT_BROWSER_APP_ID="app.zen-browser.zen"
        ;;
    *)
        # Default for other machines
        export DEFAULT_BROWSER="Firefox Firefox"
        export DEFAULT_BROWSER_PATH="/Applications/Firefox Firefox.app"
        export DEFAULT_BROWSER_APP_ID="org.mozilla.firefox"
        ;;
esac
