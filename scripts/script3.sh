#!/bin/bash

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -p|--path)
            path="$2"  
            shift       
            shift      
            ;;
        -s|--string)
            search_string="$2"  
            shift             
            shift             
            ;;
        *)
            echo "Невідомий ключ: $1"
            exit 1
            ;;
    esac
done


if [ -z "$path" ] || [ -z "$search_string" ]; then
    echo "Не вказано всі обов'язкові аргументи."
    exit 1
fi

find "$path" -type f -exec grep -l "$search_string" {} \;