#!/usr/bin/env bash
docker build \
    --tag developassion/ubuntu:latest \
    --tag developassion/ubuntu:1.0 \
    --file Dockerfile \
    .

docker push developassion/ubuntu
