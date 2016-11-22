#!/bin/bash
TZH_LOG_DIR=./tzh_log
_TZH_LOG=$TZH_LOG_DIR/build-`date +%Y%m%d-%H%M%M`.log
TZH_LOG=$_TZH_LOG

[  ! -d $TZH_LOG_DIR  ] && mkdir $TZH_LOG_DIR -p
pushd ../
./tzh/build-tzh.sh   $*  2>&1 | tee  ./tzh/$TZH_LOG
popd
