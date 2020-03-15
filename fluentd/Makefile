export DOCKER_FLUENTD_TAG=v1.9-debian-1
export DOCKER_NETWORK_NAME=sample-network

.PHONY: sample-network
sample-network:
	docker network ls | grep ${DOCKER_NETWORK_NAME} \
		|| docker network create ${DOCKER_NETWORK_NAME}

.PHONY: build
build:
	docker build \
		--build-arg DOCKER_FLUENTD_TAG=${DOCKER_FLUENTD_TAG} \
		--tag my-fluentd:latest \
		.

.PHONY: fluentd
fluentd: sample-network
	docker run \
		--rm \
		--tty \
		--interactive \
		--name fluentd \
		--hostname fluentd \
		--net ${DOCKER_NETWORK_NAME} \
		--mount type=bind,source=${PWD}/fluent.conf,target=/fluentd/etc/fluent.conf \
		--env FLUENTD_S3_ENDPOINT=http://minio:9000/ \
		--env FLUENTD_S3_BUCKET=sunacket \
		--env FLUENTD_S3_ACCESS_KEY=dummydummy \
		--env FLUENTD_S3_SECRET_KEY=dummydummy \
		my-fluentd:latest

.PHONY: fluent-cat
fluent-cat: sample-network
	docker run \
		--rm \
		--tty \
		--interactive \
		--name fluent-cat \
		--hostname fluent-cat \
		--net ${DOCKER_NETWORK_NAME} \
		--mount type=bind,source=${PWD}/fluent-cat-sample.sh,target=/fluentd/fluent-cat-sample.sh \
		--entrypoint "" \
		--workdir /fluentd/ \
		fluentd:${DOCKER_FLUENTD_TAG} \
		bash /fluentd/fluent-cat-sample.sh

.PHONY: clean
clean:
	docker container stop fluentd
	docker network rm ${DOCKER_NETWORK_NAME} \
		|| echo "${DOCKER_NETWORK_NAME}がまだ使われているか、存在しません"
