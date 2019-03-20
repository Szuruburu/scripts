#!/bin/bash
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

ssroot="$(date +%F_%H-%M-%S)"

# how many sessions is there
sessioncount="$(loginctl --no-legend | awk '{print $1}' | wc -l)"

for i in $(seq 1 $sessioncount)
do
	x=$(expr $i - 1)
	#echo Hi $i, $x
	sessionid[$x]="$(loginctl --no-legend | awk '{print $1}' | cut -d $'\n' -f $i)"
done

for item in ${sessionid[*]}
do
	sessionactive="$(loginctl show-session $item --property=Active | cut -d '=' -f 2)"
	echo $item = $sessionactive

	if [ $sessionactive = "yes" ]
	then
		sessionservice="$(loginctl show-session 5 --property=Service | cut -d '=' -f 2)"

		if [ $sessionservice = "sddm" ]
		then
			import -window root -quiet -silent /home/szuruburu/pix/.ssmakefiles/$ssroot.jpg
		fi
	fi
		done

