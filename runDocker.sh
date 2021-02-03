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
