#! /bin/sh

NAME=$1

VERSIONS="git $(seq 25 33 | sed 's/^/0./')"

for v in $VERSIONS; do
    cp --no-clobber "%%CHROOT_DGLDIR%%/data/crawl-$v-settings/init.txt" "%%CHROOT_RCFILESDIR%%/crawl-$v/$NAME.rc"
    cp --no-clobber "%%CHROOT_DGLDIR%%/data/crawl-git.macro" "%%CHROOT_RCFILESDIR%%/crawl-$v/$NAME.macro"
done

cp --no-clobber "%%CHROOT_DGLDIR%%/data/crawl-bcadrencrawl-settings/init.txt" "%%CHROOT_RCFILESDIR%%/crawl-bcadrencrawl/$NAME.rc"
cp --no-clobber "%%CHROOT_DGLDIR%%/data/crawl-git.macro" "%%CHROOT_RCFILESDIR%%/crawl-bcadrencrawl/$NAME.macro"

cp --no-clobber "%%CHROOT_DGLDIR%%/data/crawl-bcrawl-settings/init.txt" "%%CHROOT_RCFILESDIR%%/crawl-bcrawl/$NAME.rc"
cp --no-clobber "%%CHROOT_DGLDIR%%/data/crawl-git.macro" "%%CHROOT_RCFILESDIR%%/crawl-bcrawl/$NAME.macro"

cp --no-clobber "%%CHROOT_DGLDIR%%/data/crawl-stoatsoup-settings/init.txt" "%%CHROOT_RCFILESDIR%%/crawl-stoatsoup/$NAME.rc"
cp --no-clobber "%%CHROOT_DGLDIR%%/data/crawl-git.macro" "%%CHROOT_RCFILESDIR%%/crawl-stoatsoup/$NAME.macro"

mkdir -p "%%CHROOT_MORGUEDIR%%/$NAME"
mkdir -p "%%CHROOT_TTYRECDIR%%/$NAME"
