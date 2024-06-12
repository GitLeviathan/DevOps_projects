#!/bin/bash

# Проверка наличия аргументов
if [ $# -ne 0 ]; then
    echo "ERROR!!! Некорректный ввод"
    exit 1
fi

# Импорт информации из info.sh
source ./info.sh

# Функция для сохранения информации в файл
save_to_file() {
    local filename="$(date +'%d_%m_%y_%H_%M_%S').status"
    ./info.sh > "$filename"
    echo "Данные сохранены в файл: $filename"
}

read -p "Хотите сохранить данные в файл? (Y/N): " response
if [[ "$response" =~ ^[Yy]$ ]]; then
    save_to_file
else
    echo "Информация не была сохранена."
fi
