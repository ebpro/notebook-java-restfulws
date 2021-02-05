# JAX-RS Notebook

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ebpro/javanotebook-jaxrs/feature/experimentali?url=lab)

## Usage

docker run \
	--name jupyterjava \
	--rm \
        --volume $PWD/src:/src \
        --volume $PWD/codeserver:/codeserver \
        --publish 8888:8888 \
        --env PUID=$UID \
      	--env PGID=$(id -g) \
       	--env SUDO_PASSWORD=secret \
        --volume ~/.m2:/home/user/.m2 \
	brunoe/javanotebook-jaxrs:develop
