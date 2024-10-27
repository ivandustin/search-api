#!/usr/bin/env bash
fly vol create cache --size 10 --vm-cpu-kind shared --vm-cpus 8 --vm-memory 8000 --no-encryption
