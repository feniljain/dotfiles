rabbitmq_run:
	docker run -p 5672:5672 -p 15672:15672 -d rabbitmq:3-management
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
    --name my-postgres \
    -p 5432:5432 \
    -e POSTGRES_USER=dyte \
    -e POSTGRES_PASSWORD=dyte123 \
    -e POSTGRES_DB=dyte \
    -d \
    postgres
db_connect:
	PGPASSWORD=dyte123 pgcli -h localhost -p 5432 -U dyte -d dyte
socket_redis:
	docker run -d --name redis-stack -p 6379:6379 redis/redis-stack-server:latest
