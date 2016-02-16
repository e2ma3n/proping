#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Gitbub : https://github.com/e2ma3n
# Email : e2ma3n@Gmail.com
# Website : http://OSLearn.ir
# License : GPL v3.0
# proping v2.0 [ping from destination]
#--------------------------------------------------------#

# check root privilege
[ "`whoami`" != "root" ] && echo -e '[-] Please use root user or sudo' && exit 1


# help function
function help_f {
	echo "Usage: "
	echo "	sudo ./install.sh -i [install program]"
	echo "	sudo ./install.sh -c [check dependencies]"
}


# check dependencies on system
function check_f {
	echo "[+] check dependencies on system:  "
	for program in whoami ping zenity sleep
	do
		if [ ! -z `which $program 2> /dev/null` ] ; then
			echo -e "[+] $program found"
		else
			echo -e "[-] Error: $program not found"
		fi
	done
}


# install program clearly
function install_f {
	[ ! -d /opt/proping_v2/ ] && mkdir -p /opt/proping_v2/ && echo "[+] Directory created" || echo "[-] Error: /opt/proping_v2/ exist"
	sleep 1
	[ ! -f /opt/proping_v2/proping.sh ] && cp proping.sh /opt/proping_v2/ && chmod 755 /opt/proping_v2/proping.sh && echo "[+] proping.sh copied" || echo "[-] Error: /opt/proping_v2/proping.sh exist"
	sleep 1
	[ -f /opt/proping_v2/proping.sh ] && ln -s /opt/proping_v2/proping.sh /usr/bin/proping && echo "[+] symbolic link created" || echo "[-] Error: symbolic link not created"
	sleep 1
	[ ! -f /opt/proping_v2/README ] && cp README /opt/proping_v2/README && chmod 644 /opt/proping_v2/README && echo "[+] README copied" || echo "[-] Error: /opt/proping_v2/README exist"
	sleep 1
	echo "[+] Please see README"
}


case $1 in
	-i) install_f ;;
	-c) check_f ;;
	*) help_f ;;
esac
