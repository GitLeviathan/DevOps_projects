#!/bin/bash

dir_path="$1"

# Получение топ 5 папок по размеру
top_folders=$(du -h "$dir_path" 2>/dev/null | sort -rh | tail -n +2 | head -n 5 | awk '{printf "%s, %s\n", $2, $1}')

# Вывод топ 5 папок
echo -e "\033[95mTOP 5 folders of maximum size arranged in descending order (path and size):\033[0m"

# Проверка, является ли переменная top_executables пустой
if [ -z "$top_folders" ]; then
    echo -e "\033[33mWARN: No folders found in the specified directory.\033[0m"
    exit 1
fi

count=1
while IFS= read -r folder; do
    echo -e "\033[95m$count\033[0m - $folder"
    ((count++))
done <<< "$top_folders"
