#!/bin/bash

#check if script is running as a root.

if [ $UID -ne 0 ]; then
	echo "Run this script as a root user"
	exit 1
else
	echo "Running as a root user !!!"
fi


packages=("nginx" "curl" "wget")

for pkg in ${packages[@]}; do
	if dpkg -s $pkg &>/dev/null; then
		echo "Package &pkg is already installed."
	else
		echo " Installing the $pkg !!!!!"
		apt install $pkg -y &>/dev/null
		echo "Pcakage installation successfull"
	fi
done
