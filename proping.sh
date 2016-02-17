#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Gitbub : https://github.com/e2ma3n
# Email : e2ma3n@Gmail.com
# Website : http://OSLearn.ir
# License : GPL v3.0
# proping v2.0 [ping from destination]
#--------------------------------------------------------#

# check number of arguments
[ "$#" != "1" ] && echo "[-] Error: Bad argument" && echo "[+] See help : proping -h" && exit 1

# check argument for show help mode
if [ "$1" = "-h" ] ; then
	echo "Usage: "
	echo "   proping [IP Address] : for check host's status"
	exit 0
fi

# check ip address
re='^[0-9]+$'
if ! [[ `echo $1 | tr -d .` =~ $re ]] ; then
	echo "[-] Error: $1 Not a IP address" 
	echo "[+] See help : proping -h"
	exit 1
fi

for (( i=1 ;; i++ )) ; do
	ping $1 -c 1 &> /dev/null
	p=$?
	if [ "$p" = "0" ] ; then
		[ "$j" = "1" ] && echo
		echo -e "[+] $1 is up"
		if [ "$i" -gt "3" ] ; then
			zenity --timeout=1 --notification --text "$1 is up now" &> /dev/null
		fi
		exit 0
	elif [ "$p" = "1" ] ; then
		echo -en "[-] $i ICMP echo request sended, no response from destination\r"
		j=1
		sleep 5
	else
		echo "[-] Error !"
		exit 1
	fi
done
