#!/bin/bash
# Machine-specific configuration for dotfiles

# Get hostname without domain
HOSTNAME=$(hostname -s)

# Default browser configuration per machine
case "$HOSTNAME" in
    "Shadows-Mac-mini"|"shadow")
        export DEFAULT_BROWSER="Zen Browser"
        export DEFAULT_BROWSER_PATH="/Applications/Zen Browser.app"
        export DEFAULT_BROWSER_APP_ID="org.zen-browser.app"
        ;;
    *)
        # Default for other machines
        export DEFAULT_BROWSER="Firefox Firefox"
        export DEFAULT_BROWSER_PATH="/Applications/Firefox Firefox.app"
        export DEFAULT_BROWSER_APP_ID="org.mozilla.firefox"
        ;;
esac
