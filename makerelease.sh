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
	PACKAGE=`basename $pkg`
	VERSION=`cat "$pkg/version"`
	PKG_VERSION=$PACKAGE-$VERSION

	# This might be good when we have too many releases:
	#PKG_ROOT=$RELEASE_ROOT/$PACKAGE
	PKG_ROOT=$RELEASE_ROOT
	PKG_DIR=$PKG_ROOT/$PKG_VERSION
	
	echo -n Working on $PKG_VERSION ...

	make distclean -C "$pkg" > /dev/null

	mkdir -p "$PKG_ROOT"
	cp -r "$pkg" "$PKG_DIR"

	pushd "$PKG_ROOT"
	rm -rf "$PKG_VERSION/.git"
	tar zcf "$PKG_VERSION.tar.gz" "$PKG_VERSION"
	md5 "$PKG_VERSION.tar.gz" > "$PKG_VERSION.tar.gz.md5"
	rm -rf "$PKG_VERSION"
	popd



	echo DONE
done
