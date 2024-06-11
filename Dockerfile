FROM ubuntu:24.04

COPY build.sh /scripts/build.sh

RUN mkdir build

WORKDIR build

RUN sh /scripts/build.sh