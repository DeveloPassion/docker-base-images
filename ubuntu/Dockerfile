FROM ubuntu:18.04

LABEL author="Sebastien Dubois <seb@dsebastien.net>"
LABEL description="Base Ubuntu image"

ENV USERNAME dummyuser

ENV HOME /home/${USERNAME}
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN groupadd -g 1337 ${USERNAME} && \
    useradd -r -u 1337 -g ${USERNAME} ${USERNAME}

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR ${HOME}

RUN mkdir -p ${HOME}

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Set debconf to run non-interactively
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
   apt-get update && apt-get -y install \
   software-properties-common \
   apt-transport-https \
   ca-certificates && \
   apt-get update && apt-get -y install

USER ${USERNAME}
