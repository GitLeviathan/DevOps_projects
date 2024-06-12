#!/bin/bash

# Сохраняем текущее время в переменной time
time=$(date +%s)

# Проверка наличия параметра
if [ $# -ne 1 ]; then
    echo -e "\e[31mError: Usage: $0 <directory_path>\033[0m"
    exit 1
fi

# Путь к директории, полученный из параметра
dir_path="$1"

# Проверка существования директории
if [ ! -d "$dir_path" ]; then
    echo -e "\e[31mError: Directory '$dir_path' does not exist.\033[0m"
    exit 1
fi

# Проверка, что директория оканчивается на '/'
if [[ ${dir_path: -1} != '/' ]]; then
    echo -e "\033[33mWARN: The directory should end with \"/\",\n\t  but don't worry I'll take care of you.\033[0m"
    # Добавление '/' в конец директории
    dir_path="${dir_path}/"
fi

# Вызов других скриптов
./count_folders.sh "$dir_path"
./top_folders.sh "$dir_path"
./count_files.sh "$dir_path"
./file_stats.sh "$dir_path"
./top_files.sh "$dir_path"
./top_executables.sh "$dir_path"

# Вычисляем время выполнения и выводим его
echo -e "\033[36mScript execution time (in seconds) = $(($(date +%s)-$time))\033[0m"
