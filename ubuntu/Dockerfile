FROM ubuntu:18.04

LABEL author="Sebastien Dubois <seb@dsebastien.net>"
LABEL description="Base Ubuntu image"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

ENV HOME /home/root
ENV HOME_ROOT=${HOME}

USER root

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR ${HOME}
RUN mkdir -p ${HOME}

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
   apt-get update && apt-get install -y --no-install-recommends \
   apt-transport-https \
   ca-certificates \
   curl \
   git \
   gnupg2 \
   libbz2-dev \
   libcurl4-openssl-dev \
   libssl-dev \
   libzmq3-dev \
   nano \
   software-properties-common \
   unzip \
   vim \
   wget \
   && apt-get autoremove -y \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*

ARG GOSU_VERSION=1.10

RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
 && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
 && chmod +x /usr/local/bin/gosu \
 && gosu nobody true