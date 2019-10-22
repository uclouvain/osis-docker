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
# git submodule update --init --remote --recursive
# cp osis/.env.docker osis/.env
# cp osis-portal/.env.docker osis-portal/.env
````
3. Build containers
````
# docker-compose build
````
4. start the database container and execute migrations
````
# docker-compose run osis python manage.py migrate
# docker-compose run osis-portal python manage.py migrate
````
5. Start all containers
````
# docker-compose up -d
````
6. Check that all is working

  Open a browser and go to `http://localhost:8000` and you should see Osis running.
  
  
 ## Pycharm integration
 
 In PyCharm Enterprise Edition, you can use the docker-compose as project interpreter. 
 
 [Follow this tutorial in JetBrains.](https://www.jetbrains.com/help/pycharm/using-docker-compose-as-a-remote-interpreter.html) 

## Appendix

You can create a superuser by using the following command:
````
# docker-compose run osis python manage.py createsuperuser
````

You can also load demo data in osis by using:
````
# docker-compose run osis python manage.py loaddata demo_data.json
````
