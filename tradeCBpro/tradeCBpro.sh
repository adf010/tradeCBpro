#!/bin/bash
CURRVER=0.9-beta.8
cd "${0%/*}"
#
#
# This software is not associated with nor endorsed by Coinbase™ who shall be held harmless for use or misuse of this product.
# Other names of companies or products listed in this script are copyright of their respective owners and shall also be held harmless.
# This SOFTWARE PRODUCT is provided by THE PROVIDER "as is" and "with all faults." THE PROVIDER makes no representations or warranties of any kind
# concerning the safety, suitability, lack of viruses, inaccuracies, typographical errors, or other harmful components of this SOFTWARE PRODUCT.
# There are inherent dangers in the use of any software, and you are solely responsible for determining whether this SOFTWARE PRODUCT is compatible
# with your equipment and other software installed on your equipment. You are also solely responsible for the protection of your equipment and backup
# of your data, and THE PROVIDER will not be liable for any damages you may suffer in connection with using, modifying, or distributing this SOFTWARE PRODUCT.
##############################################################################
################      IMPORTANT!!!  READ THIS!!!        ######################
##############################################################################
###############################################################################
## Set key and secret.
######################
# To use instant sign-in put key and secret in the 2 files
# below by using option 8 on the menu.
COINBASE_KEY=`cat wCB-KEY1.txt`
COINBASE_SECRET=`cat wCB-KEY2.txt`
# ANOTHER, MORE SECURE METHOD TO ENTER API KEYS
if [[ "$COINBASE_KEY" == "" ]]; then
echo "Enter KEY at first prompt and SECRET at second prompt to put keys in memory."
echo "Keys will be 'forgotten' when you exit script. "
echo "Optionally you can Enter KEY/SECRET into respective files or use the menu "
echo "option which retains your keys until deleted or using the Remove Keys option."
echo "If you want to store keys then just press ENTER twice to start script."
read -p "Enter API key: " COINBASE_KEY
read -p "Enter API secret: " COINBASE_SECRET
fi
# Set CB-VERSION
CBVERSION="2017-12-01"
###### ENDPOINTS #####
ENDPOINT3="https://api.coinbase.com"
ENDPOINT=$ENDPOINT3
#############################################################################
# To run this script you will need an API KEY and SECRET on exchange.        #
# You will need to create two files in the same directory as this file       #
# or choose one of the other options (Keys in memory or use Enter/Remove     #
# Keys option from menu).                                                    #
#                                                                            #
# For Coinbase™ - Copy API KEY to wCB-KEY1.txt and SECRET to wCB-KEY2.txt    #
#--------------------------------------------------------------------------- #
#                                                                            #
# You will need to have curl, uuidgen, fold & jq available.                  #
# Please let me know if your system asks for anything else.                  #
#                                                                            #
# This script is licensed under the GNU General Public License v3.0          #
#                                                                            #
##############################################################################
#         nano save as
# Save and Save As are both accomplished with the Write Out command, Ctrl+O.
# When prompted, press enter to accept the existing file name. To save as another
# file name, type in the new name and press Enter, or use the Ctrl+T key combination
# to use nano's built-in file browser. To close the output window you can <CTRL -x>.
#####################################################################################
#####################################################################################
# TODO:
# Complete getting all calls to at least work in a basic mode.
# Add available options to calls.
# Finish DOCS.
# Reduce code.
# Complete converting script to dynamic.
##############################################################################
##############################################################################
# F O L D #
# columns=$(tput cols)
# lines=$(tput lines)
# fold  -w "$columns" -bs  order_history.txt
##############################################################################
#PATH0="/home/$USER/CB-output.json"
editor=nano
#############       DOCUMENTATION and VARIABLES     ########
############################################################
#              ######## COLORS #########
# -e '\E[32;40m'"\033[1m"    # Green on Black
# -e '\E[31;40m'"\033[1m"    # Red on Black
# -e '\E[34;40m'"\033[1m"    # Blue on Black
# -e '\E[33;40m'"\033[1m"    # Yellow on Black
# -e '\E[36;40m'"\033[1m"    # Cyan on Black
# -e '\E[35;40m'"\033[1m"    # Magenta on Black
# -e '\E[37;40m'"\033[1m"    # White on Black
# -e '\E[33;47m'"\033[1m"    # Black on White
# printf "\x1b[38;2;255;0;0m$TRUECOLOR\x1b[0m\n"; echo -n -e '\E[32;40m'"\033[1m"    # For more colors
#
#######################################################################
#            ######## CONVERT ########
# echo "1.0074E+05" | awk -F"E" 'BEGIN{OFMT="%10.10f"} {print $1 * (10 ^ $2)}'   # e notation to decimal
# nonce1=$(date +%s%N | cut -b1-13)                                              # Unix time (current)
# DATETIME= date -d @$EPOCHTIME                                                  #
#
##################################################################################################
# COINBASE™ ENDPOINTS/VARIABLES
##################################################################
###          ######## BASE URL #########
BASEENDPOINT1="https://api.coinbase.com"
BENDPOINT=$BASEENDPOINT1
##################################################################
eq1="="
amps="&"
qmark="?"
colon=":"
comma=","
fslash="/"
limit="limit"

## Print selection menu.
showMenu(){
echo -e '\E[32;40m'"\033[1m"
clear
  echo "===================================="
  echo "        tradeCBpro " ; printf "\e[5m\e[31m\x1b[38;2;255;0;0m$ENDPOINT\x1b[0m\n"; echo -n -e '\E[32;40m'"\033[1m"
echo "===================================="
  echo "[0]  EXIT"
  echo "[1]  ACCOUNTS"
  echo "[2]  PRODUCTS"
  echo "[3]  ORDERS "
  echo "[4]  PUBLIC ENDPOINTS"
  echo "[5]  PAYMENT METHODS"
  echo "[6]  DEPOSIT/WITHDRAW"
  echo "[7]  PORTFOLIO"
  echo "[8]  ENTER/REMOVE KEYS"
  echo "[9]  Not Used"
  echo "[10] Miscellaneous"
  echo "===================================="
  printf "\n"

  read -p "Please Select A Number: " mc
  return $mc
        }

while [[ "$m" != "0" ]]
do
 if [[ "$m" == "1" ]]; then
    ##
    if [[ "$ENDPOINT" == "$ENDPOINT1" ]]; then
    echo -e '\E[32;40m'"\033[1m"
    elif [[ "$ENDPOINT" == "$ENDPOINT2" ]]; then
    ##
    echo -e '\E[32;40m'"\033[1m"
##################################################
    elif [[ "$ENDPOINT" == "$ENDPOINT3" ]]; then
##################################################
i=1
j=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "ACCOUNTS"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu         = 0"
echo "List Accounts     = 1"
echo "Get Account       = 2"
echo
read -p "Type a number [0, 1, 2] :" x

   case $x in

    0)
    echo -ne '\n' | showMenu
    #$x=$0
    j=0
    i=0
    ;;

    1)
####################################################################
# LIST ACCOUNTS
# GET https://api.coinbase.com/api/v3/brokerage/accounts
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/accounts?limit=20&cursor=12345'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getaccounts
###########################################################################################
# LIST Get a list of authenticated accounts for the current user.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/list_accounts.txt
echo
method="GET"
requestpath="/api/v3/brokerage/accounts"
retail_portfolio_id0="retail_portfolio_id"
retail_portfolio_id1=""
limit0=""
cursor0="cursor"
PATH0="$PWD"/CB-output.json
rm "$PWD"/CB-output.json
touch "$PWD"/CB-output.json
echo -e '\E[32;40m'"\033[1m"
read -p "Enter Retail Portfolio ID or press ENTER for default : " retail_portfolio_id1
read -p "Enter limit of accounts to display (or 0 for all) : " limit0

while true; do

if [[ "$cursor1" != "" ]]; then
page0="$cursor1"
else
page0=$(cat $PATH0 | grep -w cursor | tr -d '"' | sed 's/,*$//g' | sed 's/cursor://' | tr -d " ")
fi

BODY="${limit}${eq1}${limit0}${amps}${cursor0}${eq1}${page0}${amps}${retail_portfolio_id0}${eq1}${retail_portfolio_id1}"

TIMESTAMP=$(date +%s)
  SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  (curl -L -s "${BENDPOINT}${requestpath}${qmark}${BODY}"  \
  -X ${method}  \
  -H 'Content-Type: application/json'  \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json

echo -e '\E[31;40m'"\033[1m"
   read -p "Are you finished y/n : " yn
case $yn in
        [Yy]* )
        echo -e '\E[32;40m'"\033[1m"
        rm -f "$PWD"/CB-output.json
        touch "$PWD"/CB-output.json
        break;;
        [Nn]* )
       read -p "Enter cursor ID for start of list or press ENTER : " cursor1
       read -p "Enter limit of accounts to display (required) : " limit0

       echo -e '\E[32;40m'"\033[1m"
    esac
    echo -e '\E[32;40m'"\033[1m"
done

#     printf "\n"
##################################################################
    i=0
    ;;
    2)
###################################################################################
# GET ACCOUNT
# GET https://api.coinbase.com/api/v3/brokerage/accounts/{account_uuid}
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/accounts/12345' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getaccount
##############################################################################################
# GET Get a list of information about an account, given an account UUID.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/get_account.txt
echo
echo
read -p "Enter Account UUID : " account_id

method="GET"
requestpath="/api/v3/brokerage/accounts/"
BODY="$account_id"

TIMESTAMP=$(date +%s)
SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "${BENDPOINT}${requestpath}${BODY}" \
 -X ${method}  \
 -H 'Content-Type: application/json'  \
 --header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
 $editor CB-output.json

##################################################################
    i=0
    ;;
    3)
##################################################################
echo "You can add a command here if you want :)"

##################################################################
    i=0
    ;;
    *)
   # i=1;;
  esac
done
fi
    printf "\n"
##############################################################
#####222222222222222222222222222222222222222222222222222222222
    elif [[ "$m" == "2" ]]; then
    ##
    if [[ "$ENDPOINT" == "$ENDPOINT1" ]]; then
    echo -e '\E[33;40m'"\033[1m"
    elif [[ "$ENDPOINT" == "$ENDPOINT2" ]]; then
    echo -e '\E[32;40m'"\033[1m"
    elif [[ "$ENDPOINT" == "$ENDPOINT3" ]]; then
################################################
i=1
j=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "PRODUCTS"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu         = 0"
echo "Best Bid/Ask      = 1"
echo "Product Book      = 2"
echo "List Products     = 3"
echo "Get Product       = 4"
echo "Product Candles   = 5"
echo "Market Trades     = 6"
echo
read -p "Type a number [0, 1, 2, 3, 4, 5, 6] :" x

   case $x in

    0) clear
    echo -ne '\n' | showMenu
    j=0
    i=0
    ;;

    1)
##################################################################################
# BEST BID/ASK
# GET https://api.coinbase.com/api/v3/brokerage/best_bid_ask
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/best_bid_ask?product_ids=BTC-USD' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getbestbidask
#################################################################################
# Get the best bid/ask for all products. A subset of all products can be returned instead by using the product_ids input.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/best_bid_ask.txt
echo

## TODO
method="GET"
requestpath="/api/v3/brokerage/best_bid_ask"
product_ids="product_ids"
product_id=""

echo "To display all products enter          1 "
echo "To display one product enter           2 "
echo "To display one or more products enter  3 "
echo
read -p "Enter your choice : " choose

