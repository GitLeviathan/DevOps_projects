#!/bin/bash
log_dir="nginx_logs"

option=$1

process_log_file() {
    local log_file="$1"
    echo -e "\e[1;33mФайл: $log_file\e[0m"
    case $option in
        1)
            # Все записи, отсортированные по коду ответа
            awk '{print $0}' "$log_file" | sort -n -k9
            ;;
        2)
            # Все уникальные IP, встречающиеся в записях
            awk '{print $1}' "$log_file" | sort -u
            ;;
        3)
            # Все запросы с ошибками (код ответа - 4хх или 5хх)
            awk '$9 ~ /^[45]/ {print $0}' "$log_file"
            ;;
        4)
            # Все уникальные IP, которые встречаются среди ошибочных запросов
            awk '$9 ~ /^[45]/ {print $1}' "$log_file" | sort -u
            ;;
        *)
            echo "Некорректный параметр. Используйте 1, 2, 3 или 4."
            ;;
    esac
}

for log_file in "$log_dir"/*.log; do
    process_log_file "$log_file"
done