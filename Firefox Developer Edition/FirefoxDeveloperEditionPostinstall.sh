#!/bin/bash

FIREFOX_DEVELOPER_PATH="/Applications/Firefox Developer Edition.app/"

if [[ ! -d "${FIREFOX_DEVELOPER_PATH}" ]]; then
    echo "File not found: ${FIREFOX_DEVELOPER_PATH}"
    exit 1
fi

echo "Fixing Firefox Developer Edition permissions..."

CURRENT_USER="$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')"

chown -R $CURRENT_USER:staff "$FIREFOX_DEVELOPER_PATH"

exit 0
