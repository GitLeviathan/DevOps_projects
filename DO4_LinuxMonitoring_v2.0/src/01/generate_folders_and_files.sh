#!/bin/bash

path="$1"
directories_count="$2"
directories_letters="$3"
files_count="$4"
files_letters="$5"
file_name=${5%.*}
file_name_extention=${5#*.}
file_size=${6%*kb}

current_date=$(date +%d%m%y)

if [ "${path: -1}" != '/' ];
then
    path=${path}'/'
fi

current_date=$(date +"%d%m%y")

dir_last_char="${directories_letters: -1}"
file_last_char="${file_name: -1}"
while [ ${#directories_letters} -lt 3 ];
do
    directories_letters=${directories_letters}"$dir_last_char"
done
while [ ${#file_name} -lt 3 ];
do
    file_name=${file_name}"$file_last_char"
done
for ((i = 1; i <= directories_count; i++)); do
    directories_letters="${directories_letters}${dir_last_char}"
    directory_path="${path}${directories_letters}_${current_date}/"

    mkdir "$directory_path"
    echo "Path: $directory_path Date: $(date +"%Y-%m-%d %H:%M:%S")" >> "log.txt"

    for ((j = 1; j <= files_count; j++)); do
        file_name="${file_name}${file_last_char}"
        file_path="${directory_path}${file_name}_${current_date}.${file_name_extention}"

        # Создание файла указанного размера
        dd if=/dev/zero of="$file_path" bs=1024 count="$file_size" 2>/dev/null

        # Запись информации в лог
        echo "Path: $file_path, Date: $(date +"%Y-%m-%d %H:%M:%S"), Size: ${file_size}kb" >> "log.txt"

        free_space=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')
        threshold=1
        if [ "$free_space" -lt "$threshold" ]; then
            print_error "Not enough free space. Exiting."
            exit 1
        fi
    done
done

echo "Folders and files created successfully."
