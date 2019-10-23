#!/usr/bin/env bash

set -e

echo "Init repositories"
git submodule update --init --remote --recursive

echo "Copy docker files"
cp -r ./osis/.env.docker ./osis/.env
cp -r ./osis-portal/.env.docker ./osis-portal/.env

echo "Build docker compose"
docker-compose build

echo "Run migrations"
docker-compose run osis python manage.py migrate
docker-compose run osis-portal python manage.py migrate

echo "Run services"
docker-compose up -d
