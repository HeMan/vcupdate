#! /bin/bash

if [ -d CVS/ ]; then
	cvs update
elif [ -d .svn/ ]; then
	svn update
elif [ -d .git/ ]; then
	git pull
fi
