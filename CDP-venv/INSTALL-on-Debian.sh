#!/bin/bash

##################################################################################
# This script installs and sets up a virtual environment in your home directory.
#
# 
read -p "Enter the directory name you would like for your base ENVIRONMENT : " test_venv
read -p "Enter the directory name you would like for the working environment : " my_env




cd
mkdir -p "$test_venv"
cd "$test_venv"
mkdir -p "$my_env"
echo "$PWD"
python3 -m venv "$my_env"
source "$my_env"/bin/activate
cd "$my_env"
git clone https://github.com/adf010/tradeCBpro.git
cp tradeCBpro/CDP-venv/requirements.txt .
pip install -r requirements.txt
pip freeze > requirements.txt 
cd tradeCBpro/tradeCBpro
./tradeCBpro.sh

