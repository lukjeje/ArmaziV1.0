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

cat radar.txt

echo ""
iwconfig
echo ""

echo -e "${blue}write your ${red}!exact!${clear} wifi card name which is in monitor mode:${clear} or type 'exit' to go in main menu"
echo "---------------------------------------------------"
echo ""
read -p "name>>" name
echo ""

air() {
  echo "-----------------------------------------------------------------------------------------------------------------"  
  airodump-ng ${name} -w radarsave/radar.txt
  echo "-----------------------------------------------------------------------------------------------------------------"
  echo -e "${blue}you can use information above or you can see save file of this in ${green}/radarsave${clear}${clear}"
  echo ""
  bash ./radar.sh
}

x=$(ifconfig -a | sed 's/[ \t].*//;/^$/d')

if [[ $x == *"$name"* ]]; then
    air

  elif [ $name = "exit" ]; 
    then
    bash ./armazi.sh

  else
    echo -e "${red}there is no card named $name !!!${clear}"
    bash radar.sh
fi
