FROM brunoe/jupyterjava:feature_binder

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

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
ENV JAVA_HOME /home/jovyan/.sdkman/candidates/java/current 
RUN echo 'PATH=/home/jovyan/.sdkman/candidates/maven/current/bin:/home/jovyan/.sdkman/candidates/java/current/bin:/opt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' > /etc/profile.d/java.sh && chmod +x /etc/profile.d/java.sh

ENTRYPOINT []
