DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. ${DIR}/env.sh

docker run \
	--name ${PWD##*/} \
        --rm \
	--volume $PWD/notebooks:/notebooks \
        --volume $PWD/src:/src \
        --volume $PWD/codeserver:/codeserver \
	--env NOTEBOOK_SRC_SUBDIR=${PWD##*/} \
        --publish 8888:8888 \
        --env PUID=$UID \
      	--env PGID=$GID \
       	--env SUDO_PASSWORD=secret \
        --volume ~/.m2:/home/user/.m2 \
        $BASE:$BRANCH
