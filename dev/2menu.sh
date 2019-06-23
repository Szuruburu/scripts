#!/bin/sh
dialog --menu "List file of a directory" 13 30 4 1 /home 2 /root 3 /tmp 2>temp


# OK is pressed
if [ "$?" = "0" ]
then
        _return=$(cat temp)

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

# remove the temp file
rm -f temp
