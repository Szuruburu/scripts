#!/bin/bash

# set variables
app_title="JavaScript Dev Tree Creator"
HOME="/home/szuruburu"
working_dir="$HOME/.config/make_js_projects"
project_name="$working_dir/project_name"
project_root="$working_dir/project_root"
menu_choice="$working_dir/mc"


function sayhello() {
	local n=${@-"anon"}
	#display it
	dialog --title "Hello" --clear --msgbox "Hello ${n}, let us be friends!" 10 41
}

function exit_program() {
	clear
	rm $menu_choice
	rm $working_dir/project_name
}

function showMainMenu() {
	rm $menu_choice
	dialog --title "Make your ${project_name} directory structure" \
		--menu "\n" 10 60 6 1 "RUN" 2 "Change projects root folder" 3 "Edit folders tree" 2>$menu_choice
}

# create files
>$project_name
if [ -f "$project_root" ]
then
	# file present
	root_set=1
else
	echo "dev" > $project_root
fi

mkdir -p $working_dir

# cleanup  - add a trap that will remove $OUTPUT
# if any of the signals - SIGHUP SIGINT SIGTERM it received.
trap "rm $project_name; exit" SIGHUP SIGINT SIGTERM
trap "rm $project_root; exit" SIGHUP SIGINT SIGTERM

dialog --title "$app_title" \
	--backtitle "Project name" \
	--inputbox "Enter project name: " 8 60 2>$project_name

# get respose
respose=$?

# get data stored in $OUPUT using input redirection
project_name=$(<$project_name)

# dialog \
#     --title "Make your ${project_name} directory structure" \
#     --menu "\n" 10 60 6 1 "RUN" 2 "Change projects root folder" 3 "Edit folders tree" 2>$menu_choice

showMainMenu

# OK is pressed
if [ "$?" = "0" ]
	then
        _return=$(cat $menu_choice)

	# RUN
	if [ "$_return" = "1" ]
	then
		clear
		printf "Creating your \"$project_name\" project\n"
		printf "\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\u2550\n"
		cd ~/dev/
		mkdir -p "$project_name"
		printf "Created $HOME/dev/\e[1m\e[31m$project_name \e[0mfolder\n"
		mkdir -p "$project_name"/src
		printf "Created $HOME/dev/$project_name/\e[1m\e[31msrc \e[0mfolder\n"
		mkdir -p "$project_name"/styles
		printf "Created $HOME/dev/$project_name/\e[1m\e[31mstyles \e[0mfolder\n"

		printf "Deleted temp files\n"
		rm $menu_choice
		rm $working_dir/project_name
	fi

	 # Change root folder
	if [ "$_return" = "2" ]
	then
		dialog --title "$app_title" \
			--backtitle "Project root folder" \
			--inputbox "Enter root folder name: " 8 60 2>$project_root

		# get respose
		respose=$?

		# get data stored in $OUPUT using input redirection
		project_root=$(<$project_root)

		showMainMenu
	fi

	 # /tmp is selected
	if [ "$_return" = "3" ]
	then
			dialog --title "List file of directory /tmp" --msgbox "$(ls /tmp -l)" 100 100
fi


# Cancel is pressed
else
	exit_program
fi

