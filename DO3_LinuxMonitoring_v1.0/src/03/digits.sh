#!/bin/bash

# Функция для проверки параметра
is_digits() {
    if [[ $1 =~ ^[+,-]?[0-9]+(\.[0-9]+)?$ ]]; then 
        return 1
    fi
    return 0
}
