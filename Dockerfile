FROM bytesmith/rclient:3.4.3
LABEL maintainer="info@bytesmith.de"

RUN . /etc/os-release \
&& echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $UBUNTU_CODENAME main" | \
	tee /etc/apt/sources.list.d/azure-cli.list \
&& apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 \
&& apt-get update \
&& apt-get install -y azure-cli \
	microsoft-mlserver-packages-r-9.3.0 microsoft-mlserver-python-9.3.0 microsoft-mlserver-packages-py-9.3.0 \
	microsoft-mlserver-mml-r-9.3.0 microsoft-mlserver-mml-py-9.3.0 \
	microsoft-mlserver-mlm-r-9.3.0  microsoft-mlserver-mlm-py-9.3.0 \
	microsoft-mlserver-adminutil-9.3 microsoft-mlserver-computenode-9.3 \
	microsoft-mlserver-config-rserve-9.3 microsoft-mlserver-webnode-9.3 \
&& /opt/microsoft/mlserver/9.3.0/bin/R/activate.sh -a -l \
&& rm -rf /tmp/* \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& rm -rf /var/lib/apt/lists/*
CMD ["/bin/bash"]
