FROM brunoe/jupyterjava:feature_experimental

ENV NB_USER user 
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

USER root
COPY notebooks /notebooks
RUN usermod -o -u "${NB_UID}" user && \
	adduser user codeserver && \
	adduser user sdk && \

	mkdir /src && \
 	chown -R ${NB_UID} ${HOME} && \
	chown -R ${NB_UID} /notebooks && \
	chown -R ${NB_UID} /src && \
	chown -R ${NB_UID} /opt/sdkman && \
	chown -R ${NB_UID} /opt/conda && \
	chown -R ${NB_UID} /codeserver 

WORKDIR /notebooks

USER ${NB_USER}
SHELL ["/bin/zsh","--interactive","-c"]
# ENTRYPOINT ["/bin/zsh","--interactive","-c"]

ENV SDK_MAN=/opt/sdkman
ENV IJAVA_COMPILER_OPTS="-deprecation"
ENV IJAVA_CLASSPATH="/home/user/lib/*.jar:/usr/local/bin/*.jar"
ENV IJAVA_STARTUP_SCRIPTS_PATH="/magics/*"
# . /home/user/.zshrc
# /opt/miniconda/etc/profile.d/conda.sh && conda activate py38
# conda activate base
#export PATH=/opt/bin:$PATH
ENV  CODE_WORKINGDIR=/src
ENV CODE_EXTENSIONSDIR=/opt/codeserverextensions
ENTRYPOINT []
