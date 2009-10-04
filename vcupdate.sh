#! /bin/bash
#  
#

if [ -d CVS/ ]; then
	cvs update
elif [ -d .git/ ]; then
	git pull
elif [ -d .bzr/ ]; then
	bzr pull
elif [ -d .hg/ ]; then
	hg pull
	hg update
elif [ -d .svn/ ]; then
	svn update
fi
