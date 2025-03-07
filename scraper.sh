#!/bin/bash

# Define URL
URL="https://www.coingecko.com/en/coins/pi-network"

# Fetch HTML content
HTML=$(curl -s "$URL")

# Extract Pi Network price using regex
#PRICE=$(echo "$HTML" | grep -oP '(?<=<span class="no-wrap">\$)[0-9,]+(\.[0-9]+)?')
PRICE=$(echo "$HTML" | grep -oP '(?<=<div class="coin-value">.*?<span class="no-wrap">\$)[0-9,]+\.[0-9]+')

# Get current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Save to CSV file
echo "$TIMESTAMP, $PRICE" >> pi_network_prices.csv

