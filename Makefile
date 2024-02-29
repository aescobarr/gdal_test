.PHONY: help

.DEFAULT_GOAL	:= help
APP_NAME 		:= 'gdal_test'
APP_NAME_ALPINE := 'gdal_test_alpine'
SHELL			:= /bin/bash

help: # http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


# ===================================================
#  DEV ENVIRONMENT COMMANDS
# ===================================================
clone: ## Clone gdal repo locally
	git clone https://github.com/AbelPau/gdal.git

pull: ## Refresh repo
	cd gdal && git pull origin master

build:  ## Build dockerfile
	docker build -t ${APP_NAME} . -f Dockerfile 

build_alpine:  ## Build dockerfile, alpine gcc 32 os
	docker build -t ${APP_NAME_ALPINE} . -f Dockerfile_alpine_gcc32

run: ## Run docker image and open shell
	docker run -it ${APP_NAME}

run_alpine: ## Run alpine docker image and open shell
	docker run -it ${APP_NAME_ALPINE}

prune: ## Clean system
	docker image prune -a --force
	docker system prune --force

clean_docker:  ## Remove all container and images.
	docker rm $(docker ps -a -q)
	docker rmi $(docker image ls -q)
