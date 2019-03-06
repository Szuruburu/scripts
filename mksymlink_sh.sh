#!/bin/bash

dir=~/scripts
files="eb.sh hypercaps.sh"

echo Where?
read outdir

cd $dir

for file in $files; do
	ext="${file##*.}"
	if [[ $ext =~ sh ]]; then
		sfile="${file%%.*}"
	fi
	sudo ln -sf $dir/$file $outdir/$sfile
done


