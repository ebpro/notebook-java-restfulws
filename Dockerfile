FROM brunoe/jupyterjava:feature_experimental

ENV NB_USER user 
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

USER root
COPY . ${HOME}
RUN usermod -o -u "${NB_UID}" user && \
	mkdir /src && \
 	chown -R ${NB_UID} ${HOME} && \
	chown -R ${NB_UID} /notebooks && \
	chown -R ${NB_UID} /src && \
	chown -R ${NB_UID} /opt/sdkman && \
	chown -R ${NB_UID} /codeserver 

WORKDIR ${HOME}

USER ${NB_USER}

ENTRYPOINT []