if [[ $choose == 1 ]]; then
BODY=""
elif [[ $choose == 2 ]];then
echo
read -p "Enter Product id string " product_id
product_id=${product_id^^}
BODY="${qmark}${product_ids}${eq1}${product_id^^}"
else
declare -a order_array
declare -a new_order_array
   echo
   echo
   echo -e '\E[31;40m'"\033[1m"
   echo "Be sure to press ENTER after every entry. Then "
   echo "Use <CTRL> d when finished."
   echo -e '\E[32;40m'"\033[1m"
   echo "Enter PRODUCT id (MUST BE UPPERCASE ex. BTC-USD): "
   k=0
   while read line
   do
    lines="$line"
    lines+=(\""$line"\",)
    order_array=("${order_array[@]}" \""$lines"\",)
    order_array=( "${order_array[@]}" )
    new_order_array[$k]=$(echo ${product_ids}${eq1}${order_array[$k]}${amps})
    k=$(expr $k + 1)
    line=""
   done

body0=${qmark}${new_order_array[*]}
BODY=$(echo ${body0} | sed 's/\(.*\),/\1 /' | awk '{print "["$0"]"}' | sed 's/[][]//g' | sed 's/"//g' | sed 's/.$//' | tr -d "," | tr -d ' ' )
fi

if [[ "$BODY" != "" ]]; then
echo $BODY
read -p "This is the request you made. If it looks good, press ENTER. If not, <CTRL-c> " n
fi

TIMESTAMP=$(date +%s)
SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

   ( curl -L -s "${BENDPOINT}${requestpath}${BODY}" \
    -X ${method}  \
    -H 'Content-Type: application/json' \
    --header "CB-ACCESS-KEY: $COINBASE_KEY" \
    --header "CB-ACCESS-SIGN: $SIG" \
    --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
    --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
    $editor CB-output.json
    unset order_array
    unset new_order_array

##################################################################
    i=0
    ;;
    2)
#################################################################################
# GET PRODUCT BOOK
# GET https://api.coinbase.com/api/v3/brokerage/product_book
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/product_book?product_id=BTC-USD&limit=50' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getproductbook
##########################################################################################
# Get a list of bids/asks for a single product. The amount of detail shown can be customized with the limit parameter.
 clear
 columns=$(tput cols)
 lines=$(tput lines)
 fold -w "$columns" -bs  DOCS/product_book.txt
 echo

 product_id="product_id"
 product_id1=""
 limit="limit"
 limit1=""
 agpri0="aggregation_price_increment"
 agpri1=""
 method="GET"
 requestpath="/api/v3/brokerage/product_book"

read -p "Enter product id (ex. BTC-USD) : " product_id1
#product_id1=${product_id1^^}
read -p "Enter limit : " limit1
read -p "Enter aggregation price increment : " agpri1

BODY="${qmark}${product_id}${eq1}${product_id1^^}${amps}${limit}${eq1}${limit1}${amps}${agpri0}${eq1}${agpri1}"
BODY0="${qmark}${product_id}${eq1}${product_id1^^}${amps}${agpri0}${eq1}${agpri1}"

if [[ "${limit1}" = "" ]]; then
BODY="$BODY0"
fi

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

   ( curl -L -s "${BENDPOINT}${requestpath}${BODY}" \
    -X ${method}  \
    -H 'Content-Type: application/json' \
    --header "CB-ACCESS-KEY: $COINBASE_KEY" \
    --header "CB-ACCESS-SIGN: $SIG" \
    --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
    --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
    $editor CB-output.json

###################################################################
    i=0
    ;;
    3)
#####  WORKS  #####  TODO: add options
###########################################################################
# LIST PRODUCTS
# GET https://api.coinbase.com/api/v3/brokerage/products
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/products?limit=50&offset=10&product_ids=BTC-USD&contract_expiry_type=PERPETUAL&expiring_contract_status=STATUS_ALL' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getproducts
###########################################################################
# Get a list of the available currency pairs for trading.

# TODO: add limit, offset, product_type, product_ids, contract_expiry_type, expiring_contract_status, get_tradability_status, get_all_products

clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/list_products.txt
echo

    method="GET"
    offset="offset"
    product_type="product_type"
    product_id="product_id"
    contract_expiry_type="contract_expiry_type"
    expiring_contract_status="expiring_contract_status"
    limit1=""
    offset1=""
    product_type1=""
    product_id1=""
    contract_expiry_type1=""
    expiring_contract_status=""
    requestpath="/api/v3/brokerage/products"

    read -p "Enter Product id(s) (ex. BTC-USD) : " product_id1
    product_id1=${product_id1^^}
    read -p "Enter limit of how many products to return : " limit1

    BODY="${qmark}${limit}${eq1}${limit1}${amps}${product_id}${eq1}${product_id1}"
    echo ${BODY}
    read -p "Press ENTER to continue: " n

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

   ( curl -L -s "${BENDPOINT}${requestpath}${BODY}" \
    -X ${method}  \
    -H 'Content-Type: application/json' \
    --header "CB-ACCESS-KEY: $COINBASE_KEY" \
    --header "CB-ACCESS-SIGN: $SIG" \
    --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
    --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
    $editor CB-output.json
##################################################################
    i=0
    ;;
    4)
 #########################################################################################
    # GET PRODUCT
    # curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/products?product_ids=BTC-USD' \
    # GET https://api.coinbase.com/api/v3/brokerage/product/{product_id}
    # https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getproduct
    ##########################################################################################
  # v3/brokerage/products?product_ids=DOGE-USD' \
  # curl -L 'https://api.coinbase.com/api/v3/brokerage/products/btc-usd?get_tradability_status=true'
  clear
  columns=$(tput cols)
  lines=$(tput lines)
  fold -w "$columns" -bs  DOCS/get_product.txt

    method="GET"
    requestpath="/api/v3/brokerage/products/${product_id1}"
    product_id="product_id"
    tradability_status0=""
    tradability_status1="true"

    read -p "Enter desired product (ex. BTC-USD ) : " product_id1
    echo
    echo "(Tradability is only enabled for SPOT products.)"
    read -p "Enter true or false for tradability status  : " tradability_status1
    product_id1=${product_id1^^}

   requestpath="/api/v3/brokerage/products/${product_id1}"
   BODY="${qmark}${tradability_status0}${eq1}${tradability_status1}"

    TIMESTAMP=$(date +%s)
    SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  ( curl -L -s "${BENDPOINT}${requestpath}${BODY}"  \
   -X "${method}"  \
   -H 'Content-Type: application/json' \
   --header "CB-ACCESS-KEY: $COINBASE_KEY" \
    --header "CB-ACCESS-SIGN: $SIG" \
    --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
    --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
    $editor CB-output.json
##################################################################
    i=0
    ;;
    5)
##########################################################################################
# GET PRODUCT CANDLES
# GET https://api.coinbase.com/api/v3/brokerage/products/{product_id}/candles
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/products/BTC-USD/candles?start=12345&end=23456&granularity=FIVE_MINUTE' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getcandles
##########################################################################################
# Get rates for a single product by product ID, grouped in buckets.
# ADD < PRODUCT ID , START (UNIX) , END (UNIX) , GRADULARITY

clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/product_candles.txt
echo

echo "Granularity choices"
echo
echo "1= ONE_MINUTE"
echo "2= FIVE_MINUTE"
echo "3= FIFTEEN_MINUTE"
echo "4= THIRTY_MINUTE"
echo "5= ONE_HOUR"
echo "6= TWO_HOUR"
echo "7= SIX_HOUR"
echo "8= ONE_DAY"
echo
echo

array_gran=("ONE_MINUTE" "FIVE_MINUTE" "FIFTEEN_MINUTE" "THIRTY_MINUTE" "ONE_HOUR" "TWO_HOUR" "SIX_HOUR" "ONE_DAY")

product_id="product_id"
product_id1=" "
start0="start"
end0="end"
start1=""
end1=""
limit0="limit"
limit1=""
index1=""
granularity="granularity"
granularity1=""
method="GET"

read -p "Enter Product trading pair id (ex. BTC-USD) : " product_id1
echo "Format start time as mm/dd/yyyy hh:mm or mm/dd/yyyy"
read -p "Enter start time : " start1
start1=$(date -u -d "$start1" +%s)
echo "Format end time as mm/dd/yyyy hh:mm or mm/dd/yyyy"
read -p "Enter end time : " end1
end1=$(date -u -d "$end1" +%s)

read -p "Enter Granularity from choices listed above : " index1
index1=$(($index1 - 1))
granularity1=${array_gran["index1"]}
read -p "Enter limit (# of candle buckets returned default/max is 350 *Optional)" limit1
limit1=$((limit1))

requestpath="/api/v3/brokerage/products/${product_id1^^}/candles"

BODY="${qmark}${start0}${eq1}${start1}${amps}${end0}${eq1}${end1}${amps}${limit0}${eq1}${limit1}${amps}${granularity}${eq1}${granularity1}"

echo ${product_id1^^}
echo $start1
echo $end1
echo $granularity1
echo "$BODY"
echo "${BENDPOINT}${requestpath}${BODY}"
read -p "Press ENTER to continue : " n

TIMESTAMP=$(date +%s)
SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "${BENDPOINT}${requestpath}${BODY}"  \
 -X ${method}  \
 -H 'Content-Type: application/json'  \
 --header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )

 $editor CB-output.json

##################################################################
    i=0
    ;;
    6)
#
#############################################################################
# GET MARKET TRADES
# GET https://api.coinbase.com/api/v3/brokerage/products/{product_id}/ticker
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/products/BTC-USD/ticker?limit=10&start=1706359&end=1706360' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getmarkettrades
##############################################################################
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/market_trades.txt
echo

product_id="product_id"
product_id1=""
limit="limit"
limit1=""
start0="start"
end0="end"
start1=""
end1=""

read -p "Enter product ID (ex. BTC-USD) : " product_id1
read -p "Enter limit : " limit1
echo "Format start time as mm/dd/yyyy hh:mm (OR mm/dd/yyyy) "
read -p "Enter start date/time : " start1
echo "Format end time as mm/dd/yyyy hh:mm (OR mm/dd/yyyy) "
read -p "Enter end date/time : " end1
start1=$(date -u -d "$start1" +%s)
end1=$(date -u -d "$end1" +%s)

if [[ "${start1}" = "" ]]; then
BODY="$BODY0"
fi

method="GET"
requestpath="/api/v3/brokerage/products/${product_id1^^}/ticker"

BODY="${qmark}${limit}${eq1}${limit1}${amps}${start0}${eq1}${start1}${amps}${end0}${eq1}${end1}"

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);
 echo ${TIMESTAMP}

(curl -L "${BENDPOINT}${requestpath}${BODY}" \
 -X ${method}  \
 -H 'Content-Type: application/json' \
 --header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
 $editor CB-output.json

    i=0
    ;;
    7)
##################################################################
##################################################################
   clear
   i=0
    ;;
    *)
    i=1;;

  esac
done
#echo -e '\E[32;40m'"\033[1m"
 fi

    printf "\n"
#####  33333333333333333333333333333333333333333333333333333333333
    elif [[ "$m" == "3" ]]; then
    if [[ "$ENDPOINT" == "$ENDPOINT1" ]]; then
    printf "\n"
 ######################################################
    elif [[ "$ENDPOINT" == "$ENDPOINT2" ]]; then
    echo -e '\E[32;40m'"\033[1m"
    printf "\n"
##################################################################
    elif [[ "$ENDPOINT" == "$ENDPOINT3" ]]; then
######   ORDER BUY/SELL
##################################################################

i=1
j=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "ORDERS"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu          = 0"
echo "Create Order       = 1"
echo "Cancel Order(s)    = 2"
echo "Edit Order         = 3"
echo "Edit Order Preview = 4"
echo "List Orders        = 5"
echo "List Fills         = 6"
echo "Get Order          = 7"
echo "Preview Order ***  = 8"
echo
read -p "Enter a number [0, 1, 2, 3, 4, 5, 6, 7, 8] :" x

   case $x in

    0) clear
    echo -ne '\n' | showMenu
    j=0
    i=0
    ;;

    1)         #   TODO: add options
 #############################################################################################
