#!/bin/bash

#Creating directories after partitioning
#I admit a better script can be written,this is only a test

cd $LFS
mkdir bin boot dev dev/pts etc home lib mnt proc root sbin tmp var

for dirname in $LFS/usr $LFS/usr/local
do
mkdir $dirname
cd $dirname

mkdir bin etc include lib sbin share src tmp var
ln −s share/man man
ln −s share/doc doc
ln −s share/info info

cd $dirname/share
mkdir dict doc info locale man nls misc terminfo zoneinfo

cd $dirname/share/man
mkdir man1 man2 man3 man4 man5 man6 man7 man8 #Not really mandatory

done
cd $LFS/var
mkdir lock log mail run spool tmp

cd $LFS
chmod 0750 root
chmod 1777 tmp usr/tmp var/tmp
