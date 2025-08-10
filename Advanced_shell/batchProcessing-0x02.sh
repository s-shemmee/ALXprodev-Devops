#!/bin/bash
# Task 2: Batch Pokémon Data Retrieval

POKEMON_LIST=(bulbasaur ivysaur venusaur charmander charmeleon)
DATA_DIR="pokemon_data"
mkdir -p "$DATA_DIR"

for name in "${POKEMON_LIST[@]}"; do
    echo "Fetching data for $name..."
    API_URL="https://pokeapi.co/api/v2/pokemon/$name"
    OUT_FILE="$DATA_DIR/${name}.json"
    if curl -s -f "$API_URL" -o "$OUT_FILE"; then
        echo "Saved data to $OUT_FILE ✅"
    else
        echo "Failed to fetch data for $name from $API_URL at $(date)" >> errors.txt
    fi
    sleep 2 # Delay to handle rate limiting

done
