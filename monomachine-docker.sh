#!/bin/bash

if [ "$POSTGRES_USER" = "" ] || [ "$POSTGRES_PASSWORD" = "" ]; then
	echo "Environment variables for POSTGRES not found"
        exit
fi

docker build -t sample_app_rails_4_image .

docker run --name some-postgres -e POSTGRES_USER=$POSTGRES_USER \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -d postgres

docker volume create --name volume-public

docker run -d -it --name some-app -e POSTGRES_USER=$POSTGRES_USER \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -w /usr/src/app \
  -v volume-public:/usr/src/app/public --link some-postgres:db sample_app_rails_4_image

docker run --name some-nginx -v "${PWD}/nginx.conf":/etc/nginx/conf.d/default.conf \
  -p 8080:80 --link some-app:app -v volume-public:/usr/src/app/public -d nginx

docker exec some-app bash -c 'rake db:create ; rake db:migrate ; rake db:seed ; rake db:populate'

