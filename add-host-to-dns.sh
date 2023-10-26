#!/bin/bash

# --------------------------
# Written by Dratnog
# https://github.com/Dratnog
# --------------------------

#Ask for sudo
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

dns_file=/etc/hosts

source ./check-installation-package.sh dnsmasq

if [[ $SIMPLE_BASH_PACKAGE_DETECTED != "false" ]]; then

	echo $'\n'"Enter new host [hostname] : "
	read new_host_name

	echo $'\n'"Enter domain name :"
	read domain_name

	echo $'\n'"Enter new host [IP] : "
	read new_host_ip


	echo $'\n'"=-=-=-=-=-=-=-=-=-=-=-=-=-="
	echo ">>> DNS file is" $dns_file $'\n'


	echo $'\n'"=-=-=-=-=-=-=-=-=-=-=-=-=-="
	echo ">>> File aspect before adding new host :"$'\n'
	cat $dns_file


	#Adding new host :
	echo -e $new_host_ip"\t"$new_host_name"."$domain_name"\t\t"$new_host_name >> $dns_file


	echo $'\n'"=-=-=-=-=-=-=-=-=-=-=-=-=-="
	echo ">>> File aspect with new host added :"$'\n'
	cat $dns_file


	echo $'\n'"=-=-=-=-=-=-=-=-=-=-=-=-=-="
	echo ">>> Host ["$new_host_name"/"$new_host_ip"] added to ["$new_host_name"."$domain_name"] domain in" $dns_file $'\n'
fi

unset SIMPLE_BASH_PACKAGE_DETECTED

#EOF
