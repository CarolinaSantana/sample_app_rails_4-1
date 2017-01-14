#!/bin/sh

echo "Waiting PostgreSQL to start on 5432..."

while ! nc -z some-postgres 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

echo "Creating databases..."
rake db:create & wait $!

echo "Migrating to databases..."
rake db:migrate & wait $!

echo "Seeding databases..."
rake db:seed & wait $!

echo "Populating databases..."
rake db:populate & wait $!

echo "Ready databases"

