#!/usr/bin/env bash

set -e

echo "Init repositories"
git submodule update --init --remote --recursive

echo "Copy docker files"
cp -r ./docker-env/osis/.env ./osis/.env
cp -r ./docker-env/osis/Dockerfile ./osis/Dockerfile
cp -r ./docker-env/osis-portal/.env ./osis-portal/.env
cp -r ./docker-env/osis-portal/Dockerfile ./osis-portal/Dockerfile

echo "Build docker compose"
docker-compose build
echo "Run migrations"
docker-compose run osis python manage.py migrate
docker-compose run osis-portal python manage.py migrate

echo "Run services"
docker-compose up -d
