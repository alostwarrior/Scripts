#!/bin/bash

# Check if ffuf is installed
if ! command -v ffuf &>/dev/null; then
    echo "Error: ffuf is not installed. Please install ffuf before running this script."
    exit 1
fi

function directory_fuzzing() {
    local target_url=$1
    local directory_wordlist=$2

    echo "Starting directory fuzzing on $target_url"

    ffuf -w "$directory_wordlist" -u "$target_url/FUZZ" -t 50
}

function parameter_fuzzing() {
    local target_url=$1
    local fuzz_wordlist=$2

    echo "Starting parameter fuzzing on $target_url"

    ffuf -w "$fuzz_wordlist" -u "$target_url?FUZZ=FUZZ" -t 50
}

function search_by_extension() {
    local target_url=$1
    local extension=$2
    local extension_wordlist=$3

    echo "Searching for files with .$extension extension on $target_url"

    ffuf -w "$extension_wordlist" -u "$target_url/FUZZ.$extension" -t 50
}

function main_menu() {
    echo "Choose an option:"
    echo "1. Directory Fuzzing"
    echo "2. Parameter Fuzzing"
    echo "3. Search for specific file extension"
    echo "4. Search for all common file extensions"
    echo "5. Search for other file extension"
    echo "6. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter the target URL for directory fuzzing: " target_url
            read -p "Enter the wordlist file path for directory fuzzing: " directory_wordlist
            directory_fuzzing "$target_url" "$directory_wordlist"
            ;;
        2)
            read -p "Enter the target URL for parameter fuzzing: " target_url
            read -p "Enter the wordlist file path for parameter fuzzing: " fuzz_wordlist
            parameter_fuzzing "$target_url" "$fuzz_wordlist"
            ;;
        3)
            read -p "Enter the target URL for searching specific file extension: " target_url
            read -p "Enter the file extension (e.g., txt, php, xml, html, etc.): " extension
            read -p "Enter the wordlist file path for searching specific file extension: " extension_wordlist
            search_by_extension "$target_url" "$extension" "$extension_wordlist"
            ;;
        4)
            read -p "Enter the target URL for searching all common file extensions: " target_url
            echo "Starting search for all common file extensions on $target_url"

            # List of common file extensions for fuzzing
            common_extensions=("txt" "php" "xml" "html" "pdf" "docx" "xlsx" "jpg" "png" "gif")

            for extension in "${common_extensions[@]}"; do
                read -p "Enter the wordlist file path for .$extension extension: " extension_wordlist
                search_by_extension "$target_url" "$extension" "$extension_wordlist"
            done
            ;;
        5)
            read -p "Enter the target URL for searching other file extension: " target_url
            read -p "Enter the file extension (e.g., js, css, etc.): " extension
            read -p "Enter the wordlist file path for searching other file extension: " extension_wordlist
            search_by_extension "$target_url" "$extension" "$extension_wordlist"
            ;;
        6)
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

while true; do
    main_menu
done