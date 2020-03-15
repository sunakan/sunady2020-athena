export DOCKER_DEBIAN_TAG=buster-slim
export TERRAFORM_VERSION=0.12.23

.PHONY: build
build:
	docker build ./ \
		--tag iac-tools:latest \
		--build-arg DOCKER_DEBIAN_TAG=${DOCKER_DEBIAN_TAG} \
		--build-arg TERRAFORM_VERSION=${TERRAFORM_VERSION}

.PHONY: bash
bash:
	mkdir -p aws-conf
	docker run \
		--rm \
		--user `id -u`:`id -g` \
		--interactive \
		--tty \
		--workdir /terraform \
		--mount type=bind,source=${PWD}/aws-conf,target=/.aws \
		--mount type=bind,source=${PWD}/terraform,target=/terraform \
		iac-tools:latest \
		bash

.PHONY: fmt
fmt:
	docker run \
		--rm \
		--user `id -u`:`id -g` \
		--tty \
		--workdir /terraform \
		--mount type=bind,source=${PWD}/terraform,target=/terraform \
		iac-tools:latest \
		terraform fmt --recursive

.PHONY: v
v:
	docker run \
		--rm \
		--user `id -u`:`id -g` \
		--tty \
		iac-tools:latest \
		terraform -v && aws --version
