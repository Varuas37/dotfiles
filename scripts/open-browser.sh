#!/bin/bash
# Script to open the configured default browser

# Source the config
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/../config.sh"

# Open the browser
open -a "$DEFAULT_BROWSER_PATH"
