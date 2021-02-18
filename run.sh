#!/usr/bin/env bash
docker run --rm \
	# The container name
	--name jupyterjava_${PWD##*/} \
	# The directory to find notebooks 
	--volume $PWD/notebooks:/notebooks \
	# The directory where the java notebook produces source code (Could be shared between notebooks).
        --volume $PWD/src:/src \
	# The directory where maven stores its config & repository (Should be shared between notebooks).
        --volume ~/.m2:/home/jovyan/.m2 \
	# The directory where codeserver stores its config & repository (Should be shared between notebooks but not by default).
        --volume $PWD/codeserver:/codeserver \
        ## --volume $HOME/.local/share/code-server:/codeserver \
	# The port of jupyterLab (other apps are proxied)
        --publish 8888:8888 \
	# The UID to run Jupyter.
        --env NB_UID=$UID \
	# Internal use
	--env NOTEBOOK_SRC_SUBDIR=${PWD##*/} \
        brunoe/jupyterjava:feature_binder
