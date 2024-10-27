#!/usr/bin/env bash
set -x
./profile.sh
time cp -r $HF_HOME /tmp
HF_HOME=/tmp ./profile.sh
