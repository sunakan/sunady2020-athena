.PHONY: minio
minio:
	cd minio && make minio

.PHONY: clean
clean:
	cd minio && make clean

watch:
	watch -n 0.3 tree minio/minio-volume

.PHONY: fluentd
fluentd:
	cd fluentd && make fluentd

.PHONY: fluent-cat
fluent-cat:
	cd fluentd && make fluent-cat
