#!/bin/bash
echo "Which user should get the .bashrc?: "
read CP_USER
CURRENT_USER="$(whoami)"

echo "Copying .bashrc to $CP_USER"

if [ "$CURRENT_USER" = "root" ]; then
	sudo cp /root/.bashrc /home/$CP_USER/
else
	if [ "$CP_USER" = "root" ]; then
		sudo cp /home/$CURRENT_USER/.bashrc /root/
	else
		sudo cp /home/$CURRENT_USER/.bashrc /home/$CP_USER/
	fi
fi

echo "Done"
