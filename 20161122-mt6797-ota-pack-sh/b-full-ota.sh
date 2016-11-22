#!/bin/bash
TZH_AUTO_TEST_ROOT=/home/tangzonghui/work/code/AutoTest/mp2_trunk/alps

m_bag=$1
new_ota=$2.zip

if [ $#  -lt 1 ]; then
echo "wrong args $0 $* "
echo "$0  m-bag new_ota_name"
exit
fi
rm new_ota -rf
PATH=$TZH_AUTO_TEST_ROOT/out/host/linux-x86/bin/:$PATH MKBOOTIMG=$TZH_AUTO_TEST_ROOT/out/host/linux-x86/bin/mkbootimg \
     ./build/tools/releasetools/ota_from_target_files -v \
     --block \
     -p $TZH_AUTO_TEST_ROOT/out/host/linux-x86 \
     -k build/target/product/security/testkey \
     -s ./device/mediatek/build/releasetools/mt_ota_from_target_files \
       $m_bag     $new_ota      
