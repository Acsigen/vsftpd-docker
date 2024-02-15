FROM ubuntu:latest AS app

ARG PROFTPD_USER
ARG PROFTPD_PASSWORD

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y proftpd openssl

RUN useradd -m -s /bin/bash -p $(openssl passwd -1 "$PROFTPD_PASSWORD") $PROFTPD_USER

EXPOSE 21
EXPOSE 49152
EXPOSE 49153

CMD ["proftpd", "-n", "-d", "debug"]