#!/bin/bash
# Task 5: Parallel Data Fetching

POKEMON_LIST=(bulbasaur ivysaur venusaur charmander charmeleon)
DATA_DIR="pokemon_data"
mkdir -p "$DATA_DIR"

pids=()
for name in "${POKEMON_LIST[@]}"; do
    echo "Fetching data for $name..."
    API_URL="https://pokeapi.co/api/v2/pokemon/$name"
    OUT_FILE="$DATA_DIR/${name}.json"
    (
        if curl -s -f "$API_URL" -o "$OUT_FILE"; then
            echo "Saved data to $OUT_FILE ✅"
        else
            echo "Failed to fetch data for $name from $API_URL at $(date)" >> errors.txt
        fi
    ) &
    pids+=("$!")
done

# Wait for all background jobs to finish
for pid in "${pids[@]}"; do
    wait $pid
done

echo "All parallel fetches complete."
