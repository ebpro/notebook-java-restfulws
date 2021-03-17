FROM brunoe/jupyterjava:feature_binder

COPY notebooks /notebooks
USER root
RUN usermod -o -u "$NB_UID" "$USER" && \
	adduser "$USER" codeserver && \
	mkdir /src && \
 	chown -R "$NB_UID" "$HOME" && \
	chown -R "$NB_UID" /notebooks && \
	chown -R "$NB_UID" /src && \
	chown -R "$NB_UID" /codeserver 

WORKDIR /notebooks

USER ${NB_USER}
SHELL ["/bin/zsh","--interactive","-c"]

# . /home/user/.zshrc
ENV  CODE_WORKINGDIR=/src
ENTRYPOINT []
