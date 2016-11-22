#!/bin/bash
if [  $# -lt 1 ]; then
  echo "$0 ramdisk-file"
  exit
fi
cp $1  ramdisk.img.gz
mv $1  ramdisk-before.img
rm ramdisk_new -rf
mkdir  ramdisk_new
gunzip ramdisk.img.gz
pushd ramdisk_new
cpio -i  -F ../ramdisk.img
popd
rm  -rf ramdisk.img.gz ramdisk.img
echo  see ramdisk_new
