FROM brunoe/jupyterjava:feature_experimental

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    --shell /bin/zsh \
    ${NB_USER} && \
	ln -sf .zlogin /home/jovyan/.zprezto/runcoms/zlogin /home/jovyan/.zlogin && \
	ln -sf .zlogout /home/jovyan/.zprezto/runcoms/zlogout /home/jovyan/.zlogout && \
	ln -sf .zprofile /home/jovyan/.zprezto/runcoms/zprofile /home/jovyan/.zprofile && \
	ln -sf .zshenv /home/jovyan/.zprezto/runcoms/zshenv /home/jovyan/.zshenv && \
	ln -sf .zshrc /home/jovyan/.zprezto/runcoms/zshrc /home/jovyan/.zshrc 

COPY . ${HOME}
USER root
RUN cp -r /home/user/. /home/${NB_USER}
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

COPY notebooks /
ENTRYPOINT []
