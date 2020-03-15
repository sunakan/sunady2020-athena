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
		--publish 9000:9000 \
		--mount type=bind,source=${PWD}/${MINIO_VOLUME_NAME},target=/export \
		--net ${DOCKER_NETWORK_NAME} \
		--env MINIO_ACCESS_KEY=dummydummy \
		--env MINIO_SECRET_KEY=dummydummy \
		minio/minio \
		server /export
	make init-minio

.PHONY: init-minio
init-minio:
	docker run \
		--rm \
		--tty \
		--interactive \
		--name minio-initializer \
		--hostname minio-initializer \
		--mount type=bind,source=${PWD}/init-minio.sh,target=/init-minio.sh \
		--net ${DOCKER_NETWORK_NAME} \
		--entrypoint "" \
		minio/mc \
		sh /init-minio.sh

.PHONY: clean
clean:
	docker container stop minio
	rm -rf ./minio-volume
	docker network rm ${DOCKER_NETWORK_NAME} \
		|| echo "${DOCKER_NETWORK_NAME}がまだ使われているか、存在しません"
