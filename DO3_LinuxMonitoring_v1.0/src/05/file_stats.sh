#!/bin/bash

dir_path="$1"

# Подсчет числа файлов с различными расширениями
conf_files=$(find "$dir_path" -type f -name "*.conf" 2>/dev/null | wc -l)
text_files=$(find "$dir_path" -type f -name "*.txt" 2>/dev/null | wc -l)
executable_files=$(find "$dir_path" -type f -executable 2>/dev/null | wc -l )
log_files=$(find "$dir_path" -type f -name "*.log" 2>/dev/null | wc -l)
archive_files=$(find "$dir_path" -type f -name "*.zip" -o -name "*.tar" -o -name "*.gz" -o -name "*.rar" 2>/dev/null | wc -l)
symbolic_links=$(find "$dir_path" -type l 2>/dev/null | wc -l )

# Вывод результатов
echo -e "\033[95mNumber of:\033[0m"
echo -e "\033[95mConfiguration files (with the .conf extension)\033[0m = $conf_files"
echo -e "\033[95mText files\033[0m = $text_files"
echo -e "\033[95mExecutable files\033[0m = $executable_files"
echo -e "\033[95mLog files (with the extension .log)\033[0m = $log_files"
echo -e "\033[95mArchive files\033[0m = $archive_files"
echo -e "\033[95mSymbolic links\033[0m = $symbolic_links"
