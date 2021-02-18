# JAX-RS Notebook

## Usage

### Online
Easiest, on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ebpro/javanotebook-jaxrs/feature/experimental?urlpath=lab&filepath=%2Fnotebooks)

### Without any local files
Easierbut no config files will be saved and maven dependencies will be redownloaded.
```shell
docker run --rm \
	--name jupyterjava \
	--publish 8888:8888 \
	brunoe/javanotebook-jaxrs:feature_experimental 
```
### With localfiles 

clone this repository, enter the directory and launch :
```shell
docker run --rm \
	# The container name
	--name jupyterjava_${PWD##*/} \
	# The directory to find notebooks 
	--volume $PWD/notebooks:/notebooks \
	# The directory where the java notebook produces source code (Could be shared between notebooks).
        --volume $PWD/src:/src \
	# The directory where maven stores its config & repository (Should be shared between notebooks).
        --volume ~/.m2:/home/jovyan/.m2 \
	# The directory where codeserver stores its config & repository (Should be shared between notebooks).
        --volume $PWD/codeserver:/codeserver \
	# The port of jupyterLab (other apps are proxied)
        --publish 8888:8888 \
	# The UID to run Jupyter.
        --env NB_UID=$UID \
	# Internal use
	--env NOTEBOOK_SRC_SUBDIR=${PWD##*/} \
        brunoe/jupyterjava:feature_binder
```
