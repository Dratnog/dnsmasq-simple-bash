#!/bin/bash

# --------------------------
# Written by Dratnog
# https://github.com/Dratnog
# --------------------------

./check-installation-package.sh dnsmasq

dns_file=/etc/hosts

echo "Enter new host [hostname] : "
read new_host_name

echo "Enter new host [IP] : "
read new_host_ip



echo $'\n'"=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo ">>> DNS file is" $dns_file $'\n'



echo $'\n'"=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo ">>> File aspect before adding new host :"$'\n'
cat $dns_file


#Adding new host :
echo -e $new_host_ip"\t"$new_host_name".local\t\t"$new_host_name >> $dns_file


echo $'\n'"=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo ">>> File aspect with new host added :"$'\n'
cat $dns_file



echo $'\n'"=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo ">>> Host ["$new_host_name"/"$new_host_ip"] added to ["$new_host_name".local] domain in" $dns_file $'\n'

#EOF
