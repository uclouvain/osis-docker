# Osis docker
All you need to get started with osis and osis portal using docker.

## Prerequisites

You need to install docker on your computer. Follow the [docker documentation](https://docs.docker.com/engine/installation/) and look for the installer for your platform.

## Getting started

1. Clone this repository
````
# git clone git@github.com:uclouvain/osis-docker.git
````
2. Initialize submodules
````
# git submodules init
# git submodules update
````
3. Initialize osis-common submodule in both osis and osis-portal
````
# cd osis
# git submodule init
# git submodule update
# cd ../osis-portal
# git submodule init
# git submodule update
# cd ..
````
4. Build containers
````
# docker-compose build
````
5. start the database container and execute migrations
````
# docker-compose up -d db
# docker-compose run osis python manage.py migrate
# docker-compose run osis-portal python manage.py migrate
````
6. Start all containers
````
# docker-compose up -d
````
7. Check that all is working

  Open a browser and go to `http://localhost:8000` and you should see Osis running.

## Appendix

You can create a superuser by using the following command:
````
# docker-compose run osis python manage.py createsuperuser
````

You can also load demo data in osis by using:
````
# docker-compose run osis python manage.py loaddata demo_data.json
````
