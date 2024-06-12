#!/bin/bash

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

# Вывод информации
echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE UTC $UTC_OFFSET"
echo "USER = $USER"
echo "OS = $OS"
echo "DATE = $DATE"
echo "UPTIME = $UPTIME"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = $IP"
echo "MASK = $MASK"
echo "GATEWAY = $GATEWAY"
echo "RAM_TOTAL = $RAM_TOTAL GB"
echo "RAM_USED = $RAM_USED GB"
echo "RAM_FREE = $RAM_FREE GB"
echo "SPACE_ROOT = $SPACE_ROOT MB"
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"
