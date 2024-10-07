#!/usr/bin/env bash
rf -rf scripts search index map
git clone https://github.com/ivandustin/scripts.git
git clone https://github.com/ivandustin/search.git
dos2unix scripts/bin/* search/bin/*
cp $SEARCH_INDEX index
cp $SEARCH_MAP map
docker build -t search .
