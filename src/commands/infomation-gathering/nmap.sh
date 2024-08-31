#!/bin/bash

# Prompt the user for the IP address
read -p "Enter the target IP address: " ip

# Prompt the user for the port number
read -p "Enter the port number (or leave blank for all ports): " port

# Prompt the user for the output file name
read -p "Enter the output file name: " output_file

# If the port is empty, run a full scan; otherwise, scan the specified port
if [ -z "$port" ]; then
  echo "Running nmap scan on $ip for all ports..."
  nmap -A -v "$ip" -oN "$output_file"
else
  echo "Running nmap scan on $ip for port $port..."
  nmap -A -v -p "$port" "$ip" -oN "$output_file"
fi

echo "Scan completed. Results are saved in $output_file"
