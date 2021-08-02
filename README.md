<p align="center">
  <a href="#">
   <img alt="# Quickorder" src="https://github.com/Thiago-Cardoso/quickorder/blob/master/app/assets/images/quickorder.jpeg" width="50">
  </a>
</p>
<p align="center">Quickorder</p>

<p align="center">
  <a href="#">
    <img alt="Current Version" src="https://img.shields.io/badge/version-1.0.0 -blue.svg">
  </a>
  <a href="https://ruby-doc.org/core-3.0.1/">
    <img alt="Ruby Version" src="https://img.shields.io/badge/Ruby-3.0.1 -green.svg" target="_blank">
  </a>
  <a href="https://guides.rubyonrails.org/6_1_release_notes.html">
    <img alt="" src="https://img.shields.io/badge/Rails-~> 6.1.4-blue.svg" target="_blank">
  </a>
</p>

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Screenshot


## Stack the Project

- **Ruby on Rails**
- **Bootstrap**
- **Postgresql**
- **Rspec(TDD)**


# Quickorder
Manage your restaurant and your orders,
Register your orders and visualize your orders in the kitchen.

### Features

Administration
Manage your restaurant and your orders quickly and simply.

Digital Commands - Order posting
place your orders through the digital command.

Kitchen
view your orders according to their certain status,
cancel or complete.

### Populate data of access
Run seed

## Index

- [Requirements](#requirements)
- [First steps](#first-steps)
- [Authors](#authors)
- [Tests](#tests)
- [License](#license)

### Requirements

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
#Must


You must have installed on your machine:

- Docker
- Docker Compose
```

## First steps
```

Follow the instructions to have a project present and able to run it locally.

After copying the repository to your machine, go to the project's root site and:


1.  Construct the container

```
docker-compose build
```

2.  Create of Database

```
docker-compose run --rm website bundle exec rails db:create db:migrate

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

## Tests

For to do the tests it is necessary in docker container running:

Test using Rspec:

**Model**

category

docker-compose run --rm app bundle exec rspec spec/models/category_spec.rb

employee

docker-compose run --rm app bundle exec rspec spec/models/employee_spec.rb

product

docker-compose run --rm app bundle exec rspec spec/models/product_spec.rb

order

docker-compose run --rm app bundle exec rspec spec/models/order_spec.rb

Product order

docker-compose run --rm app bundle exec rspec spec/models/product_order_spec.rb

**Controller**

categories

docker-compose run --rm app bundle exec rspec spec/controllers/dashboard/categories_controller_spec.rb

products

docker-compose run --rm app bundle exec rspec spec/controllers/dashboard/products_controller_spec.rb

employees

docker-compose run --rm app bundle exec rspec spec/controllers/dashboard/employees_controller_spec.rb

orders

docker-compose run --rm app bundle exec rspec spec/controllers/orders_controller_spec.rb


## Authors

Project created by the following developers

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars1.githubusercontent.com/u/1753070?s=460&v=4" width="100px;"/><br /><sub><b>Thiago Cardoso</b></sub>](https://github.com/Thiago-Cardoso)<br /> | [<img src="https://avatars.githubusercontent.com/u/28460996?v=4" width="100px;"/><br /><sub><b>Fabricio Comeli</b></sub>](https://github.com/fabriciobonjorno)<br /> | [<img src="https://avatars.githubusercontent.com/u/69864017?v=4" width="100px;"/><br /><sub><b>Raquel Lima</b></sub>](https://github.com/RaquelLima7)<br /> | [<img src="https://avatars.githubusercontent.com/u/8259466?v=4" width="100px;"/><br /><sub><b>Fábio Vilhena</b></sub>](https://github.com/fvilhena)<br /> | [<img src="https://avatars.githubusercontent.com/u/8593387?v=4" width="100px;"/><br /><sub><b>Pompermaier</b></sub>](https://github.com/Pompermaier)<br /> |
| :---: | :---: | :---: | :---: | :---: |

## License

This project is licensed under a Apache license 2.0 - see file [LICENSE](LICENSE) for more details
