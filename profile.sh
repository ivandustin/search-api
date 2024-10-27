#!/usr/bin/env bash
set -x
du -hc $(find $HF_HOME -type f)
dd if=$(find $HF_HOME | grep pytorch_model.bin | head -n 1) of=/dev/null bs=8M
time echo hi | tokens | embeddings | numpy-shape
