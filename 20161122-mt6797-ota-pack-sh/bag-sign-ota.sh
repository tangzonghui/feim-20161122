#!/bin/bash
#java -Xmx2048m -jar out/host/linux-x86/framework/signapk.jar -w build/target/product/security/testkey.x509.pem build/target/product/security/testkey.pk8 /tmp/tmpdPqvdW out/target/product/feima6

unzip_bag=$1
new_ota=$2.zip
tool=`pwd`/tool
TZH_M_FILE=___update.zip

if [ $#  -lt 1 ]; then
echo "wrong args $0 $* "
echo "$0 unzip_file new_ota_name"
exit
fi
echo "start..."

echo $new_ota
rm update.zip -rf
pushd $unzip_bag 
zip -r ../$TZH_M_FILE   *

popd
java -Xmx2048m  -jar  out/host/linux-x86/framework/signapk.jar -w build/target/product/security/testkey.x509.pem build/target/product/security/testkey.pk8  $TZH_M_FILE  $new_ota
rm $TZH_M_FILE -rf
echo "see $new_ota"
