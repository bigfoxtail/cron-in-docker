docker build -t cron-test .
docker rm -f cron-test
docker run -d --name cron-test cron-test
docker exec -it cron-test bash
