#!/bin/sh

HOST="127.0.0.1"
MYSQL_USER="USERNAME"
MYSQL_PASSWORD="PASSWORD"
DBNAME="DATABASE_NAME"
DATE=$(date +"%Y%m%d-%H%M")

cd /var/www/html/MYSITE.COM

mysqldump -h $HOST -u $MYSQL_USER -p$MYSQL_PASSWORD --skip-extended-insert --skip-dump-date --databases $DBNAME > $DBNAME\-$DATE.sql
git add -A
git commit -m "Database backup of $DBNAME on $DATE"
git push
git gc
