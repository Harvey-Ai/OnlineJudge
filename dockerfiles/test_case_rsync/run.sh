#!/usr/bin/env bash

if [ "$RSYNC_MODE" = "master" ]; then
    if [ ! -f "/etc/rsyncd/rsync_master.passwd" ]; then
        mkdir /etc/rsyncd
        (echo "ojrsync:" && cat /OnlineJudge/dockerfiles/test_case_rsync/rsyncd.passwd) | tr -d "\n" > /etc/rsyncd/rsyncd_master.passwd
    fi
    chmod 600 /etc/rsyncd/rsyncd_master.passwd
    rsync --daemon --config=/etc/rsyncd/rsyncd.conf
else
    chmod 600 /OnlineJudge/dockerfiles/test_case_rsync/rsyncd.passwd
    /bin/bash /code/rsync.sh
    echo "* * * * * /bin/bash /code/rsyncd.sh" > /tmp/crontab.conf
    crontab /tmp/crontab.conf
fi

while true
do
    sleep 100
done
