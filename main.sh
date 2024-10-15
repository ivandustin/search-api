#!/usr/bin/env bash
set -ex
find /cache -type f
./download.sh
./run.sh
