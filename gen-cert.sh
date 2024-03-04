#!/bin/bash
openssl req -x509 -newkey rsa:1024 \
          -keyout ./cert/proftpd.key -out ./cert/proftpd.crt \
          -nodes -days 365