export MINIO_VOLUME_NAME=minio-volume
export DOCKER_NETWORK_NAME=sample-network

.PHONY: minio-volume
minio-volume:
	mkdir -p ./${MINIO_VOLUME_NAME}

.PHONY: sample-network
sample-network:
	docker network ls | grep ${DOCKER_NETWORK_NAME} \
		|| docker network create ${DOCKER_NETWORK_NAME}

.PHONY: minio
minio: minio-volume sample-network
	docker run \
		-d \
		--rm \
		--tty \
		--user `id -u`:`id -g` \
		--name minio \
		--hostname minio \
		--mount type=bind,source=${PWD}/${MINIO_VOLUME_NAME},target=/export \
		--net ${DOCKER_NETWORK_NAME} \
		--env MINIO_ACCESS_KEY=dummydummy \
		--env MINIO_SECRET_KEY=dummydummy \
		minio/minio \
		server /export

.PHONY: clean
clean:
		rm -rf ./minio-volume
