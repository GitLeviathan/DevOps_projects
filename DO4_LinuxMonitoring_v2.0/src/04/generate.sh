#!/bin/bash

generate_random_ip() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

#Описание кодов ответа:
#200: Успешный запрос.
#201: Создан новый ресурс.
#400: Некорректный запрос от клиента.
#401: Требуется аутентификация.
#403: Доступ запрещен.
#404: Ресурс не найден.
#500: Внутренняя ошибка сервера.
#501: Не реализовано сервером.
#502: Плохой шлюз.
#503: Сервис недоступен.

generate_random_status() {
    statuses=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
    echo "${statuses[$((RANDOM % ${#statuses[@]}))]}"
}

generate_random_method() {
    methods=("GET" "POST" "PUT" "PATCH" "DELETE")
    echo "${methods[$((RANDOM % ${#methods[@]}))]}"
}

generate_random_time() {
    hour=$((RANDOM % 24))
    minute=$((RANDOM % 60))
    second=$((RANDOM % 60))
    printf "%02d:%02d:%02d +0000\n" "$hour" "$minute" "$second"
}

generate_random_url() {
    urls=("https://example.com/page1" "https://example.com/page2" "https://example.com/page3")
    echo "${urls[$((RANDOM % ${#urls[@]}))]}"
}

generate_random_user_agent() {
    agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
    echo "${agents[$((RANDOM % ${#agents[@]}))]}"
}
