#!/bin/bash

VERSION=2015.10.01
ARCH=x86_64
BASEURL="http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/iso"
EDITOR=emacs

BUILD_DIR=$(cd $(dirname "$0") && pwd)
TEMP_DIR=$BUILD_DIR/temp

mkdir -pv $TEMP_DIR && cd $TEMP_DIR

wget -c -nc "$BASEURL/$VERSION/archlinux-bootstrap-$VERSION-$ARCH.tar.gz"
wget -c -nc -O $BUILD_DIR/mirrorlist "https://projects.archlinux.org/svntogit/packages.git/plain/trunk/mirrorlist?h=packages/pacman-mirrorlist"

$EDITOR $BUILD_DIR/mirrorlist

echo -n "[$(date)] extract archlinux-bootstrap-$VERSION-$ARCH.tar.gz ... "
tar xf archlinux-bootstrap-$VERSION-$ARCH.tar.gz
echo "done."

echo -n "[$(date)] compress $TEMP_DIR/root.$ARCH ... "
cd $TEMP_DIR/root.$ARCH && tar -Jcf $BUILD_DIR/bootstrap.tar.xz *
echo "done."
