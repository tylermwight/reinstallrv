#!/bin/bash
url="http://install-versions.risevision.com/installer-lnx-armv7l.sh"
outpath="$HOME/installer-lnx-armv7l.sh"
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
	
	
if [ -f "$HOME/installer-lnx-armv7l.sh" ]; then
	rm $HOME/installer-lnx-armv7l.sh
	echo "old script found, deleting"
fi


wget -O "$HOME/installer-lnx-armv7l.sh" $url
bash $HOME/installer-lnx-armv7l.sh