#  ORDERS
# POST https://api.coinbase.com/api/v3/brokerage/orders
# curl -L -X POST 'https://api.coinbase.com/api/v3/brokerage/orders' \
# --data-raw '{"client_order_id":"1","product_id":"BTC-USD","side":"BUY","order_configuration":{"market_market_ioc":{"quote_size":"2"},"limit_limit_gtc":{"post_only":true}}}'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_postorder
# https://docs.cdp.coinbase.com/advanced-trade/docs/rest-api-orders
##################################################################################################
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/create_order.txt
echo
 limit_price0="limit_price"
 limit_price1=""
 post_only0="post_only"
 post1=""
 method="POST"

  basequote1=("quote_size" "base_size")
  side1=("BUY" "SELL")
  post1=("true" "false")


 orderconfig1=("market_market_ioc" "limit_limit_gtc" "limit_limit_gtd")
  read -p "Is this a MARKET or LIMIT order?  Default = [market]:" orderconfig ; orderconfig=${orderconfig:-market}
  orderconfig=${orderconfig,,}

  if [[ $orderconfig == "market" ]]; then
  orderconfig0=${orderconfig1[dow-0]}
  elif [[ "$orderconfig" == "limit" ]]; then
  orderconfig0=${orderconfig1[dow-2]}
  #basequote0=${basequote1[dow-1]}
  elif [[ "$orderconfig" == "limit2" ]]; then
  orderconfig0=${orderconfig1[dow-1]}
  fi

  read -p "Is this a BUY or SELL order? Default = [BUY]:" side1 ; side1=${side1:-BUY}
  side1=${side1^^}
  side0=${side1[dow-0]}
  basequote0=${basequote1[dow-0]}
  if [[ $side1 == "SELL" ]]; then
  side0=${side1[dow-1]}
  basequote0=${basequote1[dow-1]}
  fi

    while true; do
    read -p "Which market would you like Default = [DOGE-USD]:" prod_id ; prod_id=${prod_id:-DOGE-USD}
    prod_id=${prod_id^^}
    BTCPRICE=$(curl -s https://api.pro.coinbase.com/products/BTC-USD/ticker | awk -F',' '{printf $5}' | tr -dc '. [:digit:]')
    PRODPRICE=$(curl -s https://api.pro.coinbase.com/products/${prod_id}/ticker | awk -F',' '{printf $5}' | tr -dc '. [:digit:]')
    echo "The current price of "$prod_id" is "$PRODPRICE"    ."
    curl -s https://api.pro.coinbase.com/products/${prod_id}/ticker | jq .
    echo -e '\E[32;40m'"\033[1m"

    echo "quote=BUY only / base=BUY or SELL"
    read -p "Enter QUOTE(buy) or BASE(sell) quantity :" quantity
    if [[ $orderconfig0 == "limit_limit_gtc" ]]; then
    read -p "Enter Limit price: " limit_price1
    fi
    echo -e '\E[33;40m'"\033[1m"
    echo "This is a "${orderconfig0}" "${side0^^}" order."
    echo "You entered (read carefully):"
    echo "market= " $prod_id
    prod_id=${prod_id^^}
    echo "quote/base amount= " $quantity

    price1=$(echo $quantity*$PRODPRICE | bc)

    if [[ $orderconfig0 == "limit_limit_gtc" ]]; then
    read -p "Post only (true or false) Default = [true]:" post1 ; post1=${post1:-true}
    post1=${post1,,}
    post0=${post1[dow-0]}
    basequote0=${basequote1[dow-1]}
    elif [[ $post1 == "false" ]]; then
    post0=${post1[dow-1]}
    basequote0=${basequote1[dow-1]}
    fi

    echo "price=  ~" $price1 " + fee"
    echo
    read -p "Are the above values what you wanted ?" yn
    echo -e '\E[32;40m'"\033[1m"
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) continue;;
        * ) echo "Please answer yes or no. ( Or y or n )";;
    esac
  done
    while true; do
     echo -e '\E[31;40m'"\033[1m"
   read -p "Would you like to execute this transaction? ( y or n )" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exec $0;;
        * ) echo "Please answer yes or no.";;
    esac
  done
   echo -e '\E[32;40m'"\033[1m"

requestpath="/api/v3/brokerage/orders"
UUID1=$(uuidgen)
PROD_ID=${prod_id}

BODY="{\"client_order_id\":\"$UUID1\",\"product_id\":\"${prod_id}\",\"side\":\"${side0^^}\",\"order_configuration\":{\"${orderconfig0}\":{\"${basequote0}\":\"${quantity}\"}}}"

 BODYLGTC="{\"client_order_id\":\"$UUID1\",\"product_id\":\"${prod_id}\",\"side\":\"${side0^^}\",\"order_configuration\":{\"${orderconfig0}\":{\"${basequote0}\":\"${quantity}\",\"${limit_price0}\":\"${limit_price1}\",\"${post_only0}\":${post0}}}}"

if [[ ${orderconfig0} == "limit_limit_gtc" ]]; then
BODY=${BODYLGTC}
fi

echo $BODY
read -p "Last chance to check your information. Press ENTER if satisfied else <CTRL> c " n

TIMESTAMP=$(date +%s)
SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

urleq="${BENDPOINT}${requestpath}"

(curl -L -s "$urleq"  \
 -X ${method}             \
 -H 'Content-Type: application/json' \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-VERSION: 2017-12-01" \
 --data-raw "${BODY}" | jq -r . > CB-output.json )
 $editor CB-output.json

###################################################################
    i=0
    ;;
    2)
 #####################################################################################
# POST CANCEL ORDER(S)
# POST https://api.coinbase.com/api/v3/brokerage/orders/batch_cancel
# curl -L -X POST 'https://api.coinbase.com/api/v3/brokerage/orders/batch_cancel' \
# --data-raw '{"order_ids":["1234","4321"]}'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_cancelorders
##################################################################################################
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/cancel_orders.txt

 method="POST"
 order_ids0="order_ids"
 requestpath="/api/v3/brokerage/orders/batch_cancel"

declare -a order_array
declare -a new_order_array
   echo
   echo
   echo -e '\E[31;40m'"\033[1m"
   echo "Be sure to press ENTER after every entry. Then "
   echo "Use <CTRL> d when finished."
   echo -e '\E[32;40m'"\033[1m"
   echo "Enter ORDER ID : "

k=0
while read line
   do
   lines="$line"
    lines+=(\""$line"\",)
    order_array=("${order_array[@]}" \""$lines"\",)
    order_array=( "${order_array[@]}" )
    new_order_array[$k]=$(echo ${order_array[$k]}${comma})
    k=$(expr $k + 1)
    line=""
   done

BODY1=$(echo ${new_order_array[*]} | sed 's/,$//g' | tr -d ' ' | sed 's/\(.*\),/\1 /' | sed 's/,\{2,\}/,/g' | tr -d ' ' )
BODY="{\"${order_ids0}\":[${BODY1}]}"

TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

( curl -L -s "${BENDPOINT}${requestpath}"  \
 -X ${method} \
 -H 'Content-Type: application/json' \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-VERSION: $CBVERSION" \
 -d "${BODY}" | jq -r . > CB-output.json )
 $editor CB-output.json

###################################################################
    i=0
    ;;
    3)
#   NOT FINISHED    ##
###########################################################################################
#####  EDIT ORDER
###########################################################################################
# POST https://api.coinbase.com/api/v3/brokerage/orders/edit
# curl -L -X POST 'https://api.coinbase.com/api/v3/brokerage/orders/edit' \
# --data-raw '{"order_id":"1","price":"1","size":"1"}'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_editorder
################################################################################################
# Edit an order's size (quantity), or price. Only good-till-cancelled (GTC) Limit Orders can be edited.

 clear
 columns=$(tput cols)
 lines=$(tput lines)
 fold -w "$columns" -bs  DOCS/edit_order.txt
 echo

 size0="size"
 size1=""
 price0="price"
 price1=""
 order_id="order_id"
 order_id1=""

 read -p "Enter order id : " order_id1
 read -p "Enter price : " price1
 read -p "Enter size : " size1

 method="POST"
 requestpath="/api/v3/brokerage/orders/edit"
 BODY="'{"${order_id}":"${order_id1}","${price}":"${price1}","${size0}":"${size1}"}'"
 echo "${BODY}"
   read -p "Press ENTER to continue : " n
 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "${BENDPOINT}${requestpath}${BODY}" \
 -X ${method}  \
 -H 'Content-Type: application/json' \
 --header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-VERSION: $CBVERSION"   \
 --data-raw ${BODY} | jq -r . > CB-output.json )
 $editor CB-output.json

###################################################################
    i=0
    ;;
    4)
#  TODO:  NOT FINISHED    ####################################################################
#####  ORDER EDIT PREVIEW
##############################################################################################
# POST https://api.coinbase.com/api/v3/brokerage/orders/edit_preview
# curl -L -X POST 'https://api.coinbase.com/api/v3/brokerage/orders/edit_preview' \
# --data-raw '{"order_id":"4","price":"0","size":"2"}'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_previeweditorder
#############################################################################################
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/preview_order_request.txt

method="POST"
 requestpath="/api/v3/brokerage/orders/edit_preview"
 read -p "Enter Order UUID: " n
 BODY="'{\"order_ids\":"${ids2}"}'"

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}/api/v3/brokerage/orders/edit_preview" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s 'https://api.coinbase.com/api/v3/brokerage/orders/edit_preview' \
-X ${method}  \
-H 'Content-Type: application/json' \
--header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-VERSION: $CBVERSION"   \
--data-raw '{"order_id":"4","price":"0","size":"2"}' | jq -r . > CB-output.json )
$editor CB-output.json

    i=0
    ;;
    5)
#   NOT FINISHED     TODO:  A TON ############################################################################################
##### LIST ORDERS
############################################################################################
# ORDERS/HISTORICAL/BATCH          WORKING (not finished)
# GET https://api.coinbase.com/api/v3/brokerage/orders/historical/batch
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/orders/historical/batch?product_id=BTC- USD&order_status=CANCELLED,EXPIRED&limit=101&order_side=UNKNOWN_ORDER_SIDE&cursor=1' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_gethistoricalorders
#############################################################################################
#  Get a list of orders filtered by optional query parameters (product_id, order_status, etc).

clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/list_orders.txt
echo

# TODO a bunch
#${order_ids}        Optional string of the product ID(s). Defaults to null, or fetch for all products.
#${product_id}           <--- done
#${order_status}         Only returns orders matching the specified order statuses.
#${limit}  The number of orders to display per page (no default amount). If has_next is true, additional pages of orders are available to be fetched. Use the cursor parameter to start on a specified page.
#${start_date}  (RFC3339 Timestamp)
#${end_date}    (RFC3339 Timestamp)
#${user_native_currency} <--- deprecated
#${order_type}           <--- done
#${order_side}           <--- done
#${cursor}              For paginated responses, returns all responses that come after this value.
#${product_type}      Returns orders matching this product type. By default, returns all product types.
#${order_placement_source}  Only returns the orders matching this placement source. By default, returns RETAIL_ADVANCED placement source.
#${contract_expiry_type} <--- Only works for Futures
#${asset_filters}   Only returns the orders where the quote, base or underlying asset matches the provided asset filter(s) (e.g. 'BTC').
#${retail_portfolio_id}  <--- deprecated
#${sort_by}   Sort results by a field, results use unstable pagination. Default is to sort by creation time.

read -p "Press ENTER to continue: " n
# order_status1=("EXPIRED" "EXPIRED" "EXPIRED")
#echo "Type LIMIT or STOP if you do not want the default [MARKET]"
columns=$(tput cols)
lines=$(tput lines)
fold  -w "$columns" -bs  DOCS/order_history.txt

echo
order_type1=("market_market_ioc" "limit_limit_gtc" "limit_limit_gtd")
#  read -p "Is this a MARKET, LIMIT or STOP order? Default= [market]:" order_type ; order_type=${order_type:-market}
  order_type=${order_type,,}

  if [[ $order_type == "market" ]]; then
  order_type0=${order_type1[dow-0]}
  elif [[ "$order_type" == "limit" ]]; then
  order_type0=${order_type1[dow-2]}
  elif [[ "$order_type" == "limit2" ]]; then
  order_type0=${order_type1[dow-1]}
  fi

################
  clear

  while true; do
  echo
  echo
  echo -e '\E[31;40m'"\033[1m"
  read -p "Enter the Product id (ex. BTC-USD) or leave blank for ALL " product_id
  product_id=${product_id^^}
  echo
  read -p "Enter SELL or BUY if you do not want default [UNKNOWN_ORDER_SIDE]:" side0 ; side0=${side0:-UNKNOWN_ORDER_SIDE}
  side0=${side0^^}
  side1=("BUY" "SELL" "UNKNOWN_ORDER_SIDE")
  if [[ $side0 == "BUY" ]]; then
  side0=${side1[dow-0]}
  elif [[ "$side0" == "SELL" ]]; then
  side0=${side1[dow-2]}
  elif [[ $side0 == "UNKNOWN_ORDER_SIDE" ]]; then
  side0=${side1[dow-1]}
  fi

  echo
  echo "ORDER STATUS can be OPEN, EXPIRED or CANCELLED"
  read -p "Type CANCELLED or EXPIRED if you do not want the default [OPEN]:" order_status ; order_status=${order_status:-OPEN}
  order_status=${order_status^^}
  order_status1=("OPEN" "CANCELLED" "EXPIRED")
  if [[ $order_status == "OPEN" ]]; then
  order_status0=${order_status1[dow-0]}
  elif [[ "$order_status" == "CANCELLED" ]]; then
  order_status0=${order_status1[dow-2]}
  elif [[ "$order_status" == "EXPIRED" ]]; then
  order_status0=${order_status1[dow-1]}
  fi

    echo -e '\E[33;40m'"\033[1m"
    echo "You entered (read carefully):"
    echo "You entered "${product_id}" for the Product id."
    echo "You entered "${side0^^}" for the Order Side."
    echo "You entered "${order_status0}" for the Order Status."
    echo
    read -p "Are the above values what you wanted ?" yn
    echo -e '\E[32;40m'"\033[1m"
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) continue;;
        * ) echo "Please answer yes or no.";;
    esac
  done

