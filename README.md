# JAX-RS Notebook

A introduction to JAX-RS with Jersey on top of Grizzly.

## Usage

### Online

Easiest, on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ebpro/javanotebook-jaxrs/feature/experimental?urlpath=lab&filepath=%2Fnotebooks)

### Locally

clone this repository, enter the directory and launch :

```shell
docker run --rm \
       --name JupyterJava \
       --volume $PWD/work:/home/jovyan/work \
        --publish 8888:8888 \
        --env NB_UID=$UID \
        --env JUPYTER_ENABLE_LAB=yes \
        brunoe/jupyterjava:develop
```
