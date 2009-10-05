#! /bin/bash

#
# vcupdate updates the current directory from any VCS no
# matter what VC is used in that directory.
# Currently supports CVS, GIT, Bazaar, Mercurial and Subversion
#
# Copyright 2009 Jimmy Hedman <jimmy.hedman@southpole.se>
#
# vcupdate is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License
#

if [ $# -gt 0 ]; then
	if [ "$1" = "-h" ]; then
		echo "vcupdate updates the current workin directory from VCS"
		echo "no matter what VC was used"
		exit 0
	fi
fi

if [ -d CVS/ ]; then
	if which cvs > /dev/null; then
		cvs update -Pd
		RETVAL=$?
	else
		echo "You need CVS to update this directory"
	fi
elif [ -d .git/ ]; then
	if which git > /dev/null; then
		git pull
		RETVAL=$?
	else
		echo "You need GIT to update this directory"
	fi
elif [ -d .bzr/ ]; then
	if which bzr > /dev/null; then
		bzr pull
		RETVAL=$?
	else
		echo "You need Bazaar to update this directory"
	fi
elif [ -d .hg/ ]; then
	if which hg > /dev/null; then
		hg pull
		hg update
		RETVAL=$?
	else
		echo "You need Mercurial to update this directory"
	fi
elif [ -d .svn/ ]; then
	if which svn > /dev/null; then
		svn update
		RETVAL=$?
	else
		echo "You need Subversion to update this directory"
	fi
else
	echo "No known VC was used for this directory"
	RETVAL=1
fi

exit $RETVAL