echo -e '\E[32;40m'"\033[1m"
qmark="?"
method="GET"
requestpath="/api/v3/brokerage/orders/historical/batch"
BODY="product_id=${product_id}&order_side=${side0^^}&order_status=${order_status0}"
#echo $BODY
#read -p "" n
TIMESTAMP=$(date +%s)
SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  (curl -L -s "${BENDPOINT}${requestpath}${qmark}${BODY}"  \
  -X ${method}  \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json)
  $editor CB-output.json

###################################################################
    i=0
    ;;
    6)
    #   NOT FINISHED    TODO: OPTIONS      ########################
#########################################################################################
#####   LIST FILLS
#########################################################################################
# GET https://api.coinbase.com/api/v3/brokerage/orders/historical/fills
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/orders/historical/fills?product_id=BTC-USD' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getfills
#########################################################################################
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/list_fills.txt
echo

# Get a list of fills filtered by optional query parameters (product_id, order_id, etc).

##   TODO ADD OPTIONS
# trade_ids
# allowed by  ISO 8601 and RFC 3339    2020-12-09T16:09:53+00:00
# end_sequence_timestamp
# sort_by

order_id0="order_ids"
order_id1=""
trade_id0="trade_ids"
trade_id1=""
prod_id0="product_ids"
product_id1=""
s_s_timestamp0="start_sequence_timestamp"
s_s_timestamp1=""
e_s_timestamp0="end_sequence_timestamp"
e_s_timestamp1=""
retail_portfolio_id0="retail_portfolio_id"
retail_portfolio_id1=""
limit0="limit"
limit1=""
cursor0="cursor"
cursor1=""
sort_by0="sort_by"
sort_by1=""
method="GET"
requestpath="/api/v3/brokerage/orders/historical/fills"
PATH0="$PWD"/CB-output.json
rm "$PWD"/CB-output.json
touch "$PWD"/CB-output.json
echo -e '\E[32;40m'"\033[1m"
read -p "Enter Retail Portfolio ID or press ENTER for default ID : " retail_portfolio_id1
read -p "Enter limit of filled orders to display  : " limit1

# curl -L 'https://api.coinbase.com/api/v3/brokerage/orders/historical/fills?product_ids=btc-usd&product_ids=doge-usd'


while true; do
  read -p "Enter the Product id (required) (ex. BTC-USD) " product_id1; product_id1=${product_id1^^}
  #read -p "Enter limit of filled orders to display  : " limit1
  # "trade_time": "2024-08-21T21:20:54.193Z",   <-- from output

page0=$(cat $PATH0 | grep -w cursor | tr -d '"' | sed 's/,*$//g' | sed 's/cursor://' | tr -d " ")

#  ${amps}${s_s_timestamp0}${eq1}${s_s_timestamp1}${amps}${e_s_timestamp0}${eq1}${e_s_timestamp1}

BODY="${limit0}${eq1}${limit1}${amps}${cursor0}${eq1}${page0}${amps}${retail_portfolio_id0}${eq1}${retail_portfolio_id1}${amps}${prod_id0}${eq1}${product_id1}"
echo ${BODY}
read -p "Press ENTER to continue : " n

TIMESTAMP=$(date +%s)
  SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "${BENDPOINT}${requestpath}${qmark}${BODY}"  \
  -X ${method}  \
  -H 'Content-Type: application/json'  \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json

echo -e '\E[31;40m'"\033[1m"
   read -p "Are you finished y/n : " yn
case $yn in
        [Yy]* )
        echo -e '\E[32;40m'"\033[1m"
        rm "$PWD"/CB-output.json
        touch "$PWD"/CB-output.json
        break;;
        [Nn]* )
       echo -e '\E[32;40m'"\033[1m"; read -p "Enter limit of filled orders to display (required) : " limit1
    esac
done

###################################################################
   i=0
    ;;
    7)
#   TODO: add currency    ########
#############################################################################
#####   GET SINGLE ORDER
#############################################################################
# GET https://api.coinbase.com/api/v3/brokerage/orders/historical/{order_id}
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/orders/historical/12345' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_gethistoricalorder
############################################################################
# Get a single order by order ID.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/get_order.txt
echo
# user_native_currency (default= USD)
method="GET"
order_id1=""

read -p "Enter Order ID : " order_id1

 requestpath="/api/v3/brokerage/orders/historical/${order_id1}"

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

 (curl -L -s "${BENDPOINT}${requestpath}" \
 -X ${method} \
 -H 'Content-Type: application/json' \
 --header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
$editor CB-output.json

###################################################################
    i=0
    ;;
    8)
#   NOT FINISHED    TODO: options
######################################################################################
#####   PREVIEW ORDER REQUEST
######################################################################################
# POST https://api.coinbase.com/api/v3/brokerage/orders/preview
# curl -L -X POST 'https://api.coinbase.com/api/v3/brokerage/orders/preview' \
# --data-raw '{"product_id":"3","side":"BUY","order_configuration":{"market_market_ioc":{"quote_size":"5"},"sor_limit_ioc":{"limit_price":"5"}}}'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_previeworder
#####################################################################################
# Preview the results of an order request before sending.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/preview_order.txt
echo

# curl -L 'https://api.coinbase.com/api/v3/brokerage/orders/preview' \
# -H 'Content-Type: application/json' \
# -d '{"product_id":"btc-osd","side":"SELL","order_configuration":{"limit_limit_gtc":{"base_size":".014","limit_price":"61275.00","post_only":true}}}'

product_id=
side=
commission_rate=
value=
order_configuration=
market_market_ioc=
quote_size=
base_size=
# TODO: Ton more... see DOC page

 method="POST"
 requestpath="/api/v3/brokerage/orders/preview"
 BODY="'{\"order_ids\":"${ids2}"}'"
 #echo "${BODY}"
   read -p "Press ENTER to continue to Main Menu : " n
   break
 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}/api/v3/brokerage/orders/preview" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s -X "GET" "https://api.coinbase.com/api/v3/brokerage/orders/preview" \
 -H 'Content-Type: application/json' \
 --header "CB-ACCESS-KEY: $COINBASE_KEY" \
 --header "CB-ACCESS-SIGN: $SIG" \
 --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
 --header "CB-VERSION: $CBVERSION"  \
 --data-raw '{"product_id":"3","side":"BUY","order_configuration":{"market_market_ioc":{"quote_size":"5"},"sor_limit_ioc":{"limit_price":"5"}}}' | jq -r . > CB-output.json )
 $editor CB-output.json
#############################################################################################
    i=0
    ;;
    9)
###################################################################
###################################################################
    i=0
    j=0
    ;;
    *)
    i=1;;

  esac
done
echo -e '\E[32;40m'"\033[1m"

fi

###################################################################
#####  444444444444444444444444444444444444444444444444444444444444
    elif [[ "$m" == "4" ]]; then
    ##
    if [[ "$ENDPOINT" == "$ENDPOINT1" ]]; then
    printf "\n"
    elif [[ "$ENDPOINT" == "$ENDPOINT2" ]]; then
    printf "\n"
    elif [[ "$ENDPOINT" == "$ENDPOINT3" ]]; then
 ##################################################################
 i=1
 j=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "PUBLIC ENPOINTS"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu       = 0"
echo "Server Time     = 1"
echo "Product Book    = 2"
echo "List Products   = 3"
echo "Get Product     = 4"
echo "Product Candles = 5"
echo "Market Trades   = 6"
echo

read -p "Type a number [0, 1, 2, 3, 4, 5, 6] :" x

   case $x in

    0) clear
    echo -ne '\n' | showMenu
    #$x=$0
    j=0
    i=0
    ;;

    1)
############################################################################################
############################################################################################
# GET SERVER TIME
# GET https://api.coinbase.com/api/v3/brokerage/time
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/time' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getservertime
###########################################################################################
# Get the current time from the Coinbase Advanced API.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/server_time.txt
echo

( curl -L -X "GET" 'https://api.coinbase.com/api/v3/brokerage/time' \
-H 'Content-Type: application/json' \
| jq -r . > CB-output.json )
 $editor CB-output.json

###################################################################
    i=0
    ;;
    2)
########################################################################################
# GET PUBLIC PRODUCT BOOK
# GET https://api.coinbase.com/api/v3/brokerage/market/product_book
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/market/product_book?product_id=BTC-USD&limit=10' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getpublicproductbook
############################################################################################
# Get a list of bids/asks for a single product. The amount of detail shown can be customized with the limit parameter.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/public_product_book.txt
echo

method="GET"
product_id0="product_id"
product_id1=""
limit0="limit"
limit1=""
aggregation_price_increment0="aggregation_price_increment"
aggregation_price_increment1=""

requestpath="/api/v3/brokerage/market/product_book"

read -p "Enter Pruduct id (ex. BTC-USD) : " product_id1
product_id1=${product_id1^^}
read -p "Enter Bid/Ask response limit : " limit1
read -p "Enter desired aggregation price increment : " aggregation_price_increment1

BODY="${qmark}${product_id0}${eq1}${product_id1}${amps}${limit0}${eq1}${limit1}${amps}${aggregation_price_increment0}${eq1}${aggregation_price_increment1}"

( curl -L "${BENDPOINT}${requestpath}${BODY}" \
-X ${method}  \
-H 'Content-Type: application/json' | jq -r . > CB-output.json )
$editor CB-output.json
##############################################################
     i=0
     ;;
     3)
 ########################################################################################
# LIST PUBLIC PRODUCTS
# GET https://api.coinbase.com/api/v3/brokerage/market/products
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/market/products?product_id=BTC-USD&limit=10'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getpublicproducts
############################################################################################
# Get a list of the available currency pairs for trading.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/public_products.txt
echo

