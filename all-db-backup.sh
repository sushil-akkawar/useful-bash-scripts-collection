#!/bin/bash

USER="USERNAME"
PASSWORD="PASSWORD"
DATE=$(date +"%Y%m%d-%H%M")
OUT_DIR="OUTPUT/DIRECTORY/PATH"

mkdir -p $OUT_DIR/$DATE

echo $OUTPUT

databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$USER --password=$PASSWORD --databases $db > $OUTPUT/$DATE-$db.sql
        gzip $OUTPUT/$DATE-$db.sql
    fi
done