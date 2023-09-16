#!/bin/bash

# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
# Clear the color after that
clear='\033[0m'
echo ""

cat pcrack.txt

echo ""
echo -e "here is ${red}handshake${clear} folder content and your hack files:"
echo "------------------------------------------------------"
echo " "
ls -la handshake
echo " "
echo "------------------------------------------------------"
echo -e "${blue}write your captured "hack.cap" file and worldist location here${clear} or type 'exit' to go in main menu"
echo "---------------------------------------------------"
echo ""
read -p "CAPfile>>" name

if [ ${name} = "exit" ];
then
bash ./armazi.sh
fi

read -p "WordList>>" word

echo ""

air() {
  aircrack-ng ${name} -w ${word} | tee
  bash ./armazi.sh
}

air