array_gap=("TRUE" "FALSE")
array_prodtype=("SPOT" "FUTURE" "UNKNOWN_PRODUCT_TYPE")
array_expiry_type=("EXPIRING" "PERPETUAL" "UNKNOWN_CONTRACT_EXPIRY_TYPE")
array_expiring_contract_status=("STATUS_ALL" "STATUS_EXPIRED" "STATUS_UNEXPIRED" "UNKNOWN_EXPIRING_CONTRACT_STATUS")

    method="GET"
    offset0="offset"
    product_type0="product_type"
    product_ids0="product_ids"
    contract_expiry_type0="contract_expiry_type"
    expiring_contract_status0="expiring_contract_status"
    limit0="limit"
    limit1=""
    offset1=""
    product_type1=""
    product_ids1=""
    contract_expiry_type1=""
    expiring_contract_status1=""
    get_all_products0="get_all_products"
    get_all_products1=""
    requestpath="/api/v3/brokerage/market/products"

    read -p "Enter limit of how many products to return : " limit1
    read -p "Enter offset number : " offset1
    read -p "Enter Product Type (1=SPOT, 2=FUTURE, 3=UNKNOWN_PRODUCT_TYPE : )" index2
    index2=$(($index2 - 1))
    product_type1=${array_prodtype["index2"]}

   declare -a order_array
   declare -a new_order_array
   echo
   echo
   echo -e '\E[31;40m'"\033[1m"
   echo "Be sure to press ENTER after every entry. Then "
   echo "Use <CTRL> d when finished."
   echo "(If leaving blank, do not press Enter. Just press <CTRL> d)"
   echo -e '\E[32;40m'"\033[1m"
   echo "Enter PRODUCT id(s) (MUST BE UPPERCASE ex. BTC-USD): "
   k=0
   while read line
   do
    lines="$line"
    lines+=(\""$line"\",)
    order_array=("${order_array[@]}" \""$lines"\",)
    order_array=( "${order_array[@]}" )
    new_order_array[$k]=$(echo ${product_ids0}${eq1}${order_array[$k]}${amps})
    k=$(expr $k + 1)
    line=""
   done

body0=${new_order_array[*]}
BODY1=$(echo ${body0} | sed 's/\(.*\),/\1 /' | awk '{print "["$0"]"}' | sed 's/[][]//g' | sed 's/"//g' | sed 's/.$//' | tr -d "," | tr -d ' ' )

    read -p "Enter contract_expiry_type (1=EXPIRING, 2=PERPETUAL, 3=UNKNOWN_CONTRACT_EXPIRY_TYPE) : " index3
    index3=$(($index3 - 1))
    contract_expiry_type1=${array_expiry_type["index3"]}
    echo

    read -p "Enter expiring_contract_status (1=STATUS_ALL, 2=STATUS_EXPIRED, 3=STATUS_UNEXPIRED, 4=UNKNOWN_EXPIRING_CONTRACT_STATUS) : " index4
    index4=$(($index4 - 1))
    expiring_contract_status1=${array_expiring_contract_status["index4"]}
    echo

    read -p "Do you want to get all Products (1=TRUE, 2=FALSE) : " index1
    index1=$(($index1 - 1))
    get_all_products1=${array_gap["index1"]}
    echo

    BODY="${qmark}${limit}${eq1}${limit1}${amps}${offset0}${eq1}${offset1}${amps}${product_type0}${eq1}${product_type1}${amps}${BODY1}${amps}${contract_expiry_type0}${eq1}${contract_expiry_type1}${amps}${expiring_contract_status0}${eq1}${expiring_contract_status1}${amps}${get_all_products0}${eq1}${get_all_products1}"
    echo ${BODY}
    read -p "Press ENTER to continue: " n

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

   ( curl -L -s "${BENDPOINT}${requestpath}${BODY}" \
    -X ${method}  \
    -H 'Content-Type: application/json' \
    --header "CB-ACCESS-KEY: $COINBASE_KEY" \
    --header "CB-ACCESS-SIGN: $SIG" \
    --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
    --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
    $editor CB-output.json

#########################################################################
    i=0
    ;;
    4)
######################################################################################
# GET PUBLIC PRODUCT
# GET https://api.coinbase.com/api/v3/brokerage/market/products/{product_id}
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/market/products/BTC-USD' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getpublicproduct
##############################################################################################
# Get information on a single product by product ID.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/get_public_product.txt
echo

read -p "Enter product ID (ex. BTC-USD) " product_id1
product_id1=${product_id1^^}

( curl -L -X GET "https://api.coinbase.com/api/v3/brokerage/market/products/${product_id1}" \
-H 'Content-Type: application/json' | jq -r . > CB-output.json )
$editor CB-output.json

###########################################################################################
    i=0
    ;;
    5)
#   TODO: product_id, start, end, granularity, limit
############################################################################################
# GET PUBLIC PRODUCT CANDLES
# GET https://api.coinbase.com/api/v3/brokerage/market/products/{product_id}/candles
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/market/products/BTC-USD/candles' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getpubliccandles
###############################################################################################
# Get rates for a single product by product ID, grouped in buckets.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/get_public_product_candles.txt
echo
read -p " " n

# TODO ADD OTHER OPTIONS

( curl -L -X "GET" "https://api.coinbase.com/api/v3/brokerage/market/products/BTC-USD/candles" \
-H 'Content-Type: application/json' | jq -r . > CB-output.json )
 $editor CB-output.json

###################################################################
     i=0
     ;;
     6)
####################################################################################
# GET MARKET TRADES
# GET https://api.coinbase.com/api/v3/brokerage/market/products/{product_id}/ticker
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/market/products/BTC-USD/ticker' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getpublicmarkettrades
##############################################################################################
# Get snapshot information, by product ID, about the last trades (ticks), best bid/ask, and 24h volume.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/get_public_market_trades.txt
echo
#read -p " " n

product_id1=""
limit="limit"
limit1=""
start0="start"
end0="end"
start1=""
end1=""

read -p "Enter Product id (ex. BTC-USD) : " product_id1
read -p "Enter limit : " limit1
echo "Format start time as mm/dd/yyyy hh:mm (OR mm/dd/yyyy) "
read -p "Enter start date/time : " start1
echo "Format end time as mm/dd/yyyy hh:mm (OR mm/dd/yyyy) "
read -p "Enter end date/time : " end1

method="GET"
requestpath="/api/v3/brokerage/market/products/${product_id1^^}/ticker"

BODY0="${qmark}${limit}${eq1}${limit1}"

if [[ "${start1}" != "" ]]; then
start1=$(date -u -d "$start1" +%s)
end1=$(date -u -d "$end1" +%s)
BODY="${qmark}${limit}${eq1}${limit1}${amps}${start0}${eq1}${start1}${amps}${end0}${eq1}${end1}"
elif [[ "${start1}" -eq "" ]]; then
BODY="$BODY0"
fi

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);
 echo ${TIMESTAMP}

(curl -L -X "${method}" "${BENDPOINT}${requestpath}${BODY}" \
 -H 'Content-Type: application/json' | jq -r . > CB-output.json )
 $editor CB-output.json

 ##################################################################
     i=0
     ;;
     7)
###################################################################
    i=0
    j=0
    ;;
    *)
    i=1;;

  esac
done
echo -e '\E[32;40m'"\033[1m"
###################################################################
  printf "\n"
  fi
##### 5555555555555555555555555555555555555555555555555555555555555

    elif [[ "$m" == "5" ]]; then
    ## Dispay Order Book

    if [[ "$ENDPOINT" == "$ENDPOINT1" ]]; then
    echo -e '\E[36;40m'"\033[1m"
    elif [[ "$ENDPOINT" == "$ENDPOINT2" ]]; then
    echo -e '\E[36;40m'"\033[1m"
    elif [[ "$ENDPOINT" == "$ENDPOINT3" ]]; then
    echo "PAYMENT METHODS"
##################################################################
echo -e '\E[32;40m'"\033[1m"
###################################################################
i=1
j=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "PAYMENT METHODS"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu            = 0"
echo "List Payment Methods = 1"
echo "Get Payment Method   = 2"
echo
read -p "Type a number [0, 1, 2] :" x

   case $x in

    0) clear
    echo -ne '\n' | showMenu
    #$x=$0
    j=0
    i=0
    ;;

    1)
#    NOT FINISHED   TODO: doc #############################################
###########################################################################
# GET LIST PAYMENT METHODS
# GET https://api.coinbase.com/api/v3/brokerage/payment_methods
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/payment_methods' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getpaymentmethods
############################################################################
# Get a list of payment methods for the current user.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/list_payment_methods.txt
echo

read -p "Press Enter to continue : " n

requestpath="/api/v3/brokerage/payment_methods"
method="GET"
BODY=""
payment_method=""

TIMESTAMP=$(date +%s)
SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

( curl -L -s "${BENDPOINT}${requestpath}" \
-X ${method} \
-H 'Content-Type: application/json' \
--header "CB-ACCESS-SIGN: $SIG" \
--header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
--header "CB-ACCESS-KEY: $COINBASE_KEY"  \
--header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
$editor CB-output.json

###################################################################
    i=0
    ;;
    2)
#   NOT FINISHED   TODO: doc ##############################################
###########################################################################
# GET GET PAYMENT METHOD
# https://api.coinbase.com/api/v3/brokerage/payment_methods/{payment_method_id}
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/payment_methods/12345' \
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getpaymentmethod
############################################################################
# Get information about a payment method for the current user.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/get_payment_method.txt
echo

method="GET"
BODY=""
payment_method=""

read -p "Enter payment method id : " payment_method
requestpath="/api/v3/brokerage/payment_methods/${payment_method}"

TIMESTAMP=$(date +%s)
SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "${BENDPOINT}${requestpath}" \
-X ${method} \
-H 'Content-Type: application/json' \
--header "CB-ACCESS-SIGN: $SIG" \
--header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
--header "CB-ACCESS-KEY: $COINBASE_KEY"  \
--header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
$editor CB-output.json

    i=0
    ;;
    2)
###################################################################
###################################################################
    i=0
    j=0
    ;;
    *)
    i=1;;
  esac
done

###################################################################
###################################################################
   echo -e '\E[32;40m'"\033[1m"
   fi
#   printf "\n"
  #####  6666666666666666666666666666666666666666666666666666666666
    elif [[ "$m" == "6" ]]; then
    ##
    if [[ "$ENDPOINT" == "$ENDPOINT1" ]]; then
    echo -e '\E[33;40m'"\033[1m"
    echo -e '\E[33;40m'"\033[1m"
####################################################################
    elif [[ "$ENDPOINT" == "$ENDPOINT2" ]]; then
    printf "\n"
####################################################################
    elif [[ "$ENDPOINT" == "$ENDPOINT3" ]]; then
 #
 ############

i=1
j=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "DEPOSIT/WITHDRAW"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu           = 0"
echo "DEPOSIT             = 1"
echo "Commit Deposit      = 2"
echo "List Deposits       = 3"
echo "Get Single Deposit  = 4"
echo "WITHDRAW            = 5"
echo "Commit Withdraw     = 6"
echo "List Withdrawals    = 7"
echo "Get Single Withdraw = 8"
echo
read -p "Enter your choice [0, 1, 2, 3, 4, 5, 6, 7, 8] :" x

   case $x in

    0) clear
    echo -ne '\n' | showMenu
    #$x=$0
    j=0
    i=0
    ;;

    1)
#    TODO: v3 version
######################################################################
 #####################################################################
 # POST DEPOSIT
 # POST https://api.coinbase.com/v2/accounts/:account_id/deposits/:deposit_id/commit
 #
 # https://docs.cdp.coinbase.com/sign-in-with-coinbase/docs/api-deposits
 #####################################################################
 clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/deposit.txt
echo

 amount="amount"
 amount1=""
 currency="currency"
 currency1=""
 payment_method="payment_method"
 payment_method1=""
 deposits="deposits"
 account_id1=""
 commit="commit"
 commit1=""

 read -p "Enter Amount to Deposit (ex. 10.00): " amount1
 read -p "Enter Currency Type (USD GBP etc.): " currency1
 currency1=${currency1^^}
 read -p "Enter Payment Method UUID: " payment_method1
 read -p "Enter Receive Account UUID: " account_id1
 read -p "Do you wish to Commit (true or false)" commit1

 method="POST"
 requestpath="/v2/accounts/${account_id1}/deposits"

 BODY='{"amount":"'${amount1}'","currency":"'${currency1^^}'","payment_method":"'${payment_method1}'","commit":"'${commit1}'"}'
 echo "${requestpath}"
 echo "${BODY}"
 read -p "Review the values you entered and Press ENTER to continue : " n

    echo -e '\E[31;40m'"\033[1m"
    read -p "ARE YOU SURE YOU WANT TO COMPLETE THIS DEPOSIT to ${account_id1} ? y/n : " yn

    case $yn in
        [Yy]* )
 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  urleq="${BENDPOINT}${requestpath}"

  ( curl -L -s "$urleq"  \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" \
  --data-raw "${BODY}" | jq . > CB-output.json )
  $editor CB-output.json
      continue;;
      [Nn]* )
      break;;
    esac

 ####################################################################
    i=0
    ;;
    2)
# COMMIT DEPOSIT   TODO: v3 version
#################################################################################
# POST https://api.coinbase.com/v2/accounts/:account_id/deposits/:deposit_id/commit
#
# https://docs.cdp.coinbase.com/coinbase-app/docs/api-deposits
#################################################################################
# Completes a deposit that is created in commit: false state.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/commit_deposit.txt
echo

