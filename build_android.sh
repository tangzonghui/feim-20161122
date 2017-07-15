#!/bin/bash
source build/envsetup.sh
lunch msm8952_64-eng
make -j8  2>&1 | tee build.log
