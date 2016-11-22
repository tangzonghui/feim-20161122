#!/bin/bash
RAMDISK_S_NAME=$2
TZH_RAMDISKIMAGE=./ramdisk_$RAMDISK_S_NAME.img
TZH_ROOT=`pwd`/$1

PRODUCTDIR=~/work/code/mt6797/mp2_trunk/alps/
MKBOOTFS=$PRODUCTDIR/out/host/linux-x86/bin/mkbootfs
MINIGZIP=$PRODUCTDIR/out/host/linux-x86/bin/minigzip
SYS_DIR=$PRODUCTDIR/out/target/product/feima6797_4u_m/system

#out/host/linux-x86/bin/mkbootfs -d out/target/product/feima6797_4u_m/system out/target/product/feima6797_4u_m/root | out/host/linux-x86/bin/minigzip > out/target/product/feima6797_4u_m/ramdisk.img
function usage(){
	echo "Usage:"
		 echo "$0 root  name"	
}
if [ $# -lt  2 ]; then
echo "Error: wrong number of arguments in cmd: $0 $* "
usage
exit  1
fi

$MKBOOTFS -d $SYS_DIR  $TZH_ROOT | $MINIGZIP >  $TZH_RAMDISKIMAGE
echo see $TZH_RAMDISKIMAGE
