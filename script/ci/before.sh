#!/bin/bash

cp config/database.postgres.yml config/database.yml
psql -c 'create database decent_authentication_test;' -U postgres
