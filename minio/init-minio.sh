#!/bin/sh

until (/usr/bin/mc config host add myminio http://minio:9000 dummydummy dummydummy) do echo '...waiting...' && sleep 1; done;
/usr/bin/mc mb myminio/sunacket;
/usr/bin/mc policy download myminio/sunacket || echo "minioの初期化終了";
