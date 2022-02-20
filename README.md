![Version v1.2.1](https://img.shields.io/badge/version-v1.2.1-blue.svg?style=plastic "Version v1.2.1")
![PostgreSQL v14](https://img.shields.io/badge/PostgreSQL-v14-blue.svg?style=plastic "PostgreSQL v14")

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)

![Docker 20.10](https://img.shields.io/badge/Docker-20.10-blue.svg?style=plastic "Docker 20.10")

![example workflow](https://github.com/klimby/postgres/actions/workflows/docker-image.yml/badge.svg)


# PostgreSQL docker image

```
git clone ssh://git@github.com/klimby/postgres.git

cd postgres

npm install
```

PostgreSQL docker image with ru_RU.UTF-8 locale.


### Docker hub

[Docker Hub Repository.](https://hub.docker.com/repository/docker/klimby/postgres/general)

```
docker push klimby/postgres:14
```

### Docker compose example

```
&postgres postgres:
    image: klimby/postgres:latest
    container_name: postgres
    hostname: *postgres
    ports: ["54330:5432"]
    environment:
      - POSTGRES_DB=test
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - LANG=ru_RU.UTF-8
    command: postgres -c 'config_file=/etc/postgresql/postgresql.conf' // for custom postgresql.conf
    volumes:
      - ./pgdata:/var/lib/postgresql/data
      - ./conf/postgresql.conf:/etc/postgresql/postgresql.conf // for custom postgresql.conf
    networks:
      - pg

```
