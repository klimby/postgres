#!/usr/bin/make
# Makefile readme (ru): <http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>
SHELL = /bin/sh

docker_bin := $(shell command -v docker 2> /dev/null)

CONTAINER_NAME := postgres

PREFIX := klimby

.DEFAULT_GOAL := help

.PHONY: help build push create up down

--------------------: ## --------------------

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

--------------------: ## --------------------


build: create push ## Create and send to hub

push: ## Send to docker hub
	$(docker_bin) push $(PREFIX)/postgres:14
	$(docker_bin) push $(PREFIX)/postgres:latest

create: ## Create image
	$(docker_bin) build -t $(PREFIX)/postgres:14 -t $(PREFIX)/postgres:latest .

--------------------: ## --------------------

up: ## Start test compose
	@$(docker_bin) compose -f ./docker-pg-test/docker-compose.yml up

down: ## Stop test compose, delete db data
	@$(docker_bin) compose -f ./docker-pg-test/docker-compose.yml down -v

enter: ## Enter in container
	@$(docker_bin)  exec -i -t  postgres-test /bin/bash
