#!/bin/bash
CID=$(docker ps | grep centos7 | awk '{print $1}')
if [ -z $CID ] 
then
CID=$(docker run -d --name centos7 -it centos:7 /bin/bash)
echo "new start $CID "
docker exec -it $CID /bin/bash
else
docker exec -it $CID /bin/bash
fi
