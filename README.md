A few base images.

## Ubuntu
Image that includes basic packages.

The image is configured for non-interactive use, enables installing packages over HTTPS and uses bash as default shell.

Exposes the root's home folder through $HOME_ROOT

## Pyenv pipenv python
Image that installs pyenv, then uses it to install the specified version of python, along with pip and pipenv. 

The files in this image can be used for multi-stage builds.

When used, to make use of pyenv, the following should be used in the Dockerfile:

```
# pyenv: define the variables here because we're using a multi-stage build
# so those are not retrieved
ENV PYENV_ROOT=${HOME}/.pyenv

# pyenv: add to path as well as locally installed packages
ENV PATH=${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${HOME}/.local/bin:$PATH
```

In the target Dockerfile, just copy files from this image as follows:

```
FROM developassion/pyenv-pipenv-python:${BUILD_PYTHON_VERSION} as base_image_python
...
USER dummyuser

# extract binaries from our base python image
# get pyenv, python, pipenv and pip
COPY --from=base_image_python /home/root/.pyenv ./.pyenv
# get pipenv
COPY --from=base_image_python /home/root/.local ./.local

COPY --chown=dummyuser:dummyuser --from=base_image_python /home/root/.bashrc ./.bashrc
```

Don't run your containers as root. For now, just use chown after the copy to adapt the files ownership. Once this lands, you will be able to use `COPY --chown ...`: https://github.com/moby/moby/issues/35018.