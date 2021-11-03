docker build -t cron-in-docker2 .
docker rm -f test2
docker run -d --name test2 cron-in-docker2
docker exec -it test2 bash
