#! /bin/bash
#  
#

if [ -d CVS/ ]; then
	if which cvs > /dev/null; then
		cvs update -Pd
	else
		echo "You need CVS to update this directory"
	fi
elif [ -d .git/ ]; then
	if which git > /dev/null; then
		git pull
	else
		echo "You need GIT to update this directory"
	fi
elif [ -d .bzr/ ]; then
	if which bzr > /dev/null; then
		bzr pull
	else
		echo "You need Bazaar to update this directory"
	fi
elif [ -d .hg/ ]; then
	if which hg > /dev/null; then
		hg pull
		hg update
	else
		echo "You need Mercurial to update this directory"
	fi
elif [ -d .svn/ ]; then
	if which svn > /dev/null; then
		svn update
	else
		echo "You need Subversion to update this directory"
	fi
fi
