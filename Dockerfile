FROM alpine:latest AS app

ENV DEBIAN_FRONTEND noninteractive

RUN apk add vsftpd openssl wget vim

RUN mkdir /docker-entrypoint
RUN mkdir /var/ftp
COPY docker-entrypoint.sh /docker-entrypoint/docker-entrypoint.sh
RUN chmod +x /docker-entrypoint/docker-entrypoint.sh

EXPOSE 2020
EXPOSE 2121
EXPOSE 34000
EXPOSE 34001

CMD ["/docker-entrypoint/docker-entrypoint.sh"]