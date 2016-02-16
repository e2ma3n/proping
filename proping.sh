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

for (( ;; )) ; do
	ping $1 -c 1 &> /dev/null
	if [ "$?" = "0" ] ; then
		echo "[+] $1 is up"
		zenity --timeout=1 --notification --text "$1 is up now" &> /dev/null
		exit 0
	else
		echo "[-] Host is down, whait 5 second"
		sleep 5
	fi
done
