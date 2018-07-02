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

# prod environment
build-prod:
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.prod.yml \
		build ${ARGS}

start-prod:
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.prod.yml \
		up -d

stop-prod:
	docker-compose \
		--project-directory=${PWD} \
		--project-name=romashov \
		-f deploy/docker-compose.yml \
		-f deploy/docker-compose.prod.yml \
		down

# clean dungling images/volumes
docker-cleanup:
	docker volume rm $$(docker volume ls -qf dangling=true)
	docker rmi $$(docker images -a | grep "^<none>" | awk '{print $3}')
	docker rmi $$(docker images -a --filter=dangling=true -q)
	docker rm $$(docker ps --filter=status=exited --filter=status=created -q)

ssh-prod:
	ssh 95.213.199.198

# http://romashov.tech/.well-known/acme-challenge/6CwDT7pftLadc8ws2it2Kp7pz_7OODwLSZRmfKeUEAI
# http://www.romashov.tech/.well-known/acme-challenge/lhFRuGx3uWoizo8YanRbA3KTKzXKGswBSSLq0uiHAMM
