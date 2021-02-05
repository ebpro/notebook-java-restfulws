FROM brunoe/jupyterjava:feature_experimental

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser -D \
    -g "Default user" \
    -u ${NB_UID} \
    -s /bin/zsh 

# USER root
RUN cp -r /home/user/. /home/${NB_USER}
RUN chown -R ${NB_UID} ${HOME} && \
	chown -R ${NB_UID} /notebook && \
	chown -R ${NB_UID} /src && \
	chown -R ${NB_UID} /opt/sdkman && \
	chown -R ${NB_UID} /codeserver 

USER ${NB_USER}
RUN 

COPY notebooks /
ENTRYPOINT []
