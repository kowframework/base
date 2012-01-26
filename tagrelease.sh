#!/usr/bin/env bash




PKGLIST=pkglist

RELEASE_ROOT=$HOME/releases

if [ ! -f $PKGLIST ]
then
	echo File not found :: $PKGLIST
	exit -1
fi



for pkg in `cat $PKGLIST`
do
	VERSION=`cat "$pkg/version"`

	pushd "$pkg"
	git tag "$VERSION"
	git push origin "$VERSION"
	popd
done
