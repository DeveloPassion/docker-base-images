A few base images.

## Ubuntu
Image that includes a "dummyuser" to avoid running as root.
The image is configured for non-interactive use, enables installing packages over HTTPS and uses bash as default shell.

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