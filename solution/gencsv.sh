#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

start_index=$1
end_index=$2

if ! [[ "$start_index" =~ ^[0-9]+$ && "$end_index" =~ ^[0-9]+$ ]]; then
    echo "Error: Arguments must be integers."
    exit 1
fi

if [ "$start_index" -ge "$end_index" ]; then
    echo "Error: Start index must be less than end index."
    exit 1
fi

output_file="inputFile"

for ((i = start_index; i <= end_index; i++)); do
    rand_num=$((RANDOM % 1000))  # Generate a random number between 0 and 999
    echo "$i, $rand_num" >> "$output_file"
done

echo "File $output_file generated with entries from $start_index to $end_index."

