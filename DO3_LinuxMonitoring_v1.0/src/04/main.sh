#!/bin/bash

source messages.sh
source colors.sh

# Проверка наличия параметров
if [ $# -ne 0 ]; then
    echo -e "${ERROR}${ERROR_MESSAGE}${RESET}"
    exit 1
fi

. ./info.sh

echo "Column 1 background = $(get_color_name "$column1_b" "$column1_b_default") (${colors[$column1_b]})"
echo "Column 1 font color = $(get_color_name "$column1_f" "$column1_f_default") (${colors[$column1_f]})"
echo "Column 2 background = $(get_color_name "$column2_b" "$column2_b_default") (${colors[$column2_b]})"
echo "Column 2 font color = $(get_color_name "$column2_f" "$column2_f_default") (${colors[$column2_f]})"
