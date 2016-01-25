#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Email : e2ma3n@Gmail.com
# Github : http://Github.com/e2ma3n
# Website : http://OSLearn.ir
# License : GPL v3.0
# status v1.0 [ping from dst]

# check number of arguments
[ "$#" != "1" ] && echo "[-] Error: Bad argument" && echo "[+] See help : $0 -h" && exit 1

# check argument for show help mode
if [ "$1" = "-h" ] ; then
	echo "Usage: "
	echo "   $0 [IP Address] : for check host's status"
	echo "   $0 -u : for uninstall program"
	exit 0
fi

# check argument for show uninstall mode
if [ "$1" = "-u" ] ; then
	[ "`whoami`" != "root" ] && echo -e '[-] Please use root user or sudo' && exit 1
	[ `rm -f /usr/bin/status &> /dev/null` ] && echo "[+] /usr/bin/status removed" || echo "[-] Error : /usr/bin/status not removed"
	exit 0
fi

i="0" ; j="0"
for (( i=1 ;; i++ )) ; do
	ping $1 -c 1 &> /dev/null
	if [ "$?" = "0" ] ; then
		echo "[+] $1 is up"
		if [ 3 -lt $i ] ; then
			zenity --timeout=1 --notification --text "$1 is up now" &> /dev/null
		fi
		exit 0
	fi
	sleep 3 ; b=$[$i%20]
	[ "$b" = "0" ] && j=$[$j+2] && echo "[!] $j minutes passed ..."
done
