# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

docker build -f Dockerfile -t ruby:3.0.1 .

docker run -d \
--name quick \
-p 3000:3000 \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/timezone:/etc/timezone:ro \
-v /home/dell/projetos/onebitcode/quickorder/:/app \
-v /home/dell/projetos/onebitcode/quickorder/bundle:/usr/local/bundle \
ruby:3.0.1


### Installing

First step is to install the docker service:

```bash
#Linux: ubuntu,Mint
$ sudo apt-get update
$ sudo apt-get install docker-ce
$ sudo apt install docker-compose

# Fedora
$ sudo dnf update -y
$ sudo dnf install docker-ce
$ sudo dnf -y install docker-compose
```

For test if the service was installed with succeed, you can run the command for to check de version of docker:

```bash
$ docker --version
#Must be have the docker version: Docker version 18.06.0-ce
$ docker-compose --version
#Must be have the docker-compose version: docker-compose version 1.22.0
```

### Prerequisites

You must have installed on your machine:

- Docker
- Docker Compose


## First steps


Follow the instructions to have a project present and able to run it locally.

After copying the repository to your machine, go to the project's root site and:


1.  Construct the container

```
docker-compose build
```

2.  Create of Database

```
docker-compose run --rm website bundle exec rails db:create
```

3.  up the project

```
docker-compose up
```

4. Without turning off the server, open a new window and run the migrations

```
docker-compose run --rm website bundle exec rails db:migrate if necessary populate database

OBS. If the server does not create the pid file. due to gitignore
it is necessary to create manually.
mkdir tmp/pids
Error bundle assets or webpacker run
docker-compose run --rm app bundle exec rails webpacker:install

