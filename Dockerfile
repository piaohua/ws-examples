FROM centos:8

# set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./bin/chat /home/bin/chat
COPY ./bin/proxy /home/bin/proxy
RUN chmod +x /home/bin/chat
RUN chmod +x /home/bin/proxy

COPY ./script/bootstrap.sh /home/script/bootstrap.sh
RUN chmod +x /home/script/bootstrap.sh

COPY ./web /home/web

WORKDIR /home

CMD ["sh", "./script/bootstrap.sh"]

EXPOSE 3333 8888
