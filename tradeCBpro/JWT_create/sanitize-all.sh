#!/bin/bash

# # Remove possible sensitive info and stale main.py
rm -f main.py
rm -f JWT_create/main.py
rm -f CB-outout.json
rm -f wCB-KEY1.txt
rm -f wcB-KEY2.txt
rm -f wCB_CDP-KEY1.txt
rm -f wCB_CDP-KEY2.txt
rm -f .env
touch wCB-KEY1.txt
touch wcB-KEY2.txt
touch wCB_CDP-KEY1.txt
touch wCB_CDP-KEY2.txt
