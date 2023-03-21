rabbitmq_run:
	docker run -p 5672:5672 -p 15672:15672 rabbitmq-local
rabbitmq_build:
	docker run -p 5672:5672 -p 15672:15672 rabbitmq-local
redis_run:
	docker run --name my-redis -p 6379:6379 -d redis
redis_connect:
	docker exec -it my-redis sh
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
	PGPASSWORD=dyte123 pgcli -h localhost -p 5432 -U dyte -W dyte123 -d dyte
