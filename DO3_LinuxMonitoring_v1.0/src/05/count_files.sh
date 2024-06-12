#!/bin/bash

dir_path="$1"

# Получение общего число файлов
total_files=$(find "$dir_path" -type f 2>/dev/null | wc -l)

echo -e "\033[95mTotal number of files\033[0m = $total_files"
