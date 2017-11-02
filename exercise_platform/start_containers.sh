#!/bin/sh

docker run --name ceudsd-mysql --restart unless-stopped -p 3306:3306 -v /home/ubuntu/mysql/mysql-files:/var/lib/mysql-files/ -v /home/ubuntu/mysql/db:/var/lib/mysql -v /home/ubuntu/mysql/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=ceudsd666 -d mysql/mysql-server:5.7
docker run -p 80:8080 --restart unless-stopped -v /home/ubuntu/zeppelin/conf:/zeppelin/conf -v /home/ubuntu/zeppelin/logs:/logs -v /home/ubuntu/zeppelin/interpreter/mysql:/zeppelin/interpreter/mysql -v /home/ubuntu/zeppelin/notebook:/notebook -e ZEPPELIN_LOG_DIR='/logs' -e ZEPPELIN_NOTEBOOK_DIR='/notebook' --link ceudsd-mysql:mysql --name zeppelin -d apache/zeppelin:0.7.3
