#!/bin/bash

CHROME_CANARY_PATH="/Applications/Google Chrome Canary.app/"

if [[ ! -d "${CHROME_CANARY_PATH}" ]]; then
    echo "File not found: ${CHROME_CANARY_PATH}"
    exit 1
fi

echo "Fixing Chrome Canary permissions..."

CURRENT_USER="$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')"

chown -R $CURRENT_USER:staff "$CHROME_CANARY_PATH"

exit 0
