#!/bin/bash


################
# 这个也可以，但是比较复杂，所以我采用下面这个简单的
#local_ip=`ifconfig en0 | grep 'inet ' | sed 's/^.inet //g' | sed 's/ *netmask.*$//g'`
#echo $local_ip
LOCAL_IP=`ipconfig getifaddr en0`
export LOCAL_IP=$LOCAL_IP
echo "local_ip:$LOCAL_IP"

export MYSQL_USER=drone
export MYSQL_PASSWORD=drone_123456
export MYSQL_DATABASE_NAME=drone
export MYSQL_ROOT_PASSWORD=123456

export DRONE_HOST="http://$LOCAL_IP:8000"

export DRONE_GITLAB_CLIENT=7d98abb4db0482556d3379586115638213801ac45bb19f23c1ba0b3430b58ae8
export DRONE_GITLAB_SECRET=48f6c22b319cc9e52594d4e4dd87528c6c7efb0a6f457526095f776cee39d62e
export DRONE_GITLAB_URL="http://$LOCAL_IP"

export DRONE_DATABASE_DRIVER="mysql"
export DRONE_DATABASE_DATASOURCE="$MYSQL_USER:$MYSQL_PASSWORD@tcp(mysql-server:3306)/$MYSQL_DATABASE_NAME"

export HTTP_PROXY=http://$LOCAL_IP:1087
export HTTPS_PROXY=http://$LOCAL_IP:1087

export DRONE_SECRET=`echo -e "drone-mysql" |base64`

docker-compose up -d
