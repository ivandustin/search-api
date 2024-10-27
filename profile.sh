#!/usr/bin/env bash
set -x
./profile-single.sh
time cp -r $HF_HOME/* /tmp
HF_HOME=/tmp ./profile-single.sh
