#!/bin/bash

file="$1"
mime=$(file --mime-type -Lb "$file")

# image preview
if [[ $mime == image/* ]]; then
  if command -v viu &> /dev/null; then
    viu -w "$2" -h "$3" "$file"
    exit 1  # prevents fallback
  elif command -v chafa &> /dev/null; then
    chafa "$file"
    exit 1
  else
    echo "[no image preview tool installed]"
    exit 0
  fi
else
  bat --color=always --style=plain "$file"
  exit 0
fi

