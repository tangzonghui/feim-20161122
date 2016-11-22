#!/bin/bash
rm ota_in.zip -rf
./build/tools/releasetools/ota_from_target_files -s ./device/mediatek/build//releasetools/mt_ota_from_target_files  --block -k build/target/product/security/testkey -i $1 $2  ota_in.zip

