#!/usr/bin/env bash
set -x
du -hc $(find $HF_HOME -type f -size +1G)
time dd if=$(find $HF_HOME -type f -size +1G | head -n 1) of=/dev/null bs=8M
time echo hi | tokens | embeddings | numpy-shape
