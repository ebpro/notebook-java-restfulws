FROM brunoe/jupyterjava:feature_experimental

ARG NB_USER=user
ARG NB_UID=1000
ENV USER user 
ENV NB_UID ${NB_UID}
ENV HOME /home/${USER}

USER root
RUN	mkdir /src && \
 	chown -R ${NB_UID} ${HOME} && \
	chown -R ${NB_UID} /notebooks && \
	chown -R ${NB_UID} /src && \
	chown -R ${NB_UID} /opt/sdkman && \
	chown -R ${NB_UID} /codeserver 

COPY notebooks /

RUN usermod -o -u "${NB_UID}" user i

USER ${NB_USER}


ENTRYPOINT []
