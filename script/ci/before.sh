#!/bin/bash

# Create a database.yml for the right database
echo "Setting up database.yml for $DB"
if [ "$DB" = "postgres" ]; then
  cp config/database.postgres.yml config/database.yml
  psql -c 'create database decent_authentication_test;' -U postgres
elif [ "$DB" = "mysql" ]; then
  cp config/database.mysql.yml config/database.yml
  mysql -e 'create database decent_authentication_test;'
else
  cp config/database.sqlite.yml config/database.yml
fi
