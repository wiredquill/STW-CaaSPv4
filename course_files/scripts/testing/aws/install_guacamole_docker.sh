#!/bin/bash

echo

sudo mkdir -p /docker/guacamole
sudo chmod 777 /docker -R

mkdir /docker/guacamole/dbinit

sudo docker pull guacamole/guacamole
sudo docker pull guacamole/guacd
sudo docker pull mysql

sudo docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > /docker/guacamole/dbinit/guacamole_initdb.sql

sudo docker run -d --name mysqldb -v /docker/guacamole/dbinit:/docker-entrypoint-initdb.d -v /docker/guacamole:/config --restart=alwayse MYSQL_ROOT_PASSWORD=pass@word01 -e MYSQL_DATABASE=guacamole_db -e MYSQL_USER=guacamole_user -e MYSQL_PASSWORD=some_password mysql 


sudo docker run --name some-guacd -d --restart=always guacamole/guacd 

sudo docker run --name some-guacamole --link some-guacd:guacd --link mysqldb:mysql --restart=always -e MYSQL_DATABASE=guacamole_db -e MYSQL_USER=guacamole_user -e MYSQL_PASSWORD=some_password -d -p 8080:8080 guacamole/guacamole

#Access via ... http://docker.machine:8080/guacamole default password is guacadmin password guacadmin
####### END Guacamole #######
