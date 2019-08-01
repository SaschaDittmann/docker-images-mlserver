FROM bytesmith/rclient:3.5.2

ARG VCS_REF
ARG BUILD_DATE
ARG RCLIENT_VERSION=9.4.7

LABEL maintainer="info@bytesmith.de" \
	  org.label-schema.build-date=$BUILD_DATE \
	  org.label-schema.name="Microsoft Machine Learning Server (Developer Edition) for Docker" \
	  org.label-schema.description="Microsoft Machine Learning Server is enterprise software for data science, providing R and Python interpreters, base distributions of R and Python, additional high-performance libraries from Microsoft, and an operationalization capability for advanced deployment scenarios." \
	  org.label-schema.url="https://docs.microsoft.com/en-us/machine-learning-server" \
	  org.label-schema.vcs-ref=$VCS_REF \
	  org.label-schema.vcs-url="https://github.com/SaschaDittmann/docker-images-mlserver" \
	  org.label-schema.version=$RCLIENT_VERSION \
	  org.label-schema.schema-version="1.0"

RUN . /etc/os-release \
&& echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $UBUNTU_CODENAME main" | \
	tee /etc/apt/sources.list.d/azure-cli.list \
&& apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 \
&& apt-get update \
&& apt-get install -y azure-cli \
	microsoft-mlserver-python-$RCLIENT_VERSION \
	microsoft-mlserver-packages-r-$RCLIENT_VERSION microsoft-mlserver-packages-py-$RCLIENT_VERSION \
	microsoft-mlserver-mml-r-$RCLIENT_VERSION microsoft-mlserver-mml-py-$RCLIENT_VERSION \
	microsoft-mlserver-mlm-r-$RCLIENT_VERSION  microsoft-mlserver-mlm-py-$RCLIENT_VERSION \
	microsoft-mlserver-adminutil-$RCLIENT_VERSION microsoft-mlserver-computenode-$RCLIENT_VERSION \
	microsoft-mlserver-config-rserve-$RCLIENT_VERSION microsoft-mlserver-dotnet-$RCLIENT_VERSION \
	microsoft-mlserver-webnode-$RCLIENT_VERSION \
&& /opt/microsoft/mlserver/$RCLIENT_VERSION/bin/R/activate.sh -a -l \
&& rm -rf /tmp/* \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
