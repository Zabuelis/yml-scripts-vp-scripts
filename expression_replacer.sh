#!/usr/bin/env bash

command_exists() {
        type "$1" &> /dev/null ;
}


if ! command_exists sed ; then
        echo "The 'sed' command is required but not installed. Please install 'sed' and try again."
        exit 1
fi

if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <directory> <pattern_file>"
        exit 1
fi

dir_path="$1"
pattern_file="$2"

if [ ! -d "$dir_path" ]; then
        echo "The directory '$dir_path' does not exist."
        exit 1
fi

if [ ! -f "$pattern_file" ]; then
        echo "Pattern file does not exist"
        exit 1
fi

while IFS=, read -r search_expr replacement_expr; do
        if [[ -n "search_expr" && -n "$replacement_expr" ]]; then
                find "$dir_path" -type f -exec sed -i "s|$search_expr|$replacement_expr|g" {} +
        fi
done < "$pattern_file"

echo "Replacement complete."
