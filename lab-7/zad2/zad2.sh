docker build -t backend .
docker run --name backend -p 8000:8000 -d backend