#!/usr/bin/env bash

docker run --rm \
       --name jupyterjava_${PWD##*/} \
       --volume $PWD/work:/home/jovyan/work \
        --publish 8888:8888 \
        --env NB_UID=$UID \
        --env JUPYTER_ENABLE_LAB=yes \
        brunoe/jupyterjava:develop
