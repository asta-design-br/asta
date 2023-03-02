#!bin/bash
set -vx

docker start asta-web-1
docker start asta-db-1
docker exec -d asta-web-1 sh -c "rails db:migrate db:seed && yarn install && yarn build --watch"
docker-compose up -d
