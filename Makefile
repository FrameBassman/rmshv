# development environment
build-dev:
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.development.yml \
		build ${ARGS}

start-dev:
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.development.yml \
		up --build

stop-dev:
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.development.yml \
		down

# clean dungling images/volumes
docker-cleanup:
	docker volume rm $$(docker volume ls -qf dangling=true)
	docker rmi $$(docker images -a | grep "^<none>" | awk '{print $3}')
	docker rmi $$(docker images -a --filter=dangling=true -q)
	docker rm $$(docker ps --filter=status=exited --filter=status=created -q)

restart-proxy:
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.development.yml \
		stop proxy
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.development.yml \
		build proxy
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.development.yml \
		start proxy
