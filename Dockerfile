FROM brunoe/jupyterjava:feature_experimental

ENV NB_USER user 
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

USER root
COPY notebooks /notebooks
RUN usermod -o -u "${NB_UID}" user && \
	mkdir /src && \
 	chown -R ${NB_UID} ${HOME} && \
	chown -R ${NB_UID} /notebooks && \
	chown -R ${NB_UID} /src && \
	chown -R ${NB_UID} /opt/sdkman && \
	chown -R ${NB_UID} /codeserver 

WORKDIR /notebooks

USER ${NB_USER}
SHELL ["/bin/zsh","-l","-c"]
ENTRYPOINT []
