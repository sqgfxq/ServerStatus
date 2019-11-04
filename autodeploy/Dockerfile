FROM debian:latest as builder

MAINTAINER srbjor fan_xq@live.com

RUN apt-get update \
 && apt-get -y install gcc g++ make git\
 && git clone https://github.com/sqgfxq/ServerStatus

WORKDIR /ServerStatus/server

RUN make \
 && pwd && ls -a

# glibc env run 
FROM nginx:latest

RUN mkdir -p /ServerStatus/server/

COPY --from=builder /ServerStatus/server /ServerStatus/server/
COPY --from=builder /ServerStatus/web /usr/share/nginx/html/

EXPOSE 80 35601

CMD nohup sh -c '/etc/init.d/nginx start && /ServerStatus/server/sergate --config=/ServerStatus/server/config.json --web-dir=/usr/share/nginx/html'
