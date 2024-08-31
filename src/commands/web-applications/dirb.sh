#!/bin/bash

# Prompt the user for the target URL
read -p "Enter the target URL (e.g., http://example.com): " url

# Prompt the user for the wordlist file
read -p "Enter the path to the wordlist file: " wordlist

# Prompt the user for the output file name
read -p "Enter the output file name (e.g., dirb_output.txt): " output_file

# Run dirb with the provided inputs
echo "Running dirb scan on $url with wordlist $wordlist..."
dirb "$url" "$wordlist" -o "$output_file"

echo "Scan completed. Results are saved in $output_file"
