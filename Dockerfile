FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y cron rsyslog locales python3

# 解决输出中文编码错误
RUN locale-gen "en_US.UTF-8"
ENV LC_ALL="en_US.utf8"

RUN mkdir /code

ADD . /code

RUN crontab /code/crontabfile

RUN touch /var/log/cron.log

RUN chmod +x /code/run.sh

WORKDIR /code

CMD ["bash","/code/run.sh"]
