#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Використання: $0 шлях_до_директорії розширення_файлів"
  exit 1
fi

directory="$1"
extension="$2"

if [ ! -d "$directory" ]; then
  echo "Директорія '$directory' не існує."
  exit 1
fi

matching_files=$(find "$directory" -type f -name "*.$extension")

if [ -n "$matching_files" ]; then
  echo "Файли з розширенням .$extension:"
  echo "$matching_files"
else
  echo "Файлів з розширенням .$extension в директорії '$directory' не знайдено."
fi