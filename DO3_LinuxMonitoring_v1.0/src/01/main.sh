#!/bin/bash
# Импорт функции для проверки параметра
source digits.sh

if [ $# -ne 1 ]; then
    echo "ERROR!!! Incorrect input"
    exit 1
fi

# Проверка параметра
is_digits "$1"

if [ $? -eq 0 ]; then
    echo "$1"
else
    echo "ERROR!!! Parametr is a number"
fi
