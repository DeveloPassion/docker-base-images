FROM developassion/ubuntu:1.0

LABEL author="Sebastien Dubois <seb@dsebastien.net>"
LABEL description="Base image with a specific python version installed, along with pyenv, pip and pipenv"

ARG BUILD_PYTHON_VERSION

ENV PYTHON_VERSION=${BUILD_PYTHON_VERSION}

# pyenv
ENV PYENV_ROOT=${HOME}/.pyenv

# add to path as well as locally installed packages
ENV PATH=${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${HOME}/.local/bin:$PATH

# speed up compilation
ENV CFLAGS='-O2'

WORKDIR ${HOME}

USER root

RUN apt-get update && apt-get -y install \
   build-essential \
   curl \
   git \
   libbz2-dev \
   libcurl4-openssl-dev \
   libncurses5-dev \
   libreadline-dev \
   libsqlite3-dev \
   libssl-dev \
   libzmq3-dev \
   llvm \
   make \
   wget \
   xz-utils \
   zlib1g-dev \
   && apt-get autoremove -y \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*

USER dummyuser

RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash \
   && pyenv install ${PYTHON_VERSION} \
   && pyenv global ${PYTHON_VERSION} \
   && echo 'eval "$(pyenv init -)"' > .bashrc \
   && echo 'eval "$(pyenv virtualenv-init -)"' > .bashrc \
   && pip install --upgrade pip \
   && pip install --user pipenv
