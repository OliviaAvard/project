#!/bin/bash

# Define URL
URL="https://www.coingecko.com/en/coins/pi-network"

# Fetch HTML content
HTML=$(curl -s "$URL")

# Extract Pi Network price using regex
#PRICE=$(echo "$HTML" | grep -oP '(?<=<span class="no-wrap">\$)[0-9,]+(\.[0-9]+)?')
#PRICE=$(echo "$HTML" | grep -oP '(?<=<div class="coin-value">.*?<span class="no-wrap">\$)[0-9,]+\.[0-9]+')

# Define the API URL for Pi Network price in USD
API_URL="https://api.coingecko.com/api/v3/simple/price?ids=pi-network&vs_currencies=usd"

# Fetch the data from the CoinGecko API and extract the price using jq
PRICE=$(curl -s "$API_URL" | jq -r '.["pi-network"].usd')


# Get current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Save to CSV file
echo "$TIMESTAMP, $PRICE" >> pi_network_prices.csv

