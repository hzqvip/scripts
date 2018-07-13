#!/bin/bash
# crond cut mongodb.log 
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
kill -SIGUSR1 `cat /data/mongodb/db/mongod.lock`
find "/data/mongodb/log/" -mtime +7 -name "mongod.log*" -exec rm -rf {} \;