#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

print_error() {
    echo -e "${RED}Error: $1${NC}" >&2
}

validate_directory() {
    if [ ! -d "$1" ]; then
        print_error "No such directory: $1"
        exit 1
    fi
}

validate_integer() {
    if ! [[ $1 =~ ^[0-9]+$ ]]; then
        print_error "$1 is not a valid integer."
        exit 1
    fi
}

validate_alphabet() {
    if [[ ! $1 =~ ^[a-zA-Z]{1,7}$ ]]; then
        print_error "$1 is not a valid alphabet (up to 7 letters)."
        exit 1
    fi
}

validate_filename() {
    if [[ ! $1 =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
        print_error "$1 is not a valid filename (up to 7 letters for name, up to 3 letters for extension)."
        exit 1
    fi
}

validate_filesize() {
    if [[ ! $1 =~ ^[0-9]+kb$ ]]; then
        print_error "$1 is not a valid filesize (should be in the format 'numberkb', e.g., '3kb')."
        exit 1
    fi

    filesize="${1%kb}"
    if [[ $filesize -gt 100 || $filesize -lt 0 ]]; then
        print_error "Invalid filesize: Should be between 0kb and 100kb."
        exit 1
    fi
}