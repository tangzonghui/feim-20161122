#!/bin/bash
TZH_TOOL_DIR=./tool
TZH_DTB=$1
TZH_DT=dt_new.img

if [  $# -lt 1 ]; then
  echo "$0 dts"
  exit
fi

rm -rf 
$TZH_TOOL_DIR/dtbTool -o ./$TZH_DT -s 2048 -p $TZH_TOOL_DIR/   $TZH_DTB
echo see  ./$TZH_DT
