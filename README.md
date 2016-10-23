# Ruby On Rails On Docker Demo.

This repo demonstrates the usage of Docker to run a Ruby on Rails app, with Sidekiq, Nginx, Redis

## Stack

The whole stack is extracted as containers.

### Nginx as reverse proxy

The `web` service uses Nginx to reverse proxy the requests to the application server(puma)

### Postgresql as database

The database used in the app is PostgreSQL, and is extracted into postgres container.

### Application container

This is a bootstrapped vanilla Rails 5 application using Puma as application server.

### Sidekiq for heavy lifting

All the heavy-lifting jobs are handle by the Sidekiq instance as ActiveJob adapter and using Redis.

### redis

Redis is used as backend for Sidekiq workers and also as cache store in the Rails app.


### Quick Start.

#### First time setup:

    docker-compose build
    docker-compose up -d # Application can be accessed at http://localhost:8080

#### Some example/useful commands
    docker-compose run bin/setup
    docker-compose run rails db:create
    docker-compose run rails db:migrate
    docker-compose run rails assets:precompile
    docker-compose run bundle exec rspec


### Notes:

All the environment configuration can be changed in `.docker.env` file.


### TODO:
  There are some room for improvements in the current setup.
  Dependencies can be isolated to virtual dependencies and can be deleted afterwards.
  Bundle install and gems can be cached using a volume.
  Multi environment is overlooked at this stage.
