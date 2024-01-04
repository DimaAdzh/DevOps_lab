#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Використання: $0 <шлях до директорії> <текст для пошуку>"
  exit 1
fi

directory="$1"
search_text="$2"

if [ ! -d "$directory" ]; then
  echo "Директорія не існує: $directory"
  exit 1
fi

grep -rl "$search_text" "$directory"