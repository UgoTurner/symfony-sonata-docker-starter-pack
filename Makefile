up: ## Up containers
up:
	docker-compose up -d
.PHONY: up

down: ## Down containers
down:
	docker-compose down
.PHONY: down

ps: ## List containers
ps:
	docker ps -a
.PHONY: ps

rm: ## Stop and rm all containers
rm:
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
.PHONY: rm

bcp: ## Open a bash session in the php container
bcp:
	docker exec -it app_php bash
.PHONY: bcp

resetdb: ## Rm sqlite db and create a new, rm all migrations
resetdb:
	bash bin/resetdb.sh
.PHONY: resetdb

acl: ## Give acl permissions on var/
acl:
	bash bin/acl.sh
.PHONY: acl

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
