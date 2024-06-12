#!/bin/bash

source read_file.sh
. ./colors.sh

TIMEZONE=$(timedatectl show --property=Timezone --value)
UTC_OFFSET=$(date +"%z")
OS=$(cat /etc/os-release | grep -oP 'PRETTY_NAME="\K[^"]+')
DATE=$(date +"%d %B %Y %T")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I)
MASK=$(ifconfig | grep -m1 "netmask" | awk '{print $4}')
GATEWAY=$(ip route | awk '/default/ {print $3}')

RAM_INFO=$(free -b --si | awk '/^Mem:/ {print $2, $3, $4}')
IFS=' ' read -r -a RAM_INFO_ARRAY <<< "$RAM_INFO"
RAM_TOTAL=$(echo "scale=3; ${RAM_INFO_ARRAY[0]}/1024^3" | bc)
RAM_USED=$(echo "scale=3; ${RAM_INFO_ARRAY[1]}/1024^3" | bc)
RAM_FREE=$(echo "scale=3; ${RAM_INFO_ARRAY[2]}/1024^3" | bc)

DISK_INFO=$(df -m  | grep '/$' | awk '{print $2, $3, $4}') 
IFS=' ' read -r -a DISK_INFO_ARRAY <<< "$DISK_INFO"
SPACE_ROOT=${DISK_INFO_ARRAY[0]}
SPACE_ROOT_USED=${DISK_INFO_ARRAY[1]}
SPACE_ROOT_FREE=${DISK_INFO_ARRAY[2]}

# Ассоциативный массив с параметрами и их значениями
declare -A params
params["HOSTNAME"]=$HOSTNAME
params["TIMEZONE"]="$TIMEZONE UTC $UTC_OFFSET"
params["USER"]=$USER
params["OS"]=$OS
params["DATE"]=$DATE
params["UPTIME"]=$UPTIME
params["UPTIME_SEC"]=$UPTIME_SEC
params["IP"]=$IP
params["MASK"]=$MASK
params["GATEWAY"]=$GATEWAY
params["RAM_TOTAL"]="$RAM_TOTAL GB"
params["RAM_USED"]="$RAM_USED GB"
params["RAM_FREE"]="$RAM_FREE GB"
params["SPACE_ROOT"]="$SPACE_ROOT MB"
params["SPACE_ROOT_USED"]="$SPACE_ROOT_USED MB"
params["SPACE_ROOT_FREE"]="$SPACE_ROOT_FREE MB"

# Массив ключей из ассоциативного массива
param_keys=("HOSTNAME" "TIMEZONE" "USER" "OS" "DATE" "UPTIME" "UPTIME_SEC" 
"IP" "MASK" "GATEWAY" "RAM_TOTAL" "RAM_USED" "RAM_FREE" "SPACE_ROOT" "SPACE_ROOT_USED" "SPACE_ROOT_FREE")


choose_color $column1_b $column1_f $column2_b $column2_f
# Вывод информации с цветами для каждого параметра
for param in "${param_keys[@]}"; do
    echo -e "${background_head}${foreground_head}${param}${RESET} = ${foreground_value}${background_value}${params[$param]}${RESET}"
done
