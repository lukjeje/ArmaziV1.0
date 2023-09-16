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

cat monitor.txt

echo ""

startF() {    
echo ""
echo "to go in armazi's main page type 'exit'"
echo "--------------------------------------"
echo " "
iwconfig
echo ""

read -p "$(echo -e ${green}card-name${clear})>>" -r "cn"
echo " "
x=$(ifconfig -a | sed 's/[ \t].*//;/^$/d')

if [[ $x == *"$cn"* ]]; then
    mainF

  elif [ $cn = "exit" ]; 
    then
    bash ./armazi.sh

  else
    echo -e "${red}there is no card named $cn !!!${clear}"
    startF
fi

}

mainF() {

x=$(iwconfig $cn | grep "Monitor")

echo "----------------------------------------------"
echo "to turn on/off Monitor mode type 'on' or 'off' or 'exit' for exit."
echo "----------------------------------------------"

read -p "$(echo -e ${green}input${clear})>>" -r "inp"

if [[ $inp = "off" || $inp = "on" || $inp = "exit" ]]; then
   
    if [[ $inp = "on" ]]; then
     if [[ ${#x} > 2 ]]; then
      echo " "
      echo -e "${red}card is allredy in monitor mode!!!!${clear}"
      echo -e "${red}***********************************${clear}"
      mainF
     else
     ifconfig $cn down
     airmon-ng check kill 
     iwconfig $cn mode monitor
     ifconfig $cn up
     iwconfig
     echo " "
     mainF  
     fi
    fi

    if [[ $inp = "off" ]]; then
     if [[ ${#x} < 2 ]]; then
        echo " "
        echo -e "${red}card is not in monitor mode!!!!${clear}"
        echo -e "${red}*******************************${clear}"
        mainF
     else
        ifconfig $cn down
        iwconfig $cn mode Managed
        ifconfig $cn up
        iwconfig
        echo " "
        systemctl restart NetworkManager
     mainF
      fi
    fi

    if [[ $inp = "exit" ]]; then
        startF
    fi

else
    echo " "
    echo -e "${red}wrong input!${clear}"
    echo " "
    mainF
fi

}

startF

