# Off-time Manager

This is a team member off-time management system built with Ruby on Rails 7.

### Initial Setup
```bash
cp .env-sample .env
docker compose build
docker compose run --rm web bin/rails db:migrate db:seed
```

## How to run
```bash
docker compose build up -d
```
