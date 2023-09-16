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


echo " "
cat armazi.txt
echo -e "${blue}Choose the tool you want to use:${clear}" 
echo " "
echo -e "${green}1) monitor mode tool('use it to turn of/off monitor mode on your divice')${clear}"
echo ""
echo -e "${green}2) radar tool('use it to see all wifi points and its information around you ${red}Reqaiers monitor mode!!${clear}')${clear}"
echo ""
echo -e "${green}3) deauth tool('use it to deauthenticate all users from wifi acess point ${red}Reqaiers monitor mode!!${clear}')${clear}"
echo " "
echo -e "${green}4) handshake tool('use it to capture wpa2 handshake from wifi acess point ${red}Reqaiers monitor mode!!${clear}')${clear}"
echo " "
echo -e "${green}5) pcarak tool('use it to crack wifi password from hack.cap file ${red}Reqaiers monitor mode!!${clear}')${clear}"
echo " "
read -p ">>" number  

if [ ${number} -eq 1 ];
then
bash ./monitor.sh
elif [ ${number} -eq 2 ]
then
bash radar.sh
elif [ ${number} -eq 3 ]
then
bash deauth.sh
elif [ ${number} -eq 4 ]
then
bash handshake.sh
elif [ ${number} -eq 5 ]
then
bash pcrack.sh
else
echo ""
echo "no valid input"
echo ""
bash ./armazi.sh
fi
