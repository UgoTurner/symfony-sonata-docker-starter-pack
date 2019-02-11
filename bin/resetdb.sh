#!/bin/bash
SQLITEDB="var/sqlite.db"

[ -e $SQLITEDB ] && rm $SQLITEDB
touch $SQLITEDB
bash bin/acl.sh
