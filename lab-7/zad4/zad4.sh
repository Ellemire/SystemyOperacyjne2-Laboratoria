docker volume create mongo_volume
docker stop mongo
docker rm mongo
docker run --name mongo -p 27017:27017 -v mongo_volume:/data/db --network my_network -d mongo