#!/bin/bash

source validation.sh

if [ "$#" -ne 6 ]; then
    print_error "Incorrect number of parameters."
    echo "Usage: $0 [PATH] [NUMBER OF DIRECTORIES] [LATER LIST] [NUMBER OF FILES IN DIRECTORY] [LATER LIST] [FILE SIZE]"
    exit 1
fi

validate_directory "$1"
validate_integer "$2"
validate_alphabet "$3"
validate_integer "$4"
validate_filename "$5"
validate_filesize "$6"

./generate_folders_and_files.sh "$1" "$2" "$3" "$4" "$5" "$6"

