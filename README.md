# Off-time Manager

This is a team member time-off management system built with Ruby on Rails 7.

### Initial setup
```bash
cp .env-sample .env
docker compose build
docker compose run --rm app bin/rails db:migrate db:seed
```

## How to run
```bash
docker compose up -d
```
