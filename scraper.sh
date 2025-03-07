#!/bin/bash
#!/bin/bash

# API URL for Bitcoin price in USD
URL="https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd"

# Fetch the price and extract it using `jq`
PRICE=$(curl -s "$URL" | jq '.bitcoin.usd')

# Display the result
echo "Bitcoin Price: $PRICE USD" >> prices.log


