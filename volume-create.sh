#!/usr/bin/env bash
fly vol create cache --size 20 --vm-cpu-kind shared --vm-cpus 8 --vm-memory 2000 --no-encryption