amount="amount"
 amount1=""
 currency="currency"
 currency1=""
 payment_method="payment_method"
 payment_method1=""
 deposits="deposits"
 account_id1=""
 commit="commit"
 commit1=""

 read -p "Enter Amount to Deposit (ex. 10.00): " amount1
 read -p "Enter Currency Type (USD GBP etc.): " currency1
 currency1=${currency1^^}
 read -p "Enter Payment Method UUID: " payment_method1
 read -p "Enter Receive Account UUID: " account_id1
 read -p "Do you wish to Commit (true or false)" commit1

 method="POST"
 requestpath="/v2/accounts/${account_id1}/deposits"

 BODY='{"amount":"'${amount1}'","currency":"'${currency1^^}'","payment_method":"'${payment_method1}'","commit":"'${commit1}'"}'
 echo "${requestpath}"
 echo "${BODY}"
 read -p "Press ENTER to continue : " n

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  urleq="${BENDPOINT}${requestpath}"

  ( curl -L -s "$urleq"  \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" \
  --data-raw "${BODY}" | jq . > CB-output.json )
  $editor CB-output.json

#####################################################################
    i=0
    ;;
    3)
    # LIST DEPOSITS    TODO: v3 version
#####################################################################
# GET https://api.coinbase.com/v2/accounts/:account_id/deposits
#
# https://docs.cdp.coinbase.com/coinbase-app/docs/api-deposits
#####################################################################
# Lists fiat deposits for an account.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/list_deposits.txt
echo

deposits_id=""
 method="GET"

echo "Hint: Portfolio Breakdown to get your Deposit account UUID."
read -p "Enter Deposit Account UUID: " deposits_id
requestpath="/v2/accounts/${deposits_id}/deposits"

TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "https://api.coinbase.com/v2/accounts/${deposits_id}/deposits" \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json

#####################################################################
    i=0
    ;;
    4)
    # SHOW DEPOSIT     TODO: v3 version
##################################################################################
# GET https://api.coinbase.com/v2/accounts/:account_id/deposits/:deposit_id
#
# https://docs.cdp.coinbase.com/coinbase-app/docs/api-deposits
##################################################################################
# Get one deposit by deposit Id.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/show_deposit.txt
echo

deposits_id=""
 method="GET"

echo "Hint: Use Portfolio Breakdown to get your Deposit account UUID."
read -p "Enter Deposit Account UUID: " deposits_id
read -p "Enter single Deposit ID: " deposit_id
requestpath="/v2/accounts/${deposits_id}/deposits/${deposit_id}"

TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "https://api.coinbase.com/v2/accounts/${deposits_id}/deposits/${deposit_id}" \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json

#####################################################################
   i=0
   ;;
   5)
   # WITHDRAW FUNDS   TODO:  v3 version
#####################################################################
# POST https://api.coinbase.com/v2/accounts/:account_id/withdrawals
#
# https://docs.cdp.coinbase.com/coinbase-app/docs/api-withdrawals
#####################################################################
# Withdraws a user-defined amount of funds from a fiat account.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/create_withdrawal.txt
echo


 amount="amount"
 amount1=""
 currency="currency"
 currency1=""
 payment_method="payment_method"
 payment_method1=""
 account_id1=""
 method="POST"
 commit="commit"
 commit1=""

 read -p "Enter account to draw from: " account_id1
 read -p "Enter Amount to Withdraw (ex. 10.00): " amount1
 read -p "Enter Currency Type (USD GBP etc.): " currency1
 currency1=${currency1^^}
 read -p "Enter UUID of RECEIVE ACCOUNT: " payment_method1
 read -p "Do you wish to Commit this transaction (true or false)" commit1

requestpath="/v2/accounts/${account_id1}/withdrawals"

 BODY='{"amount":"'${amount1}'","currency":"'${currency1^^}'","payment_method":"'${payment_method1}'","commit":"'${commit1}'"}'
 echo "${requestpath}"
 echo "${BODY}"
 read -p "Press ENTER to continue : " n

 echo -e '\E[31;40m'"\033[1m"
    read -p "ARE YOU SURE YOU WANT TO COMPLETE THIS WITHDRAWAL to ${payment_method1} ? y/n : " yn
    case $yn in
        [Yy]* )
TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "${BENDPOINT}${requestpath}" \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" \
  --data-raw "${BODY}" | jq . > CB-output.json )
  $editor CB-output.json
    continue;;
      [Nn]* )
      break;;
    esac

#####################################################################
   i=0
   ;;
   6)
# COMMIT WITHDRAWAL  TODO: FINISH
##################################################################################
# POST https://api.coinbase.com/v2/accounts/:account_id/withdrawals/:withdrawal_id/commit
#
# https://docs.cdp.coinbase.com/coinbase-app/docs/api-withdrawals
##################################################################################
# Completes a withdrawal that is created in commit: false state.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/commit_withdrawal.txt
echo

amount="amount"
 amount1=""
 currency="currency"
 currency1=""
 payment_method="payment_method"
 payment_method1=""
 account_id1=""
 method="POST"
 commit="commit"
 commit1=""

 read -p "Enter account to draw from: " account_id1
 read -p "Enter Amount to Withdraw (ex. 10.00): " amount1
 read -p "Enter Currency Type (USD GBP etc.): " currency1
 currency1=${currency1^^}
 read -p "Enter Payment Method UUID of Receive Acct.: " payment_method1
 read -p "Do you wish to Commit (true or false)" commit1

requestpath="/v2/accounts/${account_id1}/withdrawals"

 BODY='{"amount":"'${amount1}'","currency":"'${currency1^^}'","payment_method":"'${payment_method1}'","commit":"'${commit1}'"}'
 echo "${requestpath}"
 echo "${BODY}"
 read -p "Press ENTER to continue : " n

TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "${BENDPOINT}${requestpath}" \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" \
  --data-raw "${BODY}" | jq . > CB-output.json )
  $editor CB-output.json
#####################################################################
  i=0
   ;;
   7)
   # LIST WITHDRAWALS  TODO: v3 version
#####################################################################
# GET https://api.coinbase.com/v2/accounts/:account_id/withdrawals
#
# https://docs.cdp.coinbase.com/coinbase-app/docs/api-withdrawals
#####################################################################
# Lists withdrawals for an account.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/list_withdrawals.txt
echo

 withdrawals_id=""
 method="GET"

read -p "Enter Withdrawal Account UUID: " withdrawals_id
requestpath="/v2/accounts/${withdrawals_id}/withdrawals"

TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "https://api.coinbase.com/v2/accounts/${withdrawals_id}/withdrawals" \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json

#####################################################################
  i=0
  ;;
  8)
  # SHOW WITHDRAWAL  TODO: v3 version
##################################################################################
##################################################################################
# GET https://api.coinbase.com/v2/accounts/:account_id/withdrawals/:withdrawal_id
#
# https://docs.cdp.coinbase.com/coinbase-app/docs/api-withdrawals
##################################################################################
# Get a single withdrawal.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/show_withdrawal.txt
echo

 withdrawals_id=""
 withdrawal_id=""
 method="GET"

read -p "Enter Withdrawal Account UUID: " withdrawals_id
read -p "Enter single Withdrawal ID: " withdrawal_id
requestpath="/v2/accounts/${withdrawals_id}/withdrawals/${withdrawal_id}"

TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

(curl -L -s "https://api.coinbase.com/v2/accounts/${withdrawals_id}/withdrawals/${withdrawal_id}" \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json

####################################################################
  i=0
  ;;
  8)
#####################################################################
    i=0
    j=0
    ;;
    *)
    i=1;;

  esac
done
echo -e '\E[32;40m'"\033[1m"
######################################################################
printf "\n"
  #fi
  showMenu
  m=$?

    fi
    printf "\n"
##### 777777777777777777777777777777777777777777777777777777777777777
    elif [[ "$m" == "7" ]]; then
    ##
    if [[ "$ENDPOINT" == "$ENDPOINT1" ]]; then
    echo -e '\E[33;40m'"\033[1m"
    elif [[ "$ENDPOINT" == "$ENDPOINT2" ]]; then
    echo -e '\E[33;40m'"\033[1m"
    printf "\n"
    elif [[ "$ENDPOINT" == "$ENDPOINT3" ]]; then
    i=1
    j=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "PORTFOLIO"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu            = 0"
echo "Portfolio Breakdown  = 1"
echo "List Portfolios      = 2"
echo "Create Portfolio     = 3"
echo "Delete Portfolio     = 4"
echo "Edit Portfolio       = 5"
echo "Move Portfolio Funds = 6"
echo
read -p "Enter your choice [0, 1, 2, 3, 4, 5, 6] :" x

   case $x in

    0) clear
    echo -ne '\n' | showMenu
    #$x=$0
    j=0
    i=0
    ;;

    1) # Get Portfolio Breakdown
    ##############################################################################
    # GET https://api.coinbase.com/api/v3/brokerage/portfolios/{portfolio_uuid}
    # https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getportfoliobreakdown
    ##############################################################################
    # Get the breakdown of a portfolio.
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/portfolio_breakdown.txt
    echo

    #read -p " " n

    method="GET"
    portfolio_uuid=""
    currency=""

    read -p "Enter Portfolio UUID : " portfolio_uuid
    read -p "Enter currency (i.e. USD) : " currency
    currency=${currency^^}

    requestpath="/api/v3/brokerage/portfolios/${portfolio_uuid}"
    BODY="${qmark}${currency}${eq1}${currency}"

   TIMESTAMP=$(date +%s)
   SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  (curl -L -s "${BENDPOINT}${requestpath}${BODY}"  \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json

    i=0
    ;;
    2)
# LIST PORTFOLIOS
##############################################################################
# GET https://api.coinbase.com/api/v3/brokerage/portfolios
# https://api.coinbase.com/api/v3/brokerage/portfolios/{portfolio_uuid}
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getportfolios
##############################################################################
# Get all portfolios of a user.
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/list_portfolios.txt
    echo

  #read -p " " n

    method="GET"
    portfolio_type0="portfolio_type"
    portfolio_type1=""

 #   'https://api.coinbase.com/api/v3/brokerage/portfolios?portfolio_type=DEFAULT'

     read -p "Enter Portfolio Type? Default = [DEFAULT]:" portfolio_type1 ; portfolio_type1=${portfolio_type1:-DEFAULT}
     portfolio_type1=${portfolio_type1^^}

    requestpath="/api/v3/brokerage/portfolios"
    BODY="${qmark}${portfolio_type1}"

   TIMESTAMP=$(date +%s)
   SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  (curl -L -s "${BENDPOINT}${requestpath}${BODY}"  \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json

    i=0
    ;;
    3)
# CREATE PORTFOLIO
##############################################################################
# POST https://api.coinbase.com/api/v3/brokerage/portfolios
# curl -L 'https://api.coinbase.com/api/v3/brokerage/portfolios' -d '{"name":"test"}'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_createportfolio
##############################################################################
# Create a portfolio.
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/create_portfolio.txt
    echo

    method="POST"
    name0="name"
    portfolio_name1=""

      read -p "Enter Portfolio Name? :" portfolio_name1

    requestpath="/api/v3/brokerage/portfolios"
    BODY="{\"${name0}\":\"${portfolio_name1}\"}"

   TIMESTAMP=$(date +%s)
   SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  (curl -L -s -H "Content-Type: application/json" "${BENDPOINT}${requestpath}"  \
  -X ${method} \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION"\
  -d "${BODY}" \
  | jq . > CB-output.json )
  $editor CB-output.json

    i=0
    ;;
    4)
# DELETE PORTFOLIO
##############################################################################
# DELETE https://api.coinbase.com/api/v3/brokerage/portfolios/{portfolio_uuid}
# curl -L -X DELETE 'https://api.coinbase.com/api/v3/brokerage/portfolios/12345'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_deleteportfolio
##############################################################################
# Delete portfolio.
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/delete_portfolio.txt
    echo

    method="DELETE"
    portfolio_uuid1=""

    read -p " Enter UUID of Portfolio to be DELETED :  " portfolio_uuid1

    requestpath="/api/v3/brokerage/portfolios/${portfolio_uuid1}"
    BODY=""

     echo -e '\E[31;40m'"\033[1m"
    read -p "ARE YOU SURE YOU WANT TO DELETE PORTFOLIO ${portfolio_uuid1} ? y/n : " yn

     case $yn in
       [Yy]* )

   TIMESTAMP=$(date +%s)
   SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  (curl -L -s "${BENDPOINT}${requestpath}${BODY}"  \
  -X ${method} \
  -H 'Content-Type: application/json' \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION" | jq . > CB-output.json )
  $editor CB-output.json
  #read -p " " n

       continue;;
       [Nn]* )
       break;;
    esac

