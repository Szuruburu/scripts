#!/bin/bash

working_dir="~/.config/make_js_projects/"
config_file="config"
OUTPUT="/tmp/input.txt"

# create empty file
>$OUTPUT

mkdir -p "$working_dir"

function sayhello(){
	local n=${@-"anon"}
	#display it
	dialog --title "Hello" --clear --msgbox "Hello ${n}, let us be friends!" 10 41
}

# cleanup  - add a trap that will remove $OUTPUT
# if any of the signals - SIGHUP SIGINT SIGTERM it received.
trap "rm $OUTPUT; exit" SIGHUP SIGINT SIGTERM

dialog --title "JavaScript Dev Tree Creator" \
	--backtitle "Project name" \
	--inputbox "Enter project name: " 8 60 2>$OUTPUT

# get respose
respose=$?

# get data stored in $OUPUT using input redirection
project_name=$(<$OUTPUT)

dialog \
	--title "Make your ${project_name} directory structure" \
	--menu "\n" 10 60 6 1 "RUN" 2 "Change projects root folder" 3 "Edit folders tree"

# # make a decsion
# case $respose in
#     0)
#         sayhello ${project_name}
#         clear
#     ;;
#     1)
#         clear
#         echo "Cancel pressed."
#     ;;
#     255)
#         clear
#         echo "[ESC] key pressed."
# esac

# remove $OUTPUT file
rm $OUTPUT

# OK is pressed
if [ "$?" = "0" ]
	then
		_return=$(cat working_dir)

	# /home is selected
	if [ "$_return" = "1" ]
	then
			dialog --title "List file of directory /home" --msgbox "$(ls /home -l)" 100 100
	fi

	 # /root is selected
	if [ "$_return" = "2" ]
	then
			dialog --title "List file of directory /root" --msgbox "$(ls /root -l)" 100 100
	fi

	 # /tmp is selected
	if [ "$_return" = "3" ]
	then
			dialog --title "List file of directory /tmp" --msgbox "$(ls /tmp -l)" 100 100
fi

	# Cancel is pressed
else
clear
echo "Cancel is pressed"
fi


project_name="/tmp/mjsp-pname"



printf "You have entered: $project_name\n"

cd ~/dev/



mkdir -p "$project_name"
printf "Created $HOME/dev/\e[1m\e[31m$project_name \e[0mfolder\n"
mkdir -p "$project_name"/src
printf "Created $HOME/dev/$project_name/\e[1m\e[31msrc \e[0mfolder\n"
mkdir -p "$project_name"/styles
printf "Created $HOME/dev/$project_name/\e[1m\e[31mstyles \e[0mfolder\n"
