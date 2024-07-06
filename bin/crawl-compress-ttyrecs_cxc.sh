#!/bin/sh

DGL_BIN=/var/local/crawl-dev/dgamelaunch-config/bin/dgl

exec >>/var/local/crawl-dev/logs/compress-ttyrecs.log 2>&1

echo '---'
date
nice -n19 ionice -c2 -n7 sudo "${DGL_BIN}" compress-ttyrecs
date
