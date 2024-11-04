#!/bin/bash
# Generated by Microsoft Copilot
# Directory containing .ts files
DIR="/media/plex/dvr"

# Find and convert .ts files in all subdirectories
find "$DIR" -type f -name "*.ts" -print0 | while IFS= read -r -d '' file; do
  ffmpeg -i "$file" -c copy "${file%.ts}.mp4" && rm "$file"
done
