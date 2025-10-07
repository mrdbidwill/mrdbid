# Dockerized Rails 8 Development Environment

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) for Mac/Windows, or Docker Engine for Linux.
- [Docker Compose](https://docs.docker.com/compose/) (included with Docker Desktop)

## Quick Start

1. **Build containers**  
   > docker-compose build

2. **Set up database**  
   > docker-compose run web bin/rails db:setup

   or, for existing db:  
   > docker-compose run web bin/rails db:migrate

3. **Run the app**  
   > docker-compose up

   Rails app will be available at [http://localhost:3000/](http://localhost:3000/)

## Useful Commands

- **Rails console:**  
  > docker-compose run web bin/rails console

- **Run tests:**  
  > docker-compose run web bin/rails test

- **Bundle install:**  
  > docker-compose run web bundle install

- **Stop all:**  
  > docker-compose down

- **Rebuild (after Gemfile, OS deps change, etc):**  
  > docker-compose build

## Customizing

- By default, DB user/password is `app`/`password`.
- To use Postgres, edit `docker-compose.yml` and `config/database.yml`.
- Update `Dockerfile` if you need additional Linux libraries for gems.

---

**Tip**: You can continue using RubyMine, editing on the host – Docker automatically uses your local files.

---
</markdown>
