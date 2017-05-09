#!/bin/sh

cp config/database.yml.postgresql config/database.yml

echo "Waiting PostgreSQL to start on 5432..."

while ! nc -z some-postgres 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

echo "Creating databases..."
rake db:create

echo "Migrating to databases..."
rake db:migrate

echo "Seeding databases..."
rake db:seed

echo "Populating databases..."
rake db:populate

echo "Ready databases"

