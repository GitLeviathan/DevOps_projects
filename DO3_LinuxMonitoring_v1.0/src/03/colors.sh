#!/bin/bash

# Цвета для сообщений об ошибках
ERROR="\e[31m"   # Красный

# Сброс цвета
RESET="\e[0m"  

# Определение цветов
declare -A foreground_colors
declare -A background_colors

foreground_colors[1]="\033[97m"  # white
foreground_colors[2]="\033[91m"  # red
foreground_colors[3]="\033[92m"  # green
foreground_colors[4]="\033[94m"  # blue
foreground_colors[5]="\033[95m"  # purple
foreground_colors[6]="\033[30m"  # black

background_colors[1]="\033[107m"  # white
background_colors[2]="\033[101m"  # red
background_colors[3]="\033[102m"  # green
background_colors[4]="\033[104m"  # blue
background_colors[5]="\033[105m"  # purple
background_colors[6]="\033[40m"   # black

choose_color() {
    foreground_head="${foreground_colors[$2]}"
    background_head="${background_colors[$1]}"
    foreground_value="${foreground_colors[$4]}"
    background_value="${background_colors[$3]}"
}
