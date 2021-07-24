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