#############################################################################
    i=0
    ;;
    5)
# EDIT PORTFOLIO
##############################################################################
# PUT https://api.coinbase.com/api/v3/brokerage/portfolios/{portfolio_uuid}
# curl -L -X PUT 'https://api.coinbase.com/api/v3/brokerage/portfolios/12345' -d '{"name":"test3"}'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_editportfolio
##############################################################################
# Edit a portfolio.
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/edit_portfolio.txt
    echo

    method="PUT"
    portfolio_uuid1=""
    name0="name"
    portfolio_name1=""

      read -p "Enter Portfolio UUID: " portfolio_uuid1
      read -p "Enter Portfolio Name? :" portfolio_name1

    requestpath="/api/v3/brokerage/portfolios/${portfolio_uuid1}"

    BODY="{\"${name0}\":\"${portfolio_name1}\"}"
    #BODY="'{\"${name0}\":\"${portfolio_name1}\"}'"
    #echo ${BODY}
    #read -p " " n

   TIMESTAMP=$(date +%s)
   SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

 #(curl -L -H "Content-Type: application/json" "${BENDPOINT}${requestpath}" -d "${BODY}" -v  \
  (curl -L -s -H "Content-Type: application/json" "${BENDPOINT}${requestpath}"  \
  -X ${method} \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION"\
  -d "${BODY}" \
  | jq . > CB-output.json )
  $editor CB-output.json

    i=0
    ;;
    6)
# MOVE PORTFOLIO FUNDS
##############################################################################
# POST https://api.coinbase.com/api/v3/brokerage/portfolios/move_funds
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_moveportfoliofunds
##############################################################################
# Move funds between portfolios.
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/move_portfolio_funds.txt
    echo

  method="POST"
  requestpath="/api/v3/brokerage/portfolios/move_funds"

  read -p "Enter amount of funds to be transferred: " amount1
  read -p "Enter currency type (ex. USD): " currency1
  currency1=${currency1^^}
  read -p "Enter source portfolio UUID : " uuid1
  read -p "Enter target portfolio UUID : " uuid2


  BODY="{\"funds\":{\"value\":\""${amount1}"\",\"currency\":\""${currency1}"\"},\"source_portfolio_uuid\":\""${uuid1}"\",\"target_portfolio_uuid\":\""${uuid2}"\"}"

#-d '{"funds":{"value":"1.00","currency":"usd"},"source_portfolio_uuid":"12345","target_portfolio_uuid":"54321"}'

 TIMESTAMP=$(date +%s)
   SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}${BODY}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

  (curl -L -s -H "Content-Type: application/json" "${BENDPOINT}${requestpath}"  \
  -X ${method} \
  --header "CB-ACCESS-KEY: $COINBASE_KEY" \
  --header "CB-ACCESS-SIGN: $SIG" \
  --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
  --header "CB-VERSION: $CBVERSION"\
  -d "${BODY}" \
  | jq . > CB-output.json )
  $editor CB-output.json

    i=0
    ;;
    7)
##############################################################################



    i=0
    ;;
    8)
##############################################################################
    i=0
    j=0
    ;;
    *)
    i=1;;

  esac
done
echo -e '\E[32;40m'"\033[1m"

    fi
    printf "\n"
#####################################################################   #88888888888888888888888888888888888888888888888888888888888888888888
    elif [[ "$m" == "8" ]]; then

    if [[ "$ENDPOINT" == "$ENDPOINT1" ]]; then
    echo -e '\E[36;40m'"\033[1m"
    elif [[ "$ENDPOINT" == "$ENDPOINT2" ]]; then
    printf "\n"
    elif [[ "$ENDPOINT" == "$ENDPOINT3" ]]; then
 ####################################################################
 #
   i=1
    j=1
#####################################################################
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "ENTER/REMOVE KEYS"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu           = 0"
echo "Enter Keys          = 1"
echo "Remove Keys         = 2"
echo "Remove Private Info = 3"
echo
read -p "Enter your choice [0, 1, 2, 3] :" x

   case $x in

    0) clear
    echo -ne '\n' | showMenu
    #$x=$0
    j=0
    i=0
    ;;
#####################################################################
    1) # Enter Keys

    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/enter_keys.txt
    echo

    read -p "Press ENTER to continue " n
    echo
    echo -e '\E[31;40m'"\033[1m"
    read -p "ARE YOU SURE YOU WANT TO ENTER YOUR KEYS? y/n : " yn

    case $yn in
        [Yy]* )
        $editor wCB-KEY1.txt
        $editor wCB-KEY2.txt
        COINBASE_KEY=`cat wCB-KEY1.txt`
        COINBASE_SECRET=`cat wCB-KEY2.txt`
        continue;;
        [Nn]* )
        break;;
    esac

#####################################################################
    i=0
    ;;
    2) # Remove keys
###########
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/remove_keys.txt
    echo
    #WARN="WARNING!!!"
    read -p "Press ENTER to continue " n
    echo
    echo -e '\E[31;40m'"\033[1m"
    read -p "ARE YOU SURE YOU WANT TO REMOVE YOUR KEYS? y/n : " yn

case $yn in
        [Yy]* )
        echo -e '\E[32;40m'"\033[1m"

        rm -f wCB-KEY1.txt
        rm -f wCB-KEY2.txt
        touch wCB-KEY1.txt
        touch wCB-KEY2.txt

        continue;;
        [Nn]* )
        break;;
esac

    i=0
    ;;
    3) # Remove all sensitve informatio
#####################################################################
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs  DOCS/remove_keys_info.txt
    echo

echo "This will REMOVE KEYS as well as the CB-output.json file."
echo "The CB-output.json file is the output you see in response"
echo "to most of the calls. This file may contain sensitive data"
echo "such as UUID's for Payment Methods, Fiat wallets, etc."

WARN="WARNING!!!"
    read -p "Press ENTER to continue " n
    echo
    echo -e '\E[31;40m'"\033[1m"
    read -p "ARE YOU SURE YOU WANT TO DELETE YOUR KEYS and SENSITIVE info? y/n : " yn

        case $yn in
        [Yy]* )
        echo -e '\E[32;40m'"\033[1m"

rm -f wCB-KEY1.txt
rm -f wCB-KEY2.txt
rm -f CB-output.json
touch wCB-KEY1.txt
touch wCB-KEY2.txt

        continue;;
        [Nn]* )
        break;;
    esac

#####################################################################
    i=0
    ;;
    *)
    #i=1;;

  esac
done
echo -e '\E[32;40m'"\033[1m"

    fi
    printf "\n"

#####################################################################
##### 999999999999999999999999999999999999999999999999999999999999999


#####################################################################
###  AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    elif [[ "$m" == "10" ]]; then
    ## Miscellaneous
     i=1
     j=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "MISCELLANEOUS"
echo -e '\E[33;40m'"\033[1m"
echo "Main Menu             = 0"
echo "TIP JAR (Voluntary)   = 1"
echo "Epoch date converter  = 2"
echo "Check for Update      = 3"
echo "Live-Ticker           = 4"
echo "Live-Stats            = 5"
echo "My Notes              = 6"
echo "UNUSED                = 7"
echo "FAQ                   = 8"
echo "UNUSED                = 9"
echo "Quick Mafs            = 10"
echo
read -p "Type a number [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10] :" x

   case $x in
    0) echo -ne '\n' | showMenu
    #$x=0
    j=0
    i=0
    ;;
    1) # TIP-JAR
   clear
   columns=$(tput cols)
   lines=$(tput lines)
   fold -w "$columns" -bs DOCS/tip_jar.txt

read -p "Press ENTER to close window. " y

 #############################################################
    i=0
    ;;
    2) # EPOCHTIME
   clear
   columns=$(tput cols)
   lines=$(tput lines)
   fold -w "$columns" -bs DOCS/epoch2read.txt

  read -p "Type or paste Epoch time :" EPOCHTIME
  echo -e '\E[36;40m'"\033[1m"
  DATETIME= date -d @$EPOCHTIME
  echo $DATETIME
  DATETIME= date -u -d @$EPOCHTIME
  echo $DATETIME
  read -p "Press ENTER to continue:" z

    i=0
    ;;
    3) # Check for Update
    LATESTVER=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/adf010/tradeCBpro/tags | grep -n 'v' | head -1 | sed -n 's/name//p' | sed 's/.*://' | tr -d  ' ":v,-')
       echo -e '\E[33;40m'"\033[1m"
       echo "Latest version is:" $LATESTVER
       echo "Your verion is   :" $CURRVER
       read -p "Press ENTER to continue: " n
    i=0
    ;;
    4)
#####################################################################
#
 # Live TICKER
    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold  -w "$columns" -bs DOCS/live_ticker.txt
    echo

read -p "Do you want to continue? (y or n) : " n
if [[ $n == "n" ]]; then
break
fi

read -p "Enter your preferred ticker or press ENTER for Default = [BTC-USD]:" prod_id ; prod_id=${prod_id:-BTC-USD}
prod_id=${prod_id^^}
echo
echo -e '\E[32;40m'"\033[1m"

     while true
do

sleep 1s
#curl https://api.coinbase.com/v2/prices/${prod_id}/spot
# https://api.exchange.coinbase.com/products/{product_id}/stats

outputb=$(curl -L -s "https://api.exchange.coinbase.com/products/${prod_id}/ticker" -H "Content-Type: application/json" | jq -r ".price" | sed -E 's/(.+)/$\1/')

echo -n "$outputb" $'\r'

if read -r -N 1 -t 2; then
        break
    fi

done

#####################################################################
   i=0
    ;;
    5)
    #################################################################
    #
    # Live Stats

    clear
    columns=$(tput cols)
    lines=$(tput lines)
    fold -w "$columns" -bs DOCS/live_stats.txt
    echo

read -p "Do you want to continue? (y or n) : " n
if [[ $n == "n" ]]; then
break
fi

read -p "Enter your preferred ticker or press ENTER for Default = [BTC-USD]:" prod_id ; prod_id=${prod_id:-BTC-USD}
prod_id=${prod_id^^}
echo
echo -e '\E[32;40m'"\033[1m"

     while true
do
clear
#sleep 1s

outputb=$(curl -s https://api.exchange.coinbase.com/products/${prod_id}/stats )
printf  "$outputb" '\r' | jq

if read -r -N 1 -t 5; then
        break
    fi

done

#####################################################################
    i=0
    ;;
    6) ## My Notes
       # NEEDS OPTION TO EXIT

       clear
       columns=$(tput cols)
       lines=$(tput lines)
       fold -w "$columns" -bs  DOCS/notes.txt
       echo
       echo -e '\E[31;40m'"\033[1m"
       echo "IT IS STRONGLY ADVISED TO NOT USE THIS OPTION TO STORE SENSITIVE INFORMATION."
       echo "This file is NOT removed by using the Remove Sensitive Information option."
       echo -e '\E[32;40m'"\033[1m"

    read -p "Do you want to open the editor? ( y or n ) ?" yn
    echo -e '\E[32;40m'"\033[1m"
    if [[ $yn == "y" ]]; then
        $editor /home/$USER/CBnotes.txt
        # bash -c "xdg-open /home/$USER/CBnotes.txt
    fi

    i=0
    ;;
    7)
 echo "7"
##############################################################################
# https://docs.cdp.coinbase.com/advanced-trade/docs/rest-api-auth  *****
# https://docs.cdp.coinbase.com/developer-platform/docs/cdp-vs-legacy-keys *
#
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getapikeypermissions

# curl -L 'https://api.coinbase.com/api/v3/brokerage/key_permissions'

# GET https://api.coinbase.com/api/v3/brokerage/key_permissions

# Get information about your CDP API key permissions

  #  clear
  #  columns=$(tput cols)
  #  lines=$(tput lines)
  #  fold  -w "$columns" -bs DOCS/cdp_key_permissions.txt
  #  echo
#####################################################################
    i=0
    ;;
    8)
 #   FAQ    #########################################################

clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/faq.txt
echo

read -n 1 -s -r -p "Press any key to continue"

#####################################################################
    i=0
    ;;
    9)
#
#####################################################################
 #
 #
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs  DOCS/.txt
echo

#read -p "This section does nothing at this time. Press ENTER to exit : " n

#####################################################################
    i=0
    ;;
    10)
