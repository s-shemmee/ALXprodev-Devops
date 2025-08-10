#!/bin/bash
# Task 3: Summarize Pokémon Data

DATA_DIR="pokemon_data"
CSV_FILE="pokemon_report.csv"

if [ ! -d "$DATA_DIR" ]; then
    echo "Directory $DATA_DIR not found! Run the batch processing script first."
    exit 1
fi

echo "Name,Height (m),Weight (kg)" > "$CSV_FILE"

for file in "$DATA_DIR"/*.json; do
    name=$(jq -r '.name' "$file" | sed 's/.*/\u&/')
    height=$(jq -r '.height' "$file")
    weight=$(jq -r '.weight' "$file")
    height_m=$(awk "BEGIN {printf \"%.2f\", $height/10}")
    weight_kg=$(awk "BEGIN {printf \"%.2f\", $weight/10}")
    echo "$name,$height_m,$weight_kg" >> "$CSV_FILE"
done

awk -F',' 'NR>1 {h+=$2; w+=$3; n++} END {if(n>0){printf "\nAverage Height: %.2f m\nAverage Weight: %.2f kg\n", h/n, w/n}}' "$CSV_FILE"
echo "\nCSV Report generated at: $CSV_FILE"
