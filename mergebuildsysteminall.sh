#!/usr/bin/env bash
#
# Installs the update build system in every repository in ..





for i in ../*/
do
	rp=`realpath "$i"`
	here=`realpath .`

	if [[ "$rp" = "$here" ]]
	then
		echo "Skipping $here"
	else
		cp -rp buildsystem/* $rp/
	fi
done
