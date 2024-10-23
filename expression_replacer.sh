#!/usr/bin/env bash

command_exists() {
    type "$1" &> /dev/null ;
}

escape_special_chars() {
    local input="$1"
    printf '%s\n' "$input" | sed -e 's/[\/&]/\\&/g' -e 's/[\|$^*+?.(){}[]]/\\&/g'
}


if ! command_exists sed ; then
    echo "The 'sed' command is required but not installed. Please install 'sed' and try again."
    exit 1
fi

if [ "$#" -ne 3 ] ; then
        echo "Usage: $0 <directory> <search_expression> <replacement_expression>"
        exit 1
fi

dir_path="$1"
search_expr="$2"
replacement_expr="$3"

if [ ! -d "$dir_path" ]; then
    echo "The directory '$dir_path' does not exist."
    exit 1
fi

escaped_search_expr=$(escape_special_chars "$search_expr")
#escaped_replace_expr=$(escape_special_chars "$replace_expr")

echo "Escaped Search Expression: $escaped_search_expr"
echo "Escaped Replacement Expression: $escaped_replace_expr"

find "$dir_path" -type f -exec sed -i "s|$escaped_search_expr|$replacement_expr|g" {} +

echo "Replacement complete."
