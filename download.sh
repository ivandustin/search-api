#!/usr/bin/env bash
set -ex
./download-file.sh $SEARCH_INDEX_LARGE
./download-file.sh $SEARCH_INDEX_SMALL
./download-file.sh $SEARCH_MAP_LARGE
./download-file.sh $SEARCH_MAP_SMALL
