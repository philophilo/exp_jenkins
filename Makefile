COMPOSE-FILE := docker/docker-compose.yml

# build:
# 	@echo Building Jenkins image...
# 	@docker build -t philophilo/jenkins-docker:1.0 .

jenkins-docker:
	@echo Starting jenkins-docker service...
	@docker-compose -f $(COMPOSE-FILE) up -d jenkins-docker

build:
	@echo Running docker-compose build...
	@docker-compose -f $(COMPOSE-FILE) build jenkins

start: jenkins-docker
	@echo Starting jenkins...
	@docker-compose -f $(COMPOSE-FILE) up jenkins

install:
	@echo installing $(package)
	@docker-compose -f $(COMPOSE-FILE) exec --user root jenkins apt-get install -y $(package)

shell:
	@echo Going to Jenkins shell
	@docker-compose -f $(COMPOSE-FILE) exec --user $(user) jenkins /bin/bash

down:
	@docker-compose -f $(COMPOSE-FILE) down