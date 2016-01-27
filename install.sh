#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Email : e2ma3n@Gmail.com
# Github : http://Github.com/e2ma3n
# Website : http://OSLearn.ir
# License : GPL v3.0
# status v1.0 [ping from dst]

# check root privilege
function privilege {
	[ "`whoami`" != "root" ] && echo -e '[-] Please use root user or sudo' && exit 1
}

# help function
function usage {
	echo "Usage: "
	echo "	sudo $0 -i [install program]"
	echo "	sudo $0 -h [help function]"
	echo "	sudo $0 -c [check dependencies on system]"
}

# check dependencies on system
function check {
	echo "[+] check dependencies on system:  "
	for program in ping sleep zenity whoami ; do
		[ ! -z `which $program` ] && echo -e "[+] $program found" || echo -e "[-] Error: $program not found"
	done
}

# install program clearly
function install {
	privilege
	echo "[+] Installing program ..."
	[ -d /usr/bin/ ] && cp status.sh /usr/bin/status && chmod 755 /usr/bin/status && echo "[+] Done" || echo "[-] Error: /usr/bin/ not found"
}

case $1 in
	-c) check ;;
	-i) install ;;
	-h) usage ;;
	*) echo "[-] Error: Bad argument" 
		echo "[+] See help : $0 -h" ;;
esac
