#!/bin/bash


packages=("nginx" "curl" "wget")


for pkg in ${packages[@]}; do
	if dpkg -s $pkg &>/dev/null; then
		echo "package $pkg is already installed."
	else
		echo "Package $pkg is installing....."
		apt install $pkg &>/dev/null
		echo "Pacakge $pkg is installed now."
	fi
done
