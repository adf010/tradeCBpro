#!/bin/bash

JWT=$(python3 main.py)

#curl -H "Authorization: Bearer $JWT" 'https://api.coinbase.com/api/v3/brokerage/key_permissions'
