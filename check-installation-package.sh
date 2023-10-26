#!/bin/bash

# --------------------------
# Written by Dratnog
# https://github.com/Dratnog
# --------------------------


if [[ $1 = "" ]]; then
	echo "Script usage : ./check-installation-package.sh <package name>"
else
	package_name=$1
	package_status=$(dpkg-query --show --showformat='${Status}\n' $package_name)
	package_name_pretty="[$package_name]"

	if [ "$package_status" != "install ok installed" ]; then
		echo "Do you want to install $package_name_pretty (if no, the script will end) ? [Y/n]"
		read package_installation_user_choice

		while [ "$package_installation_user_choice" = "Y" ] || [ "$package_installation_user_choice" != "y" ] || [ "$package_installation_user_choice" != "yes" ] || [ "$package_installation_user_choice" = "N" ] || [ "$package_installation_user_choice" != "n" ] || [ "$package_installation_user_choice" != "no" ];
		do
			if [ "$package_installation_user_choice" = "Y" ] || [ "$package_installation_user_choice" = "y" ] || [ "$package_installation_user_choice" = "yes" ]; then
				echo "Installating $package_name_pretty."
				sudo apt -y install $package_name
				break
			elif [ "$package_installation_user_choice" = "N" ] || [ "$package_installation_user_choice" = "n" ] || [ "$package_installation_user_choice" = "no" ]; then
				echo "Installation cancelled."
				break
			else
				echo "Please enter \"Y\", \"y\" or \"yes\" to install $package_name_pretty or \"N\", \"n\" or \"no\" to cancel the script."
				read package_installation_user_choice
			fi
		done
	else
		echo "$package_name is installed."
	fi

fi

#EOF
