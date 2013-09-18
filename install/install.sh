#!/bin/bash
# Copyright 2013 Christopher Simpkins
# MIT License

TARGET_DIR="path/to/the/install/directory"
INSTALL_FILE="your-file.txt"
SUCCESS_MSG="Sexy message for user goes here!"

if [ -d "$TARGET_DIR" ]; then
  cp "$INSTALL_FILE" "$TARGET_DIR"
  echo "$SUCCESS_MSG"
else
  echo "Creating the install directory path..."
  mkdir -p "$TARGET_DIR"
  echo "Done. Installing '$INSTALL_FILE'..."
  cp "$INSTALL_FILE" "$TARGET_DIR"
  echo "$SUCCESS_MSG"
fi
exit 0