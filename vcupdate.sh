#! /bin/bash
#  
#

if [ -d CVS/ ]; then
	cvs update
elif [ -d .git/ ]; then
	git pull
elif [ -d .bzr/ ]; then
	bzr upgrade
elif [ -d .svn/ ]; then
	svn update
fi
