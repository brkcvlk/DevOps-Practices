#!/bin/bash

# Usage: bash nginx-log-analyser.sh <log-file>

if [ -z "$1" ]; then
  echo "Usage: bash nginx-log-analyser.sh <log-file>"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: '$1' not found."
  exit 1
fi

LOG="$1"

echo ""
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""
echo "Top 5 user agents:"
awk -F'"' '{print $6}' "$LOG" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'