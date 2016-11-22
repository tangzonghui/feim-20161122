#!/bin/bash
pushd ex-m
rm ../m.zip
zip ../m.zip   * -r
popd
