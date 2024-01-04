#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Використання: $0 <шлях до директорії> <розширення файлів>"
    exit 1
fi

path="$1"
extension="$2"

if [ ! -d "$path" ]; then
    echo "Директорія '$path' не існує."
    exit 1
fi

count=$(find "$path" -type f -name "*.$extension" | wc -l)

echo "Кількість файлів з розширенням .$extension в директорії '$path': $count"