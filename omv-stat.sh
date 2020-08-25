#!/bin/bash

RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
WHITE=$'\e[1;37m'

PUBLIC_IP=`wget http://ipecho.net/plain -O - -q ; echo`
echo "$RED IP PUBLIQUE"
echo $PUBLIC_IP >> domains.txt
echo "$GREEN$PUBLIC_IP"

#sudo apt-get install geoip-bin
geoiplookup $PUBLIC_IP
rm domains.txt

#DISKUSAGE
echo "$BLUE DISKUSAGE"
DISKUSAGE=`df -t ext4 -H ; echo`
echo "$GREEN $DISKUSAGE"

#SENSORS
#sudo apt install sensors
echo $RED "SENSORS"
SENSORS=`sensors ; echo`
echo $GREEN "$SENSORS"

#DOCKER Containers
echo $WHITE "DOCKER Containers"
CONTAINERS=`docker ps --format "{{.ID}}: {{.Names}}: {{.Image}}: {{.Ports}}" ; echo`
echo $GREEN "$CONTAINERS"

#DOCKER Networks
echo $WHITE "DOCKER Networks"
Networks=`docker network ls ; echo`
echo $GREEN "$Networks"
