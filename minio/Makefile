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
		--rm \
		--tty \
		--mount type=bind,source=${PWD}/${MINIO_VOLUME_NAME},target=/export \
		--mount type=bind,source=${PWD}/minio-keys,target=/minio-keys \
		--net ${DOCKER_NETWORK_NAME} \
		--env MINIO_ACCESS_KEY=/minio-keys/access-key \
		--env MINIO_SECRET_KEY=/minio-keys/secret-key \
		minio/minio \
		server /export

.PHONY: clean
clean:
		rm -rf ./minio-volume
