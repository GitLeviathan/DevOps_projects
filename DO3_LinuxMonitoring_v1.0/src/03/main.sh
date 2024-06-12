#!/bin/bash

# Импорт сообщений об ошибках, цветов и функций для проверки чисел
source messages.sh
source colors.sh
source digits.sh

# Проверка наличия 4 параметров
if [ $# -ne 4 ]; then
    echo -e "${ERROR}${ERROR_MESSAGE}${RESET}"
    exit 1
fi

# Проверка параметров на числа в диапазоне от 1 до 6
for param in "$@"; do
    is_digits "$param"
    if [ $? -eq 0 ] ; then
        echo -e "${ERROR}${ERROR_MESSAGE_DIGIT}${RESET}"
        exit 1
    fi
    if ! [[ "$param" =~ ^[1-6]$ ]]; then
        echo -e "${ERROR}${ERROR_MESSAGE_RANGE}${RESET}"
        exit 1
    fi
done

# Проверка совпадения цветов шрифта и фона
if [[ "$1" == "$2" || "$3" == "$4" ]]; then
    echo -e "${ERROR}${ERROR_MESSAGE_COLOR}${RESET}"
    exit 1
fi

# Импорт информации из info.sh
. ./info.sh
