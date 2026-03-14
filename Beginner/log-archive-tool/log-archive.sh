#!/bin/bash

# Usage: bash log-archive.sh <log-directory>

if [ -z "$1" ]; then
  echo "Error: Log directory not provided."
  echo "Usage: bash log-archive.sh <log-directory>"
  exit 1
fi

LOG_DIR="$1"

if [ ! -d "$LOG_DIR" ]; then
  echo "Error: '$LOG_DIR' isnt a valid directory."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ARCHIVE_DIR="$SCRIPT_DIR/logs_archive"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"

mkdir -p "$ARCHIVE_DIR"

tar -czf "$ARCHIVE_PATH" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")" 2>/dev/null

if [ $? -eq 0 ]; then
  SIZE=$(du -sh "$ARCHIVE_PATH" | cut -f1)
  echo "Archive created: $ARCHIVE_PATH ($SIZE)"
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Archived '$LOG_DIR' -> '$ARCHIVE_NAME' ($SIZE)" >> "$LOG_FILE"
  echo "Logged to: $LOG_FILE"
else
  echo "Error: Failed to create archive."
  exit 1
fi