FROM alpine:latest
COPY prepare.sh /root/prepare.sh
COPY build-travis.sh /root/build-travis.sh
RUN sh /root/prepare.sh
