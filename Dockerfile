FROM ubuntu:latest

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y tzdata \
    && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y cron rsyslog nano python3

RUN apt-get install -y python3-pip 
RUN pip3 install requests python-dotenv

RUN mkdir /code

ADD . /code

RUN crontab /code/crontabfile

RUN touch /var/log/cron.log

RUN chmod +x /code/run.sh

WORKDIR /code

CMD ["bash","/code/run.sh"]
