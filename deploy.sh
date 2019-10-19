#!/usr/bin/env bash

git submodule update --init --remote --recursive
cp docker-env/env-osis osis/.env
cp docker-env/env-osis-portal osis-portal/.env

docker-compose build
docker-compose run osis python manage.py migrate
docker-compose run osis-portal python manage.py migrate

docker-compose up -d
