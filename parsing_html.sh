#!/bin/bash
echo "Digite o domínio:"
read domain
GREEN="\033[32m"
RESET="\033[0m"

wget $domain > /dev/null 2>&1;
grep href index.html | grep "href" | cut -d '"' -f 2 | egrep "http|https" | cut -d "/" -f 3 > lista.txt
echo "========================================================================================"
echo -e "${GREEN}PARSING HTML:${RESET}"
echo "========================================================================================"
for site in $(cat lista.txt);
do
host $site | grep "has address" | sed "s/has address/-/";
done
echo "========================================================================================"
echo -e "${GREEN}As urls completas encontradas foram:${RESET}"
echo "========================================================================================"
grep href index.html | grep "href" | cut -d '"' -f 2 | egrep "http|https" 
rm lista.txt
rm index.html
 
