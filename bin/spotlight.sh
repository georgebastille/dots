#!/bin/bash
mdutil -a -i off
launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
mdutil -a -i on
