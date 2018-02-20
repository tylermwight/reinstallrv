#!/bin/bash
url="http://install-versions.risevision.com/installer-lnx-32.sh"
outpath="$HOME/installer-lnx-32.sh"
dte=$(date +%Y-%m-%d)
name="$(whoami)"

echo "$HOME/rvplayer"

if [ -d "$HOME/rvplayer_$dte" ]; then
	rm -rf $HOME/rvplayer_$dte
	echo "Install from same day found, removing"
fi


if [ -d "$HOME/rvplayer" ]; then
	mv $HOME/rvplayer $HOME/rvplayer_$dte
	echo "old install renamed"
else
	echo "rvplayer not installed"
	exit
fi
	
	
if [ -f "$HOME/installer-lnx-32.sh" ]; then
	rm $HOME/installer-lnx-32.sh
	echo "old script found, deleting"
fi


wget -O "$HOME/installer-lnx-32.sh" $url
bash $HOME/installer-lnx-32.sh
