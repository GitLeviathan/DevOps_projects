#!/bin/bash

source messages.sh

config_file="config.cfg"

column1_b_default=6
column1_f_default=1
column2_b_default=2
column2_f_default=4

# Функция для проверки допустимости значения
check_valid_value() {
    local value="$1"
    [[ "$value" =~ ^[1-6]$ ]]
}

# Чтение конфигурационного файла (если существует)
if [ -f "$config_file" ]; then
    source "$config_file"

    column1_b=$(check_valid_value "$column1_background" && echo "$column1_background" || echo "$column1_b_default")
    column1_f=$(check_valid_value "$column1_font_color" && echo "$column1_font_color" || echo "$column1_f_default")
    column2_b=$(check_valid_value "$column2_background" && echo "$column2_background" || echo "$column2_b_default")
    column2_f=$(check_valid_value "$column2_font_color" && echo "$column2_font_color" || echo "$column2_f_default")
else
    echo -e "${ERROR}${ERROR_MESSAGE_FILE}${config_file}${RESET}"
    exit 1
fi

# Проверка совпадения цветов шрифта и фона
if [[ "$column1_b" == "$column1_f" || "$column2_b" == "$column2_f" ]]; then
    echo -e "${ERROR}${ERROR_MESSAGE_COLOR}${RESET}"
    exit 1
fi
