#!/bin/bash

set -e

DGL_BIN=/var/local/crawl-dev/dgamelaunch-config/bin/dgl

exec >>/var/local/crawl-dev/logs/cleanup-trunks.log 2>&1

echo '---'
date

# Keeps last built version as well as used ones; remove the rest
readarray -t to_del < <(
	"${DGL_BIN}" remove-trunks -qv | tail -n +4 | awk '$6==0 { sub(".*g","",$4); print $4 }'
)

if (( ${#to_del[@]} )); then
	echo -n "Cleaning trunks at "
	date;
	"${DGL_BIN}" remove-trunks "${to_del[@]}"
	echo done.
	echo
fi

date
