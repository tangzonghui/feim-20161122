#!/bin/sh
source build/envsetup.sh  
lunch 11 
make MTK_BUILD_ROOT=yes -j4 
#(NOTE: “MTK_BUILD_ROOT=yes” means disable selinux)
