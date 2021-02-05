FROM brunoe/jupyterjava:feature_experimental

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser -D \
    -g "Default user" \
    -u ${NB_UID} \
    -s /bin/zsh \
    ${NB_USER}


# USER root
RUN cp -r /home/user/. /home/${NB_USER} && \
	mkdir /src && \
 	chown -R ${NB_UID} ${HOME} && \
	chown -R ${NB_UID} /notebooks && \
	chown -R ${NB_UID} /src && \
	chown -R ${NB_UID} /opt/sdkman && \
	chown -R ${NB_UID} /codeserver 

RUN echo "conda activate base" >> $HOME/.zshrc && \
        echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> $HOME/.zshrc && \
        echo "export SDKMAN_DIR=/opt/sdkman" >> $HOME/.zshrc && \
        echo "[[ ! -f /opt/sdkman/bin/sdkman-init.sh ]] || source /opt/sdkman/bin/sdkman-init.sh" >> $HOME/.zshrc

USER ${NB_USER}

COPY notebooks /

ENTRYPOINT []
