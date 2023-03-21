#!bin/bash
set -v

echo "removing all containers..."
docker ps -aq | xargs docker stop | xargs docker rm

bundle install
docker-compose up
