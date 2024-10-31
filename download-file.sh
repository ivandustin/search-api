#!/usr/bin/env bash
[ -s $1 ] || aws s3 cp s3://$BUCKET/$(basename $1) $1
