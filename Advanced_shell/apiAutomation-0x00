#!/bin/bash
# Task 0: API Request Automation for Pikachu

API_URL="https://pokeapi.co/api/v2/pokemon/pikachu"
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

curl -s -f "$API_URL" -o "$OUTPUT_FILE"
if [ $? -ne 0 ]; then
    echo "Failed to fetch data for Pikachu from $API_URL at $(date)" >> "$ERROR_FILE"
    exit 1
fi
