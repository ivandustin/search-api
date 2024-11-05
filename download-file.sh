#!/usr/bin/env bash
set -x
[ -s $1 ] || aws s3 cp s3://$BUCKET/$(basename $1) $1
