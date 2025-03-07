#!/bin/bash

# Define URL
URL="https://fr.finance.yahoo.com/quote/MC.PA/"

# Fetch HTML content
HTML=$(curl -s "$URL")

# Extract LVMH stock price using regex
PRICE=$(echo "$HTML" | grep -oP '(?<="regularMarketPrice":{"raw":)[0-9]+\.[0-9]+')

# Get current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Save to CSV file
echo "$TIMESTAMP, $PRICE" >> lvmh_prices.csv

