#!/bin/bash

# Prompt the user for the target URL
read -p "Enter the target URL (e.g., http://example.com): " url

# Prompt the user for the wordlist file
read -p "Enter the path to the wordlist file: " wordlist

# Prompt the user for the number of threads
read -p "Enter the number of threads (default is 10): " threads

# Prompt the user for the output file name
read -p "Enter the output file name (e.g., dirbuster_output.xml): " output_file

# Set default threads if none provided
threads=${threads:-10}

# Run DirBuster with the provided inputs
echo "Running DirBuster scan on $url with wordlist $wordlist..."
java -jar /path/to/DirBuster.jar -u "$url" -l "$wordlist" -t "$threads" -r "$output_file" -H

echo "Scan completed. Results are saved in $output_file"

