#!/bin/bash

dir_path="$1"

# Получение топ 10 файлов по размеру (включая поддиректории)
top_files=$(find "$dir_path" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10)

echo -e "\033[95mTOP 10 files of maximum size arranged in descending order (path, size, and type):\033[0m"

# Проверка, является ли переменная top_executables пустой
if [ -z "$top_files" ]; then
    echo -e "\033[33mWARN: No files found in the specified directory.\033[0m"
    exit 1
fi

count=1
while IFS= read -r file_info; do
    # Разбиение информации на поля: размер, путь
    read -r size path <<< "$file_info"
    # Получение расширения файла (тип)
    file_extension="${path##*.}"
    # Вывод информации в требуемом формате
    echo -e "\033[95m$count\033[0m - $path, $size, $file_extension"
    ((count++))
done <<< "$top_files"
