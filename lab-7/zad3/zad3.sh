docker network create my_network
docker network connect my_network mongo
docker build -t backend .
docker stop backend
docker rm backend
docker run --name backend -p 8000:8000 --network my_network -d backend