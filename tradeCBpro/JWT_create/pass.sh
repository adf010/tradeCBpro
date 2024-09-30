#!/bin/bash

echo "export PRIVATE_KEY='$PRIVATE_KEYA'" >> .env
echo "export PRIVATE_KEY2='$PRIVATE_KEY2A'" >> .env

#PRIVATE_KEY="$PRIVATE_KEYA"
#PRIVATE_KEY2="$PRIVATE_KEY2A"
#export "$PRIVATE_KEY" >> .env
#export "$PRIVATE_KEY2" >> .env

source .env

#echo "$PRIVATE_KEY";
#echo
#echo
#echo "$PRIVATE_KEY2";
