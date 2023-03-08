#!/bin/bash
set -e

# Wait for MySQL to start up
./wait-for-it.sh $MYSQL_HOST:$MYSQL_PORT

# Import the posts.sql file into the db database in MySQL
mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p $MYSQL_PASSWORD $MYSQL_DATABASE < ./posts.sql

# Continue with any other setup you need for your container
echo "Database import complete."