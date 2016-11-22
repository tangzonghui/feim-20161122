#!/system/bin/sh

#close wdt
echo 0 20 30 0 0 > /proc/wdk
