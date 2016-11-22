#!/bin/bash
FEIMA_FW_RELEASE_DIR=./feima-fw
FEIMA_COMBO=feima6797_4u_m
FEIMA_FW="MT6797_Android_scatter.txt boot.img cache.img md1arm7.img md1dsp.img md1rom.img md3rom.img preloader.img ramdisk-recovery.img ramdisk.img recovery.img secro.img system.img userdata.img  *.zip lk.bin tinysys-scp.bin trustzone.bin logo.bin preloader_$FEIMA_COMBO.bin"
FROM_FW_DIR=out/target/product/$FEIMA_COMBO

function release (){
[  ! -d $FEIMA_FW_RELEASE_DIR ] && mkdir $FEIMA_FW_RELEASE_DIR

echo releasing...
for file in $FEIMA_FW; do
	cp $FROM_FW_DIR/$file  $FEIMA_FW_RELEASE_DIR
done
	
echo done,see $FEIMA_FW
}

release
