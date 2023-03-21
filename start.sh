#!bin/bash
set -v

echo "removing all containers..."
docker ps -aq | xargs docker stop | xargs docker rm

echo "removing old web image..."
docker rmi asta-web

echo "removing caches packages and gems"
docker volume rm asta_gem_cache
docker volume rm asta_node_modules

bundle install
docker-compose up
