#!/bin/bash
if [ "$1" = '--provision-chroot' ]; then
    /var/local/crawl-dev/dgamelaunch-config/utils/provision-chroot.sh
    exit $?
fi

if [ -d "/var/local/crawl/DGL/proc/" ]; then
    mount --bind /proc/ /var/local/crawl/DGL/proc/
    mount --bind /dev/pts/ /var/local/crawl/DGL/dev/pts/
    /etc/init.d/ssh start
    /etc/init.d/webtiles start
else
    echo "chroot not initialized; skipping container startup."
fi

# would probably be more docker-ish if webtiles were running in the foreground
# for this case...
if [ "$1" = '--background' ]; then
    sleep infinity # gnu-specific trick
    exit 0
fi

# convenience: run whatever CL arguments there are if we got to this point.
# probably something like /bin/bash.
if [ ! -z $@ ]; then
    exec "$@"
fi
