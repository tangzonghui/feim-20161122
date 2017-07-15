#!/bin/bash
mani=LA.BR.1.3.4-03610-8976.0.xml
#repo init -u git://codeaurora.org/platform/manifest.git -b release -m LA.BR.1.3.3-00920-8976.0.xml --repo-url=git://codeaurora.org/tools/repo.git
repo init -u git://codeaurora.org/platform/manifest.git -b release -m $mani  --repo-url=git://codeaurora.org/tools/repo.git
echo "========start repo sync======="
repo sync -j8
while [ $? != 0 ];
do
echo "========sync failed, re-sync again========"
sleep 3
repo sync -j8
done
