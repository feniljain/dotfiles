yes | docker kill $(docker ps -q)
yes | docker container prune
yes | docker volume prune
yes | docker image prune
