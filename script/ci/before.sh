#!/bin/bash

# Create a database.yml for the right database
echo "Setting up database.yml for $DB"
if [ "$DB" = "postgres" ]; then
  cp config/database.postgres.yml config/database.yml
elif [ "$DB" = "mysql" ]; then
  cp config/database.mysql.yml config/database.yml
fi

# Set up database
echo "Creating databases for $DB and loading schema"
bundle exec rake db:create --trace
bundle exec rake db:schema:load --trace
