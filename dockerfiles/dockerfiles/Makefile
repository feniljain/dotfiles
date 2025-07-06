rabbitmq_run:
	# docker run -p 5672:5672 -p 15672:15672 -d rabbitmq:3-management
	docker run -d --hostname my-rabbit --name some-rabbit -p 5672:5672 -p 15672:15672 -p 1883:1883 rabbitmq:3-management-alpine
redis_run:
	docker run --name my-redis -p 6379:6379 -d redis
redis_connect:
	#docker exec -it my-redis sh
	docker exec -it redis-stack sh
redis_cluster_run:
	# docker run -e "IP=127.0.0.1" -p 7000-7005:7000-7005 grokzen/redis-cluster:latest
	docker run --name redis-cluster -e ALLOW_EMPTY_PASSWORD=yes bitnami/redis-cluster:latest
db_run:
	docker run \
    --name postgres \
    -p 5432:5432 \
    -e POSTGRES_USER=ayoo \
    -e POSTGRES_PASSWORD=ayoo123 \
    -e POSTGRES_DB=ayoo \
    -d \
		postgres
		# -v ./postgres-data:/var/lib/postgresql \
db_connect:
	PGPASSWORD=ayoo123 pgcli -h localhost -p 5432 -U ayoo -d ayoo
socket_redis:
	docker run -d --name redis-stack -p 6379:6379 redis/redis-stack-server:latest
linux_playground_run:
	# docker run --name linux-playground -v /tmp/binaries:/app --detach --platform linux/amd64 linux-playground
	docker run --name linux-playground -v /Users/feniljain/Projects/work/e6data/profiles/perf:/app --detach --platform linux/arm64 --entrypoint tail ubuntu:latest -f /dev/null
linux_playground_connect:
	docker exec -it linux-playground /bin/bash
rust_playground:
	docker run --name rust-playground -v /tmp/binaries:/app --detach --platform linux/amd64 rust-playground
minio_playground:
	mkdir -p minio-data/ && \
	docker run \
	 --rm \
	 --detach \
   -p 9000:9000 \
   -p 9001:9001 \
   --name minio \
   -v ./minio-data:/data \
   -e "MINIO_ROOT_USER=admin" \
   -e "MINIO_ROOT_PASSWORD=admin1234" \
   -e "BUCKET_NAME=bucketto" \
   quay.io/minio/minio server /data --console-address ":9001"
localstack_s3_playground:
	docker run \
	 --rm \
	 --detach \
   -p 9000:4566 \
   --name localstack_s3 \
   localstack/localstack:s3-latest
java_playground: 
	docker run --rm -v ~/Projects/SimpleDB_3.4:/app --name java-playground --detach --entrypoint tail openjdk:latest -f /dev/null # https://stackoverflow.com/questions/41694329/docker-run-override-entrypoint-with-shell-script-which-accepts-arguments
kafka_playground:
	docker run -d --name kafka -p 9092:9092 -p 9644:9644 docker.redpanda.com/vectorized/redpanda:latest start --overprovisioned --smp 1 --memory 1G --reserve-memory 0M --node-id 0 --check=false
check_kafka_msgs:
	docker run -it --rm --network=host edenhill/kcat:1.7.1 -b localhost:9092 -C -t test.local
coretto_jdk_playground:
	docker run -d -t --name coretto_jdk_playground -v /tmp/executor:/app/executor -v ~/.m2:/root/.m2 --platform linux/arm64 public.ecr.aws/e6data/amazoncoretto:21-al2023-jdk # --entrypoint tail -f /dev/null
executor_run_playground:
	docker run -d -t --name executor_run_playground -v /tmp/executor:/app/executor -e ENABLE_RUST_EXECUTION=true --platform linux/arm64 --entrypoint /bin/bash 670514002493.dkr.ecr.us-east-1.amazonaws.com/executor:fenil-rust
rs_build_playground:
	docker run -d -t --name rs_build_playground -v ~/.m2:/root/.m2 -v /tmp/executor/:/app/executor --platform linux/arm64 rs-build-img # --entrypoint tail -f /dev/null
	# docker run -d -t --name rs_build_playground root/.m2 --platform linux/arm64 rs-build-img
	# docker run -d -t --name rs_build_playground -v /tmp/executor/:/app/executor --platform linux/arm64 rs-build-img # --entrypoint tail -f /dev/null
rs_build_playground_no_app:
	docker run -d -t --name rs_build_playground_no_app -v ~/.m2:/root/.m2 -v /tmp/executor/:/app/executor --platform linux/arm64 rs-build-img-no-app
