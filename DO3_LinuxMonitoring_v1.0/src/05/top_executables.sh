#!/bin/bash

# Путь к директории, полученный из параметра
dir_path="$1"

# Получение топ 10 исполняемых файлов по размеру
top_executables=$(find "$dir_path" -type f -executable -exec du -h {} + 2>/dev/null | sort -rh | head -n 10)

# Вывод заголовка
echo -e "\033[95mTOP 10 executable files of maximum size arranged in descending order (path, size and MD5 hash of file):\033[0m"

# Проверка, является ли переменная top_executables пустой
if [ -z "$top_executables" ]; then
    echo -e "\033[33mWARN: No executable files found in the specified directory.\033[0m"
    exit 1
fi

# Счетчик
count=1
# Вывод информации о файлах
while IFS= read -r executable_info; do
    # Разбиение информации на поля: размер, путь
    read -r size path <<< "$executable_info"
    # Вычисление хеш-суммы MD5 файла
    md5_hash=$(md5sum "$path" | awk '{print $1}')
    # Вывод информации в требуемом формате
    echo -e "\033[95m$count\033[0m - $path, $size, $md5_hash"
    ((count++))
done <<< "$top_executables"
