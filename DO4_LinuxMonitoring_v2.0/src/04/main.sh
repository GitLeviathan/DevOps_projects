#!/bin/sh
chmod +x generate.sh

. ./generate.sh

if [ -n "$1" ]; then
    echo -e "\e[1;31mERROR!!! The script should run without parameters!\e[0m"
    exit 1
fi

# Параметры
log_dir="nginx_logs"
mkdir -p "$log_dir"

for i in {1..5}; do
    log_file="$log_dir/access_log_$i.log"
    touch "$log_file"

    # Генерация случайного числа записей от 100 до 1000
    num_records=$((RANDOM % 901 + 100))
    current_date=$(date -d "$i days ago" +"%d/%b/%Y")

    for ((j = 0; j < num_records; j++)); do
        ip=$(generate_random_ip)
        status=$(generate_random_status)
        method=$(generate_random_method)
        time=$(generate_random_time)
        date=$current_date:$time
        url=$(generate_random_url)
        agent=$(generate_random_user_agent)

        log_entry="$ip - - [$date] \"$method $url HTTP/1.1\" $status $((RANDOM % 1024)) \"$url\" \"$agent\""
        echo "$log_entry" >> "$log_file"
    done
    sort -k 4 -o "$log_file" "$log_file"
    echo "$log_file сгенерирован ..."
done
echo "Все файлы сгенерированы"

log_format='$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent"'
#Что означает каждое поле записи:
#$remote_addr — 192.168.33.1 — IP-адрес клиента, выполняющего запрос.
#$remote_user — - — Пользователь, $remote_user аутентификацию по HTTP. Если имя пользователя не задано, в этом поле отображается - .
#[$time_local] — [15/Oct/2019:19:41:46 +0000] — Время на локальном сервере.
#"$request" — "GET / HTTP/1.1" — тип запроса, путь и протокол.
#$status — 200 — Код ответа сервера.
#$body_bytes_sent — 396 — Размер ответа сервера в байтах.
#"$http_referer" — "-" — URL перехода.
#"$http_user_agent" — Mozilla/5.0 ... — Пользовательский агент клиента (веб-браузер).