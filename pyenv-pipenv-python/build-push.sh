#!/usr/bin/env bash
PYTHON_VERSION=$(cat .python-version)
docker build \
    --tag developassion/pyenv-pipenv-python:latest \
    --tag developassion/pyenv-pipenv-python:${PYTHON_VERSION} \
    --file Dockerfile \
    --build-arg BUILD_PYTHON_VERSION=${PYTHON_VERSION} \
    .
docker push developassion/pyenv-pipenv-python