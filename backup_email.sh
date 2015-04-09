#!/bin/bash
logfile=$HOME/logs/cron$$.log
exec > $logfile 2>&1

P="thunderbird"
FILE="/backup/email_backup-$(date +%F).tgz"
DIR="$HOME/.thunderbird/"
TAR="/bin/tar -zcvf"

echo "backup started $(date)"

if [ -n "$(pgrep -o $P)" ]
  then
     echo "$P is running... kiling process..."
     /usr/bin/killall -s KILL -w -v $P
    $TAR $FILE $DIR
  else
     echo "$P is not running... starting backup"
     $TAR $FILE $DIR
fi

echo "backup completed $(date)"

