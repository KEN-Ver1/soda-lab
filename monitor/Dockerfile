FROM alpine:3.9

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk add --no-cache telegraf

RUN mkdir /usr/local/http-monitor
COPY . /usr/local/http-monitor

RUN chmod +x /usr/local/http-monitor/run.sh

CMD ["/usr/local/http-monitor/run.sh"]
