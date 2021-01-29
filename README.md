# mySMS
mySMS is a ReadyTech onboarding project. 


## Getting Started
The docker-compose file is intended to power the development environment. If you'd like to use to use docker-compose to run the application there are a few more steps involved.

```bash
# builds the rails application image & starts the mysql database.
docker-compose build
docker-compose up -d db
```

```bash
# creates the dev & test databases
docker-compose run --rm web rake db:create
docker-compose run --rm web rake db:migrate
```

```bash
# starts the rails application, listens on port 3000
docker-compose run --service-ports web rails server -b 0.0.0.0
```
