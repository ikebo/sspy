FROM ubuntu:16.04
ENV CT="210129"

# 支持apt-get https
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates

# 换国内源
ADD ./sources.list /etc/apt/sources.list
RUN apt-get update

# 安装redis & common utils
RUN apt-get install -y redis-server redis-tools
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN apt-get install -y iputils-ping net-tools telnet vim

# 安装supervisor
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install -y supervisor

EXPOSE 6000-9000

CMD cp /project/sspy.conf /etc/supervisor/conf.d/ && supervisord -n -c /etc/supervisor/supervisord.conf