######################################################################
    clear
    i=1
    j=1
    while [ $j = 1 ] ; do
        clear
        echo -e '\E[33;40m'"\033[1m"
        echo "                       Quickmafs"
        echo "                       ---------"
        echo
echo "Main Menu                       = 0"
echo "Calculate BTC to USD            = 1"
echo "Calculate Amount of ONION       = 2"
echo "Calculate Amount of BTC         = 3"
echo "Use Custom BTC Price for Amount = 4"
echo "Use Custom Amount For Cost      = 5"
echo "Market buy/sell fee             = 6"
echo
read -p "Type a number [0, 1, 2, 3, 4, 5, 6] :" a

    case $a in

    0) clear
    echo -ne '\n' | showMenu
    j=0
    i=0
    ;;

    1)
    clear
    echo " Calculate BTC to USD "
    echo
    #columns=$(tput cols)
    #lines=$(tput lines)
    #fold  -w "$columns" -bs  DOCS/btc2usd.txt
    prod_id="BTC-USD"

    BTCBTC=$(curl -L -s "https://api.exchange.coinbase.com/products/btc-usd/ticker" -H "Content-Type: application/json" | jq -r ".price" | sed -E 's/(.+)/$\1/' | tr -d '$' )

    echo "BTC = $"$BTCBTC
    read -p " Enter the BTC amount you want to buy/sell : " c
    USDONION=$(echo $BTCBTC*$c | bc)
    echo " Your buy/sell USD amount will be  $"$USDONION
    read -p "Hit ENTER to continue" g
    echo
    echo
    i=0
    ;;
    2)
    clear
    echo " Calculate Amount of ONION For Amount of BTC "
    echo "This can be used to find the amount of any crypto."
    echo "Just enter the current price of your favorite COIN/TOKEN."
    prod_id="BTC-USD"

    BTCBTC=$(curl -L -s "https://api.exchange.coinbase.com/products/btc-usd/ticker" -H "Content-Type: application/json" | jq -r ".price" | sed -E 's/(.+)/$\1/' | tr -d '$' )

    echo "BTC = $"$BTCBTC
    read -p " Enter The Price of ONION : " u
    read -p " Enter the Amount of fiat to SPEND : " USDONION
    AmountOfONION=$(echo "scale=8;$USDONION/$u" | bc)
    echo " Your Amount of ONION = : " $AmountOfONION
    read -p "Hit ENTER to continue" g
    echo
    echo
    i=0
    ;;
    3)
    clear
    echo " Calculate Amount of BTC "
    prod_id="BTC-USD"
    BTCBTC=$(curl -L -s "https://api.exchange.coinbase.com/products/btc-usd/ticker" -H "Content-Type: application/json" | jq -r ".price" | sed -E 's/(.+)/$\1/' | tr -d '$' )
    echo "BTC = $"$BTCBTC
    read -p " Enter Amount of USD : " w
    AmountOfBTC=$(echo "scale=8;$w/$BTCBTC" | bc )
    echo " Your Amount of BTC = " $AmountOfBTC
    read -p "Hit ENTER to continue" g
    echo
    echo
    i=0
    ;;
    4)
    clear
    echo " Use Custom BTC Price to find Amount "
    read -p " Enter a Custom Price for BTC : " u
    read -p " Enter an Amount of USD : " t
    AmountOfBTC=$(echo "scale=8;$t/$u" | bc )
    echo " Your Amount of BCT = " $AmountOfBTC
    read -p "Hit ENTER to continue" g
    echo
    echo
    i=0
    ;;
    5)
    clear
    echo " Use Custom Price to Find BTC Amount for USD Cost "
    read -p " Enter a Custom Price for BTC : " s
    read -p " Enter an Amount of BTC : " AmountofBTC
    CostOfBTC=$(echo "$s*$AmountofBTC" | bc )
    echo " Your USD Cost = " $CostOfBTC
    read -p "Hit ENTER to continue" g
    i=1
    ;;
    6)
    clear
    read -p " Enter USD amount : " zz
    read -p " Enter Fee % ( ex. .55 ) : " yy
    AmountOfFee=$(echo "scale=2;$yy*$zz/100" | bc)
    echo " Fee is About : " $AmountOfFee
    read -p "Press ENTER to return to menu: " n
    i=1
    ;;
    7)
##############################################################################
#prod_id="BTC-USD"
#
#    read -p " " n


##############################################################################
   i=0
   ;;
   8)
##############################################################################
#(curl -L "https://api.exchange.coinbase.com/products/btc-usd/ticker" -H "Content-Type: application/json" | jq -r ".price" | sed -E 's/(.+)/$\1/' | tr -d '$' )

#read -p " " n
#(curl -L "https://api.exchange.coinbase.com/products/btc-usd/stats" -H "Content-Type: application/json" | jq )

#read -p " " n
##############################################################################
    i=1
    ;;
    *)
    i=1;;
  esac
done
echo -e '\E[32;40m'"\033[1m"
   printf "\n"
   esac
done
echo -e '\E[32;40m'"\033[1m"
    printf "\n"

echo -e '\E[32;40m'"\033[1m"
    printf "\n"
#####  BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
    elif [[ "$m" == "11" ]]; then
    ## Choose Exchange

i=1
while [ $i = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "Choose an exchange"
echo -e '\E[33;40m'"\033[1m"
echo "CoinBase     = 1"
echo "CoinBase     = 2"
echo "CoinBase v3  = 3"
echo
read -p "Type a number [1, 2, 3] :" x

   case $x in

    1) ENDPOINT=$ENDPOINT1
    #skey1=$COINBASE_KEY
    #skey2=$COINBASE_SECRET
    i=0
    ;;
    2) ENDPOINT=$ENDPOINT2
    #skey1=$COINBASE_KEY
    #skey2=$COINBASE_SECRET
    i=0
    ;;
    3) ENDPOINT=$ENDPOINT3
    #skey1=$COINBASE_KEY
    #skey2=$COINBASE_SECRET
    i=0
    ;;
    *)
    i=1;;

  esac
done
echo -e '\E[32;40m'"\033[1m"

##################################################################################
      elif [[ "$m" == "12" ]]; then
    ## T E S T I N G
j=1
i=1
while [ $j = 1 ] ; do
clear
echo -e '\E[32;40m'"\033[1m"
echo "TESTING"
echo -e '\E[33;40m'"\033[1m"
echo "TEST Menu     = 0"
echo "Pub LIST Prod = 1"
echo "Skeleton      = 2"
echo
read -p "Type a number [0, 1, 2] :" x

   case $x in

    0) clear
    echo -ne '\n' | showMenu
    #$x=$0
    j=0
    i=0
    ;;

    1)
#########################################################################
########################################################################################
# LIST PUBLIC PRODUCTS
# GET https://api.coinbase.com/api/v3/brokerage/market/products
# curl -L -X GET 'https://api.coinbase.com/api/v3/brokerage/market/products?product_id=BTC-USD&limit=10'
# https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_getpublicproducts
############################################################################################
# Get a list of the available currency pairs for trading.
clear
columns=$(tput cols)
lines=$(tput lines)
fold -w "$columns" -bs DOCS/public_products.txt
echo

array_gap=("TRUE" "FALSE")
array_prodtype=("SPOT" "FUTURE" "UNKNOWN_PRODUCT_TYPE")
array_expiry_type=("EXPIRING" "PERPETUAL" "UNKNOWN_CONTRACT_EXPIRY_TYPE")
array_expiring_contract_status=("STATUS_ALL" "STATUS_EXPIRED" "STATUS_UNEXPIRED" "UNKNOWN_EXPIRING_CONTRACT_STATUS")

    method="GET"
    offset0="offset"
    product_type0="product_type"
    product_ids0="product_ids"
    contract_expiry_type0="contract_expiry_type"
    expiring_contract_status0="expiring_contract_status"
    limit0="limit"
    limit1=""
    offset1=""
    product_type1=""
    product_ids1=""
    contract_expiry_type1=""
    expiring_contract_status1=""
    get_all_products0="get_all_products"
    get_all_products1=""
    requestpath="/api/v3/brokerage/market/products"

    read -p "Enter limit of how many products to return : " limit1
    read -p "Enter offset number : " offset1
    read -p "Enter Product Type (1=SPOT, 2=FUTURE, 3=UNKNOWN_PRODUCT_TYPE : )" index2
    index2=$(($index2 - 1))
    product_type1=${array_prodtype["index2"]}

   declare -a order_array
   declare -a new_order_array
   echo
   echo
   echo -e '\E[31;40m'"\033[1m"
   echo "Be sure to press ENTER after every entry. Then "
   echo "Use <CTRL> d when finished."
   echo "(If leaving blank, do not press Enter. Just press <CTRL> d)"
   echo -e '\E[32;40m'"\033[1m"
   echo "Enter PRODUCT id(s) (MUST BE UPPERCASE ex. BTC-USD): "
   k=0
   while read line
   do
    lines="$line"
    lines+=(\""$line"\",)
    order_array=("${order_array[@]}" \""$lines"\",)
    order_array=( "${order_array[@]}" )
    new_order_array[$k]=$(echo ${product_ids0}${eq1}${order_array[$k]}${amps})
    k=$(expr $k + 1)
    line=""
   done

body0=${new_order_array[*]}
BODY1=$(echo ${body0} | sed 's/\(.*\),/\1 /' | awk '{print "["$0"]"}' | sed 's/[][]//g' | sed 's/"//g' | sed 's/.$//' | tr -d "," | tr -d ' ' )

    read -p "Enter contract_expiry_type (1=EXPIRING, 2=PERPETUAL, 3=UNKNOWN_CONTRACT_EXPIRY_TYPE) : " index3
    index3=$(($index3 - 1))
    contract_expiry_type1=${array_expiry_type["index3"]}
    echo

    read -p "Enter expiring_contract_status (1=STATUS_ALL, 2=STATUS_EXPIRED, 3=STATUS_UNEXPIRED, 4=UNKNOWN_EXPIRING_CONTRACT_STATUS) : " index4
    index4=$(($index4 - 1))
    expiring_contract_status1=${array_expiring_contract_status["index4"]}
    echo

    read -p "Do you want to get all Products (1=TRUE, 2=FALSE) : " index1
    index1=$(($index1 - 1))
    get_all_products1=${array_gap["index1"]}
    echo

    BODY="${qmark}${limit}${eq1}${limit1}${amps}${offset0}${eq1}${offset1}${amps}${product_type0}${eq1}${product_type1}${amps}${BODY1}${amps}${contract_expiry_type0}${eq1}${contract_expiry_type1}${amps}${expiring_contract_status0}${eq1}${expiring_contract_status1}${amps}${get_all_products0}${eq1}${get_all_products1}"
    echo ${BODY}
    read -p "Press ENTER to continue: " n

 TIMESTAMP=$(date +%s)
 SIG=$(echo -n "${TIMESTAMP}${method}${requestpath}" | openssl dgst -sha256 -hmac "$COINBASE_SECRET" |cut -d' ' -f2);

   ( curl -L -s "${BENDPOINT}${requestpath}${BODY}" \
    -X ${method}  \
    -H 'Content-Type: application/json' \
    --header "CB-ACCESS-KEY: $COINBASE_KEY" \
    --header "CB-ACCESS-SIGN: $SIG" \
    --header "CB-ACCESS-TIMESTAMP: $TIMESTAMP" \
    --header "CB-VERSION: $CBVERSION" | jq -r . > CB-output.json )
    $editor CB-output.json

#########################################################################
    i=0
    ;;
    2)
    #####################################################################
echo "two"
#########################################################################

#########################################################################
    i=0
    ;;
    *)
    j=0
    i=1;;

  esac
done
echo -e '\E[32;40m'"\033[1m"
#######################################################################################
printf "\n"
  fi
  showMenu
  m=$?
done

########################################################################################
# Readme.md
#
# 0. It is advised to read all of the text and as much code as you can in this script.
# 1. Please do not misuse or abuse the Coinbase© API.
# 2. You must have an account on Coinbase© as well as API key:secret pair to use this script.
# 3. Some of the options have [defaults] where you can just press [ENTER] to accept the default.
# 4. This script has only been tested on Debian Linux in a bash shell using Konsole terminal emulator.
# 5. Do not run this script as root. It is not needed.
# 6. This script depends on curl, jq, uuidgen and fold to be installed on your system.                                                                  #
######################################################################################
clear
exit 0;
