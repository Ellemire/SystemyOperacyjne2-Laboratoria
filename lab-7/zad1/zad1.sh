docker pull mongo
docker run -d --name mongo -p 27017:27017 mongo
docker logs mongo > ../zad1/zad1-log.txt