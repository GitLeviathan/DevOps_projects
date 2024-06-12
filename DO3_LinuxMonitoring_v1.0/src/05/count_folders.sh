#!/bin/bash

dir_path="$1"

# Получение общего числа папок, включая вложенные
total_folders=$(find "$dir_path" -mindepth 1 -type d 2>/dev/null | wc -l)

echo -e "\033[95mTotal number of folders (including all nested ones)\033[0m = $total_folders"
