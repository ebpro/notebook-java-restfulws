#!/usr/bin/env bash
echo $GID
docker run \
	--name jupyterjava \
        --rm \
	--volume $PWD/notebooks:/notebooks \
        --volume $PWD/src:/src \
        --volume $PWD/codeserver:/codeserver \
	--env NOTEBOOK_SRC_SUBDIR=${PWD##*/} \
        --publish 8888:8888 \
        --env PUID=$UID \
      	--env PGID=$(id -g) \
       	--env SUDO_PASSWORD=secret \
        --volume ~/.m2:/home/user/.m2 \
        brunoe/jupyterjava:develop
