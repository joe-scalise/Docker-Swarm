#!/bin/bash

check_exit_status() {

	if [ $? -eq 0 ]
	then
		echo "Success"
	else
		echo
		echo "[ERROR] Process Failed! Exiting."
		echo

		read -p "The last update command failed.  Exit script? (yes/no) " answer

		if [ "$answer" == "yes" ]
		then
			exit 1
		fi
	fi
}

hello() {

	echo
	echo "Hello, $USER. Let's update this system."
	echo
}

update() {

	sudo apt-get update;
	check_exit_status

	sudo apt-get upgrade -y;
	check_exit_status

	sudo apt-get dist-upgrade -y;
	check_exit_status

	sudo apt-get autoremove -y;
	check_exit_status

	sudo apt-get autoclean -y;
	check_exit_status

	sudo updatedb;
	check_exit_status
}

leave() {

	echo "Update Complete."
	exit
}

hello
update
leave
