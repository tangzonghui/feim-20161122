#!/bin/bash
TZH_TOOL=./tool
TZH_BOOT_NEW=boot_new.img
GIVEN_KERNEL=$1
GIVEN_RAM=$2

PRODUCTDIR=~/work/code/mt6797/mp2_trunk/alps/
MKBOOTIMG=$PRODUCTDIR/out/host/linux-x86/bin/mkbootimg


function usage(){
	echo "Usage:"
		 echo "$0 GIVEN_KERNEL  GIVEN_RAM "	
}
if [ $# -lt  2 ]; then
echo "Error: wrong number of arguments in cmd: $0 $* "
usage
exit  1
fi


#pushd ../../code/msm8916/msm8916-102/LINUX/android/
#. ./build/envsetup.sh
#lunch D05-userdebug
#popd
#console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0
echo +++++++++++++++++MKBOOT B++++++++++++
rm -rf $TZH_BOOT_NEW
$MKBOOTIMG  --kernel $GIVEN_KERNEL --ramdisk $GIVEN_RAM --cmdline "bootopt=64S3,32N2,64N2" --base 0x40000000 --ramdisk_offset 0x05000000 --kernel_offset 0x00080000 --tags_offset 0x4000000 --board 1477983408 --kernel_offset 0x00080000 --ramdisk_offset 0x05000000 --tags_offset 0x4000000   --output  $TZH_BOOT_NEW
echo +++++++++++++++++MKBOOT E++++++++++++
echo +++++++++++++++++SIGN B++++++++++++++
$TZH_TOOL/boot_signer /boot   $TZH_BOOT_NEW  $TZH_TOOL/verity.pk8   $TZH_TOOL/verity.x509.pem   $TZH_BOOT_NEW
echo +++++++++++++++++SIGN E++++++++++++++
echo see $TZH_BOOT_NEW
#out/host/linux-x86/bin/mkbootimg  --kernel out/target/product/feima6797_4u_m/kernel --ramdisk out/target/product/feima6797_4u_m/ramdisk.img --cmdline "bootopt=64S3,32N2,64N2" --base 0x40000000 --ramdisk_offset 0x05000000 --kernel_offset 0x00080000 --tags_offset 0x4000000 --board 1477983408 --kernel_offset 0x00080000 --ramdisk_offset 0x05000000 --tags_offset 0x4000000 --output out/target/product/feima6797_4u_m/boot.img
#out/host/linux-x86/bin/boot_signer /boot out/target/product/feima6797_4u_m/boot.img build/target/product/security/verity.pk8 build/target/product/security/verity.x509.pem out/target/product/feima6797_4u_m/boot.img
#echo -n 1477983408 > out/target/product/feima6797_4u_m/custom_build_verno

#p563
#ifeq ($(TARGET_BOOTIMAGE_USE_EXT2),true)
#$(error TARGET_BOOTIMAGE_USE_EXT2 is not supported anymore)
#else ifeq (true,$(PRODUCTS.$(INTERNAL_PRODUCT).PRODUCT_SUPPORTS_BOOT_SIGNER)) # TARGET_BOOTIMAGE_USE_EXT2 != true
